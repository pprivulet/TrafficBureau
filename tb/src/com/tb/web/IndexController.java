package com.tb.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.tb.service.UserService;
import com.tb.domain.User;

@Controller
@RequestMapping("/index.html")
public class IndexController {
	@Autowired
	private UserService userService;
		
	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView doGet(HttpServletRequest request,HttpServletResponse response){		
		User user = (User) userService.findUserByLoginName("tsari");	
		return new ModelAndView("home","user",user);		
	}
}

