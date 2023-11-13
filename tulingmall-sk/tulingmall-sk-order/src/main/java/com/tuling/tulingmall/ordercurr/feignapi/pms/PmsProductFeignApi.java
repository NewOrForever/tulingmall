package com.tuling.tulingmall.ordercurr.feignapi.pms;

import com.tuling.tulingmall.common.api.CommonResult;
import com.tuling.tulingmall.ordercurr.domain.PmsProductParam;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.*;


/**
* @desc: 类的描述:调用商品服务接口
*/
@FeignClient(name = "tulingmall-product")
public interface PmsProductFeignApi {

//    @RequestMapping(value = "/pms/productInfo/{id}", method = RequestMethod.GET)
//    @ResponseBody
//    CommonResult<PmsProductParam> getProductInfo(@PathVariable("id") Long id);
//
//    @RequestMapping(value = "/stock/selectStock", method = RequestMethod.GET)
//    @ResponseBody
//    CommonResult<Integer> selectStock(@RequestParam("productId") Long productId,
//                                      @RequestParam(value = "flashPromotionRelationId") Long flashPromotionRelationId);

}
