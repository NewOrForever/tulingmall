package com.tuling;

import org.springframework.aop.target.SimpleBeanTargetSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cloud.context.config.annotation.RefreshScope;
import org.springframework.context.annotation.*;

/**
 * ClassName:TestProtoScopeConfig
 * Package:com.tuling
 * Description:
 *
 * @Date:2023/11/13 10:15
 * @Author:qs@1.com
 */
@Configuration
public class TestProtoScopeConfig {
    @Autowired
    private ProtoTypeBean protoTypeBean;

    public static void main(String[] args) {
        AnnotationConfigApplicationContext context = new AnnotationConfigApplicationContext(TestProtoScopeConfig.class);
        System.out.println(1);
    }


    /**
     * 原型 bean 每次getBean 的时候都会创建一个新的对象
     * 不管什么 scope 的 bean，request、session、prototype、refresh 等等都是会有一个 BeanDefinition 对象的
     *
     * 非单例bean 只有在 getBean 的时候才会创建一个新的对象（比如说依赖注入、构造方法注入。。。）
     * 如果 A bean 维护了一个  Proto bean 属性，A bean 是单例的，Proto bean 是非单例的，那么 Proto bean 会在 A bean 创建的时候创建一个新的对象
     * 只要 A 没有销毁重建（或者 Proto bean 没走代理每次都要 getBean {@link ScopedProxyMode#INTERFACES}
     * {@link ScopedProxyMode#TARGET_CLASS}，比如 {@link RefreshScope} -> {@link SimpleBeanTargetSource#getTarget()}）
     * 那么 Proto bean 就不会重新去 getBean 创建一个新的对象
     */
    @Bean
    @Scope("prototype")
    public ProtoTypeBean protoTypeBean() {
        System.out.println("我是原型bean");
        ProtoTypeBean pro = new ProtoTypeBean();
        System.out.println(pro);
        return pro;
    }

    public static  class ProtoTypeBean {
        public ProtoTypeBean() {

        }
    }
}
