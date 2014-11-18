package com.tb.web;

import java.io.IOException;
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
@RequestMapping("/votedResult.html")
public class VotedResultController {
	@Autowired
	private VoteThemeService voteThemeService;
	
	@Autowired
	private VoteQuizService voteQuizService;
	
	@Autowired
	private VoteOptionService voteOptionService;
	
	private int sumThemeVote(int option, int themeId){
		int sum = 0;
		List<VoteOption> voteOptionList = voteOptionService.getVoteOptionListByThemeId(themeId, option);				
		for(VoteOption voteOption: voteOptionList){			
			System.out.println(option);
			if(voteOption.getIndex()==option){
				sum += voteOption.getVote();
			}		
		}	
		return sum;
	}
	
	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView showVoteResult(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		System.out.println(1111111);
		int themeId = Integer.parseInt(request.getParameter("themeId"));
		VoteTheme voteTheme = voteThemeService.findById(themeId);
		List<VoteQuiz> voteQuizList = voteQuizService.getVoteQuizListByThemeId(themeId);	
		int option1 = 1, option2 = 2, option3 = 3, option4 = 4;
		int sumTheme1, sumTheme2, sumTheme3, sumTheme4 =0;
		System.out.println(1111111);
		sumTheme1 = sumThemeVote(option1, themeId);
		sumTheme2 = sumThemeVote(option2, themeId);
		sumTheme3 = sumThemeVote(option3, themeId);
		sumTheme4 = sumThemeVote(option4, themeId);
		System.out.println(sumTheme1);
		System.out.println(sumTheme2);
		System.out.println(sumTheme3);
		System.out.println(sumTheme4);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("themeId", themeId);
		map.put("nice", sumTheme1);
		map.put("good", sumTheme2);
		map.put("ok", sumTheme3);
		map.put("bad", sumTheme4);
		map.put("voteTheme", voteTheme);
		
		map.put("voteQuizList", voteQuizList);
		
		return new ModelAndView("votedResult", map);
		
		
	}
}
