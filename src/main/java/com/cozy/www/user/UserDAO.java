package com.cozy.www.user;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UserDAO {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public List<UserVO> list() {
		return sqlSessionTemplate.selectList("UserDAO.list");
	}
	
	public int insert(UserVO vo) {
		return sqlSessionTemplate.insert("UserDAO.insert", vo);
	}
	
	public int login(UserVO vo) throws Exception {
        return sqlSessionTemplate.selectOne("UserDAO.login", vo);
    }


}
