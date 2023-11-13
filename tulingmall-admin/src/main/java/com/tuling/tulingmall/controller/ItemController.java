package com.tuling.tulingmall.controller;

import com.tuling.tulingmall.common.api.CommonResult;
import com.tuling.tulingmall.service.ItemService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
@Api(description = "商品列表信息")
@RequestMapping("/item")
public class ItemController {
    @Autowired
    @Qualifier("tulingItemServiceImpl")
    ItemService itemService;

    @RequestMapping(value = "/static/{id}",method = RequestMethod.GET)
    @ApiOperation(value = "静态化商品")
    public CommonResult<String> buildStatic(@PathVariable Long id){

        String path = itemService.toStatic(id);
        if(StringUtils.isEmpty(path)){
            return  CommonResult.failed("静态化商品页面出现异常");
        }
        return  CommonResult.success(path);
    }

}