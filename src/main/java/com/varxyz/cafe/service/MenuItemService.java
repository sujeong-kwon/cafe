package com.varxyz.cafe.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.varxyz.cafe.domain.MenuItem;
import com.varxyz.cafe.repository.MenuItemDao;
import com.varxyz.cafe.web.MenuItemCommand;

@Service
public class MenuItemService {
	
	@Autowired
	private MenuItemDao menuItemDao;
	
	public void addMenuItem(MenuItemCommand menuitem) {
		menuItemDao.addMenuItem(menuitem);
	}
}
