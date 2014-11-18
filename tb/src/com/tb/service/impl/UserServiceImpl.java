package com.tb.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tb.dao.UserDao;
import com.tb.domain.User;
import com.tb.service.UserService;

@Service("userService")
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDao userDao;
	
	@Override
	public User findUserByLoginName(String loginName) {
		return userDao.findUserByLoginName(loginName);
	}
	
	@Override
	public Integer insert(User user){
		return userDao.insertUser(user);
	}
	
	@Override
	public Integer update(User user){
		return userDao.updateUser(user);
	}
	
	@Override
	public User findUserByID(int id){
		return userDao.findUserByID(id);
	}
	
	
}
