package com.zzu.zjh.realmobject;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import tk.mybatis.mapper.annotation.KeySql;

import javax.persistence.Table;


@Data
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "role")
public class Role {
    @KeySql(useGeneratedKeys = true)
    private Integer id;
    private String username;
    private String roles;
}
