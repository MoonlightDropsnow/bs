package com.zzu.zjh.service;

import com.github.pagehelper.PageHelper;
import com.zzu.zjh.entity.Admin;
import com.zzu.zjh.entity.AdminDto;
import com.zzu.zjh.mapper.AdminMapper;
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
    public AdminDto getAllAdmins(int page,int rows) {
        AdminDto adminDto = new AdminDto();
        PageHelper.startPage(page,rows);
        List<Admin> admins = adminMapper.selectAll();
        int total = adminMapper.selectCount(new Admin());
        adminDto.setTotal(total);
        adminDto.setRows(admins);
        return adminDto;
    }

}
