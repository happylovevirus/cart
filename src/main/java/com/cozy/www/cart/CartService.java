package com.cozy.www.cart;

import java.util.List;

public interface CartService {
	
	//장바구니 목록
	List<CartVO> getCartList(CartVO vo);
	
	//장바구니 담기
	int insertCart(CartVO vo);

	//장바구니 개별 삭제
	int deleteCart(CartVO vo);
	
	//장바구니 전체 삭제
	int deleteAllCart(CartVO vo);
	
	//장바구니 수량 변경
	int updateCart(CartVO vo);
	
}
