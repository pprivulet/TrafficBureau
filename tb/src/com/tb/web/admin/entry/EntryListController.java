package com.tb.web.admin.entry;

import java.io.IOException;
import java.io.PrintWriter;
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

import com.tb.domain.Entry;
import com.tb.service.EntryService;

@Controller
@RequestMapping("/admin/entry.html")
public class EntryListController {
	
	@Autowired
	private EntryService entryService;
	
	@RequestMapping(method=RequestMethod.GET)
	public ModelAndView entryListPage(HttpServletRequest request,HttpServletResponse response) throws IOException{
		int category = Integer.parseInt(request.getParameter("category"));
		ArrayList<Entry> entryList = new ArrayList<Entry>();
		entryList = (ArrayList<Entry>) entryService.getLastEntries();	
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("entries", entryList);		
		map.put("idx", category);
		return new ModelAndView("admin/entry", map);
	}
	
	
	/*
	private Map<String,Object> getParam(HttpServletRequest request){
		Map<String,Object> map = new HashMap<String,Object>();
		String pageIndex = request.getParameter("pageIndex");
		String sub = request.getParameter("sub");
		map.put("sub", sub==null||"".equals(sub.trim())?1:Integer.parseInt(sub));//新闻
		map.put("pageIndex", pageIndex==null||"".equals(pageIndex.trim())?1:Integer.parseInt(pageIndex));
		map.put("pageSize", 20);
		map.put("status", "1");//已发布的
		map.put("preferredOrder", "publish_date DESC");
		return map;
	}
	*/
	
}
