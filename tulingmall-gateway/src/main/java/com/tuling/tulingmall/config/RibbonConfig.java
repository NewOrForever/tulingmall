package com.tuling.tulingmall.config;

import com.tuling.tulingmall.Component.TulingRestTemplate;
import org.springframework.cloud.client.discovery.DiscoveryClient;
import org.springframework.cloud.client.loadbalancer.LoadBalancerInterceptor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.client.ClientHttpRequestInterceptor;
import org.springframework.web.client.RestTemplate;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by smlz on 2019/12/26.
 */
@Configuration
public class RibbonConfig {

    /**
     * 方法实现说明:原生的RestTemplate +@LB不行 因为在
     * InitializingBean方法执行前我们的RestTemplate还没有被增强
     * 需要自己改写RestTemplate
     * @author:smlz
     * @return:
     * @exception:
     * @date:2020/1/22 14:28
     */
//    @Bean
//    public TulingRestTemplate restTemplate(DiscoveryClient discoveryClient) {
//        return new TulingRestTemplate(discoveryClient);
//    }

    /**
     *
     * 手动注入loadBalancerInterceptor拦截器，实现负载均衡功能
     * @param loadBalancerInterceptor
     * @return
     *
     */
    @Bean
    public RestTemplate restTemplate(LoadBalancerInterceptor loadBalancerInterceptor){
        RestTemplate restTemplate = new RestTemplate();
        List<ClientHttpRequestInterceptor> list = new ArrayList();
        list.add(loadBalancerInterceptor);
        restTemplate.setInterceptors(list);
        return restTemplate;
    }

}
