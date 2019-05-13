package com.zzu.zjh.entity;

import cn.afterturn.easypoi.excel.annotation.Excel;
import cn.afterturn.easypoi.excel.annotation.ExcelTarget;
import com.alibaba.fastjson.annotation.JSONField;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;
import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "cargo")
@ExcelTarget(value = "ID")
public class Cargo implements Serializable {
    @Id
    @Excel(name = "货物编号", needMerge = true)
    private Integer cargoId;
    @Excel(name = "货物名称", needMerge = true)
    private String cargoName;
    @Excel(name = "货物进价", needMerge = true)
    private Double cargoPprice;
    @Excel(name = "货物售价", needMerge = true)
    private Double cargoSprice;
    @Excel(name = "货物状态", needMerge = true)
    private Integer cargoStatus;
    @Excel(name = "货物图片", needMerge = true,type = 2,width = 40,height = 40)
    private String cargoImgpath;
    @Excel(name = "货物数量", needMerge = true)
    private Integer cargoNumber;
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @JSONField(format = "yyyy-MM-dd HH:mm:ss")
    @Excel(name = "货物时间", needMerge = true,width = 20,databaseFormat = "yyyyMMddHHmmss",format = "yyyy-MM-dd")
    private Date cargoDate;
    @Excel(name = "货物详情", needMerge = true)
    private String cargoDes;
}
