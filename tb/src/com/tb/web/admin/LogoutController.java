package com.tb.web.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/admin/logout.html")
public class LogoutController {
	@RequestMapping(method = RequestMethod.GET)
	public String showAnnoucementPage(HttpServletRequest request,HttpServletResponse response){		
		return "admin/login";		
	}
}