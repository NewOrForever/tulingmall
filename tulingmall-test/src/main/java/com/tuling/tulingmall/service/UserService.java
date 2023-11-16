package com.tuling.tulingmall.service;

import com.tuling.tulingmall.domain.User;
import com.tuling.tulingmall.mapper.UserMapper;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * ClassName:UserService
 * Package:com.tuling.tulingmall.service
 * Description:
 *
 * @Date:2023/11/16 11:24
 * @Author:qs@1.com
 */
@Service
public class UserService {
    @Autowired
    private UserMapper userMapper;
    @Autowired
    private SqlSessionTemplate sqlSessionTemplate;
    public void testVersion() {
        User user = userMapper.selectById(5L);

        User toUpdate = new User();
        toUpdate.setId(user.getId());
        toUpdate.setVersion(user.getVersion());
//        int affectRowCount = sqlSessionTemplate.update("com.tuling.tulingmall.mapper.UserMapper.updateWithVersionById", user);
        int affectRowCount = sqlSessionTemplate.update("com.tuling.tulingmall.mapper.UserMapper.updateCountWithVersionById", toUpdate);
//        int affectRowCount = sqlSessionTemplate.update("com.tuling.tulingmall.mapper.UserMapper.updateCountById", toUpdate);
        System.out.println("影响行数：" + affectRowCount);
    }
}
