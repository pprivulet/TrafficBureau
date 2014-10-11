package com.tb.dao;

import com.tb.domain.User;

public interface UserDao {

	User findUserByLoginName(String loginName);
	
	Integer insertUser(User user);
	
}
