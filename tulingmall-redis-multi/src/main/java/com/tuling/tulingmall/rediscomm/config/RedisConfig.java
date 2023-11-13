package com.tuling.tulingmall.rediscomm.config;

import cn.hutool.core.convert.Convert;
import com.fasterxml.jackson.annotation.JsonAutoDetect;
import com.fasterxml.jackson.annotation.PropertyAccessor;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.tuling.tulingmall.rediscomm.util.RedisClusterUtil;
import com.tuling.tulingmall.rediscomm.util.RedisSingleUtil;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.pool2.impl.GenericObjectPoolConfig;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;
import org.springframework.core.env.Environment;
import org.springframework.core.env.MapPropertySource;
import org.springframework.data.redis.connection.RedisClusterConfiguration;
import org.springframework.data.redis.connection.RedisConnectionFactory;
import org.springframework.data.redis.connection.RedisStandaloneConfiguration;
import org.springframework.data.redis.connection.lettuce.LettuceClientConfiguration;
import org.springframework.data.redis.connection.lettuce.LettuceConnectionFactory;
import org.springframework.data.redis.connection.lettuce.LettucePoolingClientConfiguration;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.serializer.Jackson2JsonRedisSerializer;
import org.springframework.data.redis.serializer.StringRedisSerializer;

import java.util.HashMap;
import java.util.Map;

@Configuration
@Slf4j
public class RedisConfig {

    @Autowired
    private Environment environment;

    @Value("${spring.redisSingle.host}")
    private String host;
    @Value("${spring.redisSingle.port}")
    private String port;
    @Value("${spring.redisSingle.lettuce.pool.max-active}")
    private String max_active;
    @Value("${spring.redisSingle.lettuce.pool.max-idle}")
    private String max_idle;
    @Value("${spring.redisSingle.lettuce.pool.max-wait}")
    private String max_wait;
    @Value("${spring.redisSingle.lettuce.pool.min-idle}")
    private String min_idle;

    @Bean("redisClusterPool")
    @Primary
    @ConfigurationProperties(prefix = "spring.redis.cluster.lettuce.pool")
    public GenericObjectPoolConfig redisClusterPool() {
        return new GenericObjectPoolConfig();
    }

    @Bean("redisClusterConfig")
    @Primary
    public RedisClusterConfiguration redisClusterConfig() {

        Map<String, Object> source = new HashMap<>(8);
        source.put("spring.redis.cluster.nodes", environment.getProperty("spring.redis.cluster.nodes"));
        RedisClusterConfiguration redisClusterConfiguration = new RedisClusterConfiguration(new MapPropertySource("RedisClusterConfiguration", source));
        redisClusterConfiguration.setPassword(environment.getProperty("spring.redis.password"));
        return redisClusterConfiguration;

    }

    @Bean("redisFactoryCluster")
    @Primary
    public LettuceConnectionFactory lettuceConnectionFactory(
            @Qualifier("redisClusterPool") GenericObjectPoolConfig redisPool,
            @Qualifier("redisClusterConfig") RedisClusterConfiguration redisClusterConfig) {
        LettuceClientConfiguration clientConfiguration = LettucePoolingClientConfiguration.builder().poolConfig(redisPool).build();
        return new LettuceConnectionFactory(redisClusterConfig, clientConfiguration);
    }

    @Bean("redisClusterTemplate")
    @Primary
    public RedisTemplate redisClusterTemplate(
            @Qualifier("redisFactoryCluster") RedisConnectionFactory redisConnectionFactory) {
        return redisTemplateSerializer(redisConnectionFactory);
    }

    @Bean
    public RedisClusterUtil redisOpsUtil(){
        return new RedisClusterUtil();
    }

    @Bean("redisSinglePool")
    public GenericObjectPoolConfig redisSinglePool() {
        GenericObjectPoolConfig config = new GenericObjectPoolConfig();
        config.setMinIdle(Convert.toInt(min_idle));
        config.setMaxIdle(Convert.toInt(max_idle));
        config.setMaxTotal(Convert.toInt(max_active));
        config.setMaxWaitMillis(Convert.toInt(max_wait));
        return config;
    }

    @Bean("redisSingleConfig")
    public RedisStandaloneConfiguration redisSingleConfig() {
        RedisStandaloneConfiguration redisConfig = new RedisStandaloneConfiguration(host,Convert.toInt(port));
        return redisConfig;
    }

    @Bean("redisFactorySingle")
    public LettuceConnectionFactory redisFactorySingle(@Qualifier("redisSinglePool") GenericObjectPoolConfig config,
                                             @Qualifier("redisSingleConfig") RedisStandaloneConfiguration redisConfig) {//注意传入的对象名和类型RedisStandaloneConfiguration
        LettuceClientConfiguration clientConfiguration = LettucePoolingClientConfiguration.builder().poolConfig(config).build();
        return new LettuceConnectionFactory(redisConfig, clientConfiguration);
    }


    /**
     * 单实例redis数据源
     *
     * @param connectionFactory
     * @return
     */
    @Bean("redisSingleTemplate")
    public RedisTemplate<String, Object> redisSingleTemplate(
            @Qualifier("redisFactorySingle")LettuceConnectionFactory connectionFactory) {
        return redisTemplateSerializer(connectionFactory);
    }

    @Bean
    public RedisSingleUtil redisSingleUtil(){
        return new RedisSingleUtil();
    }

    private RedisTemplate<String, Object> redisTemplateSerializer(RedisConnectionFactory connectionFactory){
        RedisTemplate<String,Object> template = new RedisTemplate();
        template.setConnectionFactory(connectionFactory);
        // 序列化工具
        Jackson2JsonRedisSerializer<Object> jackson2JsonRedisSerializer
                = new Jackson2JsonRedisSerializer<>(Object.class);
        ObjectMapper om = new ObjectMapper();
        om.setVisibility(PropertyAccessor.ALL, JsonAutoDetect.Visibility.ANY);
        om.enableDefaultTyping(ObjectMapper.DefaultTyping.NON_FINAL);
        jackson2JsonRedisSerializer.setObjectMapper(om);

        StringRedisSerializer stringRedisSerializer = new StringRedisSerializer();
        template.setKeySerializer(stringRedisSerializer);
        template.setValueSerializer(jackson2JsonRedisSerializer);

        template.setHashKeySerializer(jackson2JsonRedisSerializer);
        template.setHashValueSerializer(jackson2JsonRedisSerializer);

        template.afterPropertiesSet();
        return template;
    }

}
