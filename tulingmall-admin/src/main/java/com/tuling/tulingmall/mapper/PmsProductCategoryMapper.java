package com.tuling.tulingmall.mapper;

import com.baomidou.dynamic.datasource.annotation.DS;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.tuling.tulingmall.dto.PmsProductCategoryWithChildrenItem;
import com.tuling.tulingmall.model.PmsProductCategory;
import org.apache.ibatis.annotations.Select;

import java.util.List;
@DS("goods")
public interface PmsProductCategoryMapper extends BaseMapper<PmsProductCategory> {

//    @Select("select" +
//            "            c1.id," +
//            "            c1.name," +
//            "            c2.id   child_id," +
//            "            c2.name child_name" +
//            "        from pms_product_category c1 left join pms_product_category c2 on c1.id = c2.parent_id" +
//            "        where c1.parent_id = 0")
    List<PmsProductCategoryWithChildrenItem> listWithChildren();
}