package com.tuling.tulingmall.history.config;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.Configuration;

/**
 * MyBatis配置类
 */
@Configuration
@MapperScan({"com.tuling.tulingmall.history.mapper","com.tuling.tulingmall.history.dao"})
public class MyBatisConfig {


}
