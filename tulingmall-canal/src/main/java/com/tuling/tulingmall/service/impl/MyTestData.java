//package com.tuling.tulingmall.service.impl;
//
//import com.alibaba.otter.canal.client.CanalConnector;
//import com.alibaba.otter.canal.protocol.CanalEntry;
//import com.alibaba.otter.canal.protocol.Message;
//import com.tuling.tulingmall.config.PromotionRedisKey;
//import com.tuling.tulingmall.rediscomm.util.RedisSingleUtil;
//import com.tuling.tulingmall.service.IProcessCanalData;
//import lombok.extern.slf4j.Slf4j;
//import org.apache.commons.lang.StringUtils;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.beans.factory.annotation.Qualifier;
//import org.springframework.beans.factory.annotation.Value;
//import org.springframework.scheduling.annotation.Async;
//import org.springframework.scheduling.annotation.Scheduled;
//import org.springframework.stereotype.Service;
//
//import javax.annotation.PostConstruct;
//import javax.annotation.PreDestroy;
//import java.util.HashMap;
//import java.util.HashSet;
//import java.util.Map;
//import java.util.Set;
//import java.util.concurrent.TimeUnit;
//
//@Service
//@Slf4j
//public class MyTestData implements IProcessCanalData {
//
//    private final static String SMS_HOME_ADVERTISE = "sms_home_advertise";
//    private final static String SMS_HOME_BRAND = "sms_home_brand";
//    private final static String SMS_HOME_NEW_PRODUCT = "sms_home_new_product";
//    private final static String SMS_HOME_RECOMMEND_PRODUCT = "sms_home_recommend_product";
//    /*存储从表名到Redis缓存的键*/
//    private Map<String, String> tableMapKey = new HashMap<>();
//
//    @Autowired
//    @Qualifier("promotionConnector")
//    private CanalConnector connector;
//
//    @Autowired
//    private PromotionRedisKey promotionRedisKey;
//
//    // 暂未搭建Redis集群，先使用单机版
////    @Autowired
////    private RedisClusterUtil redisOpsExtUtil;
//    @Autowired
//    private RedisSingleUtil redisOpsExtUtil;
//
//    @Value("${canal.promotion.subscribe:server}")
//    private String subscribe;
//
//    @Value("${canal.promotion.batchSize}")
//    private int batchSize;
//
//    @PostConstruct
//    @Override
//    public void connect() {
//        tableMapKey.put(SMS_HOME_ADVERTISE, promotionRedisKey.getHomeAdvertiseKey());
//        tableMapKey.put(SMS_HOME_BRAND, promotionRedisKey.getBrandKey());
//        tableMapKey.put(SMS_HOME_NEW_PRODUCT, promotionRedisKey.getNewProductKey());
//        tableMapKey.put(SMS_HOME_RECOMMEND_PRODUCT, promotionRedisKey.getRecProductKey());
//        Runnable runnable = new Runnable() {
//            @Override
//            public void run() {
//                boolean flag = true;
//                while (flag) {
//                    try {
//                        connector.connect();
//                        connector.subscribe();
//                        connector.rollback();
//                        while (flag) {
//                            Message message = connector.getWithoutAck(batchSize);
//                            log.info("获取消息 {}", message);
//                            long batchId = message.getId();
//                            int size = message.getEntries().size();
//                            if (message.getId() != -1 && message.getEntries().size() != 0) {
//                                log.info("本次[{}]促销数据本次共有[{}]次更新需要处理", batchId, size);
//                                /*一个表在一次周期内可能会被修改多次，而对Redis缓存的处理只需要处理一次即可*/
//                                Set<String> factKeys = new HashSet<>();
//                                for (CanalEntry.Entry entry : message.getEntries()) {
//                                    if (entry.getEntryType() == CanalEntry.EntryType.TRANSACTIONBEGIN
//                                            || entry.getEntryType() == CanalEntry.EntryType.TRANSACTIONEND) {
//                                        continue;
//                                    }
//                                    /**
//                                     * @see com.alibaba.otter.canal.protocol.CanalEntry.RowData#beforeColumns_ 修改前的数据
//                                     * @see com.alibaba.otter.canal.protocol.CanalEntry.RowData#afterColumns_ 修改后的数据
//                                     */
//                                    CanalEntry.RowChange rowChange = CanalEntry.RowChange.parseFrom(entry.getStoreValue());
//                                    String tableName = entry.getHeader().getTableName();
//                                    if (log.isDebugEnabled()) {
//                                        CanalEntry.EventType eventType = rowChange.getEventType();
//                                        log.debug("数据变更详情：来自binglog[{}.{}]，数据源{}.{}，变更类型{}",
//                                                entry.getHeader().getLogfileName(), entry.getHeader().getLogfileOffset(),
//                                                entry.getHeader().getSchemaName(), tableName, eventType);
//                                    }
//                                    factKeys.add(tableMapKey.get(tableName));
//                                }
//                                for (String key : factKeys) {
//                                    if (StringUtils.isNotEmpty(key)) redisOpsExtUtil.delete(key);
//                                }
//                                connector.ack(batchId); // 提交确认
//                                log.info("本次[{}]处理促销Canal同步数据完成", batchId);
//                            } else {
//                                // 没拉取到数据，休眠1秒
//                                TimeUnit.SECONDS.sleep(1);
//                            }
//                        }
//                    } catch (Exception e) {
//                        log.error("canal client 异常", e);
//                    } finally {
//                        connector.disconnect();
//                    }
//                }
//            }
//        };
//
//        Thread thread = new Thread(runnable);
//        thread.setDaemon(true);
//        thread.start();
//    }
//
//    @PreDestroy
//    @Override
//    public void disConnect() {
//        connector.disconnect();
//    }
//
//    @Override
//    public void processData() {
//
//    }
//
//
//}
