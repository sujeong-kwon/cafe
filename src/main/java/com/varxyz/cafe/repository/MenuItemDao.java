package com.varxyz.cafe.repository;

import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
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
		String sql = "INSERT INTO MenuItem (mname, price, stock, categoryId, image_url)"
				+ " VALUES (?, ?, ?, ?, ?)";
		jdbcTemplate.update(sql, menuitem.getMname(), menuitem.getPrice(),
				menuitem.getStock(), menuitem.getCategory().getCid(), menuitem.getImage_url());
		System.out.println("inserted");
	}

	public List<MenuItem> findMenuItemsByCategoryId(long categoryId) {
		String sql = "SELECT c.cid, c.cname, m.mid, m.mname, m.price, m.stock, m.categoryId, m.image_url FROM Category c INNER JOIN MenuItem m ON c.cid = m.categoryId WHERE m.categoryId = ?";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper<MenuItem>(MenuItem.class){
		}, categoryId);
	}
}
