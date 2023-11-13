package com.tuling.tulingmall.promotion.controller;

import com.tuling.tulingmall.common.api.CommonResult;
import com.tuling.tulingmall.promotion.domain.FlashPromotionProduct;
import com.tuling.tulingmall.promotion.domain.HomeContentResult;
import com.tuling.tulingmall.promotion.service.HomePromotionService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 首页推荐管理Controller
 */
@Controller
@Api(tags = "HomeRecommendController", description = "品牌和产品推荐内容")
@RequestMapping("/recommend")
public class HomeRecommendController {
    @Autowired
    private HomePromotionService homePromotionService;

    @ApiOperation("首页品牌和产品推荐")
    @ApiImplicitParam(name = "getType", value = "推荐内容类型:0->全部；1->品牌；2->新品推荐；3->人气推荐;4->轮播广告",
            allowableValues = "0,1,2,3,4", paramType = "query", dataType = "integer")
    @RequestMapping(value = "/content", method = RequestMethod.GET)
    @ResponseBody
    public CommonResult<HomeContentResult> content(@RequestParam int getType) {
        HomeContentResult contentResult = homePromotionService.content(getType);
        return CommonResult.success(contentResult);
    }




}
