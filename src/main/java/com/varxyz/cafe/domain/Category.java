package com.varxyz.cafe.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Category {
	private String cid;
	private String name;
	
	public Category() {
		
	}
	
	public Category(String cid) {
		this.cid = cid;
	}
}
