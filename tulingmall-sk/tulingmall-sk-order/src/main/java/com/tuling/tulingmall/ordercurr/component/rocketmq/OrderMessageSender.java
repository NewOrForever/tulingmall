package com.tuling.tulingmall.ordercurr.component.rocketmq;

import com.tuling.tulingmall.ordercurr.domain.OrderMessage;
import lombok.extern.slf4j.Slf4j;
import org.apache.rocketmq.client.producer.SendResult;
import org.apache.rocketmq.client.producer.SendStatus;
import org.apache.rocketmq.spring.core.RocketMQTemplate;
import org.apache.rocketmq.spring.support.RocketMQHeaders;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.messaging.Message;
import org.springframework.messaging.support.MessageBuilder;
import org.springframework.stereotype.Component;

@Slf4j
@Component
public class OrderMessageSender {

    @Value("${rocketmq.tulingmall.scheduleTopicSk}")
    private String scheduleTopic;

//    @Value("${rocketmq.tulingmall.stocksync}")
//    private String stockSync;

//    @Value("${rocketmq.tulingmall.transTopic}")
//    private String transTopic;

    @Value("${rocketmq.tulingmall.asyncOrderTopicSk}")
    private String asyncOrderTopic;

    @Autowired
    private RocketMQTemplate rocketMQTemplate;

    /**
     * 发送延时订单
     * messageDelayLevel=1s 5s 10s 30s 1m 2m 3m 4m 5m 6m 7m 8m 9m 10m 20m 30m 1h 2h
     * @param cancelId
     *      秒杀订单ID orderId:promotionId 秒杀活动ID
     * @return
     */
    public boolean sendTimeOutOrderMessage(String cancelId){
        Message message = MessageBuilder.withPayload(cancelId)
                .setHeader(RocketMQHeaders.KEYS, cancelId)
                .build();
        SendResult result = rocketMQTemplate.syncSend(scheduleTopic,message,5000,15);
        return SendStatus.SEND_OK == result.getSendStatus();
    }

    /**发送创建订单消息*/
    public boolean sendCreateOrderMsg(OrderMessage message){
        SendResult result = rocketMQTemplate.syncSend(asyncOrderTopic,message);
        return SendStatus.SEND_OK == result.getSendStatus();
    }

//    /**
//     * 发送延时同步库存消息，60s后同步库存
//     * @param productId
//     * @param promotionId
//     * @return
//     */
//    public boolean sendStockSyncMessage(Long productId,Long promotionId){
//        Message message = MessageBuilder.withPayload(productId+":"+promotionId).build();
//        SendResult result = rocketMQTemplate.syncSend(stockSync,message,5000,5);
//        return SendStatus.SEND_OK == result.getSendStatus();
//    }
}
