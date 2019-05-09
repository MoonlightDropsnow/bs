package com.zzu.zjh.service;

import com.zzu.zjh.entity.Manufacturer;
import com.zzu.zjh.entity.ManufacturerMsg;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;
import java.util.Map;

public interface ManufacturerService {
    public List<ManufacturerMsg> allManufacturersForMap();
    public Map<String,Integer> dataOfManufacturer(List<Manufacturer> manufacturers);
    public void importManufacturer(MultipartFile file);
    public List<Manufacturer> queryAllManufacturers();
}
