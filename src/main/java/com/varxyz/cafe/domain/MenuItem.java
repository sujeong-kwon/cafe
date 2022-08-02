package com.varxyz.cafe.domain;

import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MenuItem {
	private long mid;
	private String name;
	private double price;
	private int stock;
	private Category category;
	private MultipartFile imgFile;
}
