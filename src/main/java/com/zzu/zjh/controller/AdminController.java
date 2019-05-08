package com.zzu.zjh.controller;

import com.zzu.zjh.entity.Admin;
import com.zzu.zjh.service.AdminService;
import com.zzu.zjh.util.ValidateImageCodeUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

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

    @RequestMapping("login")
    public String login(Admin admin, Model model, String enCode, HttpSession session) {
        if (!session.getAttribute("code").equals(enCode)) {
            model.addAttribute("error", "验证码错误");
            return "login";
        } else {
            Admin admin1 = adminService.getOne(admin);
            if (admin1 == null) {
                model.addAttribute("error", "用户不存在");
                return "login";
            } else if (!admin1.getPassword().equals(admin.getPassword())) {
                model.addAttribute("error", "密码错误");
                return "login";
            }
            session.setAttribute("admin",admin);
            return "main/main";
            //
        }
    }
    @RequestMapping("quit")
    public String quit(HttpSession session){
        session.invalidate();
        return "login";
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
}
