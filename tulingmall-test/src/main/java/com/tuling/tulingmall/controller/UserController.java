package com.tuling.tulingmall.controller;

import com.tuling.tulingmall.domain.User;
import com.tuling.tulingmall.mapper.UserMapper;
import com.tuling.tulingmall.service.UserService;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * ClassName:LoginController
 * Package:com.example.demo.controller
 * Description:
 *
 * @Date:2023/10/7 10:14
 * @Author:qs@1.com
 */
@RestController
@RequestMapping("/user/test")
public class UserController {
    @Autowired
    private UserService userService;

    @RequestMapping("/version")
    public String testVersion() {
        userService.testVersion();
        return "success";
    }

}
