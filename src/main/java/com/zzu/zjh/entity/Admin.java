package com.zzu.zjh.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;
@Data
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "admin")
public class Admin implements Serializable {
    @Id
    private Integer id;
    private String name;
    private String password;
}
