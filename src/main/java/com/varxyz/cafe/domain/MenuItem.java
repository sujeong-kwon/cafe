package com.varxyz.cafe.domain;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
public class MenuItem {
	private long mid;
	private String mname;
	private double price;
	private int stock;
	private long categoryId;
	private long cid;
	private Category category;
	private MultipartFile imgFile;
	private String image;
}
