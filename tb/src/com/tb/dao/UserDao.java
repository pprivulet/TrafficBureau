package com.tb.dao;

import com.tb.domain.User;

public interface UserDao {

	User findUserByLoginName(String loginName);
	
	Integer insertUser(User user);
	
	Integer updateUser(User user);

	User findUserByID(int id);
	
}
