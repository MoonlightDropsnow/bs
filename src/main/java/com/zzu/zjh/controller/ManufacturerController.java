package com.zzu.zjh.controller;

import com.alibaba.fastjson.JSON;
import com.zzu.zjh.entity.Manufacturer;
import com.zzu.zjh.entity.ManufacturerDto;
import com.zzu.zjh.entity.ManufacturerMsg;
import com.zzu.zjh.service.ManufacturerService;
import io.goeasy.GoEasy;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("manufacturer")
public class ManufacturerController {
    @Autowired
    private ManufacturerService manufacturerService;

    @RequestMapping("allManufacturersMsg")
    public List<ManufacturerMsg> allManufacturerMsg() {
        return manufacturerService.allManufacturersForMap();
    }
    @RequestMapping("allManufacturerNumbers")
    public Map<String, Integer> allManufacturerNumbers(){
        List<Manufacturer> manufacturers = manufacturerService.queryAllManufacturers();
        return manufacturerService.dataOfManufacturer(manufacturers);}
    @RequestMapping("allManufacturerNumbers2")
    public void allUserNumbersGo(){
        List<Manufacturer> manufacturers = manufacturerService.queryAllManufacturers();
        GoEasy goEasy = new GoEasy("http://rest-hangzhou.goeasy.io", "BC-0e7e8c1d21b94a9b83a985ee2d60e8e0");
        goEasy.publish("goeasy", JSON.toJSONString(manufacturerService.dataOfManufacturer(manufacturers)) );
    }
    @RequestMapping("importUser")
    public void importUser(MultipartFile file){
        manufacturerService.importManufacturer(file);
    }
    @RequestMapping("allManufacturersThisPage")
    public ManufacturerDto allManufacturersThisPage(Integer page, Integer rows) {
        return manufacturerService.getManufacturersByPage(page, rows);
    }

}
