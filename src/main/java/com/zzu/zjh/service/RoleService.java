package com.zzu.zjh.service;


import com.zzu.zjh.realmobject.Role;

import java.util.List;


public interface RoleService {
    List<Role> queryRolesByUserName(String username);
}
