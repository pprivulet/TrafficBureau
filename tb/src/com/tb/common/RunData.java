package com.tb.common;

import java.io.Serializable;

@SuppressWarnings("serial")
public class RunData implements Serializable {

	private Integer id;
	private String loginName;
	private Integer userType;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getLoginName() {
		return loginName;
	}

	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}

	public Integer getUserType() {
		return userType;
	}

	public void setUserType(Integer userType) {
		this.userType = userType;
	}

}
