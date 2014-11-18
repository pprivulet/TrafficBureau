package com.tb.web.admin.entry;

import java.io.IOException;
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
import com.tb.domain.Phile;
import com.tb.service.EntryService;
import com.tb.service.PhileService;

@Controller
@RequestMapping("/admin/entryDelete.html")
public class EntryDeleteController {
	@Autowired
	private EntryService entryService;
	
	@Autowired
	private PhileService fileService;
	
	@RequestMapping(method=RequestMethod.GET)
	public ModelAndView entryDetailPage(HttpServletRequest request,HttpServletResponse response) throws IOException{
		int id = Integer.parseInt(request.getParameter("id"));
		int ctg = Integer.parseInt(request.getParameter("category"));
		//Entry entry = new Entry();		
		entryService.deleteById(id);		
		Phile file = fileService.findByEntryID(id);
		if (file != null)
			fileService.delete(file.getId());		
		return new ModelAndView("redirect:/admin/entry.html?category="+ctg+"&pageNum=1");
	}
}
