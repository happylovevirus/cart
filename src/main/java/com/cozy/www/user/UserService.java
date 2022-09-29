package com.cozy.www.user;

import java.util.List;

public interface UserService {
	public List<UserVO> list();
	public int insert(UserVO vo);
	public int login(UserVO vo) throws Exception;
}
