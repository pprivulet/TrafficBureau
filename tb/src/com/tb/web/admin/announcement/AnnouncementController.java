package com.tb.web.admin.announcement;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;



@Controller
@RequestMapping("/admin/announcement.html")
public class AnnouncementController {
	@RequestMapping(method = RequestMethod.GET)
	public String showAnnoucementPage(HttpServletRequest request,HttpServletResponse response){		
		return "admin/announcement";		
	}
}
