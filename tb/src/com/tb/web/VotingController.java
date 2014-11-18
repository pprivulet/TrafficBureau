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

import com.tb.domain.VoteOption;
import com.tb.domain.VoteQuiz;
import com.tb.domain.VoteTheme;
import com.tb.service.VoteOptionService;
import com.tb.service.VoteQuizService;
import com.tb.service.VoteThemeService;

@Controller
@RequestMapping("/voting.html")
public class VotingController {
	@Autowired
	private VoteThemeService voteThemeService;
	
	@Autowired
	private VoteQuizService voteQuizService;
	
	@Autowired
	private VoteOptionService voteOptionService;

	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView doGet(HttpServletRequest request,
			HttpServletResponse response) {
			
		List<VoteQuiz> voteQuizList;
		List<VoteOption> voteOptionList;
		VoteTheme voteTheme = voteThemeService.getPublishedVoteTheme();
		if(voteTheme!=null){
			voteQuizList = voteQuizService.getVoteQuizListByThemeId(voteTheme.getId());
			voteOptionList = voteOptionService.getVoteOptionListByThemeId(voteTheme.getId(), -1);
		} else {
			voteQuizList = null;
			voteOptionList = null;
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		//map.put("idx", 48);
		map.put("voteTheme", voteTheme);
		map.put("voteQuizList", voteQuizList);
		
		System.out.println(voteQuizList);
		
		map.put("voteOptionList", voteOptionList);
		System.out.println(voteOptionList);
		
		return new ModelAndView("voting", map);
	}
}
