package com.zzu.zjh.service;


import com.zzu.zjh.realmobject.Perm;

import java.util.List;

public interface PermService {
    List<Perm> queryPermsByRole(String role);
}
