package com.tuling.tulingmall.service.impl;

import com.alibaba.otter.canal.client.CanalConnector;
import com.alibaba.otter.canal.protocol.CanalEntry;
import com.alibaba.otter.canal.protocol.Message;
import com.tuling.tulingmall.config.PromotionRedisKey;
import com.tuling.tulingmall.rediscomm.util.RedisClusterUtil;
import com.tuling.tulingmall.rediscomm.util.RedisSingleUtil;
import com.tuling.tulingmall.service.IProcessCanalData;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.scheduling.annotation.Async;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import javax.annotation.PostConstruct;
import javax.annotation.PreDestroy;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

@Service
@Slf4j
public class PromotionData implements IProcessCanalData {

    private final static String SMS_HOME_ADVERTISE = "sms_home_advertise";
    private final static String SMS_HOME_BRAND = "sms_home_brand";
    private final static String SMS_HOME_NEW_PRODUCT = "sms_home_new_product";
    private final static String SMS_HOME_RECOMMEND_PRODUCT = "sms_home_recommend_product";
    /*存储从表名到Redis缓存的键*/
    private Map<String,String> tableMapKey = new HashMap<>();

    @Autowired
    @Qualifier("promotionConnector")
    private CanalConnector connector;

    @Autowired
    private PromotionRedisKey promotionRedisKey;

    // 暂未搭建Redis集群，先使用单机版
//    @Autowired
//    private RedisClusterUtil redisOpsExtUtil;
    @Autowired
    private RedisSingleUtil redisOpsExtUtil;

    @Value("${canal.promotion.subscribe:server}")
    private String subscribe;

    @Value("${canal.promotion.batchSize}")
    private int batchSize;

    @PostConstruct
    @Override
    public void connect() {
        /**
         * @see MyTestData 测试下这个 while true
         * 类似这种循环我好像记得在 Zookeeper 还是 RabbitMQ 的学习笔记中我写过呢
         * 这个开线程while true 循环执行 我暂时还是不太能 hold 住，得后面并发学习后才能使用
         *   while (flag) {
         *             try {
         *                 connector.connect();
         *                 connector.subscribe(filter);
         *                 while (flag) {
         *                     Message message = connector.getWithoutAck(batchSize, timeout, unit);
         *                     log.info("获取消息 {}", message);
         *                     long batchId = message.getId();
         *                     if (message.getId() != -1 && message.getEntries().size() != 0) {
         *                         messageHandler.handleMessage(message);
         *                     }
         *                     connector.ack(batchId);
         *                 }
         *             } catch (Exception e) {
         *                 log.error("canal client 异常", e);
         *             } finally {
         *                 connector.disconnect();
         *             }
         *         }
         */
        tableMapKey.put(SMS_HOME_ADVERTISE,promotionRedisKey.getHomeAdvertiseKey());
        tableMapKey.put(SMS_HOME_BRAND,promotionRedisKey.getBrandKey());
        tableMapKey.put(SMS_HOME_NEW_PRODUCT,promotionRedisKey.getNewProductKey());
        tableMapKey.put(SMS_HOME_RECOMMEND_PRODUCT,promotionRedisKey.getRecProductKey());
        connector.connect();
        if("server".equals(subscribe))
            connector.subscribe(null);
        else
            connector.subscribe(subscribe);
        connector.rollback();
    }

    @PreDestroy
    @Override
    public void disConnect() {
        connector.disconnect();
    }

    /**
     * 写定时任务，每隔5秒执行一次去手动检查Canal服务器是否有数据变更
     * 这样做会不会导致数据变更的延迟？？？
     * canal client 是否能够订阅数据变更的通知？？？
     */
    @Async
    @Scheduled(initialDelayString="${canal.promotion.initialDelay:5000}",fixedDelayString = "${canal.promotion.fixedDelay:5000}")
    @Override
    public void processData() {
        try {
            if(!connector.checkValid()){
                log.warn("与Canal服务器的连接失效！！！重连，下个周期再检查数据变更");
                this.connect();
            }else{
                Message message = connector.getWithoutAck(batchSize);
                long batchId = message.getId();
                int size = message.getEntries().size();
                if (batchId == -1 || size == 0) {
                    log.info("本次[{}]没有检测到促销数据更新。",batchId);
                }else{
                    log.info("本次[{}]促销数据本次共有[{}]次更新需要处理",batchId,size);
                    /*一个表在一次周期内可能会被修改多次，而对Redis缓存的处理只需要处理一次即可*/
                    Set<String> factKeys = new HashSet<>();
                    for(CanalEntry.Entry entry : message.getEntries()){
                        if (entry.getEntryType() == CanalEntry.EntryType.TRANSACTIONBEGIN
                                || entry.getEntryType() == CanalEntry.EntryType.TRANSACTIONEND) {
                            continue;
                        }
                        /**
                         * @see com.alibaba.otter.canal.protocol.CanalEntry.RowData#beforeColumns_ 修改前的数据
                         * @see com.alibaba.otter.canal.protocol.CanalEntry.RowData#afterColumns_ 修改后的数据
                         */
                        CanalEntry.RowChange rowChange = CanalEntry.RowChange.parseFrom(entry.getStoreValue());
                        String tableName = entry.getHeader().getTableName();
                        if(log.isDebugEnabled()){
                            CanalEntry.EventType eventType = rowChange.getEventType();
                            log.debug("数据变更详情：来自binglog[{}.{}]，数据源{}.{}，变更类型{}",
                                    entry.getHeader().getLogfileName(),entry.getHeader().getLogfileOffset(),
                                    entry.getHeader().getSchemaName(),tableName,eventType);
                        }
                        factKeys.add(tableMapKey.get(tableName));
                    }
                    for(String key : factKeys){
                        if(StringUtils.isNotEmpty(key))  redisOpsExtUtil.delete(key);
                    }
                    connector.ack(batchId); // 提交确认
                    log.info("本次[{}]处理促销Canal同步数据完成",batchId);
                }
            }
        } catch (Exception e) {
            log.error("处理促销Canal同步数据失效，请检查：",e);
        }

    }
}
