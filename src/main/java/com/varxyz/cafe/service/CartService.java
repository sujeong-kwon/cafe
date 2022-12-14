package com.varxyz.cafe.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.varxyz.cafe.domain.Cart;
import com.varxyz.cafe.repository.CartDao;
import com.varxyz.cafe.web.CartCommand;

@Service
public class CartService {
	
	@Autowired
	private CartDao cartDao;
	
	public Cart findCart(long mid_long) {
		return cartDao.findCart(mid_long);
	}
	
	// 장바구니 상품 확인
	public int countCart(long mid_long) {
		return cartDao.findCountCart(mid_long);
	}

	// 장바구니 추가
	public void insertCart(Cart cart) {
		cartDao.insertCart(cart);
	}
	
	// 장바구니 수량 변경
	public void updateCart(Cart cart) {
		cartDao.updateCountCart(cart);
		
	}

	public List<CartCommand> listCart() {
		return cartDao.listCart();
	}

	public long sumMoney() {
		return cartDao.sumMoney();
	}
}
