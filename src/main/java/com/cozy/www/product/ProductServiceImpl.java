package com.cozy.www.product;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("productService")
public class ProductServiceImpl implements ProductService{
	@Autowired
	private ProductDAO productDAO;
	
	@Override
	public List<ProductVO> getProductList(ProductVO vo) {
		return productDAO.getProductList(vo);
	}

	@Override
	public List<ProductVO> getProductListDiv1(ProductVO vo) {
		return productDAO.getProductListDiv1(vo);
	}

	@Override
	public List<ProductVO> getProductListPage(Paging paging) {
		// TODO Auto-generated method stub
		return productDAO.getProductListPage(paging);
	}

	@Override
	public ProductVO detail(int no) {
		return productDAO.detail(no);
	}
}
