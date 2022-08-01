package com.varxyz.cafe.domain;

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
}
