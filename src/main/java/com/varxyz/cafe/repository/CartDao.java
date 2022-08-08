package com.varxyz.cafe.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

import com.varxyz.cafe.domain.Cart;
import com.varxyz.cafe.domain.Category;
import com.varxyz.cafe.web.CartCommand;

@Component("cartDao")
public class CartDao {
	private JdbcTemplate jdbcTemplate;
	
	@Autowired
	public CartDao(DataSource dataSource) {
		jdbcTemplate = new JdbcTemplate(dataSource);
	}
	
	public CartCommand findCart(long mid_long) {
		String sql = "SELECT * FROM Cart menuItemId WHERE menuItemId=?";
		CartCommand cart = jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<CartCommand>(CartCommand.class){
		});
		return cart;
	}
	
	public int findCountCart(long mid_long) {
		String sql = "SELECT COUNT(*) FROM Cart menuItemId WHERE menuItemId=?";
		return jdbcTemplate.queryForObject(sql, Integer.class, mid_long);
	}

	public void insertCart(CartCommand cart) {
		String sql = "INSERT INTO Cart (amount, menuItemId)"
				+ " VALUES (?, ?)";
		jdbcTemplate.update(sql, cart.getAmount(), cart.getMenuItemId());
		System.out.println("inserted");
	}

	public void updateCountCart(CartCommand cart) {
		String sql = "UPDATE Cart SET amount=? WHERE menuItemId=?";
		Object[] args = null;
		cart.getAmount();
		cart.getMenuItemId();
		args = new Object[] {
				cart.getAmount(),
				cart.getMenuItemId()
		};
		jdbcTemplate.update(sql, args);
		System.out.println("updated");
	}

	public List<CartCommand> listCart() {
		String sql = "SELECT c.cartId, c.amount, c.menuItemId, m.mid, m.mname, m.price, m.stock, m.categoryId FROM Cart c INNER JOIN MenuItem m ON m.mid = c.menuItemId";
		List<CartCommand> cart = jdbcTemplate.query(sql, new BeanPropertyRowMapper<CartCommand>(CartCommand.class){
		});
		return cart;
	}

	public long sumMoney() {
		// TODO Auto-generated method stub
		return 0;
	}
}
