package com.tuling.tulingmall.portal.feignapi.promotion;

import com.tuling.tulingmall.common.api.CommonResult;
import com.tuling.tulingmall.model.UmsMember;
import com.tuling.tulingmall.model.UmsMemberReceiveAddress;
import com.tuling.tulingmall.portal.domain.HomeContentResult;
import com.tuling.tulingmall.portal.domain.PortalMemberInfo;
import com.tuling.tulingmall.promotion.domain.FlashPromotionProduct;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
* @desc: 类的描述:远程调用获取首页显示内容，包括推荐和秒杀等
*/
@FeignClient(name = "tulingmall-promotion",path = "/recommend")
public interface PromotionFeignApi {

    /*推荐内容类型:0->全部；1->品牌；2->新品推荐；3->人气推荐;4->轮播广告*/
    @RequestMapping(value = "/content", method = RequestMethod.GET)
    @ResponseBody
    public CommonResult<HomeContentResult> content(@RequestParam(value = "getType") int getType);

}
