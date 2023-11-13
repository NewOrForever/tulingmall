package com.tuling.tulingmall.promotion.config;

import com.tuling.tulingmall.promotion.util.RedisDistrLock;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class RedisPromotionConifg {

    @Bean
    public RedisDistrLock redisDistrLock(){
        return new RedisDistrLock();
    }

}
