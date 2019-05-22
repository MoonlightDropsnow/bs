package com.zzu.zjh.service;

import com.zzu.zjh.entity.Cargo;
import com.zzu.zjh.entity.CargoDto;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface CargoService {
    List<Cargo> getAllCargos();

    CargoDto getCargosByPage(int page, int rows);

    void changeCargo(Cargo cargo);

    void deleteCargo(Integer id);

    void increaseCargo(Cargo cargo);

    Map<String, Integer> dataOfCargo(List<Cargo> cargos);

}
