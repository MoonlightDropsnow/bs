package com.zzu.zjh.service;

import com.zzu.zjh.entity.Admin;
import com.zzu.zjh.entity.AdminDto;


public interface AdminService {
    Admin getOne(Admin admin);

    AdminDto getAllAdmins(int page, int rows);

    void increaseAdmin(Admin admin);

    void login(String username, String password);

    void deleteAdmin(Integer id);

    void changeAdmin(Admin admin);


}
