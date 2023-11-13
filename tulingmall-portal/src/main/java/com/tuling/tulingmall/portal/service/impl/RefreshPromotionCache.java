package com.tuling.tulingmall.portal.service.impl;

import com.github.benmanes.caffeine.cache.Cache;
import com.tuling.tulingmall.portal.config.PromotionRedisKey;
import com.tuling.tulingmall.portal.domain.HomeContentResult;
import com.tuling.tulingmall.portal.service.HomeService;
import com.tuling.tulingmall.promotion.domain.FlashPromotionProduct;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.scheduling.annotation.Async;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import java.util.List;

/*
* 异步刷新促销信息在本地的缓存*/
@Service
@Slf4j
public class RefreshPromotionCache {

    @Autowired
    private HomeService homeService;

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

    @Autowired
    private PromotionRedisKey promotionRedisKey;

    @Async
    @Scheduled(initialDelay=5000*60,fixedDelay = 1000*60)
    public void refreshCache(){
        if(promotionRedisKey.isAllowLocalCache()){
            log.info("检查本地缓存[promotionCache] 是否需要刷新...");
            final String brandKey = promotionRedisKey.getBrandKey();
            if(null == promotionCache.getIfPresent(brandKey)||null == promotionCacheBak.getIfPresent(brandKey)){
                log.info("本地缓存[promotionCache] 需要刷新");
                HomeContentResult result = homeService.getFromRemote();
                if(null != result){
                    if(null == promotionCache.getIfPresent(brandKey)) {
                        promotionCache.put(brandKey,result);
                        log.info("刷新本地缓存[promotionCache] 成功");
                    }
                    if(null == promotionCacheBak.getIfPresent(brandKey)) {
                        promotionCacheBak.put(brandKey,result);
                        log.info("刷新本地缓存[promotionCache] 成功");
                    }
                }else{
                    log.warn("从远程获得[promotionCache] 数据失败");
                }
            }
        }
    }

    @Async
    @Scheduled(initialDelay=30,fixedDelay = 30)
    public void refreshSecKillCache(){
        final String secKillKey = promotionRedisKey.getSecKillKey();
        if(null == secKillCache.getIfPresent(secKillKey)||null == secKillCacheBak.getIfPresent(secKillKey)){
            List<FlashPromotionProduct> secKills = homeService.getSecKillFromRemote();
            if(null != secKills){
                if(null == secKillCache.getIfPresent(secKillKey)) {
                    secKillCache.put(secKillKey,secKills);
                }
                if(null == secKillCacheBak.getIfPresent(secKillKey)) {
                    secKillCacheBak.put(secKillKey,secKills);
                }
            }else{
                log.warn("从远程获得[SecKillCache] 数据失败");
            }
        }
    }
}
