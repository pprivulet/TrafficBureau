package com.tb.service;

import com.tb.domain.User;

public interface UserService {
	User findUserByLoginName(String loginName);
	Integer insert(User user);
}
