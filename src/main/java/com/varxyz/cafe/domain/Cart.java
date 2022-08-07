package com.varxyz.cafe.domain;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Cart {
	private long cartId;
	private int amount;
	private long menuItemId;
	private MenuItem menuitem;
}
