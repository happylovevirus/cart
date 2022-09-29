package com.cozy.www.product;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("product")
public class ProductController {
	@Autowired
	private ProductService productService;
	
	@RequestMapping("list")
	public String getBoardList(ProductVO vo, Model model) {
		model.addAttribute("productList", productService.getProductList(vo));
		return "product/getProductList";
	}
	@RequestMapping("list/{div1}")
	public String getBoardList(@PathVariable String div1, ProductVO vo, Model model) {
		System.out.println("product/{div1} : "+div1);
		model.addAttribute("productList", productService.getProductListDiv1(vo));
		return "product/getProductList";
	}
	@RequestMapping("list/{div1}/{offset}")
	public String getBoardList(@PathVariable String div1, @PathVariable int offset, Paging paging,  Model model) {
		System.out.println("product/{div1}/{offset} : "+div1+"/"+offset);
		paging.setPage((int)Math.floor((offset/5)));
		paging.setNowPage(offset);
		paging.setOffset(6*(paging.getOffset()-1));
		model.addAttribute("productList", productService.getProductListPage(paging));
		return "product/getProductList";
	}
	
	@RequestMapping("productDetail/{no}")
	public String detail(Model model, @PathVariable("no") int no) {
		model.addAttribute("productDetail", productService.detail(no));
		return "product/productDetail";
	}
}
