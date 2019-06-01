package com.zzu.zjh.service;

import com.zzu.zjh.entity.Menu;
import com.zzu.zjh.mapper.MenuMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Service
@Transactional
public class MenuServiceImpl implements MenuService {
    @Autowired
    private MenuMapper menuMapper;

    @Override
    @Transactional(propagation = Propagation.SUPPORTS)
    public List<Menu> getAllMenus(Integer parent_id, String duty) {
        Menu menu = new Menu();
        if (parent_id == null) parent_id = 0;
        menu.setParentId(parent_id);
        List<Menu> allMenus = menuMapper.select(menu);
        if (duty.equals("all")) {
            return allMenus;
        } else if (duty.equals("in")) {
            menu.setMenuIn(1);
            List<Menu> inMenus = menuMapper.select(menu);
            return inMenus;
        } else {
            menu.setMenuOut(1);
            List<Menu> outMenus = menuMapper.select(menu);
            return outMenus;
        }
    }
}
