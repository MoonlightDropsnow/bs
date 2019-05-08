package com.zzu.zjh.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.util.List;
@Data
@AllArgsConstructor
@NoArgsConstructor
public class CargoDto implements Serializable {
    private Integer total;
    private List<Cargo> rows;
}
