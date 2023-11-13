package com.tuling.tulingmall.promotion.service;

import com.tuling.tulingmall.common.api.CommonResult;
import com.tuling.tulingmall.promotion.model.SmsCouponHistory;
import com.tuling.tulingmall.promotion.domain.CartPromotionItem;
import com.tuling.tulingmall.promotion.domain.SmsCouponHistoryDetail;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 用户优惠券管理Service
 * Created by macro on 2018/8/29.
 */
public interface UserCouponService {
    /**
     * 会员添加优惠券
     */
    @Transactional
    CommonResult activelyGet(Long couponId, Long memberId, String nickName);

    /**
     * 获取优惠券列表
     * @param useStatus 优惠券的使用状态
     */
    List<SmsCouponHistory> listCoupons(Integer useStatus, Long memberId);

    /**
     * 根据购物车信息获取可用优惠券
     */
    List<SmsCouponHistoryDetail> listCart(List<CartPromotionItem> cartItemList, Integer type,Long memberId);
}
