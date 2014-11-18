package com.tb.web.admin.vote;

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

import com.tb.domain.VoteQuiz;
import com.tb.service.VoteOptionService;
import com.tb.service.VoteQuizService;

@Controller
@RequestMapping("/admin/voteQuizDelete.html")
public class VoteQuizDeleteController {
	@Autowired
	private VoteQuizService voteQuizService;
	
	@Autowired
	private VoteOptionService voteOptionService;
	
	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView doGet(HttpServletRequest request,
			HttpServletResponse response) throws IOException {		
		int id = Integer.parseInt(request.getParameter("id"));
		int themeId = voteQuizService.findById(id).getVoteThemeId();
		voteOptionService.deleteByQuizId(id);
		voteQuizService.deleteById(id);			
		return new ModelAndView("redirect:/admin/voteDetail.html?id="+themeId);
	}
}
