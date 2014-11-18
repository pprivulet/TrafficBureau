package com.tb.web;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;



@Controller
@RequestMapping("/sendMail.html")
public class SendEmailController {
	@RequestMapping(method = RequestMethod.POST)
	public ModelAndView handlerLogin(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		String city = request.getParameter("city");
		String place = request.getParameter("place");
		String road = request.getParameter("road");
		String area = request.getParameter("area");
		String job = request.getParameter("job");
		String title = request.getParameter("title");
		String type = request.getParameter("type");
		String content = request.getParameter("content");	
		PrintWriter out = response.getWriter();
		if (name != null && !"".equals(name.trim())
				&& phone != null && !"".equals(phone.trim())
				&& email != null && !"".equals(email.trim())
						&& area != null && !"".equals(area.trim())
						&& title != null && !"".equals(title.trim())
								&& content != null && !"".equals(content.trim())){
	        
			System.out.println(name);
			System.out.println(phone);
			System.out.println(email);
			System.out.println(city);
			System.out.println(place);
			System.out.println(road);
			System.out.println(area);
			System.out.println(job);
			System.out.println(title);
			System.out.println(type);
			System.out.println(content);		
			
			out.print("pass");
		} else {
			out.print("error");			
		}		
		return null;
	}
}
