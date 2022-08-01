package com.varxyz.cafe.web;

import com.varxyz.cafe.domain.Category;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MenuItemCommand {
	private String name;
	private double price;
	private int stock;
	private Category category;
}
