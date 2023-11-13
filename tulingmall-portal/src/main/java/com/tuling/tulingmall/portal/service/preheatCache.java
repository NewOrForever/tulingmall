package com.tuling.tulingmall.portal.service;

import com.tuling.tulingmall.portal.config.PromotionRedisKey;
import com.tuling.tulingmall.portal.domain.HomeContentResult;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.stereotype.Component;

@Component
@Slf4j
public class preheatCache implements CommandLineRunner {

    @Autowired
    private HomeService homeService;

    @Override
    public void run(String... args) throws Exception {
        for(String str : args) {
            log.info("系统启动命令行参数: {}",str);
        }
        homeService.preheatCache();
    }

}
