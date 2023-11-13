package com.tuling.tulingmall.feignapi;

import com.tuling.tulingmall.common.api.CommonResult;
import com.tuling.tulingmall.model.OmsOrderSetting;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * @author roy
 * @desc
 */
@FeignClient(value = "tulingmall-order-curr",path = "/orderSetting")
public interface OmsOrderSettingApi {

    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    CommonResult<OmsOrderSetting> getItem(@PathVariable("id") Long id);

    @RequestMapping(value = "/update/{id}", method = RequestMethod.POST)
    CommonResult update(@PathVariable("id") Long id, @RequestBody OmsOrderSetting orderSetting);
}
