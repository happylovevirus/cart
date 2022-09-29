package com.cozy.www.product;

import java.util.List;

public interface ProductService {
	List<ProductVO> getProductList(ProductVO vo);
	List<ProductVO> getProductListDiv1(ProductVO vo);
	List<ProductVO> getProductListPage(Paging paging);
	ProductVO detail(int no);
}
