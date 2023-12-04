package com.tuling.tulingmall.rediscomm.config;

import com.fasterxml.jackson.annotation.JsonAutoDetect;
import com.fasterxml.jackson.annotation.PropertyAccessor;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.tuling.tulingmall.rediscomm.util.RedisOpsExtUtil;
import org.apache.commons.pool2.impl.GenericObjectPoolConfig;
import org.redisson.Redisson;
import org.redisson.api.RedissonClient;
import org.redisson.config.ClusterServersConfig;
import org.redisson.config.Config;
import org.redisson.config.SingleServerConfig;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.autoconfigure.condition.ConditionalOnMissingBean;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
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
public class RedisExtConifg {

    @Autowired
    private Environment environment;

    @Value("${spring.redis.host}")
    private String host;
    @Value("${spring.redis.port}")
    private int port;
    @Value("${spring.redis.lettuce.pool.max-active}")
    private int max_active;
    @Value("${spring.redis.lettuce.pool.max-idle}")
    private int max_idle;
    @Value("${spring.redis.lettuce.pool.max-wait}")
    private int max_wait;
    @Value("${spring.redis.lettuce.pool.min-idle}")
    private int min_idle;


    @Bean("redisClusterPool")
    @ConditionalOnProperty(name = "spring.redis.cluster.nodes")
    @Primary
    @ConfigurationProperties(prefix = "spring.redis.cluster.lettuce.pool")
    public GenericObjectPoolConfig redisClusterPool() {
        return new GenericObjectPoolConfig();
    }

    @Bean("redisClusterConfig")
    @ConditionalOnProperty(name = "spring.redis.cluster.nodes")
    @Primary
    public RedisClusterConfiguration redisClusterConfig() {

        Map<String, Object> source = new HashMap<>(8);
        source.put("spring.redis.cluster.nodes", environment.getProperty("spring.redis.cluster.nodes"));
        RedisClusterConfiguration redisClusterConfiguration = new RedisClusterConfiguration(new MapPropertySource("RedisClusterConfiguration", source));
        redisClusterConfiguration.setPassword(environment.getProperty("spring.redis.password"));
        return redisClusterConfiguration;

    }

    @Bean("redisFactoryCluster")
    @ConditionalOnProperty(name = "spring.redis.cluster.nodes")
    @Primary
    public LettuceConnectionFactory lettuceConnectionFactory(
            @Qualifier("redisClusterPool") GenericObjectPoolConfig redisPool,
            @Qualifier("redisClusterConfig") RedisClusterConfiguration redisClusterConfig) {
        LettuceClientConfiguration clientConfiguration = LettucePoolingClientConfiguration.builder().poolConfig(redisPool).build();
        return new LettuceConnectionFactory(redisClusterConfig, clientConfiguration);
    }

    @Bean("redisTemplate")
    @ConditionalOnProperty(name = "spring.redis.cluster.nodes")
    @Primary
    public RedisTemplate redisClusterTemplate(
            @Qualifier("redisFactoryCluster") RedisConnectionFactory redisConnectionFactory) {
        return redisTemplateSerializer(redisConnectionFactory);
    }


    @Bean("redisSinglePool")
    @ConditionalOnMissingBean(name = "redisFactoryCluster")
    public GenericObjectPoolConfig redisSinglePool() {
        GenericObjectPoolConfig config = new GenericObjectPoolConfig();
        config.setMinIdle(min_idle);
        config.setMaxIdle(max_idle);
        config.setMaxTotal(max_active);
        config.setMaxWaitMillis(max_wait);
        return config;
    }

    @Bean("redisSingleConfig")
    @ConditionalOnMissingBean(name = "redisFactoryCluster")
    public RedisStandaloneConfiguration redisSingleConfig() {
        RedisStandaloneConfiguration redisConfig = new RedisStandaloneConfiguration(host, port);
        redisConfig.setPassword(environment.getProperty("spring.redis.password"));
        return redisConfig;
    }

    @Bean("redisFactorySingle")
    @ConditionalOnMissingBean(name = "redisFactoryCluster")
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
    @Bean("redisTemplate")
    @ConditionalOnMissingBean(name = "redisFactoryCluster")
    public RedisTemplate<String, Object> redisSingleTemplate(
            @Qualifier("redisFactorySingle") LettuceConnectionFactory connectionFactory) {
        return redisTemplateSerializer(connectionFactory);
    }

    private RedisTemplate<String, Object> redisTemplateSerializer(RedisConnectionFactory connectionFactory) {
        RedisTemplate<String, Object> template = new RedisTemplate();
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

    @Bean
    public RedisOpsExtUtil redisOpsUtil() {
        return new RedisOpsExtUtil();
    }

    @Bean
    public RedissonClient redissonClient() {
        Config config = new Config();
        String password = environment.getProperty("spring.redis.password");
        if (environment.containsProperty("spring.redis.cluster.nodes")) {
            String redisNodes = environment.getProperty("spring.redis.cluster.nodes");
            ClusterServersConfig clusterServersConfig = config.useClusterServers();
            for (String node : redisNodes.split(",")) {
                clusterServersConfig.addNodeAddress("redis://" + node);
            }
            clusterServersConfig.setPassword(password);
        } else {
            SingleServerConfig singleServerConfig = config.useSingleServer().setAddress("redis://" + host + ":" + port);
            singleServerConfig.setPassword(password);
        }

        return Redisson.create(config);
    }

}
