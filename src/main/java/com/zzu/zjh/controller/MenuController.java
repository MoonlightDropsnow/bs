package com.zzu.zjh.controller;

import com.zzu.zjh.entity.Admin;
import com.zzu.zjh.entity.Menu;
import com.zzu.zjh.service.MenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpSession;
import java.util.List;

@RestController
@RequestMapping("menu")
public class MenuController {
    @Autowired
    MenuService menuService;
    @RequestMapping("allMenus")
    public List<Menu> allMenus(Integer parent_id, HttpSession session){
        Admin admin = (Admin) session.getAttribute("admin");
        String duty = admin.getDuty();
        return menuService.getAllMenus(parent_id,duty);
    }

}
