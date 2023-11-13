package com.tuling.tulingmall.search.config;

/*
@author 图灵学院-白起老师
*/

import org.apache.http.HttpHost;
import org.apache.http.auth.AuthScope;
import org.apache.http.auth.UsernamePasswordCredentials;
import org.apache.http.client.CredentialsProvider;
import org.apache.http.impl.client.BasicCredentialsProvider;
import org.elasticsearch.client.RestClient;
import org.elasticsearch.client.RestClientBuilder;
import org.elasticsearch.client.RestHighLevelClient;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class ElasticSearchConfig {

    @Bean
    public RestHighLevelClient restHighLevelClient(){
//        RestHighLevelClient client = new RestHighLevelClient(
//                RestClient.builder(
//                       new HttpHost("192.168.21.130", 9200, "http"),
//                        new HttpHost("192.168.21.131", 9200, "http"),
//                        new HttpHost("192.168.21.132", 9200, "http")));

        RestClientBuilder builder=RestClient.builder(
                new HttpHost("192.168.65.110", 9200, "http"),
                new HttpHost("192.168.65.113", 9200, "http"),
                new HttpHost("192.168.65.219", 9200, "http"));
        CredentialsProvider credentialsProvider = new BasicCredentialsProvider();
        credentialsProvider.setCredentials(AuthScope.ANY, new UsernamePasswordCredentials("elastic", "123456"));
        builder.setHttpClientConfigCallback(f -> f.setDefaultCredentialsProvider(credentialsProvider));
        RestHighLevelClient client = new RestHighLevelClient( builder);
        return client;


    }
}
