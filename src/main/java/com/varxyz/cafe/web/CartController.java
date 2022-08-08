package com.varxyz.cafe.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.varxyz.cafe.domain.Cart;
import com.varxyz.cafe.domain.MenuItem;
import com.varxyz.cafe.service.CartService;
import com.varxyz.cafe.service.CategoryService;
import com.varxyz.cafe.service.MenuItemService;

@Controller
public class CartController {
	
	@Autowired
	private MenuItemService menuItemService;
	@Autowired
	private CartService cartService;

	@GetMapping("/cart")
	public ModelAndView orderCartForm(ModelAndView mav, HttpServletRequest request) {
		String mid = request.getParameter("mid");
		long mid_long = Long.parseLong(mid);
		
		MenuItem menuitem = new MenuItem();
		menuitem = menuItemService.getMenuItemByMid(mid_long);
		mav.addObject("menuitem", menuitem);
		mav.setViewName("customer/cart");
		return mav;
	}	
	
	@GetMapping("/cart/list")
	public ModelAndView orderCartList(@ModelAttribute("cart") CartCommand cart, @ModelAttribute("menuitem") MenuItemCommand menuitem, ModelAndView mav, HttpServletRequest request) {
		Map<String, Object> map = new HashMap<String, Object>();
		List<CartCommand> list = cartService.listCart();
		map.put("list", list);
		mav.addObject("map", map);
		mav.setViewName("customer/list_cart");
		return mav;
	}
	
	@PostMapping("/cart/insert")
	public String cartMenuItem(@ModelAttribute("cart") CartCommand cart, HttpServletRequest request, Model model) {
		String mid = request.getParameter("menuitemId");
		long mid_long = Long.parseLong(mid);
//		String amount = request.getParameter("amount");
//		int amount_int = Integer.parseInt(amount);
		Cart cart = new Cart();
		
		cart.setMenuItemId(mid_long);
		int count = cartService.countCart(mid_long);
		if(count == 0) {
			cart = cartService.insertCart(cart);
		}else {
			System.out.println(cart.getAmount());
			int amount_result = cart.plus(cart.getAmount());
			cart.setAmount(amount_result);
			cartService.updateCart(cart);
		}
		return "redirect:/";
	}
}
