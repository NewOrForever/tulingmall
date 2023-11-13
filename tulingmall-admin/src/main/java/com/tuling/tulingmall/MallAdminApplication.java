package com.tuling.tulingmall;

import com.alibaba.druid.spring.boot.autoconfigure.DruidDataSourceAutoConfigure;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.openfeign.EnableFeignClients;
import org.springframework.transaction.annotation.EnableTransactionManagement;

/**
 * 应用启动入口
 * Created on 2018/4/26.
 */
@SpringBootApplication(exclude = DruidDataSourceAutoConfigure.class)
@EnableTransactionManagement
@EnableFeignClients
@MapperScan({"com.tuling.tulingmall.mapper","com.tuling.tulingmall.dao"})
public class MallAdminApplication {
    public static void main(String[] args) {
        SpringApplication.run(MallAdminApplication.class, args);
    }
}
