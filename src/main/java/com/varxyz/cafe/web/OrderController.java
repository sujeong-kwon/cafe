package com.varxyz.cafe.web;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.varxyz.cafe.domain.Category;
import com.varxyz.cafe.domain.MenuItem;
import com.varxyz.cafe.service.CategoryService;
import com.varxyz.cafe.service.MenuItemService;

@Controller
public class OrderController {
	
	@Autowired
	private MenuItemService menuItemService;
	@Autowired
	private CategoryService categoryService;

	@GetMapping("/order")
	public ModelAndView orderCategoryForm(ModelAndView mav, HttpServletRequest request) {
		String mid = request.getParameter("mid");
		long mid_long = Long.parseLong(mid);
		System.out.println(mid_long);
		
		List<MenuItem> menuitem = new ArrayList<MenuItem>();
		menuitem = menuItemService.getMenuItemsByCid(mid_long);
		mav.addObject("menuitem", menuitem);
		mav.setViewName("customer/cart");
		return mav;
	}
	
	@GetMapping("/order/category/menu")
	public ModelAndView orderMenuItemForm(ModelAndView mav, HttpServletRequest request) {
		List<Category> category = new ArrayList<Category>();
		category = categoryService.getCategorys();
		mav.addObject("category", category);
		String cid = request.getParameter("cid");
		long cid_long = Long.parseLong(cid);
		System.out.println(cid_long);
//		List<MenuItem> menuitem = new ArrayList<MenuItem>();
//		menuitem = menuItemService.getMenuItemsByCid(cid_long);
//		mav.addObject("menuitem", menuitem);
		String mid = request.getParameter("mid");
		long mid_long = Long.parseLong(mid);
		System.out.println(mid_long);
		MenuItem menuitem_modal = new MenuItem();
		menuitem_modal = menuItemService.getMenuItemByMid(mid_long);
		System.out.println(menuitem_modal.getMname());
		
		mav.addObject("menuitem_modal", menuitem_modal);
		mav.setViewName("home");
		return mav;
	}
}
