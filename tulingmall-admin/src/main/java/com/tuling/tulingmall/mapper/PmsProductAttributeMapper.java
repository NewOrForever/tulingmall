package com.tuling.tulingmall.mapper;

import com.baomidou.dynamic.datasource.annotation.DS;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.tuling.tulingmall.dto.ProductAttrInfo;
import com.tuling.tulingmall.model.PmsProductAttribute;
import org.apache.ibatis.annotations.Param;

import java.util.List;
@DS("goods")
public interface PmsProductAttributeMapper extends BaseMapper<PmsProductAttribute> {
}