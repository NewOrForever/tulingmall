package com.tuling.tulingmall.ordercurr.feignapi.pms;

import com.tuling.tulingmall.common.api.CommonResult;
import com.tuling.tulingmall.ordercurr.domain.CartPromotionItem;
import com.tuling.tulingmall.ordercurr.domain.StockChanges;
import com.tuling.tulingmall.ordercurr.model.OmsOrderItem;
import org.apache.ibatis.annotations.Param;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

/**
* @desc: 类的描述: 订单服务用于调用商品服务锁定库存
*/
@FeignClient(value = "tulingmall-product",path = "/stock")
public interface PmsProductStockFeignApi {


    @RequestMapping("/lockStock")
    CommonResult lockStock(@RequestBody List<CartPromotionItem> cartPromotionItemList);

    @RequestMapping("/reduceStock")
    CommonResult reduceStock(@RequestBody List<StockChanges> stockChangesList);

    @RequestMapping("/recoverStock")
    CommonResult recoverStock(@RequestBody List<StockChanges> stockChangesList);
}
