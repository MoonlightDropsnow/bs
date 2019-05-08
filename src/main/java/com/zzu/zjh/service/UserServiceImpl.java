package com.zzu.zjh.service;

import com.zzu.zjh.entity.User;
import com.zzu.zjh.mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class UserServiceImpl implements UserService {
    @Autowired
    private UserMapper userMapper;
    @Override
    public User queryUser(Integer id) {
        System.out.println(userMapper.selectAll());
        return userMapper.selectByPrimaryKey(id);
    }
}
