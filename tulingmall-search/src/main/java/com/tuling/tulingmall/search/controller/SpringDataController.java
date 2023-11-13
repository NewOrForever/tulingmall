package com.tuling.tulingmall.search.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tuling.tulingmall.search.domain.EsProduct;
import com.tuling.tulingmall.search.service.SpringDataService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;

/**
 * 搜索商品管理Controller
 */
@Controller
@Api(tags = "EsProductController", description = "搜索商品管理")
@RequestMapping("/esProduct")
public class SpringDataController {

    @Autowired
    private SpringDataService springDataService;


    @ApiOperation(value = "根据id创建商品")
    @RequestMapping(value = "/create/{id}", method = RequestMethod.GET)
    @ResponseBody
    public String create(@PathVariable Long id) {
        EsProduct esProduct = springDataService.create(id);

        return "";
    }

    @ApiOperation(value = "根据id删除商品")
    @RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
    @ResponseBody
    public String delete(@PathVariable Long id) {
        springDataService.delete(id);
        return "";
    }

    @ApiOperation(value = "根据id批量删除商品")
    @RequestMapping(value = "/delete/batch", method = RequestMethod.GET)
    @ResponseBody
    public String delete(@RequestParam("ids") List<Long> ids) {
        springDataService.delete(ids);
        return "";
    }




    @ApiOperation(value = "简单搜索")
    @RequestMapping(value = "/search/simple", method = RequestMethod.GET)
    @ResponseBody
    public String search(@RequestParam(required = false) String keyword,
                                                      @RequestParam(required = false, defaultValue = "0") Integer pageNum,
                                                      @RequestParam(required = false, defaultValue = "10") Integer pageSize) {
        Page<EsProduct> esProductPage = springDataService.search(keyword, pageNum, pageSize);
        System.out.println("esProductPage.toString():"+esProductPage.toString()+" esProductPage.getContent():"+esProductPage.getContent().size());
        return esProductPage.getContent().toString();
    }

}
