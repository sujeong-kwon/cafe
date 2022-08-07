package com.varxyz.cafe.web;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import com.varxyz.cafe.domain.Category;
import com.varxyz.cafe.service.MenuItemService;

@Controller
@RequestMapping("/admin/add_menuitem")
public class AddMenuItemController {
	
	@Autowired
	private MenuItemService menuItemService;
	private FileOutputStream fos = null;
	
	@GetMapping
	public String addMenuItenForm(Model model) {
		model.addAttribute("menuitem", new MenuItemCommand());
		return "admin/add_menuitem";
	}
	
	@ModelAttribute("categoryProviderList")
	public List<CategoryProvider> getCategoryProviderList(){
		List<CategoryProvider> list = new ArrayList<CategoryProvider>();
		list.add(new CategoryProvider("커피", "1"));
		list.add(new CategoryProvider("음료", "2"));
		list.add(new CategoryProvider("빽스치노", "3"));
		
		return list;
	}
	
	@PostMapping
	public String addMenuItem(@ModelAttribute("menuitem") MenuItemCommand menuitem, HttpServletRequest request, Model model) throws Exception, IOException {
		String categoryId = request.getParameter("categoryId");
		long categoryId_long = Long.parseLong(categoryId);
//		menuitem.setCategory(new Category(categoryId));
		menuitem.setCategoryId(categoryId_long);
		System.out.println(menuitem.getMname());
		MultipartFile imgFile = menuitem.getImgFile();
		String uploadFileName = imgFile.getOriginalFilename();
		System.out.println(uploadFileName);
		UUID uuid = UUID.randomUUID();
		uploadFileName = uuid.toString() + "_" + uploadFileName;
//		String filePath = "C:\\ncs\\cafe\\cafe\\src\\main\\webapp\\resources\\img\\";
		String filePath = "C:\\back_work\\cafe\\src\\main\\webapp\\resources\\img\\";
		String fullPath = filePath + uploadFileName;
		System.out.println(fullPath);
		menuitem.getImgFile().transferTo(new File(fullPath));
		menuitem.setImage(uploadFileName);
		menuItemService.addMenuItem(menuitem);
		model.addAttribute("menuitem", menuitem);
		return "admin/success_add_menuitem";
	}
	
	@Bean
	public CommonsMultipartResolver multipartResolver() {
		CommonsMultipartResolver resolver = new CommonsMultipartResolver();
		resolver.setDefaultEncoding("utf-8");
		return resolver;
	}
}
