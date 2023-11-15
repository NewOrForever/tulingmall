package com.tuling.tulingmall.service.snowflake;

import java.util.Random;

/**
 * Twitter_Snowflake
 * SnowFlake的结构如下(每部分用-分开):
 * 0 - 0000000000 0000000000 0000000000 0000000000 0 - 00000 - 00000 - 000000000000
 * 1位标识，由于long基本类型在Java中是带符号的，最高位是符号位，正数是0，负数是1，所以id一般是正数，最高位是0
 * 41位时间戳(毫秒级)，注意，41位时间戳不是存储当前时间的时间戳，而是存储时间戳的差值（当前时间戳 - 开始时间戳)
 * 得到的值），这里的的开始时间戳，一般是我们的id生成器开始使用的时间，由我们程序来指定的
 * （如下面程序SnowflakeIdWorker类的startTime属性）。
 * 41位的时间戳，可以使用69年，年T = (1L << 41) / (1000L * 60 * 60 * 24 * 365) = 69
 * 10位的数据机器位，可以部署在1024个节点，包括5位datacenterId和5位workerId
 * 12位序列，毫秒内的计数，12位的计数顺序号支持每个节点每毫秒(同一机器，同一时间戳)产生4096个ID序号
 * 加起来刚好64位，为一个Long型。
 */
public class SnowflakeIdWorker {

    /**
     * 机器id所占的位数
     */
    private final long workerIdBits = 5L;

    /**
     * 数据标识id所占的位数 - 数据中心
     */
    private final long datacenterIdBits = 5L;

    /**
     * 支持的最大机器id，结果是31 (这个移位算法可以很快的计算出几位二进制数所能表示的最大十进制数)
     */
    private final long maxWorkerId = -1L ^ (-1L << workerIdBits);

    /**
     * 支持的最大数据标识id，结果是31
     */
    private final long maxDatacenterId = -1L ^ (-1L << datacenterIdBits);

    /**
     * 序列在id中占的位数
     */
    private final long sequenceBits = 12L;

    /**
     * 机器ID向左移12位
     */
    private final long workerIdShift = sequenceBits;

    /**
     * 数据标识id向左移17位(12+5)
     */
    private final long datacenterIdShift = sequenceBits + workerIdBits;

    /**
     * 时间戳向左移22位(5+5+12)
     */
    private final long timestampLeftShift = sequenceBits + workerIdBits + datacenterIdBits;

    /**
     * 生成序列的掩码，这里为4095，对应二进制 1111 1111 1111
     */
    private final long sequenceMask = -1L ^ (-1L << sequenceBits);

    /**
     * 工作机器ID(0~31)
     */
    private long workerId;

    /**
     * 数据中心ID(0~31)
     */
    private long datacenterId;

    /**
     * 毫秒内序列(0~4095)
     * 12位 -> 4096
     */
    private long sequence = 0L;

    /**
     * 上次生成ID的时间戳
     */
    private long lastTimestamp = -1L;

    private final Random random = new Random();

    //==============================Constructors=====================================

    /**
     * 构造函数
     *
     * @param workerId     工作ID (0~31)
     * @param datacenterId 数据中心ID (0~31)
     */
    public SnowflakeIdWorker(long workerId, long datacenterId) {
        if (workerId > maxWorkerId || workerId < 0) {
            throw new IllegalArgumentException(String.format("worker Id can't be greater than %d or less than 0", maxWorkerId));
        }
        if (datacenterId > maxDatacenterId || datacenterId < 0) {
            throw new IllegalArgumentException(String.format("datacenter Id can't be greater than %d or less than 0", maxDatacenterId));
        }
        this.workerId = workerId;
        this.datacenterId = datacenterId;
    }

    // ==============================Methods==========================================

    /**
     * 获得下一个ID (该方法是线程安全的) - synchronized
     *
     * @return SnowflakeId
     */
    public synchronized long nextId() {
        long timestamp = System.currentTimeMillis();

        // 如果当前时间小于上一次ID生成的时间戳，说明系统时钟回退过这个时候应当抛出异常
        /**
         * 这块代码其实在对于时钟回拨的问题上已经进行了简化
         * 当出现时钟回拨时直接抛出异常
         * 实际美团的做法是对于时钟回拨的情况下，如果时钟回拨的时间小于5ms则会再做一层重试，如果重试后还是时钟回拨则抛出异常
          */
        if (timestamp < lastTimestamp) {
            throw new RuntimeException(
                    String.format("Clock moved backwards.  Refusing to generate id for %d milliseconds", lastTimestamp - timestamp));
        }

        //如果是同一时间生成的，则进行毫秒内序列
        if (lastTimestamp == timestamp) {
            //当sequence累加到4096，也就是0001000000000000时，和sequenceMask相与后sequence=0
            sequence = (sequence + 1) & sequenceMask;
            //毫秒内序列溢出
            if (sequence == 0) {
                // 下一毫秒开始序列号随机处理，避免低并发下序列号分布不均匀 -> 如果根据 id 进行分库分表，就会导致数据倾斜分布不均匀
                sequence = random.nextInt(100);
                //阻塞到下一个毫秒,获得新的时间戳
                timestamp = tilNextMillis(lastTimestamp);
            }
        }
        //时间戳改变，毫秒内序列重置
        else {
            // 下一毫秒开始序列号随机处理，避免低并发下序列号分布不均匀 -> 如果根据 id 进行分库分表，就会导致数据倾斜分布不均匀
            sequence = random.nextInt(100);
//            sequence = 0L;
        }

        //上次生成ID的时间戳
        lastTimestamp = timestamp;

        //移位并通过或运算拼到一起组成64位的ID
        return (timestamp << timestampLeftShift)       // 时间戳左移22位
                | (datacenterId << datacenterIdShift)  //数据标识左移17位
                | (workerId << workerIdShift)          //机器id标识左移12位
                | sequence;
    }

    /**
     * 阻塞到下一个毫秒，直到获得新的时间戳
     *
     * @param lastTimestamp 上次生成ID的时间戳
     * @return 当前时间戳
     */
    protected long tilNextMillis(long lastTimestamp) {
        long timestamp = System.currentTimeMillis();
        while (timestamp <= lastTimestamp) {
            timestamp = System.currentTimeMillis();
        }
        return timestamp;
    }

    /**
     * 测试
     */
    public static void main(String[] args) {
        /**
         * workerId - 机器id，datacenterId - 数据中心id
         * 一个机房一个datacenterId，一个机房多台机器，每台机器一个workerId
         * 所以发号服务支持的机器数量为 2^5 * 2^5 = 1024
         */
        SnowflakeIdWorker idWorker = new SnowflakeIdWorker(1, 1);
        for (int i = 0; i < 10; i++) {
            long id = idWorker.nextId();
            System.out.println(id);
            //System.out.println(Long.toBinaryString(id));
        }
    }
}
