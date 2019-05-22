package com.zzu.zjh.service;


import com.zzu.zjh.mapper.PermMapper;
import com.zzu.zjh.realmobject.Perm;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;


@Service
@Transactional
public class PermServiceImpl implements PermService {
    @Resource
    private PermMapper permMapper;
    @Override
    @Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
    public List<Perm> queryPermsByRole(String role) {
        Perm perm=new Perm();
        perm.setRole(role);
        List<Perm> permList=permMapper.select(perm);
        return permList;
    }
}
