package com.tb.web.admin.mail;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.tb.domain.Phile;
import com.tb.service.EntryService;
import com.tb.service.MailService;
import com.tb.service.PhileService;

@Controller
@RequestMapping("/admin/mailDelete.html")
public class MailDeleteController {
	@Autowired
	private MailService mailService;
	
	@Autowired
	private PhileService fileService;
	
	@RequestMapping(method=RequestMethod.GET)
	public ModelAndView entryDetailPage(HttpServletRequest request,HttpServletResponse response) throws IOException{
		int id = Integer.parseInt(request.getParameter("id"));
		//int ctg = Integer.parseInt(request.getParameter("category"));
		//Entry entry = new Entry();		
		mailService.deleteById(id);		
			
		return new ModelAndView("redirect:/admin/maillist.html?category=1&pageNum=1");
	}
}
