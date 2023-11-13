package com.tuling.tulingmall.ordercurr.controller;

import com.tuling.tulingmall.common.api.CommonResult;
import com.tuling.tulingmall.common.exception.BusinessException;
import com.tuling.tulingmall.ordercurr.domain.SecKillOrderParam;
import com.tuling.tulingmall.ordercurr.service.SecKillOrderService;
import io.swagger.annotations.Api;

import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;


/**
 * 秒杀订单管理Controller
 */
@Slf4j
@Controller
@Api(tags = "SeckillOrderController",description = "秒杀订单管理")
@RequestMapping("/seckillOrder")
public class SecKillOrderController {

    @Autowired
    private SecKillOrderService secKillOrderService;

    @ApiOperation("生成秒杀订单")
    @RequestMapping(value = "/generateOrder",method = RequestMethod.POST)
    @ResponseBody
    public CommonResult generateOrder(@RequestBody SecKillOrderParam secKillOrderParam,
                                      @RequestHeader("memberId") Long memberId) throws BusinessException {
        return secKillOrderService.generateSecKillOrder(secKillOrderParam,memberId,null,1);
    }

    @ApiOperation("查询秒杀订单是否生成")
    @RequestMapping(value = "/checkOrder",method = RequestMethod.POST)
    @ResponseBody
    public CommonResult checkOrder(@RequestParam("orderId") Long orderId) throws BusinessException {
        return secKillOrderService.checkOrder(orderId);
    }

}
