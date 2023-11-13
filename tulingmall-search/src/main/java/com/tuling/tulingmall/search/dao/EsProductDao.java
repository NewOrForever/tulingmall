package com.tuling.tulingmall.search.dao;

import com.tuling.tulingmall.search.domain.EsProduct;


import java.util.List;

import org.apache.ibatis.annotations.Param;


/**
 * 搜索系统中的商品管理自定义Dao
 * Created on 2018/6/19.
 */
public interface EsProductDao {
    List<EsProduct> getAllEsProductList(@Param("id") Long id);
}
