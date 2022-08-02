package com.varxyz.cafe.repository;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

import com.varxyz.cafe.domain.MenuItem;
import com.varxyz.cafe.web.MenuItemCommand;

@Component("menuItemDao")
public class MenuItemDao {
	private JdbcTemplate jdbcTemplate;
	
	@Autowired
	public MenuItemDao(DataSource dataSource) {
		jdbcTemplate = new JdbcTemplate(dataSource);
	}
	
	public void addMenuItem(MenuItemCommand menuitem) {
		String sql = "INSERT INTO MenuItem (name, price, stock, cateCode)"
				+ " VALUES (?, ?, ?, ?)";
		jdbcTemplate.update(sql, menuitem.getName(), menuitem.getPrice(),
				menuitem.getStock(), menuitem.getCategory().getCateCode());
		System.out.println("inserted");
	}
}
