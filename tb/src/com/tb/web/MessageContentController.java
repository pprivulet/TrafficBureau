package com.tb.web;

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

import com.tb.domain.Entry;
import com.tb.domain.Message;
import com.tb.service.MessageService;


@Controller
@RequestMapping("/messageDetail.html")
public class MessageContentController {
	@Autowired
	private MessageService messageService;
	
	@RequestMapping(method=RequestMethod.GET)
	public ModelAndView entryDetailPage(HttpServletRequest request,HttpServletResponse response) throws IOException{
		int id = Integer.parseInt(request.getParameter("id"));
		Message message = new Message();
		message = (Message) messageService.findById(id);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("message", message);	
		map.put("category", 1);		
		return new ModelAndView("messageDetail", map);
	}
}
