package com.tuling.tulingmall.promotion;

import com.alibaba.druid.spring.boot.autoconfigure.DruidDataSourceAutoConfigure;
import com.tuling.tulingmall.rediscomm.config.RedisExtConifg;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.openfeign.EnableFeignClients;
import org.springframework.context.annotation.Import;

@SpringBootApplication(exclude = DruidDataSourceAutoConfigure.class)
@EnableFeignClients
@EnableDiscoveryClient
@Import(RedisExtConifg.class)
public class TulingmallPromotionApplication {

	public static void main(String[] args) {
		SpringApplication.run(TulingmallPromotionApplication.class, args);
	}

}
