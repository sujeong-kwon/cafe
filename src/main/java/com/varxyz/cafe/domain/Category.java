package com.varxyz.cafe.domain;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Category {
	private long cid;
	private String cateCode;
	
	public Category() {
		
	}
	
	public Category(String cateCode) {
		this.cateCode = cateCode;
	}
}
