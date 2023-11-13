package com.tuling.tulingmall.mapper;

import com.baomidou.dynamic.datasource.annotation.DS;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.tuling.tulingmall.dto.PmsProductAttributeCategoryItem;
import com.tuling.tulingmall.model.PmsProductAttributeCategory;
import org.apache.ibatis.annotations.ResultMap;
import org.apache.ibatis.annotations.Select;

import java.util.List;
@DS("goods")
public interface PmsProductAttributeCategoryMapper extends BaseMapper<PmsProductAttributeCategory> {

//    @Select("SELECT\n" +
//            "            pac.id,\n" +
//            "            pac.name,\n" +
//            "            pa.id attr_id,\n" +
//            "            pa.name attr_name\n" +
//            "        FROM\n" +
//            "            pms_product_attribute_category pac\n" +
//            "            LEFT JOIN pms_product_attribute pa ON pac.id = pa.product_attribute_category_id\n" +
//            "        AND pa.type=1;")
    List<PmsProductAttributeCategoryItem> getListWithAttr();
}