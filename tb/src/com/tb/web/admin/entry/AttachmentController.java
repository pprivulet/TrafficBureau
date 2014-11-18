package com.tb.web.admin.entry;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/admin/ueditor/dialogs/attachment/attachment.html")
public class AttachmentController {
	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView doGet(HttpServletRequest request,HttpServletResponse response){	
		System.out.println("attachment");
		return new ModelAndView("attachment/attachment");		
	}
}
