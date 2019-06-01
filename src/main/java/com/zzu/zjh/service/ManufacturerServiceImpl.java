package com.zzu.zjh.service;

import com.github.pagehelper.PageHelper;
import com.zzu.zjh.entity.Manufacturer;
import com.zzu.zjh.entity.ManufacturerDto;
import com.zzu.zjh.entity.ManufacturerMsg;
import com.zzu.zjh.mapper.AdminMapper;
import com.zzu.zjh.mapper.ManufacturerMapper;
import com.zzu.zjh.util.FileUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.util.Date;
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
    public Map<String, Integer> dataOfManufacturer(List<Manufacturer> manufacturers) {
        Map<String, Integer> manufacturerData = new HashMap();
        for (Manufacturer manufacturer : manufacturers) {
            Integer number = manufacturerMapper.queryManufacturerNumberByTimeInterval(manufacturer.getManufacturerName());
            manufacturerData.put(manufacturer.getManufacturerName(), number);
        }
        return manufacturerData;
    }
    @Override
    public List<Manufacturer> queryAllManufacturers() {
        return manufacturerMapper.selectAll();
    }

    @Override
    public ManufacturerDto getManufacturersByPage(int page, int rows) {
        ManufacturerDto manufacturerDto = new ManufacturerDto();
        PageHelper.startPage(page, rows);
        List<Manufacturer> manufacturers = manufacturerMapper.selectAll();
        int total = manufacturerMapper.selectCount(new Manufacturer());
        manufacturerDto.setTotal(total);
        manufacturerDto.setRows(manufacturers);
        return manufacturerDto;
    }

    @Override
    public void increaseManufacturer(Manufacturer manufacturer) {
        manufacturer.setCooperationTimes(0);
        manufacturer.setManufacturerDate(new Date());
        manufacturerMapper.insert(manufacturer);
    }

    @Override
    public void deleteManufacturer(Integer id) {
        manufacturerMapper.deleteByPrimaryKey(id);
    }

    @Override
    public void changeManufacturer(Manufacturer manufacturer) {
        manufacturerMapper.updateByPrimaryKeySelective(manufacturer);
    }
}
