package com.zzu.zjh.service;

import com.zzu.zjh.entity.Menu;

import java.util.List;

public interface MenuService {
    public List<Menu> getAllMenus(Integer parent_id);
}
