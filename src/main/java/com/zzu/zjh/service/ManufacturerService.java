package com.zzu.zjh.service;

import com.zzu.zjh.entity.Manufacturer;
import com.zzu.zjh.entity.ManufacturerDto;
import com.zzu.zjh.entity.ManufacturerMsg;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;
import java.util.Map;

public interface ManufacturerService {
    List<ManufacturerMsg> allManufacturersForMap();

    Map<String, Integer> dataOfManufacturer(List<Manufacturer> manufacturers);

    List<Manufacturer> queryAllManufacturers();

    ManufacturerDto getManufacturersByPage(int page, int rows);

    void increaseManufacturer(Manufacturer manufacturer);

    void deleteManufacturer(Integer id);

    void changeManufacturer(Manufacturer manufacturer);

}
