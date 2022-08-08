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
	
	public int plus(int plus){
    	System.out.println("amount : "+amount);
    	System.out.println("plus : "+plus);
		return amount += plus;
    }
}
