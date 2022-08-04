package com.varxyz.cafe.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Category {
	private long cid;
	private String name;
	
	public Category() {
		
	}
	
	public Category(long cid) {
		this.cid = cid;
	}
}
