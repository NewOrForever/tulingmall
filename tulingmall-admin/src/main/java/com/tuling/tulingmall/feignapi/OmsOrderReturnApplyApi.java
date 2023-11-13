package com.tuling.tulingmall.feignapi;

import com.tuling.tulingmall.common.api.CommonPage;
import com.tuling.tulingmall.common.api.CommonResult;
import com.tuling.tulingmall.dto.OmsOrderReturnApplyResult;
import com.tuling.tulingmall.dto.OmsReturnApplyQueryParam;
import com.tuling.tulingmall.dto.OmsUpdateStatusParam;
import com.tuling.tulingmall.model.OmsOrderReturnApply;
import io.swagger.annotations.ApiOperation;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * @author roy
 * @desc
 */
@FeignClient(value = "tulingmall-order-curr",path = "/returnApply")
public interface OmsOrderReturnApplyApi {

    @RequestMapping(value = "/list", method = RequestMethod.GET)
    CommonResult<CommonPage<OmsOrderReturnApply>> list(OmsReturnApplyQueryParam queryParam,
                                                       @RequestParam(value = "pageSize", defaultValue = "5") Integer pageSize,
                                                       @RequestParam(value = "pageNum", defaultValue = "1") Integer pageNum);

    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    CommonResult delete(@RequestParam("ids") List<Long> ids);

    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    CommonResult getItem(@PathVariable("id") Long id);

    @RequestMapping(value = "/update/status/{id}", method = RequestMethod.POST)
    CommonResult updateStatus(@PathVariable("id") Long id,@RequestBody OmsUpdateStatusParam statusParam);
}
