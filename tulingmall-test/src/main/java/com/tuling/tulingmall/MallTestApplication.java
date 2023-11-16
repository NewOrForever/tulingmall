package com.tuling.tulingmall;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.transaction.annotation.EnableTransactionManagement;

/**
 * 应用启动入口
 * Created on 2018/4/26.
 */
@SpringBootApplication
@EnableTransactionManagement
@MapperScan({"com.tuling.tulingmall.mapper"})
public class MallTestApplication {
    public static void main(String[] args) {
        SpringApplication.run(MallTestApplication.class, args);
    }
}
