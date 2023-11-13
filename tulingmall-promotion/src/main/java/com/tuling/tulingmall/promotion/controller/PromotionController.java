package com.tuling.tulingmall.promotion.controller;

import com.tuling.tulingmall.common.api.CommonResult;
import com.tuling.tulingmall.promotion.model.SmsCouponHistory;
import com.tuling.tulingmall.promotion.domain.CartPromotionItem;
import com.tuling.tulingmall.promotion.domain.SmsCouponHistoryDetail;
import com.tuling.tulingmall.promotion.service.UserCouponService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 优惠券管理Controller
 */
@Controller
@Api(tags = "PromotionController", description = "优惠券统一管理")
@RequestMapping("/coupon")
public class PromotionController {
    @Autowired
    private UserCouponService userCouponService;

    @ApiOperation("用户领取指定优惠券")
    @RequestMapping(value = "/add/{couponId}", method = RequestMethod.POST)
    @ResponseBody
    public CommonResult userActivelyGet(@PathVariable("couponId") Long couponId,
                                        @RequestHeader(value = "memberId",required = true) Long memberId,
                                        @RequestHeader(value = "nickName",required = true) String nickName) {
        return userCouponService.activelyGet(couponId,memberId,nickName);
    }

    @ApiOperation("获取用户优惠券列表")
    @ApiImplicitParam(name = "useStatus", value = "优惠券筛选类型:0->未使用；1->已使用；2->已过期",
            allowableValues = "0,1,2", paramType = "query", dataType = "integer")
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    @ResponseBody
    public CommonResult<List<SmsCouponHistory>> listUserCoupons(
            @RequestParam(value = "useStatus", required = false) Integer useStatus,
            @RequestHeader("memberId") Long memberId) {
        List<SmsCouponHistory> couponHistoryList = userCouponService.listCoupons(useStatus,memberId);
        return CommonResult.success(couponHistoryList);
    }

//    @ApiOperation("获取用户购物车商品的相关优惠券")
//    @ApiImplicitParam(name = "type", value = "使用可用:0->不可用；1->可用",
//            defaultValue = "1", allowableValues = "0,1", paramType = "query", dataType = "integer")
//    @RequestMapping(value = "/list/cart/{type}", method = RequestMethod.GET)
//    @ResponseBody
//    public CommonResult<List<SmsCouponHistoryDetail>> listCartCoupons(@PathVariable Integer type,
//                                                                      @RequestHeader("memberId") Long memberId) {
//        List<CartPromotionItem> cartPromotionItemList = omsCartItemClientApi.listPromotionByMemberId().getData();
//        List<SmsCouponHistoryDetail> couponHistoryList = userCouponService.listCart(cartPromotionItemList, type,memberId);
//        return CommonResult.success(couponHistoryList);
//    }

    @ApiOperation("获取用户购物车商品的相关优惠券")
    @ApiImplicitParam(name = "type", value = "使用可用:0->不可用；1->可用",
            defaultValue = "1", allowableValues = "0,1", paramType = "query", dataType = "integer")
    @RequestMapping(value = "/listCart", method = RequestMethod.POST)
    @ResponseBody
    public CommonResult<List<SmsCouponHistoryDetail>> listCartCoupons(@RequestParam Integer type,
                                                                      @RequestBody List<CartPromotionItem> cartPromotionItemList,
                                                                      @RequestHeader("memberId")Long memberId) {

        List<SmsCouponHistoryDetail> couponHistoryList = userCouponService.listCart(cartPromotionItemList, type,memberId);
        return CommonResult.success(couponHistoryList);
    }
}
