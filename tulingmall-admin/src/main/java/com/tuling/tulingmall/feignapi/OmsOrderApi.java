package com.tuling.tulingmall.feignapi;

import com.tuling.tulingmall.common.api.CommonPage;
import com.tuling.tulingmall.common.api.CommonResult;
import com.tuling.tulingmall.dto.*;
import com.tuling.tulingmall.model.OmsOrder;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * @author roy
 * @desc
 */
@FeignClient(value = "tulingmall-order-curr",path = "/orderadmin")
public interface OmsOrderApi {

    @RequestMapping(value = "/list", method = RequestMethod.GET)
    CommonResult<CommonPage<OmsOrder>> list(@RequestBody OmsOrderQueryParam queryParam,
                                            @RequestParam("pageSize") Integer pageSize,
                                            @RequestParam("pageNum") Integer pageNum) ;

    @RequestMapping(value = "/update/delivery", method = RequestMethod.POST)
    CommonResult delivery(@RequestBody List<OmsOrderDeliveryParam> deliveryParamList);

    @RequestMapping(value = "/update/close", method = RequestMethod.POST)
    CommonResult close(@RequestParam("ids") List<Long> ids,@RequestParam("note") String note);

    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    CommonResult delete(@RequestParam("ids") List<Long> ids);

    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    CommonResult<OmsOrderDetail> detail(@PathVariable("id") Long id);

    @RequestMapping(value = "/update/receiverInfo", method = RequestMethod.POST)
    CommonResult updateReceiverInfo(@RequestBody OmsReceiverInfoParam receiverInfoParam);

    @RequestMapping(value = "/update/moneyInfo", method = RequestMethod.POST)
    CommonResult updatMoneyInfo(@RequestBody OmsMoneyInfoParam moneyInfoParam);

    @RequestMapping(value = "/update/note", method = RequestMethod.POST)
    CommonResult updateNote(@RequestParam("id") Long id,
                            @RequestParam("note") String note,
                            @RequestParam("status") Integer status);
}
