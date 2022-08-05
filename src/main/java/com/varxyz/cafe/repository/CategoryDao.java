package com.varxyz.cafe.repository;

import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

import com.varxyz.cafe.domain.Category;
import com.varxyz.cafe.domain.MenuItem;

@Component("categoryDao")
public class CategoryDao {
	private JdbcTemplate jdbcTemplate;
	
	@Autowired
	public CategoryDao(DataSource dataSource) {
		jdbcTemplate = new JdbcTemplate(dataSource);
	}
	
	public List<Category> findCategorys() {	
		String sql = "SELECT cid, cname FROM Category";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper<Category>(Category.class){
		});
	}
	
}
