package com.zzu.zjh.service;

import com.zzu.zjh.mapper.RoleMapper;
import com.zzu.zjh.realmobject.Role;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;


@Service
@Transactional
public class RoleServiceImpl implements RoleService {
    @Resource
    private RoleMapper roleMapper;
    @Override
    @Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
    public List<Role> queryRolesByUserName(String username) {
        Role role=new Role();
        role.setUsername(username);
        List<Role> roleList=roleMapper.select(role);
        return roleList;
    }
}
