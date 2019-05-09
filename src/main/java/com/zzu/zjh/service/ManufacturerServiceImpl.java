package com.zzu.zjh.service;

import com.zzu.zjh.entity.Manufacturer;
import com.zzu.zjh.entity.ManufacturerMsg;
import com.zzu.zjh.mapper.AdminMapper;
import com.zzu.zjh.mapper.ManufacturerMapper;
import com.zzu.zjh.util.FileUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@Transactional
public class ManufacturerServiceImpl implements ManufacturerService {
    @Autowired
    private ManufacturerMapper manufacturerMapper;
    @Override
    public List<ManufacturerMsg> allManufacturersForMap() {
        return manufacturerMapper.queryAllGroupByCity();
    }

    @Override
    public Map<String,Integer> dataOfManufacturer(List<Manufacturer> manufacturers) {
        Map<String,Integer> manufacturerData = new HashMap();
        for(Manufacturer manufacturer:manufacturers){
            Integer number = manufacturerMapper.queryManufacturerNumberByTimeInterval(manufacturer.getManufacturerName());
            manufacturerData.put(manufacturer.getManufacturerName(),number);
        }
        return manufacturerData;
    }

    @Override
    public void importManufacturer(MultipartFile file) {
        List<Manufacturer> manufacturers = FileUtil.importExcel(file,1,1,Manufacturer.class);
        for (Manufacturer manufacturer : manufacturers) {
            System.out.println(manufacturer);
            /*String headPic = manufacturer.getHead_pic();
            int i = headPic.lastIndexOf("/");
            String s = headPic.substring(i+1,headPic.length());
            user.setHead_pic(s);*/
        }
        manufacturerMapper.insertBatch(manufacturers);
    }

    @Override
    public List<Manufacturer> queryAllManufacturers() {
        return manufacturerMapper.selectAll();
    }
}
