package com.cozy.www.product;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ProductDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public List<ProductVO> getProductList(ProductVO vo) {
		return mybatis.selectList("ProductDAO.getProductList",vo);
	}
	public List<ProductVO> getProductListDiv1(ProductVO vo) {
		return mybatis.selectList("ProductDAO.getProductListDiv1",vo);
	}
	public List<ProductVO> getProductListPage(Paging paging) {
		return mybatis.selectList("ProductDAO.getProductListPage",paging);
	}
	
	public ProductVO detail(int no) {
		return mybatis.selectOne("ProductDAO.detail", no);
	}
}
