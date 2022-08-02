package com.varxyz.cafe.web;

import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

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
		list.add(new CategoryProvider("커피", "C"));
		list.add(new CategoryProvider("음료", "D"));
		list.add(new CategoryProvider("빽스치노", "F"));
		
		return list;
	}
	
	@PostMapping
	public String addMenuItem(@ModelAttribute("menuitem") MenuItemCommand menuitem, Model model) throws Exception, IOException {
//		String cateCode = menuitem.getCategory().getCateCode();
//		menuitem.setCategory(new Category(cateCode));
		MultipartFile imgFile = menuitem.getImgFile();
		System.out.println(imgFile.getOriginalFilename());
		String filePath = "C:\\ncs\\cafe\\cafe\\src\\main\\webapp\\resources\\img";
		try {
			byte fileData[] = imgFile.getBytes();
			fos = new FileOutputStream(filePath + imgFile.getOriginalFilename());
			fos.write(fileData);
			System.out.println(fos);
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			if(fos != null) {
				fos.close();
			}
		}
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
