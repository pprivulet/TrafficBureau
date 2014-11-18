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

import com.tb.domain.VoteTheme;
import com.tb.service.VoteThemeService;

@Controller
@RequestMapping("/admin/voteThemeClose.html")
public class VoteThemeCloseController {
	@Autowired
	private VoteThemeService voteThemeService;

	@RequestMapping(method = RequestMethod.POST)
	public ModelAndView doPost(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		System.out.println(id);
		PrintWriter out = response.getWriter();
		System.out.println(voteThemeService.getPublishedVoteTheme());
		VoteTheme voteTheme = voteThemeService.findById(id);
		if(voteTheme.getStatus()==2){
			out.write("already");
			return null;
		}
		voteTheme.setStatus(2);
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Timestamp now = new Timestamp(System.currentTimeMillis());
		String closeDate = df.format(now);
		voteTheme.setClosed(closeDate);;
		voteThemeService.updateVoteTheme(voteTheme);
		out.write("pass");

		return null;
	}
}
