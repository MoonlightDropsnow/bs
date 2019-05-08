package com.zzu.zjh.entity;

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
public class Cargo implements Serializable {
    @Id
    private Integer cargoId;
    private String cargoName;
    private Double cargoPprice;
    private Double cargoSprice;
    private Integer cargoStatus;
    private String cargoImgpath;
    private Integer cargoNumber;
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @JSONField(format = "yyyy-MM-dd HH:mm:ss")
    private Date cargoDate;
    private String cargoDes;
}
