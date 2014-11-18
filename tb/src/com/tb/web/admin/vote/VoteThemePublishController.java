package com.tb.web.admin.vote;

import java.io.IOException;
import java.io.PrintWriter;
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
import com.tb.domain.VoteTheme;
import com.tb.service.VoteThemeService;

@Controller
@RequestMapping("/admin/voteThemePublish.html")
public class VoteThemePublishController {
	@Autowired
	private VoteThemeService voteThemeService;	
	
	@RequestMapping(method=RequestMethod.POST)
	public ModelAndView doPost(HttpServletRequest request,HttpServletResponse response) throws IOException{
		int id = Integer.parseInt(request.getParameter("id"));
		System.out.println(id);			
		PrintWriter out = response.getWriter();		
		System.out.println(voteThemeService.getPublishedVoteTheme());		
		if(voteThemeService.getPublishedVoteTheme()==null){
			VoteTheme voteTheme = voteThemeService.findById(id);
			voteTheme.setStatus(1);	
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			Timestamp now = new Timestamp(System.currentTimeMillis());
			String publishDate = df.format(now);
			voteTheme.setPublished(publishDate);
			voteThemeService.updateVoteTheme(voteTheme);
			out.write("pass");			
		}else{
			out.write("forbbiden");
		}			
		return null;		
	}
}
