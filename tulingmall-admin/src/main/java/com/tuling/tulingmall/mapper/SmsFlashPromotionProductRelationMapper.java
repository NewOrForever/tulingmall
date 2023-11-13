package com.tuling.tulingmall.mapper;

import com.baomidou.dynamic.datasource.annotation.DS;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.tuling.tulingmall.dto.SmsFlashPromotionProduct;
import com.tuling.tulingmall.model.SmsFlashPromotionProductRelation;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;
@DS("promotion")
public interface SmsFlashPromotionProductRelationMapper extends BaseMapper<SmsFlashPromotionProductRelation> {
    /**
     * 获取限时购及相关商品信息
     */
//    @Select("SELECT" +
//            "            r.id," +
//            "            r.flash_promotion_price," +
//            "            r.flash_promotion_count," +
//            "            r.flash_promotion_limit," +
//            "            r.flash_promotion_id," +
//            "            r.flash_promotion_session_id," +
//            "            r.product_id," +
//            "            r.sort," +
//            "            p.id p_id," +
//            "            p.`name` p_name," +
//            "            p.product_sn p_product_sn," +
//            "            p.price p_price," +
//            "            p.stock p_stock" +
//            "        FROM" +
//            "            sms_flash_promotion_product_relation r" +
//            "            LEFT JOIN tl_mall_goods.pms_product p ON r.product_id = p.id" +
//            "        WHERE" +
//            "            r.flash_promotion_id = #{flashPromotionId}" +
//            "            AND r.flash_promotion_session_id = #{flashPromotionSessionId}" +
//            "        ORDER BY r.sort DESC")
    List<SmsFlashPromotionProduct> getList(@Param("flashPromotionId") Long flashPromotionId, @Param("flashPromotionSessionId") Long flashPromotionSessionId);
}