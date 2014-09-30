package com.tb.web.admin;

import java.io.IOException;
import java.io.PrintWriter;

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
@RequestMapping("/admin/login.html")
public class LoginController {

	@Autowired
	private UserService userService;

	@RequestMapping(method = RequestMethod.GET)
	public String showLoginPage(HttpServletRequest request,
			HttpServletResponse response) {
		return "admin/login";
	}

	@RequestMapping(method = RequestMethod.POST)
	public ModelAndView handlerLogin(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		String loginname = request.getParameter("username");
		String password = request.getParameter("password");		
		if (loginname != null && !"".equals(loginname.trim())
				&& password != null && !"".equals(password.trim())) {
			try {
				User user = userService.findUserByLoginName(loginname.trim());
				if (password.equals(user.getLoginPassword()))
					return new ModelAndView("redirect:/admin/entry.html?category=1&pageNum=1");
				else
					return new ModelAndView("redirect:/admin/login.html");
			} catch (Exception e) {
				return new ModelAndView("redirect:/admin/login.html");
			}
		} else {
			return new ModelAndView("redirect:/admin/login.html");
		}
	}

}
