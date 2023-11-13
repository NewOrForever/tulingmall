package com.tuling.tulingmall.service;

import com.tuling.tulingmall.common.api.CommonResult;
import com.tuling.tulingmall.common.exception.BusinessException;

/**
 * @description:
 **/
public interface SecKillConfirmOrderService {

    /**
     * 生成秒杀确认单
     * @param productId
     * @param memberId
     * @return
     */
    CommonResult generateConfirmMiaoShaOrder(Long productId
            , Long memberId,String token,Long flashPromotionId) throws BusinessException;

}
