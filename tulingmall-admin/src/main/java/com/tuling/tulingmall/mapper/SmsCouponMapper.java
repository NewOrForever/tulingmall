package com.tuling.tulingmall.mapper;

import com.baomidou.dynamic.datasource.annotation.DS;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.tuling.tulingmall.dto.SmsCouponParam;
import com.tuling.tulingmall.model.SmsCoupon;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
@DS("promotion")
public interface SmsCouponMapper extends BaseMapper<SmsCoupon> {

    @Select("SELECT" +
            "            c.*," +
            "            cpr.id                   cpr_id," +
            "            cpr.product_id           cpr_product_id," +
            "            cpr.product_name         cpr_product_name," +
            "            cpr.product_sn           cpr_product_sn," +
            "            cpcr.id                  cpcr_id," +
            "            cpcr.product_category_id cpcr_product_category_id," +
            "            cpcr.product_category_name cpcr_product_category_name," +
            "            cpcr.parent_category_name cpcr_parent_category_name" +
            "        FROM" +
            "            sms_coupon c" +
            "            LEFT JOIN sms_coupon_product_relation cpr ON c.id = cpr.coupon_id" +
            "            LEFT JOIN sms_coupon_product_category_relation cpcr ON c.id = cpcr.coupon_id" +
            "        WHERE" +
            "            c.id = #{id}")
    SmsCouponParam getItem(@Param("id") Long id);
}