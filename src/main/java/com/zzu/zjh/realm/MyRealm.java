package com.zzu.zjh.realm;


import com.zzu.zjh.entity.Admin;
import com.zzu.zjh.realmobject.Perm;
import com.zzu.zjh.realmobject.Role;
import com.zzu.zjh.service.AdminService;
import com.zzu.zjh.service.PermService;
import com.zzu.zjh.service.RoleService;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;
import org.springframework.beans.factory.annotation.Autowired;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;


public class MyRealm extends AuthorizingRealm {
    @Resource
    private AdminService adminService;
    @Autowired
    private RoleService roleService;
    @Autowired
    private PermService permService;
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authenticationToken) throws AuthenticationException {
        //将传过来的AuthenticationInfo对象转为UsernamePasswToken对象
        UsernamePasswordToken token=(UsernamePasswordToken) authenticationToken;
        //接受其传过来的username
        String username=token.getUsername();
        //判断是否为空
        if (username!=null&&!"".equals(username)){
            //调用数据库查出密码
            Admin admin=new Admin();
            admin.setName(username);
            System.out.println(username);
            Admin userInfo=adminService.getOne(admin);
            System.out.println(userInfo);
            if (userInfo==null){
                throw new RuntimeException("该用户不存在!");
            }
            String password=userInfo.getPassword();
            String salt=userInfo.getSalt();
            if (password!=null){
                return  new SimpleAuthenticationInfo(username,password, ByteSource.Util.bytes(salt),getName());
            }
        }
        return null;
    }

    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {
        //获取前台传过来的用户名
        SimpleAuthorizationInfo simpleAuthorizationInfo=new SimpleAuthorizationInfo();
        String username=(String) principalCollection.fromRealm(getName()).iterator().next();
        if (username!=null){
            //根据用户名获取角色集合
            List<String> roles=new ArrayList<>();
            for (Role role:
                    roleService.queryRolesByUserName(username)) {
                roles.add(role.getRoles());
            }
            simpleAuthorizationInfo.addRoles(roles);
            List<String> perms=new ArrayList<>();
            for (String s:
                    roles) {
                for (Perm perm:
                        permService.queryPermsByRole(s)) {
                    if (!perms.contains(perm.getPerm())){
                        perms.add(perm.getPerm());
                    }

                }
                simpleAuthorizationInfo.addStringPermissions(roles);
            }
        }
        return simpleAuthorizationInfo;
    }
}
