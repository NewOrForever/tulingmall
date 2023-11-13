package com.tuling.tulingmall.search.service;

import java.util.List;

import org.springframework.data.domain.Page;

import com.tuling.tulingmall.search.domain.EsProduct;

/**
 * 商品搜索管理Service
 */
public interface SpringDataService {


    /**
     * 根据id删除商品
     */
    void delete(Long id);

    /**
     * 根据id创建商品
     */
    EsProduct create(Long id);

    /**
     * 批量删除商品
     */
    void delete(List<Long> ids);

    /**
     * 根据关键字搜索名称或者副标题
     */
    Page<EsProduct> search(String keyword, Integer pageNum, Integer pageSize);


}
