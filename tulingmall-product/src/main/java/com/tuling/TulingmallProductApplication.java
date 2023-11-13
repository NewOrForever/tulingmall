package com.tuling;

import com.alibaba.druid.spring.boot.autoconfigure.DruidDataSourceAutoConfigure;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;

@SpringBootApplication(exclude = DruidDataSourceAutoConfigure.class)/*(exclude = GlobalTransactionAutoConfiguration.class)*/
@EnableDiscoveryClient
public class TulingmallProductApplication {

	public static void main(String[] args) {
		SpringApplication.run(TulingmallProductApplication.class, args);
	}

}
