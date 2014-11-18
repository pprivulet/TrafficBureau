package com.tb.web.admin.message;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;


import com.tb.service.MessageService;


@Controller
@RequestMapping("/admin/messageDelete.html")
public class MessageDeleteController {
	@Autowired
	private MessageService messageService;
	
	
	
	@RequestMapping(method=RequestMethod.GET)
	public ModelAndView doGet(HttpServletRequest request,HttpServletResponse response) throws IOException{
		int id = Integer.parseInt(request.getParameter("id"));
		int ctg = Integer.parseInt(request.getParameter("category"));
		//Entry entry = new Entry();		
		messageService.deleteById(id);		
			
		return new ModelAndView("redirect:/admin/message.html?category=47&pageNum=1");
	}
}
