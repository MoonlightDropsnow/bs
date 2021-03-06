package com.zzu.zjh.service;

import com.github.pagehelper.PageHelper;
import com.zzu.zjh.entity.Cargo;
import com.zzu.zjh.entity.Manufacturer;
import com.zzu.zjh.entity.Operation;
import com.zzu.zjh.entity.OperationDto;
import com.zzu.zjh.mapper.CargoMapper;
import com.zzu.zjh.mapper.ManufacturerMapper;
import com.zzu.zjh.mapper.OperationMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

@Service
@Transactional
public class OperationServiceImpl implements OperationService {
    @Autowired
    OperationMapper operationMapper;
    @Autowired
    CargoMapper cargoMapper;
    @Autowired
    ManufacturerMapper manufacturerMapper;

    @Override
    public OperationDto getInOperationsByPage(int page, int rows) {
        return getOperationDtoByType(page, rows, 1);
    }

    @Override
    public OperationDto getOutOperationsByPage(int page, int rows) {
        return getOperationDtoByType(page, rows, -1);

    }

    public OperationDto getOperationDtoByType(int page, int rows, Integer type) {
        OperationDto operationDto = new OperationDto();
        PageHelper.startPage(page, rows);
        Operation operation = new Operation();
        if (type == 1) {
            operation.setOutNumber(0);
        } else if (type == -1) {
            operation.setInNumber(0);
        }
        List<Operation> operations = operationMapper.select(operation);
        int total = operationMapper.selectCount(new Operation());
        operationDto.setTotal(total);
        operationDto.setRows(operations);
        return operationDto;
    }

    @Override
    public String increaseOperation(Operation operation) {
        Cargo cargo = new Cargo();
        cargo.setCargoName(operation.getCargoName());
        cargo = cargoMapper.selectOne(cargo);
        if (cargo == null) {
            return "货物不存在，请先添加货物";
        } else {
            //manufacturer
            Manufacturer manufacturer = new Manufacturer();
            manufacturer.setManufacturerName(operation.getManufacturerName());
            if (operation.getManufacturerName() != null) {
                manufacturer = manufacturerMapper.selectOne(manufacturer);
                if(manufacturer==null){
                    return "厂家不存在，请先添加厂家";
                }
            }
            if (operation.getOutNumber() == null) {
                operation.setOutNumber(0);
                cargo.setCargoNumber(cargo.getCargoNumber() + operation.getInNumber());
                manufacturer.setCooperationTimes(manufacturer.getCooperationTimes() + 1);
                manufacturerMapper.updateByPrimaryKeySelective(manufacturer);
            } else {
                if (cargo.getCargoNumber() < operation.getOutNumber()) {
                    return "货物数量不足";
                }
                operation.setInNumber(0);
                cargo.setCargoNumber(cargo.getCargoNumber() - operation.getOutNumber());
            }
            cargoMapper.updateByPrimaryKeySelective(cargo);
            if(cargo.getCargoNumber()<=50){
                cargo.setCargoStatus(0);
            }else{
                cargo.setCargoStatus(1);
            }
            cargoMapper.updateByPrimaryKeySelective(cargo);
            operation.setOperationTime(new Date());
            operationMapper.insert(operation);
        }
        return "ok";
    }
}
