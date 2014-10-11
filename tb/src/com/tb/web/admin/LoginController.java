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

import com.tb.common.Constant;
import com.tb.service.UserService;
import com.tb.domain.User;
import com.tb.common.RunData;

@Controller
@RequestMapping("/login.html")
public class LoginController {

	@Autowired
	private UserService userService;

	@RequestMapping(method = RequestMethod.GET)
	public String showLoginPage(HttpServletRequest request,
			HttpServletResponse response) {
		return "login";
	}

	@RequestMapping(method = RequestMethod.POST)
	public ModelAndView handlerLogin(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		String loginname = request.getParameter("username");
		String password = request.getParameter("password");
		PrintWriter out = response.getWriter();
		if (loginname != null && !"".equals(loginname.trim())
				&& password != null && !"".equals(password.trim())) {
			try {
				User user = userService.findUserByLoginName(loginname.trim());
				if (password.equals(user.getLoginPassword())) {
					RunData runData = new RunData();
					runData.setId(user.getId());
					runData.setLoginName(user.getLoginName());
					runData.setUserType(user.getType());
					request.getSession().setAttribute(Constant.RUN_DATA,
							runData);
					out.print("tryAgain");
					out.flush();
				} else {
					out.print("notMatch");
					out.flush();
				}
			} catch (Exception e) {
				out.print("error");
				out.flush();
			}
		} else {
			out.print("illegal");
			out.flush();
		}
		return null;
	}

}
