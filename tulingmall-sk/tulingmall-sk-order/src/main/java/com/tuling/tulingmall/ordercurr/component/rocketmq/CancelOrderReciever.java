package com.tuling.tulingmall.ordercurr.component.rocketmq;

import com.tuling.tulingmall.ordercurr.feignapi.promotion.PromotionFeignApi;
import com.tuling.tulingmall.ordercurr.mapper.OmsOrderMapper;
import com.tuling.tulingmall.ordercurr.model.OmsOrder;
import com.tuling.tulingmall.ordercurr.service.SecKillOrderService;
import com.tuling.tulingmall.ordercurr.service.impl.OrderConstant;
import lombok.extern.slf4j.Slf4j;
import org.apache.rocketmq.spring.annotation.RocketMQMessageListener;
import org.apache.rocketmq.spring.core.RocketMQListener;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;

/**
 * 消费监听rocketmq-秒杀订单超时消息
 */
@Slf4j
@Component
@RocketMQMessageListener(consumerGroup = "${rocketmq.tulingmall.cancelGroupSk}",
        topic = "${rocketmq.tulingmall.scheduleTopicSk}")
public class CancelOrderReciever implements RocketMQListener<String> {

    @Autowired
    private PromotionFeignApi promotionFeignApi;

    @Autowired
    private SecKillOrderService secKillOrderService;

    @Autowired
    private OmsOrderMapper orderMapper;

    /**
     * 延时消息,取消超时订单
     * @param cancelId
     */
    @Override
    public void onMessage(String cancelId) {
        if(StringUtils.isEmpty(cancelId)){
            return;
        }
        String[] content = cancelId.split(":");
        Long orderId = Long.parseLong(content[0]);
        Long flashPromotionRelationId = Long.parseLong(content[1]);
        Long productId = Long.parseLong(content[2]);
        try {
            OmsOrder omsOrder = orderMapper.selectByPrimaryKey(orderId);
            if(null != omsOrder && omsOrder.getStatus() == OrderConstant.ORDER_STATUS_UNPAY){
                //取消订单,释放DB库存
                promotionFeignApi.incStock(flashPromotionRelationId,1);
                //取消的订单-还原缓存库存
                secKillOrderService.incrRedisStock(productId);
            }
        } catch (Exception e) {
            log.error("订单取消异常 : 还原库存失败，please check:{}",e.getMessage(),e.getCause());
            throw new RuntimeException();//抛异常出去,rocketmq会重新投递
        }

    }

}
