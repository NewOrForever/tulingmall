package com.tuling.tulingmall.portal.service.impl;

import cn.hutool.core.collection.CollectionUtil;
import com.github.benmanes.caffeine.cache.Cache;
import com.github.pagehelper.PageHelper;
import com.tuling.tulingmall.mapper.CmsSubjectMapper;
import com.tuling.tulingmall.mapper.PmsProductCategoryMapper;
import com.tuling.tulingmall.mapper.PmsProductMapper;
import com.tuling.tulingmall.model.*;
import com.tuling.tulingmall.portal.config.PromotionRedisKey;
import com.tuling.tulingmall.portal.dao.HomeDao;
import com.tuling.tulingmall.promotion.domain.FlashPromotionProduct;
import com.tuling.tulingmall.portal.domain.HomeContentResult;
import com.tuling.tulingmall.portal.feignapi.promotion.PromotionFeignApi;
import com.tuling.tulingmall.portal.service.HomeService;
import com.tuling.tulingmall.promotion.model.SmsHomeAdvertise;
import com.tuling.tulingmall.rediscomm.util.RedisOpsExtUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import java.util.ArrayList;
import java.util.List;

/**
 * 首页内容管理Service实现类
 */
@Slf4j
@Service
public class HomeServiceImpl implements HomeService {
//    @Autowired
//    private SmsHomeAdvertiseMapper advertiseMapper;
    @Autowired
    private HomeDao homeDao;
//    @Autowired
//    private PmsProductFeignApi pmsProductFeignApi;
    @Autowired
    private PmsProductMapper productMapper;
    @Autowired
    private PmsProductCategoryMapper productCategoryMapper;
    @Autowired
    private CmsSubjectMapper subjectMapper;
    @Autowired
    private PromotionFeignApi promotionFeignApi;
    @Autowired
    private PromotionRedisKey promotionRedisKey;
    @Autowired
    private RedisOpsExtUtil redisOpsUtil;

    @Autowired
    @Qualifier("promotion")
    private Cache<String, HomeContentResult> promotionCache;

    @Autowired
    @Qualifier("promotionBak")
    private Cache<String, HomeContentResult> promotionCacheBak;

    @Autowired
    @Qualifier("secKill")
    private Cache<String, List<FlashPromotionProduct>> secKillCache;

    @Autowired
    @Qualifier("secKillBak")
    private Cache<String, List<FlashPromotionProduct>> secKillCacheBak;

    @Override
    public HomeContentResult cmsContent(HomeContentResult content) {
        //获取推荐专题
        content.setSubjectList(homeDao.getRecommendSubjectList(0,4));
        return content;
    }

    /*处理首页推荐品牌和商品内容*/
    public HomeContentResult recommendContent(){
        /*品牌和产品在本地缓存中统一处理，有则视为同有，无则视为同无*/
        final String brandKey = promotionRedisKey.getBrandKey();
        final boolean allowLocalCache = promotionRedisKey.isAllowLocalCache();
        /*先从本地缓存中获取推荐内容*/
        HomeContentResult result = allowLocalCache ?
                promotionCache.getIfPresent(brandKey) : null;
        if(result == null){
            result = allowLocalCache ?
                    promotionCacheBak.getIfPresent(brandKey) : null;
        }
        /*本地缓存中没有*/
        if(result == null){
            log.warn("从本地缓存中获取推荐品牌和商品失败，可能出错或禁用了本地缓存[allowLocalCache = {}]",allowLocalCache);
            result = getFromRemote();
            if(null != result) {
                promotionCache.put(brandKey,result);
                promotionCacheBak.put(brandKey,result);
            }
        }
        /* 处理秒杀内容*/
        final String secKillKey = promotionRedisKey.getSecKillKey();
        List<FlashPromotionProduct> secKills = secKillCache.getIfPresent(secKillKey);
        if(CollectionUtils.isEmpty(secKills)){
            secKills = secKillCacheBak.getIfPresent(secKillKey);
        }
        if(CollectionUtils.isEmpty(secKills)){
            /*极小的概率出现本地两个缓存同时失效的问题，
            从远程获取时，只从Redis缓存中获取，不从营销微服务中获取，
            避免秒杀的流量冲垮营销微服务*/
            secKills = getSecKillFromRemote();
            if(!CollectionUtils.isEmpty(secKills)) {
                secKillCache.put(secKillKey,secKills);
                secKillCacheBak.put(secKillKey,secKills);
            }else{
                /*Redis缓存中也没有秒杀活动信息，此处用一个空List代替，
                * 其实可以用固定的图片或信息，作为降级和兜底方案*/
                secKills = new ArrayList<FlashPromotionProduct>();
            }
        }
        result.setHomeFlashPromotion(secKills);
        // fixme CMS本次不予实现，设置空集合
        result.setSubjectList(new ArrayList<CmsSubject>());
        return result;
    }

    public List<FlashPromotionProduct> getSecKillFromRemote(){
        List<FlashPromotionProduct> result = redisOpsUtil.getListAll(promotionRedisKey.getSecKillKey(),
                FlashPromotionProduct.class);
//        if(CollectionUtil.isEmpty(result)){
//            result = promotionFeignApi.getHomeSecKillProductList().getData();
//        }
        return result;
    }
    /*从远程(Redis或者对应微服务)获取推荐内容*/
    public HomeContentResult getFromRemote(){
        List<PmsBrand> recommendBrandList = null;
        List<SmsHomeAdvertise> smsHomeAdvertises = null;
        List<PmsProduct> newProducts  = null;
        List<PmsProduct> recommendProducts  = null;
        HomeContentResult result = null;
        /*从redis获取*/
        if(promotionRedisKey.isAllowRemoteCache()){
            recommendBrandList = redisOpsUtil.getListAll(promotionRedisKey.getBrandKey(), PmsBrand.class);
            smsHomeAdvertises = redisOpsUtil.getListAll(promotionRedisKey.getHomeAdvertiseKey(), SmsHomeAdvertise.class);
            newProducts = redisOpsUtil.getListAll(promotionRedisKey.getNewProductKey(), PmsProduct.class);
            recommendProducts = redisOpsUtil.getListAll(promotionRedisKey.getRecProductKey(), PmsProduct.class);
        }
        /*redis没有则从微服务中获取*/
        if(CollectionUtil.isEmpty(recommendBrandList)
                ||CollectionUtil.isEmpty(smsHomeAdvertises)
                ||CollectionUtil.isEmpty(newProducts)
                ||CollectionUtil.isEmpty(recommendProducts)) {
            result = promotionFeignApi.content(0).getData();
        }else{
            result = new HomeContentResult();
            result.setBrandList(recommendBrandList);
            result.setAdvertiseList(smsHomeAdvertises);
            result.setHotProductList(recommendProducts);
            result.setNewProductList(newProducts);
        }
        return result;
    }

    /*缓存预热*/
    public void preheatCache(){
        try {
            final String secKillKey = promotionRedisKey.getSecKillKey();
            List<FlashPromotionProduct> secKillResult = getSecKillFromRemote();
            secKillCache.put(secKillKey,secKillResult);
            secKillCacheBak.put(secKillKey,secKillResult);
            log.info("秒杀数据本地缓存预热完成");
        } catch (Exception e) {
            log.error("秒杀数据缓存预热失败：",e);
        }

        try {
            if(promotionRedisKey.isAllowLocalCache()){
                final String brandKey = promotionRedisKey.getBrandKey();
                HomeContentResult result = getFromRemote();
                promotionCache.put(brandKey,result);
                promotionCacheBak.put(brandKey,result);
                log.info("promotionCache 数据缓存预热完成");
            }
        } catch (Exception e) {
            log.error("promotionCache 数据缓存预热失败：",e);
        }
    }

    @Override
    public List<PmsProduct> recommendProductList(Integer pageSize, Integer pageNum) {
        // TODO: 2019/1/29 暂时默认推荐所有商品，可与推荐系统结合
        PageHelper.startPage(pageNum,pageSize);
        PmsProductExample example = new PmsProductExample();
        example.createCriteria()
                .andDeleteStatusEqualTo(0)
                .andPublishStatusEqualTo(1);
        return productMapper.selectByExample(example);
    }

    @Override
    public List<PmsProductCategory> getProductCateList(Long parentId) {
        PmsProductCategoryExample example = new PmsProductCategoryExample();
        example.createCriteria()
                .andShowStatusEqualTo(1)
                .andParentIdEqualTo(parentId);
        example.setOrderByClause("sort desc");
        return productCategoryMapper.selectByExample(example);
    }

    @Override
    public List<CmsSubject> getSubjectList(Long cateId, Integer pageSize, Integer pageNum) {
        PageHelper.startPage(pageNum,pageSize);
        CmsSubjectExample example = new CmsSubjectExample();
        CmsSubjectExample.Criteria criteria = example.createCriteria();
        criteria.andShowStatusEqualTo(1);
        if(cateId!=null){
            criteria.andCategoryIdEqualTo(cateId);
        }
        return subjectMapper.selectByExample(example);
    }

}
