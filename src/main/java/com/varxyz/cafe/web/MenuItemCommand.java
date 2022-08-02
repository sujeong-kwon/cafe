package com.varxyz.cafe.web;

import org.springframework.web.multipart.MultipartFile;

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
	private MultipartFile imgFile;
}
