package com.varxyz.cafe.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.varxyz.cafe.domain.Category;
import com.varxyz.cafe.repository.CategoryDao;

@Service
public class CategoryService {
	
	@Autowired
	private CategoryDao categoryDao;
	
	public List<Category> getCategorys(){
		return categoryDao.findCategorys();
	}
}
