package com.tb.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;






import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.tb.service.EntryService;
import com.tb.service.PhileService;
import com.tb.domain.Entry;


@Controller
@RequestMapping("/news.html")
public class NewsController {
	
	
	@Autowired
	private EntryService entryService;
	
	@Autowired
	private PhileService fileService;
		
	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView doGet(HttpServletRequest request,HttpServletResponse response){		
		//User user = (User) userService.findUserByLoginName("tsari");
		
		List<Entry> newsList = entryService.getLastEntries(6, 1, -1); //6 news
		//System.out.println(newsList);		
		List<Entry> importantNewsList = entryService.getLastEntries(6, 1, 1);// 6 important news
		//System.out.println(importantNewsList);		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("newsList", newsList);
		map.put("importantNewsList", importantNewsList);		
		return new ModelAndView("news", map);		
	}
}