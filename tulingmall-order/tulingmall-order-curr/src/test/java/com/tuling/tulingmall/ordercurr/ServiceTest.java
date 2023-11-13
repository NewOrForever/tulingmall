package com.tuling.tulingmall.ordercurr;

import com.tuling.tulingmall.ordercurr.service.impl.OrderConstant;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.Set;

/**
 * @author roy
 * @desc
 */

@SpringBootTest
@RunWith(SpringRunner.class)
public class ServiceTest {

    @Autowired
    private RedisTemplate redisTemplate;


    @Test
    public void redisTest(){
//        redisTemplate.opsForHash().put("hash","key",1);
//        System.out.println(redisTemplate.opsForHash().get("hash","key"));
//        redisTemplate.opsForHash().increment("hash","key",1);
//        System.out.println(redisTemplate.opsForHash().get("hash","key"));

//        Set keys = redisTemplate.opsForHash().keys(OrderConstant.REDIS_CREATE_ORDER);
//        keys.forEach(key -> {
//            Object times = redisTemplate.opsForHash().get(OrderConstant.REDIS_CREATE_ORDER, key);
//            int l = (int) times;
//            System.out.println(key +": ==> "+ l);
//            redisTemplate.opsForHash().increment(OrderConstant.REDIS_CREATE_ORDER,key,1);
//            Object times2 = redisTemplate.opsForHash().get(OrderConstant.REDIS_CREATE_ORDER, key);
//            int l2 = (int) times2;
//            System.out.println(key +": ==> "+ l2);
//        });

        String orderId ="700045";
        Object times = redisTemplate.opsForHash().get(OrderConstant.REDIS_CREATE_ORDER, orderId);
        int l = (int) times;
        System.out.println(orderId +": ==> "+ l);
        redisTemplate.opsForHash().increment(OrderConstant.REDIS_CREATE_ORDER,orderId,1);
        Object times2 = redisTemplate.opsForHash().get(OrderConstant.REDIS_CREATE_ORDER, orderId);
        int l2 = (int) times2;
        System.out.println(orderId +": ==> "+ l2);
    }
}
