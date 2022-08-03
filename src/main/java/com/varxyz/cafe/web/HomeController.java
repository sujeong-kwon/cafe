package com.varxyz.cafe.web;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.varxyz.cafe.domain.MenuItem;
import com.varxyz.cafe.service.MenuItemService;

@Controller
@RequestMapping("/")
public class HomeController {
	
	@Autowired
	private MenuItemService menuItemService;
	
	long categoryId=1;
	
	@GetMapping
	public ModelAndView orderMenuItenForm(ModelAndView mav) {
		List<MenuItem> menuitem = new ArrayList<MenuItem>();
		menuitem = menuItemService.getMenuItemsByCategoryId(categoryId);
		mav.addObject("menuitem", menuitem);
		mav.setViewName("home");
		return mav;
	}
	
}
