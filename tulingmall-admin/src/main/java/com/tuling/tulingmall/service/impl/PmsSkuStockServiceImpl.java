package com.tuling.tulingmall.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.tuling.tulingmall.dao.PmsSkuStockDao;
import com.tuling.tulingmall.mapper.PmsSkuStockMapper;
import com.tuling.tulingmall.model.PmsSkuStock;
import com.tuling.tulingmall.service.PmsSkuStockService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.util.List;

/**
 * 商品sku库存管理Service实现类
 * Created on 2018/4/27.
 */
@Service
public class PmsSkuStockServiceImpl implements PmsSkuStockService {
    @Autowired
    private PmsSkuStockMapper skuStockMapper;
    @Autowired
    private PmsSkuStockDao skuStockDao;

    @Override
    public List<PmsSkuStock> getList(Long pid, String keyword) {
        QueryWrapper<PmsSkuStock> wrapper = new QueryWrapper<>();
        wrapper.eq("product_id",pid);
        if (!StringUtils.isEmpty(keyword)) {
            wrapper.like("sku_code","%" + keyword + "%");
        }
        return skuStockMapper.selectList(wrapper);
    }

    @Override
    public int update(Long pid, List<PmsSkuStock> skuStockList) {
        return skuStockDao.replaceList(skuStockList);
    }
}
