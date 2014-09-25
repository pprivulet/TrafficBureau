package com.tb.test;

import com.tb.domain.Entry;
import com.tb.domain.User;
import com.tb.service.EntryService;
import com.tb.service.UserService;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Driver {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		ApplicationContext context=
				new ClassPathXmlApplicationContext("config/spring/applicationContext.xml");		
		User user = new User();		
		user.setLoginName("tsarii");
		user.setLoginPassword("123456");
		user.setStatus(0);
		user.setType(1);	
		
		SimpleDateFormat sdf = 
			     new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		
		String currentTime = sdf.format(new Date());
		user.setCreateDate(currentTime);		
		UserService us = (UserService) context.getBean("userService");	
		//us.insert(user);
		user = us.findUserByLoginName("tsari");
		System.out.println(user.getLoginName());
		System.out.println(user.getLoginPassword());
		System.out.println(user.getCreateDate());
		
		
		EntryService  es = (EntryService)context.getBean("entryService");
		Entry entry = es.findById(2);
		System.out.println(entry.getTitle());
		System.out.println(entry.getContent());
		System.out.println(entry.getCreateDate());
		
		
	}

}
