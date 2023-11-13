package com.tuling.tulingmall.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.github.pagehelper.PageHelper;
import com.tuling.tulingmall.dao.PmsProductCategoryAttributeRelationDao;
import com.tuling.tulingmall.dto.PmsProductCategoryParam;
import com.tuling.tulingmall.dto.PmsProductCategoryWithChildrenItem;
import com.tuling.tulingmall.mapper.PmsProductCategoryAttributeRelationMapper;
import com.tuling.tulingmall.mapper.PmsProductCategoryMapper;
import com.tuling.tulingmall.mapper.PmsProductMapper;
import com.tuling.tulingmall.model.PmsProduct;
import com.tuling.tulingmall.model.PmsProductCategory;
import com.tuling.tulingmall.model.PmsProductCategoryAttributeRelation;
import com.tuling.tulingmall.service.PmsProductCategoryService;
import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * PmsProductCategoryService实现类
 * Created on 2018/4/26.
 */
@Service
public class PmsProductCategoryServiceImpl implements PmsProductCategoryService {
    @Autowired
    private PmsProductCategoryMapper productCategoryMapper;
    @Autowired
    private PmsProductMapper productMapper;
    @Autowired
    private PmsProductCategoryAttributeRelationDao productCategoryAttributeRelationDao;
    @Autowired
    private PmsProductCategoryAttributeRelationMapper productCategoryAttributeRelationMapper;
    @Override
    public int create(PmsProductCategoryParam pmsProductCategoryParam) {
        PmsProductCategory productCategory = new PmsProductCategory();
        productCategory.setProductCount(0);
        BeanUtils.copyProperties(pmsProductCategoryParam, productCategory);
        //没有父分类时为一级分类
        setCategoryLevel(productCategory);
        int count = productCategoryMapper.insert(productCategory);
        //创建筛选属性关联
        List<Long> productAttributeIdList = pmsProductCategoryParam.getProductAttributeIdList();
        if(!CollectionUtils.isEmpty(productAttributeIdList)){
            insertRelationList(productCategory.getId(), productAttributeIdList);
        }
        return count;
    }

    /**
     * 批量插入商品分类与筛选属性关系表
     * @param productCategoryId 商品分类id
     * @param productAttributeIdList 相关商品筛选属性id集合
     */
    private void insertRelationList(Long productCategoryId, List<Long> productAttributeIdList) {
        List<PmsProductCategoryAttributeRelation> relationList = new ArrayList<>();
        for (Long productAttrId : productAttributeIdList) {
            PmsProductCategoryAttributeRelation relation = new PmsProductCategoryAttributeRelation();
            relation.setProductAttributeId(productAttrId);
            relation.setProductCategoryId(productCategoryId);
            relationList.add(relation);
        }
        productCategoryAttributeRelationDao.insertList(relationList);
    }

    @Override
    public int update(Long id, PmsProductCategoryParam pmsProductCategoryParam) {
        PmsProductCategory productCategory = new PmsProductCategory();
        productCategory.setId(id);
        BeanUtils.copyProperties(pmsProductCategoryParam, productCategory);
        setCategoryLevel(productCategory);
        //更新商品分类时要更新商品中的名称
        PmsProduct product = new PmsProduct();
        product.setProductCategoryName(productCategory.getName());
        UpdateWrapper<PmsProduct> wrapper = new UpdateWrapper<>();
        wrapper.eq("product_category_id",id);
        productMapper.update(product,wrapper);
        //同时更新筛选属性的信息
        if(!CollectionUtils.isEmpty(pmsProductCategoryParam.getProductAttributeIdList())){
            UpdateWrapper<PmsProductCategoryAttributeRelation> rWrapper = new UpdateWrapper<>();
            rWrapper.eq("product_category_id",id);
            productCategoryAttributeRelationMapper.delete(rWrapper);
            insertRelationList(id,pmsProductCategoryParam.getProductAttributeIdList());
        }else{
            UpdateWrapper<PmsProductCategoryAttributeRelation> rWrapper = new UpdateWrapper<>();
            rWrapper.eq("product_category_id",id);
            productCategoryAttributeRelationMapper.delete(rWrapper);
        }
        return productCategoryMapper.updateById(productCategory);
    }

    @Override
    public List<PmsProductCategory> getList(Long parentId, Integer pageSize, Integer pageNum) {
        PageHelper.startPage(pageNum, pageSize);

        QueryWrapper<PmsProductCategory> wrapper = new QueryWrapper<>();
        wrapper.orderByDesc("sort");
        wrapper.eq("parent_id",parentId);
        return productCategoryMapper.selectList(wrapper);
    }

    @Override
    public int delete(Long id) {
        return productCategoryMapper.deleteById(id);
    }

    @Override
    public PmsProductCategory getItem(Long id) {
        return productCategoryMapper.selectById(id);
    }

    @Override
    public int updateNavStatus(List<Long> ids, Integer navStatus) {
        PmsProductCategory productCategory = new PmsProductCategory();
        productCategory.setNavStatus(navStatus);
        UpdateWrapper<PmsProductCategory> wrapper = new UpdateWrapper<>();
        wrapper.in("id",ids);
        return productCategoryMapper.update(productCategory, wrapper);
    }

    @Override
    public int updateShowStatus(List<Long> ids, Integer showStatus) {
        PmsProductCategory productCategory = new PmsProductCategory();
        productCategory.setShowStatus(showStatus);

        UpdateWrapper<PmsProductCategory> wrapper = new UpdateWrapper<>();
        wrapper.in("id",ids);
        return productCategoryMapper.update(productCategory, wrapper);
    }

    @Override
    public List<PmsProductCategoryWithChildrenItem> listWithChildren() {
        return productCategoryMapper.listWithChildren();
    }

    /**
     * 根据分类的parentId设置分类的level
     */
    private void setCategoryLevel(PmsProductCategory productCategory) {
        //没有父分类时为一级分类
        if (productCategory.getParentId() == 0) {
            productCategory.setLevel(0);
        } else {
            //有父分类时选择根据父分类level设置
            PmsProductCategory parentCategory = productCategoryMapper.selectById(productCategory.getParentId());
            if (parentCategory != null) {
                productCategory.setLevel(parentCategory.getLevel() + 1);
            } else {
                productCategory.setLevel(0);
            }
        }
    }
}
