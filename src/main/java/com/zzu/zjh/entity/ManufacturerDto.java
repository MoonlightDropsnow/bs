package com.zzu.zjh.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;
@Data
@AllArgsConstructor
@NoArgsConstructor
public class ManufacturerDto {
    private Integer total;
    private List<Manufacturer> rows;
}
