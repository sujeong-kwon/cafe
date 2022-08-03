package com.varxyz.cafe.web;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.varxyz.cafe.domain.Category;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
public class MenuItemCommand {
	private String mname;
	private double price;
	private int stock;
	private Category category;
	private MultipartFile imgFile;
	private String image_url;
}
