package com.varxyz.cafe.web;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CartCommand {
	private long cartId;
    private int amount;
    private long menuItemId;
    private String mname;
	private double price;
	private int stock;
	private long categoryId;
	
    public int plus(int plus){
    	System.out.println("amount : "+amount);
    	System.out.println("plus : "+plus);
		return amount = amount + plus;
    }
 
}
