package com.zzu.zjh.controller;

import com.zzu.zjh.entity.User;
import com.zzu.zjh.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("user")
public class UserController {
    @Autowired
    private UserService userService;
    @RequestMapping("oneUser")
    public User queryUser() {
        return userService.queryUser(1);
    }
}
