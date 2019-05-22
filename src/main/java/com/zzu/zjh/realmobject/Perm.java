package com.zzu.zjh.realmobject;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import tk.mybatis.mapper.annotation.KeySql;

import javax.persistence.Table;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "perm")
public class Perm {
    @KeySql(useGeneratedKeys = true)
    private Integer id;
    private String role;
    private String perm;
}
