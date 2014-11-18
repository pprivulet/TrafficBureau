package com.tb.web.admin.entry;

import java.io.IOException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;

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
@RequestMapping("/admin/entryUnslide.html")
public class EntryUnslideController {
	
	@Autowired
	private EntryService entryService;
	
	@Autowired
	private PhileService fileService;
	
	@RequestMapping(method=RequestMethod.GET)
	public ModelAndView entryDetailPage(HttpServletRequest request,HttpServletResponse response) throws IOException{
		int id = Integer.parseInt(request.getParameter("id"));
		int ctg = Integer.parseInt(request.getParameter("category"));
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));
		Entry entry = entryService.findById(id);
		entry.setStatus(1);				
		entry.setPublishDate(null);		
		entryService.updateEntry(entry);
		Phile file = fileService.findByEntryID(id);
		if(file != null){
			file.setStatus(1);
			fileService.update(file);
		}			
		file = fileService.findByEntryID(id);
		System.out.println(file);		
		return new ModelAndView("redirect:/admin/entry.html?category="+ctg+"&pageNum="+pageNum);
	}
}
