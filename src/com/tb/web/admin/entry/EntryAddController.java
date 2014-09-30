package com.tb.web.admin.entry;

import java.io.IOException;
import java.util.Date;
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
@RequestMapping("/admin/entryAdd.html")
public class EntryAddController {	
	
	
	@Autowired
	private EntryService entryService;
	
	@RequestMapping(method=RequestMethod.GET)
	public ModelAndView entryAddPage(HttpServletRequest request,HttpServletResponse response) throws IOException{
		int category = Integer.parseInt(request.getParameter("category"));
		if(category>10 && category<1){
			return new ModelAndView("error");
		}
		Map<String, Object> map = new HashMap<String, Object>();		
		map.put("idx", category);
		return new ModelAndView("admin/entryAdd", map);
	}
	
	@RequestMapping(method=RequestMethod.POST)
	public ModelAndView entrySavePage(HttpServletRequest request,HttpServletResponse response) throws IOException{
		Entry entry = buildObject(request);
		Integer id= entryService.insertEntry(entry);
		entry = entryService.findById(id);
		Map<String, Object> map = new HashMap<String, Object>();		
		map.put("idx", entry.getCategory()-1);
		map.put("entry", entry);
		//String path  = "redirect:/backend/editNews.html?id="+id;		
		return new ModelAndView("admin/entryDetail", map);
	}
	
	private Entry buildObject(HttpServletRequest request) {
		String category = request.getParameter("entryCategory");
		String title = request.getParameter("entryInputTitle");
		String content = request.getParameter("entryInputContent");
		String status = "0";//request.getParameter("status"); 
		
		Entry entry = new Entry();
		entry.setCategory((null == category  || "".equals(category.trim()) ? null : Integer.parseInt(category.trim())));
		entry.setTitle(null == title || "".equals(title.trim()) ? null : title.trim());
		entry.setStatus(null == status || "".equals(status.trim()) ? 0 : Integer.parseInt(status));
		entry.setContent(null == content || "".equals(content.trim()) ? null : content.trim());
		entry.setListOrder(0);		
		return entry;
	}
	
}