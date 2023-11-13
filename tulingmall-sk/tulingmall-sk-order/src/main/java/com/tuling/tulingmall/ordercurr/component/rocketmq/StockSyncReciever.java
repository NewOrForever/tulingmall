package com.tuling.tulingmall.ordercurr.component.rocketmq;

import com.tuling.tulingmall.common.constant.RedisKeyPrefixConst;
import com.tuling.tulingmall.ordercurr.feignapi.pms.PmsProductFeignApi;
import com.tuling.tulingmall.rediscomm.util.RedisClusterUtil;
import lombok.extern.slf4j.Slf4j;
import org.apache.rocketmq.spring.core.RocketMQListener;
import org.springframework.beans.factory.annotation.Autowired;


/**
 * @description: 消息消费，解决数据库和redis库存不一致的问题
 * 本类其实已无必要
 **/
@Slf4j
//@Component
//@RocketMQMessageListener(topic = "${rocketmq.tulingmall.stocksync}",consumerGroup = "stock-sync-worker")
public class StockSyncReciever implements RocketMQListener<String> {

    @Autowired
    private RedisClusterUtil redisOpsUtil;

    @Autowired
    private PmsProductFeignApi stockManageFeignApi;

    @Override
    public void onMessage(String message) {
        String[] param = message.split(":");
        if(param.length <= 1){
            log.error("库存同步，消费消息参数不完整!");
            return;
        }
        Long productID = Long.parseLong(param[0]);
        Long promotionId =  Long.parseLong(param[1]);
        /*
         * 有此标记,代表还没有做同步,需要同步DB到redis,如果标记被删除说明肯定不久前
         * 刚刚同步过。同步过就没有必要多次去同步，多条同步延时消息来源于高并发下发送
         * 库存同步消息。这里任然没有办法绝对避免多次查询DB，但是可以大大减少查询次数.
         */
        if(redisOpsUtil.hasKey(RedisKeyPrefixConst.STOCK_REFRESHED_MESSAGE_PREFIX + promotionId)){
            log.info("start sync mysql stock to redis");
            //error mark注：这里的同步是没有必要的，而且有可能造成超卖的情况，动作一是直接从数据库读取
            // 或是远程调用获得当前库存，动作二是在获取后再更改redis缓存中的库存值，这中间是有个时间段的，
            // 因此在并发情况下，不管是否有NPC问题，完全有可能出现在这两个动作之间出现了新的DB库存扣减操作
            // 在V5版本中已经改成所有的库存扣减只从Redis中操作，然后从MQ中异步写回到DB中
            //todo 同步一下库存到缓存当中
//            Integer stock = stockManageFeignApi.selectStock(productID,promotionId).getData();
//            if(stock > 0){
//                //重置库存
//                redisOpsUtil.set(RedisKeyPrefixConst.MIAOSHA_STOCK_CACHE_PREFIX + productID,stock);
//                //删除同步标记
//                redisOpsUtil.delete(RedisKeyPrefixConst.STOCK_REFRESHED_MESSAGE_PREFIX + promotionId);
//            }
        }
    }

}
