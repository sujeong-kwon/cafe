package com.varxyz.cafe.web;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.varxyz.cafe.domain.Category;

@Controller
@RequestMapping("/admin/add_menuitem")
public class AddMenuItemController {
	
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
	public String addMenuItem(@ModelAttribute("menuitem") MenuItemCommand menuitem, Model model) {
		char cType = menuitem.getCategory().getCtype();
		menuitem.setCategory(new Category());
		
		model.addAttribute("menuitem", menuitem);
		return "admin/success_add_menuitem";
	}
}
