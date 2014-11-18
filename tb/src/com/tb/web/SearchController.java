package com.tb.web;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.tb.common.Constant;
import com.tb.domain.Entry;
import com.tb.service.EntryService;


@Controller
@RequestMapping("/search.html")
public class SearchController { 
	@Autowired
	private EntryService entryService;
	
	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView doGet(HttpServletRequest request,
			HttpServletResponse response) throws UnsupportedEncodingException {
		
		String title= new String(request.getParameter("key").getBytes("ISO-8859-1"), "UTF8");		
		System.out.println(title);
		if (title == null || title == "") {
			return new ModelAndView("redirect:home");
		}	
		ArrayList<Entry> entryList = new ArrayList<Entry>();
		entryList = (ArrayList<Entry>) entryService.searchEntries(title);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("entries", entryList);		
		return new ModelAndView("searchResult", map);
	}
	
	
}
