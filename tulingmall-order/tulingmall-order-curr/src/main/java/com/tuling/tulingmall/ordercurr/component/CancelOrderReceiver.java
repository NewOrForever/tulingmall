package com.tuling.tulingmall.ordercurr.component;//package com.tuling.tulingmall.component;
//
//import com.fasterxml.jackson.databind.ObjectMapper;
//import com.tuling.tulingmall.domain.MqCancelOrder;
//import com.tuling.tulingmall.service.OmsPortalOrderService;
//import org.apache.rocketmq.common.message.Message;
//import org.apache.rocketmq.spring.annotation.RocketMQMessageListener;
//import org.apache.rocketmq.spring.core.RocketMQListener;
//import org.slf4j.Logger;
//import org.slf4j.LoggerFactory;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Component;
//
//import java.io.IOException;
//
///**
// * 取消订单消息的处理者
// */
//@Component
//@RocketMQMessageListener(topic = "mall.order.cancel.ttl",consumerGroup = "mall-order-cancel" )
//public class CancelOrderReceiver implements RocketMQListener<MqCancelOrder> {
//    private static Logger LOGGER =LoggerFactory.getLogger(CancelOrderReceiver.class);
//    @Autowired
//    private OmsPortalOrderService portalOrderService;
//
////    @RabbitListener(queues = "mall.order.cancel")
////    @RabbitHandler
////    public void handle(Message message) throws IOException {
////
////        ObjectMapper objectMapper = new ObjectMapper();
////        MqCancelOrder mqCancelOrder = objectMapper.readValue(message.getBody(), MqCancelOrder.class);
////
////
////
////        LOGGER.info("取消订单对象:{}",mqCancelOrder);
////        portalOrderService.cancelOrder(mqCancelOrder.getOrderId(),mqCancelOrder.getMemberId());
////        LOGGER.info("process orderId:{}",mqCancelOrder.getOrderId());
////    }
//
//    @Override
//    public void onMessage(MqCancelOrder mqCancelOrder) {
//        LOGGER.info("取消订单对象:{}",mqCancelOrder);
//        portalOrderService.cancelOrder(mqCancelOrder.getOrderId(),mqCancelOrder.getMemberId());
//        LOGGER.info("process orderId:{}",mqCancelOrder.getOrderId());
//    }
//}
