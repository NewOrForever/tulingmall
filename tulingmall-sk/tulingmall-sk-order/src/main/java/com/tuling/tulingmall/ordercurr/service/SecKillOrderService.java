package com.tuling.tulingmall.ordercurr.service;//package com.tuling.tulingmall.service;

import com.tuling.tulingmall.common.api.CommonResult;
import com.tuling.tulingmall.common.exception.BusinessException;
import com.tuling.tulingmall.ordercurr.domain.SecKillOrderParam;
import com.tuling.tulingmall.ordercurr.domain.PmsProductParam;
import com.tuling.tulingmall.ordercurr.model.OmsOrder;
import com.tuling.tulingmall.ordercurr.model.OmsOrderItem;
import com.tuling.tulingmall.promotion.domain.FlashPromotionProduct;

import java.util.Map;

/**
 * @description:
 **/
public interface SecKillOrderService {

    CommonResult checkOrder(Long orderId);


    /**
     * 秒杀订单下单
     * @param secKillOrderParam
     * @param memberId
     * @return
     */
    CommonResult generateSecKillOrder(SecKillOrderParam secKillOrderParam, Long memberId,
                                      String token,Integer stockCount) throws BusinessException;

    /**
     * 还原redis库存,每次加1
     * @param productId
     */
    void incrRedisStock(Long productId);

    /**
     * 判断是否应该pub消息清除集群服务本地的售罄标识
     * @param productId
     * @return
     */
    boolean shouldPublishCleanMsg(Long productId);

    /**
     * 异步下单
     * @param order
     * @param orderItem
     * @param flashPromotionRelationId
     * @return
     */
    Long asyncCreateOrder(OmsOrder order, OmsOrderItem orderItem, Long flashPromotionRelationId);

    /**
     * 获取产品信息
     * @param productId
     * @return
     */
    FlashPromotionProduct getProductInfo(Long flashPromotionId,Long productId);

    void failSendMessage(long productId, Map<String,Object> result);

}
