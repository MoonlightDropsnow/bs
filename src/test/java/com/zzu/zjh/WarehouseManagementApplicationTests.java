package com.zzu.zjh;

import com.zzu.zjh.entity.Admin;
import com.zzu.zjh.service.AdminService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.test.context.junit4.SpringRunner;

import javax.annotation.Resource;

@RunWith(SpringRunner.class)
@SpringBootTest
public class WarehouseManagementApplicationTests extends SpringBootServletInitializer {

    @Resource
    AdminService adminService;
    @Test
    public void contextLoads() {
        Admin admin=new Admin();
        admin.setName("zjh");
        admin.setPassword("123123");
        adminService.increaseAdmin(admin);
    }

    public static void main(String[] args) {
        SpringApplication.run(WarehouseManagementApplication.class,args);
    }

}
