package com.zzu.zjh.controller;

import com.zzu.zjh.entity.Cargo;
import com.zzu.zjh.entity.CargoDto;
import com.zzu.zjh.service.CargoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;

@RestController
@RequestMapping("cargo")
public class CargoController {
    @Autowired
    private CargoService cargoService;

    @RequestMapping("allCargos")
    public List<Cargo> allBanners() {
        return cargoService.getAllCargos();
    }

    @RequestMapping("allCargosThisPage")
    public CargoDto allBannersThisPage(Integer page, Integer rows) {
        return cargoService.getCargosByPage(page, rows);
    }

    @RequestMapping("editCargo")
    public void editBanner(Cargo cargo) {
        cargoService.changeCargo(cargo);
    }

    @RequestMapping("removeCargo")
    public void removeBanner(Integer id) {
        cargoService.deleteCargo(id);
    }

    @RequestMapping(value = "addCargo", method = RequestMethod.POST)
    public void addCargo(Cargo cargo, @RequestParam("file") MultipartFile file) throws IOException {
        File file1 = new File(System.getProperty("user.dir") + "/src/main/webapp/images/cargos/" + file.getOriginalFilename());
        //System.out.println(file1);
        String path = "images/cargos/" + file.getOriginalFilename();
        // System.out.println(path);
        cargo.setCargoImgpath(path);
        cargo.setCargoDate(new Date());
        cargo.setCargoStatus(1);
        cargoService.increaseCargo(cargo);
        file.transferTo(file1);
    }
}
