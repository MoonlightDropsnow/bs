package com.zzu.zjh.service;

import com.zzu.zjh.entity.Cargo;
import com.zzu.zjh.entity.CargoDto;

import java.util.List;

public interface CargoService {
    public List<Cargo> getAllCargos();
    public CargoDto getCargosByPage(int page, int rows);
    public void changeCargo(Cargo banner);
    public void deleteCargo(Integer id);
    public void increaseCargo(Cargo banner);
}
