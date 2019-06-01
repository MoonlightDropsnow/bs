package com.zzu.zjh.controller;

import com.zzu.zjh.entity.Admin;
import com.zzu.zjh.entity.AdminDto;
import com.zzu.zjh.service.AdminService;
import com.zzu.zjh.util.ValidateImageCodeUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.image.BufferedImage;
import java.io.IOException;

@Controller
@RequestMapping("admin")
public class AdminController {
    @Autowired
    private AdminService adminService;

    @ResponseBody
    @RequestMapping("allAdminsThisPage")
    public AdminDto allAdmins(Integer page, Integer rows) {
        return adminService.getAllAdmins(page, rows);
    }

    @ResponseBody
    @RequestMapping("login")
    public String login(Admin admin,Model model, String enCode, HttpSession session) {
        if (!session.getAttribute("code").equals(enCode)) {
            return "验证码错误";
        } else {
            Admin admin1 = new Admin();
            admin1.setName(admin.getName());
            Admin admin2 = adminService.getOne(admin1);
            if (admin2 == null) {
                return "用户不存在";
            }
            try {
                adminService.login(admin.getName(), admin.getPassword());
                session.setAttribute("admin", admin2);
                return "ok";
            } catch (RuntimeException e) {
                return "密码错误";
            }
        }
    }

    @RequestMapping("quit")
    public String quit(HttpSession session) {
        if(session.getAttribute("admin")!=null){
            session.removeAttribute("admin");
        }
        adminService.logout();
        return "redirect:/login.jsp";
    }

    @RequestMapping("validateCode")
    public void validateCode(HttpServletResponse response, HttpSession session) {
        String code = ValidateImageCodeUtils.getSecurityCode();
        session.setAttribute("code", code);
        BufferedImage image = ValidateImageCodeUtils.createImage(code);
        ServletOutputStream outputStream = null;
        try {
            outputStream = response.getOutputStream();
            ImageIO.write(image, "png", outputStream);
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            try {
                outputStream.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    @RequestMapping("editAdmin")
    public void editAdmin(Admin admin) {
        adminService.changeAdmin(admin);
    }

    @RequestMapping("removeAdmin")
    public void removeAdmin(Integer id) {
        adminService.deleteAdmin(id);
    }

    @RequestMapping(value = "addAdmin", method = RequestMethod.POST)
    public void addAdmin(Admin admin) {
        adminService.increaseAdmin(admin);
    }
}
