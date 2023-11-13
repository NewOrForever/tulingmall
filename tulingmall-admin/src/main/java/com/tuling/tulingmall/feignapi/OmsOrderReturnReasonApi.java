package com.tuling.tulingmall.feignapi;

import com.tuling.tulingmall.common.api.CommonPage;
import com.tuling.tulingmall.common.api.CommonResult;
import com.tuling.tulingmall.model.OmsOrderReturnReason;
import io.swagger.annotations.ApiOperation;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * @author roy
 * @desc
 */
@FeignClient(value = "tulingmall-order-curr",path = "/returnReason")
public interface OmsOrderReturnReasonApi {

    @ApiOperation("添加退货原因")
    @RequestMapping(value = "/create", method = RequestMethod.POST)
    @ResponseBody
    CommonResult create(@RequestBody OmsOrderReturnReason returnReason);

    @ApiOperation("修改退货原因")
    @RequestMapping(value = "/update/{id}", method = RequestMethod.POST)
    @ResponseBody
    CommonResult update(@PathVariable("id") Long id, @RequestBody OmsOrderReturnReason returnReason);

    @ApiOperation("批量删除退货原因")
    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    @ResponseBody
    CommonResult delete(@RequestParam("ids") List<Long> ids);

    @ApiOperation("分页查询全部退货原因")
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    @ResponseBody
    CommonResult<CommonPage<OmsOrderReturnReason>> list(@RequestParam(value = "pageSize", defaultValue = "5") Integer pageSize,
                                                        @RequestParam(value = "pageNum", defaultValue = "1") Integer pageNum);

    @ApiOperation("获取单个退货原因详情信息")
    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    @ResponseBody
    public CommonResult<OmsOrderReturnReason> getItem(@PathVariable("id") Long id);

    @ApiOperation("修改退货原因启用状态")
    @RequestMapping(value = "/update/status", method = RequestMethod.POST)
    @ResponseBody
    public CommonResult updateStatus(@RequestParam(value = "status") Integer status,
                                     @RequestParam("ids") List<Long> ids);
}
