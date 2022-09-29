package com.cozy.www.cart;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("cartService")
public class CartServiceImpl implements CartService {
	@Autowired
	private CartDAO cartDAO;
	
	//장바구니 목록
	@Override
	public List<CartVO> getCartList(CartVO vo) {
		return cartDAO.getCartList(vo);
	}
	
	//장바구니 담기
	@Override
	public int insertCart(CartVO vo) {
		return cartDAO.insertCart(vo);
	}
	
	//장바구니 개별 삭제
	@Override
	public int deleteCart(CartVO vo) {
		return cartDAO.deleteCart(vo);
	}
	
	//장바구니 전체 삭제
	@Override
	public int deleteAllCart(CartVO vo) {
		return cartDAO.deleteAllCart(vo);
	}
	
	
	
	//장바구니 수정
	@Override
	public int updateCart(CartVO vo) {
		return cartDAO.updateCart(vo);
	}

}
