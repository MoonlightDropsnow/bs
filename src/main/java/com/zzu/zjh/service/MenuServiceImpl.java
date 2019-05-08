package com.zzu.zjh.service;

import com.zzu.zjh.entity.Menu;
import com.zzu.zjh.mapper.MenuMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class MenuServiceImpl implements MenuService {
    @Autowired
    private MenuMapper menuMapper;
    @Override
    @Transactional(propagation = Propagation.SUPPORTS)
    public List<Menu> getAllMenus(Integer parent_id) {
        Menu menu = new Menu();
        if(parent_id==null)parent_id=0;
        menu.setParentId(parent_id);
        return menuMapper.select(menu);
    }
}
