package com.zzu.zjh;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.test.context.junit4.SpringRunner;

@RunWith(SpringRunner.class)
@SpringBootTest
public class WarehouseManagementApplicationTests extends SpringBootServletInitializer {

    @Test
    public void contextLoads() {
    }

    public static void main(String[] args) {
        SpringApplication.run(WarehouseManagementApplication.class,args);
    }

}
