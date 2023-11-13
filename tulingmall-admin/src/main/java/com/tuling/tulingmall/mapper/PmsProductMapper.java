package com.tuling.tulingmall.mapper;

import com.baomidou.dynamic.datasource.annotation.DS;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.tuling.tulingmall.dto.PmsProductResult;
import com.tuling.tulingmall.model.PmsProduct;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
@DS("goods")
public interface PmsProductMapper extends BaseMapper<PmsProduct> {

    /**
     * 获取商品编辑信息
     */
    PmsProductResult getUpdateInfo(@Param("id") Long id);
}