package com.tb.web.admin.user;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;


import org.springframework.security.authentication.encoding.Md5PasswordEncoder;

import com.tb.common.Constant;
import com.tb.service.UserService;
import com.tb.domain.User;


@Controller
@RequestMapping("/admin/profile.html")
public class ProfileEditController {

	@Autowired
	private UserService userService;

	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView showLoginPage(HttpServletRequest request,
			HttpServletResponse response) {
		User user = userService.findUserByID(Constant.ADMINISTRATOR_ID);
		Map<String, Object> map = new HashMap<String, Object>();		
		map.put("user", user);
		return new ModelAndView("admin/profile", map);
	}

	@RequestMapping(method = RequestMethod.POST)
	public ModelAndView handlerLogin(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		String loginName = request.getParameter("loginname");
		String password1 = request.getParameter("password1");
		String password2 = request.getParameter("password2");
		PrintWriter out = response.getWriter();
		
		if (loginName != null && !"".equals(loginName.trim())
				&& password1 != null && !"".equals(password1)
				&& password2 != null && !"".equals(password2)){			
			if(!password1.equals(password2)){
				out.print("notMatch");
				return null;
			}
			try{
			Md5PasswordEncoder md5 = new Md5PasswordEncoder();         
	        md5.setEncodeHashAsBase64(false);   
	        String pwd = md5.encodePassword(password1, Constant.SALT);	        	        	        
	        User user = userService.findUserByID(Constant.ADMINISTRATOR_ID);
	        user.setLoginName(loginName.trim());
	        user.setLoginPassword(pwd);	       
	        userService.update(user);
	        out.print("pass");
	        //return null;
	        } catch (Exception e){
	        	out.print("error");
	        	//return null;
	        }
		} else {
			out.print("error");			
		}		
		return null;
	}
 
	
}
