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
		String sql = "INSERT INTO MenuItem (mname, price, stock, categoryId, image)"
				+ " VALUES (?, ?, ?, ?, ?)";
		jdbcTemplate.update(sql, menuitem.getMname(), menuitem.getPrice(),
				menuitem.getStock(), menuitem.getCategoryId(), menuitem.getImage());
		System.out.println("inserted");
	}
	
	public List<MenuItem> findMenuItems() {
		String sql = "SELECT mid, mname, price, stock, categoryId, image FROM MenuItem";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper<MenuItem>(MenuItem.class){
		});
	}

	public List<MenuItem> findMenuItemsByCid(long cid) {
		String sql = "SELECT c.cid, c.cname, m.mid, m.mname, m.price, m.stock, m.categoryId, m.image FROM Category c INNER JOIN MenuItem m ON c.cid = m.categoryId WHERE c.cid = ?";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper<MenuItem>(MenuItem.class){
		}, cid);
	}

	public MenuItem findMenuItemByMid(long mid) {
		String sql = "SELECT mid, mname, price, stock, categoryId, image FROM MenuItem WHERE mid = ?";
		return jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<MenuItem>(MenuItem.class){
		}, mid);
	}

	public void updateStock(MenuItem menuitem) {
		String sql = "UPDATE MenuItem SET stock=? WHERE mid=?";
		Object[] args = null;
		menuitem.getStock();
		menuitem.getMid();
		args = new Object[] {
				menuitem.getStock(),
				menuitem.getMid()
		};
		jdbcTemplate.update(sql, args);
		System.out.println("updated");
	}
}
