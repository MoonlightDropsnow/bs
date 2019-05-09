package com.zzu.zjh.mapper;

import com.zzu.zjh.entity.Manufacturer;
import com.zzu.zjh.entity.ManufacturerMsg;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

public interface ManufacturerMapper extends Mapper<Manufacturer> {
    public List<ManufacturerMsg> queryAllGroupByCity();
    public Integer queryManufacturerNumberByTimeInterval(String manufacturerName);
    public void insertBatch(List<Manufacturer> users);
}
