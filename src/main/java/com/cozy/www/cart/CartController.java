package com.cozy.www.cart;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("cart")
public class CartController {
	@Autowired
	private CartService cartService;

	// 장바구니 목록
	@RequestMapping("list")
	public String getBoardList(CartVO vo, Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		vo.setUid((String) session.getAttribute("uid"));
		model.addAttribute("cartList", cartService.getCartList(vo));
		return "cart/getCartList";
	}

	// 장바구니 담기
	@RequestMapping("{no}/{qty}")
	public String insertCart(@PathVariable int no, @PathVariable int qty, CartVO vo, Model model,
			HttpServletRequest request) {
		HttpSession session = request.getSession();
		System.out.println("CartController에서 세션(id) 가져오기 : " + session.getAttribute("uid"));
		vo.setUid((String) session.getAttribute("uid"));
		vo.setQty(qty);
		model.addAttribute("cartList", cartService.insertCart(vo));
		return "redirect:/cart/list";
	}

	// 장바구니 선택 삭제
	@RequestMapping("list/{cart_num}")
	public String deleteCart(@PathVariable int cart_num, CartVO vo, Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		vo.setUid((String) session.getAttribute("uid"));
		vo.setCart_num(cart_num);
		model.addAttribute("cartList", cartService.deleteCart(vo));
		return "redirect:/cart/list";
	}

	// 장바구니 전체 삭제
	@RequestMapping("list/deleteAll")
	public String deleteAllCart(CartVO vo, Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		vo.setUid((String) session.getAttribute("uid"));
		model.addAttribute("cartList", cartService.deleteAllCart(vo));
		return "redirect:/cart/list";
	}

	// 장바구니 수량 변경
	@RequestMapping("list/{cart_num}/{qty}")
	public String updateCart(@PathVariable int cart_num, @PathVariable int qty, CartVO vo, Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		vo.setUid((String) session.getAttribute("uid"));
		vo.setCart_num(cart_num);
		vo.setQty(qty);
		model.addAttribute("cartList", cartService.updateCart(vo));
		return "redirect:/cart/list";

	}
}
