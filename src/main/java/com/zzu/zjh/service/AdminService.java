package com.zzu.zjh.service;

import com.zzu.zjh.entity.Admin;
import com.zzu.zjh.entity.AdminDto;

import java.util.List;

public interface AdminService {
    Admin getOne(Admin admin);

    AdminDto getAllAdmins(int page,int rows);
}
