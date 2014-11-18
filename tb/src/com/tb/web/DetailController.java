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
import com.tb.service.EntryService;

@Controller
@RequestMapping("/detail.html")
public class DetailController {

	@Autowired
	private EntryService entryService;
	
	@RequestMapping(method=RequestMethod.GET)
	public ModelAndView entryDetailPage(HttpServletRequest request,HttpServletResponse response) throws IOException{
		int id = Integer.parseInt(request.getParameter("id"));
		Entry entry = new Entry();
		entry = (Entry) entryService.findById(id);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("entry", entry);	
		map.put("category", entry.getCategory());		
		return new ModelAndView("detail", map);
	}
}

