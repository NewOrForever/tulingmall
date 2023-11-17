package com.tuling.tulingmall.history.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.mongodb.MongoDatabaseFactory;
import org.springframework.data.mongodb.MongoTransactionManager;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import com.mongodb.ClientSessionOptions;
import com.mongodb.ReadConcern;
import com.mongodb.WriteConcern;
import com.mongodb.ReadPreference;
import com.mongodb.client.internal.MongoClientDelegate;

@Configuration
@EnableTransactionManagement
public class MongoDbConfig {

    /**
     * @see MongoClientDelegate#createClientSession(ClientSessionOptions, ReadConcern, WriteConcern, ReadPreference)
     * mongo db 的事务需要mongodb 集群支持
     * @param factory
     * @return
     */
    @Bean("mongoTransactionManager")
    MongoTransactionManager transactionManager(MongoDatabaseFactory factory){
        return new MongoTransactionManager(factory);
    }

}
