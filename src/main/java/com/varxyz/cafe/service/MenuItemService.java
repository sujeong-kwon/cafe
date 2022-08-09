package com.varxyz.cafe.service;

import java.util.List;

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
	
	public List<MenuItem> getMenuItems() {	
		return menuItemDao.findMenuItems();
	}

	public List<MenuItem> getMenuItemsByCid(long cid) {	
		return menuItemDao.findMenuItemsByCid(cid);
	}

	public MenuItem getMenuItemByMid(long mid) {
		return menuItemDao.findMenuItemByMid(mid);
	}

	public void updateStock(MenuItem menuitem) {
		menuItemDao.updateStock(menuitem);
		
	}
}
