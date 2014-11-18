package com.tb.dao.impl;

import org.springframework.stereotype.Repository;

import com.tb.dao.BaseDao;
import com.tb.dao.UserDao;
import com.tb.domain.User;

@Repository
public class UserDaoImpl extends BaseDao<User> implements UserDao {

	@Override
	protected Class getEntityClass() {
		return User.class;
	}

	@Override
	public User findUserByID(int id) {
		return super.findByOther("users.selectByPrimaryKey", id);
	}	
	
	@Override
	public User findUserByLoginName(String loginName) {
		return super.findByOther("users.findUserByLoginName", loginName);
	}	
	
	@Override
	public Integer insertUser(User user) {
		return super.insert("users.insert", user);
	}
	
	@Override
	public Integer updateUser(User user) {
		return super.update("users.updateByPrimaryKey", user);
	}
}