package com.zzu.zjh.controller;

import cn.afterturn.easypoi.excel.ExcelExportUtil;
import cn.afterturn.easypoi.excel.entity.ExportParams;
import com.alibaba.fastjson.JSON;
import com.zzu.zjh.entity.Cargo;
import com.zzu.zjh.entity.CargoDto;
import com.zzu.zjh.service.CargoService;
import io.goeasy.GoEasy;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.Date;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("cargo")
public class CargoController {
    @Autowired
    private CargoService cargoService;
    @Autowired
    private Environment env;

    @RequestMapping("allCargos")
    public List<Cargo> allCargos() {
        return cargoService.getAllCargos();
    }

    @RequestMapping("allCargosThisPage")
    public CargoDto allCargosThisPage(Integer page, Integer rows) {
        return cargoService.getCargosByPage(page, rows);
    }

    @RequestMapping("editCargo")
    public void editCargo(Cargo cargo) {
        cargoService.changeCargo(cargo);
    }

    @RequestMapping("removeCargo")
    public void removeCargo(Integer id) {
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
        cargo.setCargoNumber(0);
        cargoService.increaseCargo(cargo);
        file.transferTo(file1);
    }
    @RequestMapping("exportCargo")
    public void exportAlbum(HttpServletResponse response) {
        List<Cargo> cargos = cargoService.getAllCargos();
        for (Cargo cargo : cargos) {
            //String realPath = env.getProperty("file.real.path");
            String realPath = System.getProperty("user.dir");
            cargo.setCargoImgpath(realPath +"/src/main/webapp"+ File.separatorChar + cargo.getCargoImgpath());
            //System.out.println(cargo.getCargoImgpath());
        }
        Workbook workbook = ExcelExportUtil.exportExcel(new ExportParams("货物", "货物"), Cargo.class, cargos);
        try {
            String encode = URLEncoder.encode("货物数据.xls", "UTF-8");
            response.setHeader("content-disposition", "attachment;filename=" + encode);
            response.setContentType("application/vnd.ms-excel");
            workbook.write(response.getOutputStream());
        } catch (IOException e) {
            e.printStackTrace();
        }


    }
    @RequestMapping("allCargoNumbers")
    public Map<String, Integer> allCargoNumbers(){
        List<Cargo> cargos = cargoService.getAllCargos();
        return cargoService.dataOfCargo(cargos);}
    @RequestMapping("allCargoNumbers2")
    public void allCargoNumbersGo(){
        List<Cargo> cargos = cargoService.getAllCargos();
        GoEasy goEasy = new GoEasy("http://rest-hangzhou.goeasy.io", "BC-0e7e8c1d21b94a9b83a985ee2d60e8e0");
        goEasy.publish("goeasy", JSON.toJSONString(cargoService.dataOfCargo(cargos)) );
    }
}
