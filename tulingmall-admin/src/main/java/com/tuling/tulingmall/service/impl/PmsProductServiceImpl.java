package com.tuling.tulingmall.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.github.pagehelper.PageHelper;
import com.tuling.tulingmall.dao.*;
import com.tuling.tulingmall.dto.PmsProductParam;
import com.tuling.tulingmall.dto.PmsProductQueryParam;
import com.tuling.tulingmall.dto.PmsProductResult;
import com.tuling.tulingmall.mapper.*;
import com.tuling.tulingmall.model.*;
import com.tuling.tulingmall.service.PmsProductService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;
import org.springframework.util.StringUtils;

import java.lang.reflect.Method;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * 商品管理Service实现类
 * Created on 2018/4/26.
 */
@Service
public class PmsProductServiceImpl implements PmsProductService {
    private static final Logger LOGGER = LoggerFactory.getLogger(PmsProductServiceImpl.class);
    @Autowired
    private PmsProductMapper productMapper;
    @Autowired
    private PmsMemberPriceDao memberPriceDao;
    @Autowired
    private PmsMemberPriceMapper memberPriceMapper;
    @Autowired
    private PmsProductLadderDao productLadderDao;
    @Autowired
    private PmsProductLadderMapper productLadderMapper;
    @Autowired
    private PmsProductFullReductionDao productFullReductionDao;
    @Autowired
    private PmsProductFullReductionMapper productFullReductionMapper;
    @Autowired
    private PmsSkuStockDao skuStockDao;
    @Autowired
    private PmsSkuStockMapper skuStockMapper;
    @Autowired
    private PmsProductAttributeValueDao productAttributeValueDao;
    @Autowired
    private PmsProductAttributeValueMapper productAttributeValueMapper;
    @Autowired
    private CmsSubjectProductRelationDao subjectProductRelationDao;
    @Autowired
    private CmsSubjectProductRelationMapper subjectProductRelationMapper;
    @Autowired
    private CmsPrefrenceAreaProductRelationDao prefrenceAreaProductRelationDao;
    @Autowired
    private CmsPrefrenceAreaProductRelationMapper prefrenceAreaProductRelationMapper;
    @Autowired
    private PmsProductVertifyRecordDao productVertifyRecordDao;

    @Override
    public int create(PmsProductParam productParam) {
        int count;
        //创建商品
        PmsProduct product = productParam;
        product.setId(null);
        productMapper.insert(product);
        //根据促销类型设置价格：、阶梯价格、满减价格
        Long productId = product.getId();
        //会员价格
        relateAndInsertList(memberPriceDao, productParam.getMemberPriceList(), productId);
        //阶梯价格
        relateAndInsertList(productLadderDao, productParam.getProductLadderList(), productId);
        //满减价格
        relateAndInsertList(productFullReductionDao, productParam.getProductFullReductionList(), productId);
        //处理sku的编码
        handleSkuStockCode(productParam.getSkuStockList(),productId);
        //添加sku库存信息
        relateAndInsertList(skuStockDao, productParam.getSkuStockList(), productId);
        //添加商品参数,添加自定义商品规格
        relateAndInsertList(productAttributeValueDao, productParam.getProductAttributeValueList(), productId);
        //关联专题
        relateAndInsertList(subjectProductRelationDao, productParam.getSubjectProductRelationList(), productId);
        //关联优选
        relateAndInsertList(prefrenceAreaProductRelationDao, productParam.getPrefrenceAreaProductRelationList(), productId);
        count = 1;
        return count;
    }

    private void handleSkuStockCode(List<PmsSkuStock> skuStockList, Long productId) {
        if(CollectionUtils.isEmpty(skuStockList)) {
            return;
        }
        for(int i=0;i<skuStockList.size();i++){
            PmsSkuStock skuStock = skuStockList.get(i);
            if(StringUtils.isEmpty(skuStock.getSkuCode())){
                SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
                StringBuilder sb = new StringBuilder();
                //日期
                sb.append(sdf.format(new Date()));
                //四位商品id
                sb.append(String.format("%04d", productId));
                //三位索引id
                sb.append(String.format("%03d", i+1));
                skuStock.setSkuCode(sb.toString());
            }
        }
    }

    @Override
    public PmsProductResult getUpdateInfo(Long id) {
        return productMapper.getUpdateInfo(id);
    }

    @Override
    public int update(Long id, PmsProductParam productParam) {
        int count;
        //更新商品信息
        PmsProduct product = productParam;
        product.setId(id);
        productMapper.updateById(product);
        //会员价格
        UpdateWrapper<PmsMemberPrice> memberWrapper = new UpdateWrapper<>();
        memberWrapper.eq("product_id",id);
        memberPriceMapper.delete(memberWrapper);
        relateAndInsertList(memberPriceDao, productParam.getMemberPriceList(), id);
        //阶梯价格
        UpdateWrapper<PmsProductLadder> ladderWrapper = new UpdateWrapper<>();
        ladderWrapper.eq("product_id",id);
        productLadderMapper.delete(ladderWrapper);
        relateAndInsertList(productLadderDao, productParam.getProductLadderList(), id);
        //满减价格
        UpdateWrapper<PmsProductFullReduction> reductionWrapper = new UpdateWrapper<>();
        reductionWrapper.eq("product_id",id);
        productFullReductionMapper.delete(reductionWrapper);
        relateAndInsertList(productFullReductionDao, productParam.getProductFullReductionList(), id);
        //修改sku库存信息
        UpdateWrapper<PmsSkuStock> stockWrapper = new UpdateWrapper<>();
        stockWrapper.eq("product_id",id);
        skuStockMapper.delete(stockWrapper);
        handleSkuStockCode(productParam.getSkuStockList(),id);
        relateAndInsertList(skuStockDao, productParam.getSkuStockList(), id);
        //修改商品参数,添加自定义商品规格
        UpdateWrapper<PmsProductAttributeValue> valueWrapper = new UpdateWrapper<>();
        valueWrapper.eq("product_id",id);
        productAttributeValueMapper.delete(valueWrapper);
        relateAndInsertList(productAttributeValueDao, productParam.getProductAttributeValueList(), id);
        //关联专题
        UpdateWrapper<CmsSubjectProductRelation> rWrapper = new UpdateWrapper<>();
        rWrapper.eq("product_id",id);
        subjectProductRelationMapper.delete(rWrapper);
        relateAndInsertList(subjectProductRelationDao, productParam.getSubjectProductRelationList(), id);
        //关联优选
        UpdateWrapper<CmsPrefrenceAreaProductRelation> rWrapper2 = new UpdateWrapper<>();
        rWrapper2.eq("product_id",id);
        prefrenceAreaProductRelationMapper.delete(rWrapper2);
        relateAndInsertList(prefrenceAreaProductRelationDao, productParam.getPrefrenceAreaProductRelationList(), id);
        count = 1;
        return count;
    }

    @Override
    public List<PmsProduct> list(PmsProductQueryParam productQueryParam, Integer pageSize, Integer pageNum) {
        PageHelper.startPage(pageNum, pageSize);
        QueryWrapper<PmsProduct> wrapper = new QueryWrapper<>();
        wrapper.eq("delete_status",0);
        if (productQueryParam.getPublishStatus() != null) {
            wrapper.eq("publish_status",productQueryParam.getPublishStatus());
        }
        if (productQueryParam.getVerifyStatus() != null) {
            wrapper.eq("verify_status",productQueryParam.getVerifyStatus());
        }
        if (!StringUtils.isEmpty(productQueryParam.getKeyword())) {
            wrapper.like("name","%" + productQueryParam.getKeyword() + "%");
        }
        if (!StringUtils.isEmpty(productQueryParam.getProductSn())) {
            wrapper.eq("product_sn",productQueryParam.getProductSn());
        }
        if (productQueryParam.getBrandId() != null) {
            wrapper.eq("brand_id",productQueryParam.getBrandId());
        }
        if (productQueryParam.getProductCategoryId() != null) {
            wrapper.eq("product_category_id",productQueryParam.getProductCategoryId());
        }
        return productMapper.selectList(wrapper);
    }

    @Override
    public int updateVerifyStatus(List<Long> ids, Integer verifyStatus, String detail) {
        PmsProduct product = new PmsProduct();
        product.setVerifyStatus(verifyStatus);

        QueryWrapper<PmsProduct> wrapper = new QueryWrapper<>();
        wrapper.in("id",ids);
        List<PmsProductVertifyRecord> list = new ArrayList<>();
        int count = productMapper.update(product,wrapper);
        //修改完审核状态后插入审核记录
        for (Long id : ids) {
            PmsProductVertifyRecord record = new PmsProductVertifyRecord();
            record.setProductId(id);
            record.setCreateTime(new Date());
            record.setDetail(detail);
            record.setStatus(verifyStatus);
            record.setVertifyMan("test");
            list.add(record);
        }
        productVertifyRecordDao.insertList(list);
        return count;
    }

    @Override
    public int updatePublishStatus(List<Long> ids, Integer publishStatus) {
        PmsProduct record = new PmsProduct();
        record.setPublishStatus(publishStatus);
        QueryWrapper<PmsProduct> wrapper = new QueryWrapper<>();
        wrapper.in("id",ids);
        return productMapper.update(record, wrapper);
    }

    @Override
    public int updateRecommendStatus(List<Long> ids, Integer recommendStatus) {
        PmsProduct record = new PmsProduct();
        record.setRecommandStatus(recommendStatus);
        QueryWrapper<PmsProduct> wrapper = new QueryWrapper<>();
        wrapper.in("id",ids);
        return productMapper.update(record, wrapper);
    }

    @Override
    public int updateNewStatus(List<Long> ids, Integer newStatus) {
        PmsProduct record = new PmsProduct();
        record.setNewStatus(newStatus);
        QueryWrapper<PmsProduct> wrapper = new QueryWrapper<>();
        wrapper.in("id",ids);
        return productMapper.update(record, wrapper);
    }

    @Override
    public int updateDeleteStatus(List<Long> ids, Integer deleteStatus) {
        PmsProduct record = new PmsProduct();
        record.setDeleteStatus(deleteStatus);
        QueryWrapper<PmsProduct> wrapper = new QueryWrapper<>();
        wrapper.in("id",ids);
        return productMapper.update(record, wrapper);
    }

    @Override
    public List<PmsProduct> list(String keyword) {
        QueryWrapper<PmsProduct> wrapper = new QueryWrapper<>();
        wrapper.eq("delete_status",0);
        if(!StringUtils.isEmpty(keyword)){
            wrapper.like("name","%" + keyword + "%");
            wrapper.or(cond->cond.eq("delete_status",0))
                    .and(cond-> cond.like("product_sn","%" + keyword + "%"));
        }
        return productMapper.selectList(wrapper);
    }

    /**
     * @deprecated 旧版创建
     */
    public int createOld(PmsProductParam productParam) {
        int count;
        //创建商品
        PmsProduct product = productParam;
        product.setId(null);
        productMapper.insert(product);
        //根据促销类型设置价格：、阶梯价格、满减价格
        Long productId = product.getId();
        //会员价格
        List<PmsMemberPrice> memberPriceList = productParam.getMemberPriceList();
        if (!CollectionUtils.isEmpty(memberPriceList)) {
            for (PmsMemberPrice pmsMemberPrice : memberPriceList) {
                pmsMemberPrice.setId(null);
                pmsMemberPrice.setProductId(productId);
            }
            memberPriceDao.insertList(memberPriceList);
        }
        //阶梯价格
        List<PmsProductLadder> productLadderList = productParam.getProductLadderList();
        if (!CollectionUtils.isEmpty(productLadderList)) {
            for (PmsProductLadder productLadder : productLadderList) {
                productLadder.setId(null);
                productLadder.setProductId(productId);
            }
            productLadderDao.insertList(productLadderList);
        }
        //满减价格
        List<PmsProductFullReduction> productFullReductionList = productParam.getProductFullReductionList();
        if (!CollectionUtils.isEmpty(productFullReductionList)) {
            for (PmsProductFullReduction productFullReduction : productFullReductionList) {
                productFullReduction.setId(null);
                productFullReduction.setProductId(productId);
            }
            productFullReductionDao.insertList(productFullReductionList);
        }
        //添加sku库存信息
        List<PmsSkuStock> skuStockList = productParam.getSkuStockList();
        if (!CollectionUtils.isEmpty(skuStockList)) {
            for (PmsSkuStock skuStock : skuStockList) {
                skuStock.setId(null);
                skuStock.setProductId(productId);
            }
            skuStockDao.insertList(skuStockList);
        }
        //添加商品参数,添加自定义商品规格
        List<PmsProductAttributeValue> productAttributeValueList = productParam.getProductAttributeValueList();
        if (!CollectionUtils.isEmpty(productAttributeValueList)) {
            for (PmsProductAttributeValue productAttributeValue : productAttributeValueList) {
                productAttributeValue.setId(null);
                productAttributeValue.setProductId(productId);
            }
            productAttributeValueDao.insertList(productAttributeValueList);
        }
        //关联专题
        relateAndInsertList(subjectProductRelationDao, productParam.getSubjectProductRelationList(), productId);
        //关联优选
        relateAndInsertList(prefrenceAreaProductRelationDao, productParam.getPrefrenceAreaProductRelationList(), productId);
        count = 1;
        return count;
    }

    /**
     * 建立和插入关系表操作
     *
     * @param dao       可以操作的dao
     * @param dataList  要插入的数据
     * @param productId 建立关系的id
     */
    private void relateAndInsertList(Object dao, List dataList, Long productId) {
        try {
            if (CollectionUtils.isEmpty(dataList)) return;
            for (Object item : dataList) {
                Method setId = item.getClass().getMethod("setId", Long.class);
                setId.invoke(item, (Long) null);
                Method setProductId = item.getClass().getMethod("setProductId", Long.class);
                setProductId.invoke(item, productId);
            }
            Method insertList = dao.getClass().getMethod("insertList", List.class);
            insertList.invoke(dao, dataList);
        } catch (Exception e) {
            LOGGER.warn("创建产品出错:{}", e.getMessage());
            throw new RuntimeException(e.getMessage());
        }
    }

}
