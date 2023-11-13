package com.tuling.tulingmall.ordercurr.feignapi.cart;

import com.tuling.tulingmall.ordercurr.domain.CartPromotionItem;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
* @desc: 调用购物车服务
*/
@FeignClient(name = "tulingmall-cart",path = "/cart")
public interface CartFeignApi {


//    public String getSegmentId(@PathVariable("key") String key) ;
//    @RequestMapping(value = "/api/segment/get/{key}")
//    public List<CartPromotionItem> listSelectedPromotion(List<Long> itemIds,Long memberId);

    @RequestMapping(value = "/list/selectedpromotion", method = RequestMethod.POST)
    public List<CartPromotionItem> listSelectedPromotion(@RequestBody List<Long> itemIds);

}
