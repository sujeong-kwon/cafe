package com.varxyz.cafe.domain;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Category {
	private long cid;
	private char ctype;
	
	public Category() {
		
	}
	
	public Category(long cid) {
		this.cid = cid;
	}
}
