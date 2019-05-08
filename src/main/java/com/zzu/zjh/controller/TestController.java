package com.zzu.zjh.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("testController")
public class TestController {
    @RequestMapping("testMethod")
    public String test(){
        return "test";
    }
}
