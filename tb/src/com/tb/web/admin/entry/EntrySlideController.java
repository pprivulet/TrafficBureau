package com.tb.web.admin.entry;

import java.io.IOException;
import java.io.PrintWriter;

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
@RequestMapping("/admin/entrySlide.html")
public class EntrySlideController {
	@Autowired
	private EntryService entryService;
	
	@Autowired
	private PhileService fileService;
	
	@RequestMapping(method=RequestMethod.POST)
	public ModelAndView entryDetailPage(HttpServletRequest request,HttpServletResponse response) throws IOException{
		int id = Integer.parseInt(request.getParameter("id"));
		int ctg = Integer.parseInt(request.getParameter("category"));
		//int pageNum = Integer.parseInt(request.getParameter("pageNum"));
		
		PrintWriter out = response.getWriter();		
		System.out.println(fileService.getTotalNum(ctg, 2));		
		if(fileService.getTotalNum(ctg, 2)<4){
			Entry entry = entryService.findById(id);
			entry.setStatus(2);		
			Phile file = fileService.findByEntryID(id);
			if(file != null){			
				file.setStatus(2);
				fileService.update(file);
			}				
			entryService.updateEntry(entry);
			out.write("pass");			
		}else{
			out.write("forbbiden");
		}			
		return null;	
		//return new ModelAndView("redirect:/admin/entry.html?category="+ctg+"&pageNum="+pageNum);
	}
}