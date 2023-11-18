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
            /**
             * TODO 这个判断条件有必要吗？有必要等到本地缓存失效才去刷新吗？
             * 如果 db 中的数据有变化 -> 那么本地缓存也应该要删除
             * canal 监听 binlog -> 往 mq 发送消息 -> mq 消费者 -> 删除本地缓存 ？？？
             *
             * 实际应该根据业务场景和对数据不一致的容忍度来决定使用那种方案：
             * 1. 容忍度比较宽松：定时刷新本地缓存（本地缓存失效的情况下才会去远程拉取）
             * 2. 容忍度不是很严格：每次定时刷新本地缓存时都会去远程拉取
             * 3. 容忍度很严格，对数据一致性要求较高：canal 监听 binlog -> 往 mq 发送消息 -> mq 消费者 -> 删除本地缓存 
             */
            if(null == promotionCache.getIfPresent(brandKey)||null == promotionCacheBak.getIfPresent(brandKey)){
                log.info("本地缓存[promotionCache] 需要刷新");
                HomeContentResult result = homeService.getFromRemote();
                if(null != result){
                    /**
                     * 正式缓存只有无效才会被重新写入
                     * TODO db中的数据有变化时 -> 如何是本地缓存失效？
                     * canal 监听 binlog -> 往 mq 发送消息 -> mq 消费者 -> 删除本地缓存 ？？？
                     */
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
