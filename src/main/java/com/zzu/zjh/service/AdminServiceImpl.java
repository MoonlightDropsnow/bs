package com.zzu.zjh.service;

import com.github.pagehelper.PageHelper;
import com.zzu.zjh.entity.Admin;
import com.zzu.zjh.entity.AdminDto;
import com.zzu.zjh.mapper.AdminMapper;
import com.zzu.zjh.util.MD5Utils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class AdminServiceImpl implements AdminService {
    @Autowired
    private AdminMapper adminMapper;

    @Override
    @Transactional(propagation = Propagation.SUPPORTS)
    public Admin getOne(Admin admin) {
        return adminMapper.selectOne(admin);
    }

    @Override
    public AdminDto getAllAdmins(int page, int rows) {
        AdminDto adminDto = new AdminDto();
        PageHelper.startPage(page, rows);
        List<Admin> admins = adminMapper.selectAll();
        int total = adminMapper.selectCount(new Admin());
        adminDto.setTotal(total);
        adminDto.setRows(admins);
        return adminDto;
    }

    @Override
    public void increaseAdmin(Admin admin) {
        String password = admin.getPassword();
        admin.setTruePassword(password);
        String salt = MD5Utils.getSalt();
        admin.setSalt(salt);
        String newPassword = new SimpleHash("MD5", password, salt, 1024).toString();
        admin.setPassword(newPassword);
        adminMapper.insert(admin);

    }

    @Override
    public void deleteAdmin(Integer id) {
        adminMapper.deleteByPrimaryKey(id);
    }

    @Override
    public void changeAdmin(Admin admin) {
        adminMapper.updateByPrimaryKeySelective(admin);
    }

    @Override
    public void login(String username, String password) {
        Subject subject = SecurityUtils.getSubject();
        AuthenticationToken authenticationToken = new UsernamePasswordToken(username, password);
        subject.login(authenticationToken);
    }

}
