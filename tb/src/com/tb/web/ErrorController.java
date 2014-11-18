package com.tb.web;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;



@Controller
@RequestMapping("/error.html")
public class ErrorController {
	@RequestMapping(method=RequestMethod.GET)
	public ModelAndView entryDetailPage(HttpServletRequest request,HttpServletResponse response) throws IOException{
		int errorCode = Integer.parseInt(request.getParameter("a"));
		
		Map<String, Object> map = new HashMap<String, Object>();
	
		map.put("errorCode", errorCode);		
		return new ModelAndView("error", map);
	}
}
