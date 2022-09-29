package com.cozy.www.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("userService")
public class UserServiceImpl implements UserService {
	@Autowired
	private UserDAO userDAO;
	
	@Override
	public List<UserVO> list() {
		return userDAO.list();
	}

	@Override
	public int insert(UserVO vo) {
		return userDAO.insert(vo);
	}
	@Override
    public int login(UserVO vo) 
    		throws Exception {
		 return userDAO.login(vo);
	}
}
