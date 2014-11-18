package com.tb.web.admin.mail;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.tb.domain.Mail;
import com.tb.service.MailService;

@Controller
@RequestMapping("/admin/mailDetail.html")
public class MailDetailController {
	@Autowired
	private MailService mailService;
	
	@RequestMapping(method=RequestMethod.GET)
	public ModelAndView entryDetailPage(HttpServletRequest request,HttpServletResponse response) throws IOException{
		int id = Integer.parseInt(request.getParameter("id"));
		Mail mail = new Mail();
		mail = (Mail) mailService.findById(id);
		System.out.println(mail);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("mail", mail);			
		return new ModelAndView("admin/mailDetail", map);
	}
}
