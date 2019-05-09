package com.zzu.zjh.entity;

import com.alibaba.fastjson.annotation.JSONField;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.Id;
import javax.persistence.Table;
import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "manufacturer")
public class Manufacturer {
    @Id
    private Integer manufacturerId;
    private String manufacturerName;
    private String manufacturerPhone;
    private String manufacturerAddress;
    private Integer cooperationTimes;
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @JSONField(format = "yyyy-MM-dd HH:mm:ss")
    private Date manufacturerDate;
}
