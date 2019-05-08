package com.zzu.zjh.service;

import com.github.pagehelper.PageHelper;
import com.zzu.zjh.entity.Cargo;
import com.zzu.zjh.entity.CargoDto;
import com.zzu.zjh.mapper.CargoMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class CargoServiceImpl implements CargoService {
    @Autowired
    private CargoMapper cargoMapper;
    @Transactional(propagation = Propagation.SUPPORTS)
    @Override
    public List<Cargo> getAllCargos() {
        return cargoMapper.selectAll();
    }

    @Override
    public CargoDto getCargosByPage(int page, int rows) {
        CargoDto cargoDto = new CargoDto();
        PageHelper.startPage(page,rows);
        List<Cargo> cargos = cargoMapper.selectAll();
        for (Cargo cargo : cargos) {
            System.out.println(cargo);
        }
        int total = cargoMapper.selectCount(new Cargo());
        cargoDto.setTotal(total);
        cargoDto.setRows(cargos);
        return cargoDto;
    }

    @Override
    public void changeCargo(Cargo cargo) {
        cargoMapper.updateByPrimaryKeySelective(cargo);
    }

    @Override
    public void deleteCargo(Integer id) {
        cargoMapper.deleteByPrimaryKey(id);
    }

    @Override
    public void increaseCargo(Cargo cargo) {
        cargoMapper.insert(cargo);
    }
}
