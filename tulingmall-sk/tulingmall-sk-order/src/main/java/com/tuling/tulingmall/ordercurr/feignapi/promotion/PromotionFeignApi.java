package com.tuling.tulingmall.ordercurr.feignapi.promotion;

import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
* @desc: 类的描述:秒杀库存管理
*/
@FeignClient(name = "tulingmall-promotion",path = "/seckill")
public interface PromotionFeignApi {

    /*减库存*/
    @RequestMapping(value = "/descStock", method = RequestMethod.GET)
    @ResponseBody
    public Integer descStock(@RequestParam("id") Long flashPromotionRelationId,
                             @RequestParam("stock") Integer stock);

    /*减库存*/
    @RequestMapping(value = "/incStock", method = RequestMethod.GET)
    @ResponseBody
    public Integer incStock(@RequestParam("id") Long flashPromotionRelationId,
                             @RequestParam("stock") Integer stock);

    /*减库存*/
    @RequestMapping(value = "/getStock", method = RequestMethod.GET)
    @ResponseBody
    public Integer getStock(@RequestParam("id") Long flashPromotionRelationId);
}
