package com.tuling.tulingmall.service.impl;

import com.github.pagehelper.PageHelper;
import com.tuling.tulingmall.common.constant.RedisKeyPrefixConst;
import com.tuling.tulingmall.component.LocalCache;
import com.tuling.tulingmall.component.zklock.ZKLock;
import com.tuling.tulingmall.dao.FlashPromotionProductDao;
import com.tuling.tulingmall.dao.PortalProductDao;
import com.tuling.tulingmall.domain.*;
import com.tuling.tulingmall.mapper.PmsBrandMapper;
import com.tuling.tulingmall.mapper.PmsProductMapper;
import com.tuling.tulingmall.mapper.SmsFlashPromotionMapper;
import com.tuling.tulingmall.mapper.SmsFlashPromotionSessionMapper;
import com.tuling.tulingmall.model.*;
import com.tuling.tulingmall.rediscomm.util.RedisOpsExtUtil;
import com.tuling.tulingmall.service.PmsProductService;
import com.tuling.tulingmall.util.DateUtil;
import lombok.extern.slf4j.Slf4j;
import org.redisson.api.RLock;
import org.redisson.api.RedissonClient;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;
import org.springframework.util.ObjectUtils;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.TimeUnit;

/**
 * ,;,,;
 * ,;;'(    社
 * __      ,;;' ' \   会
 * /'  '\'~~'~' \ /'\.)  主
 * ,;(      )    /  |.     义
 * ,;' \    /-.,,(   ) \    码
 * ) /       ) / )|    农
 * ||        ||  \)
 * (_\       (_\
 *
 * @author ：图灵学院
 * @date ：Created in 2019/12/31 17:22
 * @version: V1.0
 * @slogan: 天下风云出我辈，一入代码岁月催
 * @description:
 **/
@Slf4j
@Service
public class PmsProductServiceImpl implements PmsProductService {

    @Autowired
    private PortalProductDao portalProductDao;

    @Autowired
    private FlashPromotionProductDao flashPromotionProductDao;

    @Autowired
    private SmsFlashPromotionMapper flashPromotionMapper;

    @Autowired
    private PmsProductMapper pmsProductMapper;

    @Autowired
    private PmsBrandMapper pmsBrandMapper;

    @Autowired
    private SmsFlashPromotionSessionMapper promotionSessionMapper;

    @Autowired
    private RedisOpsExtUtil redisOpsUtil;

    private Map<String, PmsProductParam> cacheMap = new ConcurrentHashMap<>();

    @Autowired
    private LocalCache cache;


    /*
     * zk分布式锁
     */
//    @Autowired
    private ZKLock zkLock;
    private String lockPath = "/load_db";

    @Autowired
    RedissonClient redission;


    /**
     * 获取商品详情信息
     *
     * @param id 产品IDrenntentlock
     */
    public PmsProductParam getProductInfo(Long id) {
        return getProductInfoOne(id);
    }

    /**
     * 获取商品详情信息
     *
     * @param id 产品IDrenntentlock
     */
    public PmsProductParam getProductInfoOne(Long id) {
        PmsProductParam productInfo = portalProductDao.getProductInfo(id);
        if (null == productInfo) {
            return null;
        }
        checkFlash(id, productInfo);//判断是否为秒杀商品
        return productInfo;
    }

    /**
     * 批量获取产品信息
     * @param productIdList
     * @return
     */
    public List<PmsProduct> getProductBatch(List<Long> productIdList){
        List<PmsProduct> products = new ArrayList<>();
        for(Long productId:productIdList){
            PmsProduct pmsProduct = pmsProductMapper.selectByPrimaryKey(productId);
            products.add(pmsProduct);
        }
        return products;
    }

    public List<PmsBrand> getRecommandBrandList(List<Long> brandIdList){
        List<PmsBrand> brands = new ArrayList<>();
        for(Long brandId:brandIdList){
            PmsBrand pmsBrand = pmsBrandMapper.selectByPrimaryKey(brandId);
            brands.add(pmsBrand);
        }
        return brands;
    }

    /**
     * 获取商品详情信息  加入redis
     *
     * @param id 产品ID
     */
    public PmsProductParam getProductInfoRedisCache(Long id) {
        PmsProductParam productInfo = null;
        //从缓存Redis里找
        productInfo = redisOpsUtil.get(RedisKeyPrefixConst.PRODUCT_DETAIL_CACHE + id, PmsProductParam.class);
        if (null != productInfo) {
            return productInfo;//已经缓存过 不是第一次访问
        }
        productInfo = portalProductDao.getProductInfo(id);
        log.info("走数据库:" + id);
        if (null == productInfo) {
            log.warn("没有查询到商品信息,id:" + id);
            return null;
        }
        checkFlash(id, productInfo);
        redisOpsUtil.set(RedisKeyPrefixConst.PRODUCT_DETAIL_CACHE + id, productInfo, 3600, TimeUnit.SECONDS);
        return productInfo;
    }


    /**
     * 获取商品详情信息  加入redis 加入锁
     *
     * @param id 产品ID
     */
    /**
     * 获取商品详情信息  加入redis 加入锁
     *
     * @param id 产品ID
     */
    public PmsProductParam getProductInfoDisLock(Long id) {
        PmsProductParam productInfo = redisOpsUtil.get(RedisKeyPrefixConst.PRODUCT_DETAIL_CACHE + id, PmsProductParam.class);
        if (null != productInfo) {
            return productInfo;
        }
        RLock lock = redission.getLock(lockPath + id);
        try {
            if (lock.tryLock(0, 3, TimeUnit.SECONDS)) {
                productInfo = portalProductDao.getProductInfo(id);
                log.info("走数据库:" + id);
                if (null == productInfo) {
                    return null;
                }
                checkFlash(id, productInfo);
                redisOpsUtil.set(RedisKeyPrefixConst.PRODUCT_DETAIL_CACHE + id, productInfo, 360, TimeUnit.SECONDS);
            } else {
                 productInfo = redisOpsUtil.get(RedisKeyPrefixConst.PRODUCT_DETAIL_CACHE + id, PmsProductParam.class);
               /* Thread.sleep(10);
                getProductInfoDisLock(id);*/
            }
        } catch (InterruptedException e) {
            e.printStackTrace();
        } finally {
            if (lock.isLocked()) {
                if (lock.isHeldByCurrentThread()) {
                    lock.unlock();
                }
            }

        }
        return productInfo;
    }

    /**
     * 获取商品详情信息 分布式锁、 本地缓存、redis缓存
     *
     * @param id 产品ID
     */
    public PmsProductParam getProductInfoLocalCache(Long id) {
        PmsProductParam productInfo = null;
        productInfo = cache.get(RedisKeyPrefixConst.PRODUCT_DETAIL_CACHE + id);
        if (null != productInfo) {
            return productInfo;//没网络io 没磁盘io
        }
        productInfo = redisOpsUtil.get(RedisKeyPrefixConst.PRODUCT_DETAIL_CACHE + id, PmsProductParam.class);
        if (productInfo != null) {
            cache.setLocalCache(RedisKeyPrefixConst.PRODUCT_DETAIL_CACHE + id, productInfo);//设置本地缓存 //解决磁盘io 但是还有网络uo
            return productInfo;
        }
        RLock lock = redission.getLock(lockPath + id);
        try {
            if (lock.tryLock(0, 10, TimeUnit.SECONDS)) {
                productInfo = portalProductDao.getProductInfo(id);//网络io 磁盘io
                if (null == productInfo) {
                    return null;
                }
                checkFlash(id, productInfo);
                redisOpsUtil.set(RedisKeyPrefixConst.PRODUCT_DETAIL_CACHE + id, productInfo, 3600, TimeUnit.SECONDS);
                cache.setLocalCache(RedisKeyPrefixConst.PRODUCT_DETAIL_CACHE + id, productInfo);
                log.info("set cache productId:");
            } else {
                productInfo = redisOpsUtil.get(RedisKeyPrefixConst.PRODUCT_DETAIL_CACHE + id, PmsProductParam.class);
                if (productInfo != null) {
                    cache.setLocalCache(RedisKeyPrefixConst.PRODUCT_DETAIL_CACHE + id, productInfo);
                }
            }
        } catch (InterruptedException e) {
            e.printStackTrace();
        } finally {
            if (lock.isLocked()) {
                if (lock.isHeldByCurrentThread())
                    lock.unlock();
            }
        }
        return productInfo;
    }

    private PmsProductParam checkFlash(Long id, PmsProductParam productInfo) {
        FlashPromotionParam promotion = flashPromotionProductDao.getFlashPromotion(id);
        if (!ObjectUtils.isEmpty(promotion)) {
            productInfo.setFlashPromotionCount(promotion.getRelation().get(0).getFlashPromotionCount());
            productInfo.setFlashPromotionLimit(promotion.getRelation().get(0).getFlashPromotionLimit());
            productInfo.setFlashPromotionPrice(promotion.getRelation().get(0).getFlashPromotionPrice());
            productInfo.setFlashPromotionRelationId(promotion.getRelation().get(0).getId());
            productInfo.setFlashPromotionEndDate(promotion.getEndDate());
            productInfo.setFlashPromotionStartDate(promotion.getStartDate());
            productInfo.setFlashPromotionStatus(promotion.getStatus());
        }
        return productInfo;
    }


    /***
     * 直接访问数据库
     * @param id
     * @return
     */
    public PmsProductParam getProductInfo1(Long id) {
        PmsProductParam productInfo = portalProductDao.getProductInfo(id);
        if (null == productInfo) {
            return null;
        }
        FlashPromotionParam promotion = flashPromotionProductDao.getFlashPromotion(id);
        if (!ObjectUtils.isEmpty(promotion)) {
            productInfo.setFlashPromotionCount(promotion.getRelation().get(0).getFlashPromotionCount());
            productInfo.setFlashPromotionLimit(promotion.getRelation().get(0).getFlashPromotionLimit());
            productInfo.setFlashPromotionPrice(promotion.getRelation().get(0).getFlashPromotionPrice());
            productInfo.setFlashPromotionRelationId(promotion.getRelation().get(0).getId());
            productInfo.setFlashPromotionEndDate(promotion.getEndDate());
            productInfo.setFlashPromotionStartDate(promotion.getStartDate());
            productInfo.setFlashPromotionStatus(promotion.getStatus());
        }
        return productInfo;
    }

    /**
     * add by yangguo
     * 获取秒杀商品列表
     *
     * @param flashPromotionId 秒杀活动ID，关联秒杀活动设置
     * @param sessionId        场次活动ID，for example：13:00-14:00场等
     */
    public List<FlashPromotionProduct> getFlashProductList(Integer pageSize, Integer pageNum, Long flashPromotionId, Long sessionId) {
        PageHelper.startPage(pageNum, pageSize, "sort desc");
        return flashPromotionProductDao.getFlashProductList(flashPromotionId, sessionId);
    }

    /**
     * 获取当前日期秒杀活动所有场次
     *
     * @return
     */
    public List<FlashPromotionSessionExt> getFlashPromotionSessionList() {
        Date now = new Date();
        SmsFlashPromotion promotion = getFlashPromotion(now);
        if (promotion != null) {
            SmsFlashPromotionSessionExample sessionExample = new SmsFlashPromotionSessionExample();
            //获取时间段内的秒杀场次
            sessionExample.createCriteria().andStatusEqualTo(1);//启用状态
            sessionExample.setOrderByClause("start_time asc");
            List<SmsFlashPromotionSession> promotionSessionList = promotionSessionMapper.selectByExample(sessionExample);
            List<FlashPromotionSessionExt> extList = new ArrayList<>();
            if (!CollectionUtils.isEmpty(promotionSessionList)) {
                promotionSessionList.stream().forEach((item) -> {
                    FlashPromotionSessionExt ext = new FlashPromotionSessionExt();
                    BeanUtils.copyProperties(item, ext);
                    ext.setFlashPromotionId(promotion.getId());
                    if (DateUtil.getTime(now).after(DateUtil.getTime(ext.getStartTime()))
                            && DateUtil.getTime(now).before(DateUtil.getTime(ext.getEndTime()))) {
                        //活动进行中
                        ext.setSessionStatus(0);
                    } else if (DateUtil.getTime(now).after(DateUtil.getTime(ext.getEndTime()))) {
                        //活动即将开始
                        ext.setSessionStatus(1);
                    } else if (DateUtil.getTime(now).before(DateUtil.getTime(ext.getStartTime()))) {
                        //活动已结束
                        ext.setSessionStatus(2);
                    }
                    extList.add(ext);
                });
                return extList;
            }
        }
        return null;
    }

    //根据时间获取秒杀活动
    public SmsFlashPromotion getFlashPromotion(Date date) {
        Date currDate = DateUtil.getDate(date);
        SmsFlashPromotionExample example = new SmsFlashPromotionExample();
        example.createCriteria()
                .andStatusEqualTo(1)
                .andStartDateLessThanOrEqualTo(currDate)
                .andEndDateGreaterThanOrEqualTo(currDate);
        List<SmsFlashPromotion> flashPromotionList = flashPromotionMapper.selectByExample(example);
        if (!CollectionUtils.isEmpty(flashPromotionList)) {
            return flashPromotionList.get(0);
        }
        return null;
    }

    /**
     * 获取首页的秒杀商品列表
     *
     * @return
     */
    public List<FlashPromotionProduct> getHomeSecKillProductList() {
        PageHelper.startPage(1, 8, "sort desc");
        FlashPromotionParam flashPromotionParam = flashPromotionProductDao.getFlashPromotion(null);
        if (flashPromotionParam == null || CollectionUtils.isEmpty(flashPromotionParam.getRelation())) {
            return null;
        }
        List<Long> promotionIds = new ArrayList<>();
        flashPromotionParam.getRelation().stream().forEach(item -> {
            promotionIds.add(item.getId());
        });
        PageHelper.clearPage();
        return flashPromotionProductDao.getHomePromotionProductList(promotionIds);
    }

    @Override
    public CartProduct getCartProduct(Long productId) {
        return portalProductDao.getCartProduct(productId);
    }

    @Override
    public List<PromotionProduct> getPromotionProductList(List<Long> ids) {
        return portalProductDao.getPromotionProductList(ids);
    }

    /**
     * 查找出所有的产品ID
     *
     * @return
     */
    public List<Long> getAllProductId() {
        return portalProductDao.getAllProductId();
    }
}
