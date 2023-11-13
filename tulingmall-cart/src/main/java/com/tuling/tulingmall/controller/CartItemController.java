package com.tuling.tulingmall.controller;

import com.tuling.tulingmall.common.api.CommonResult;
import com.tuling.tulingmall.common.exception.BusinessException;
import com.tuling.tulingmall.domain.CartProduct;
import com.tuling.tulingmall.domain.CartPromotionItem;
import com.tuling.tulingmall.domain.ConfirmOrderResult;
import com.tuling.tulingmall.domain.OrderParam;
import com.tuling.tulingmall.model.OmsCartItem;
import com.tuling.tulingmall.service.OmsCartItemService;
import com.tuling.tulingmall.service.OmsPortalOrderService;
import com.tuling.tulingmall.service.SecKillOrderService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author roy
 * @desc
 */
@Controller
@RequestMapping("/cart")
@Api(tags = "CartItemController")
public class CartItemController {

    @Resource
    private SecKillOrderService secKillOrderService;

    @Autowired
    private OmsCartItemService cartItemService;

    @Autowired
    private OmsPortalOrderService portalOrderService;

    @ApiOperation("根据购物车信息生成确认单信息")
    @ApiImplicitParam(name = "itemId",value = "购物车选择购买的选项ID",allowMultiple = true,paramType = "query",dataType = "long")
    @RequestMapping(value = "/generateConfirmOrder",method = RequestMethod.POST)
    @ResponseBody
    public CommonResult<ConfirmOrderResult> generateConfirmOrder(@RequestParam(value = "itemIds") List<Long> itemIds,
                                                                 @RequestHeader("memberId") Long memberId) throws BusinessException {
        ConfirmOrderResult confirmOrderResult = portalOrderService.generateConfirmOrder(itemIds,memberId);
        return CommonResult.success(confirmOrderResult);
    }

    /**
     * 秒杀订单确认页
     * @param productId
     * @param memberId
     * @return
     * @throws BusinessException
     */
    @RequestMapping(value = "/miaosha/generateConfirmOrder",method = RequestMethod.POST)
    @ResponseBody
    public CommonResult generateMiaoShaConfirmOrder(@RequestParam("productId") Long productId,
                                                    String token,
                                                    @RequestHeader("memberId") Long memberId) throws BusinessException {
        return secKillOrderService.generateConfirmMiaoShaOrder(productId,memberId,token);
    }

    @ApiOperation(value = "添加商品到购物车", notes = "修改购物逻辑,数据不必全都从前台传")
    @RequestMapping(value = "/add",method = RequestMethod.POST)
    @ResponseBody
    public CommonResult add(@RequestBody OmsCartItem cartItem, @RequestHeader("memberId") Long memberId, @RequestHeader("nickName") String nickName) {
        int count = cartItemService.add(cartItem, memberId, nickName);
        if (count > 0) {
            return CommonResult.success(count);
        }
        return CommonResult.failed();
    }

    @ApiOperation("获取某个会员的购物车列表")
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    @ResponseBody
    public CommonResult<List<OmsCartItem>> list(@RequestHeader("memberId") Long memberId) {
        List<OmsCartItem> cartItemList = cartItemService.list(memberId);
        return CommonResult.success(cartItemList);
    }

    @ApiOperation("获取某个会员的购物车列表,包括促销信息")
    @RequestMapping(value = "/list/promotion", method = RequestMethod.GET)
    @ResponseBody
    public CommonResult<List<CartPromotionItem>> listPromotion(@RequestHeader("memberId") Long memberId) {
        List<CartPromotionItem> cartPromotionItemList = cartItemService.listPromotion(memberId);
        return CommonResult.success(cartPromotionItemList);
    }

    @ApiOperation("获取某个会员的指定的购物车列表,包括促销信息#订单模块需要")
    @RequestMapping(value = "/list/selectedpromotion", method = {RequestMethod.POST})
    @ResponseBody
    public List<CartPromotionItem> listSelectedPromotion(@RequestBody List<Long> itemIds,@RequestHeader("memberId") Long memberId) throws BusinessException {
        return cartItemService.listSelectedPromotion(memberId,itemIds);
    }

    @ApiOperation("修改购物车中某个商品的数量")
    @RequestMapping(value = "/update/quantity", method = RequestMethod.POST)
    @ResponseBody
    public CommonResult updateQuantity(@RequestParam Long id,
                                       @RequestParam Integer quantity,
                                       @RequestHeader("memberId") Long memberId) {
        int count = cartItemService.updateQuantity(id, memberId, quantity);
        if (count > 0) {
            return CommonResult.success(count);
        }
        return CommonResult.failed();
    }

    @ApiOperation("获取购物车中某个商品的规格,用于重选规格")
    @RequestMapping(value = "/getProduct/{productId}", method = RequestMethod.GET)
    @ResponseBody
    public CommonResult<CartProduct> getCartProduct(@PathVariable Long productId) {
        CartProduct cartProduct = cartItemService.getCartProduct(productId);
        return CommonResult.success(cartProduct);
    }

    @ApiOperation("修改购物车中商品的规格")
    @RequestMapping(value = "/update/attr", method = RequestMethod.POST)
    @ResponseBody
    public CommonResult updateAttr(@RequestBody OmsCartItem cartItem,
                                   @RequestHeader("memberId") Long memberId,
                                   @RequestHeader("nickName") String nickName) {
        int count = cartItemService.updateAttr(cartItem, memberId, nickName);
        if (count > 0) {
            return CommonResult.success(count);
        }
        return CommonResult.failed();
    }

    @ApiOperation("删除购物车中的某个商品")
    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    @ResponseBody
    public CommonResult delete(@RequestParam("ids") List<Long> ids, @RequestHeader("memberId") Long memberId) {
        int count = cartItemService.delete(memberId, ids);
        if (count > 0) {
            return CommonResult.success(count);
        }
        return CommonResult.failed();
    }

    @ApiOperation("清空购物车")
    @RequestMapping(value = "/clear", method = RequestMethod.POST)
    @ResponseBody
    public CommonResult clear(@RequestHeader("memberId") Long memberId) {
        int count = cartItemService.clear(memberId);
        if (count > 0) {
            return CommonResult.success(count);
        }
        return CommonResult.failed();
    }
}
