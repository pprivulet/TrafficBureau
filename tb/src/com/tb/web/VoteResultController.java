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
@RequestMapping("/voteResult.html")
public class VoteResultController {
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
		int themeId = Integer.parseInt(request.getParameter("themeId"));
		VoteTheme voteTheme = voteThemeService.findById(themeId);
			
//		int quizListLength = quizList.size();		
//		for(int i=1;i<quizListLength+1;i++){
//			int option = Integer.parseInt(request.getParameter("quiz"+i));
//			List<VoteOption> voteOptionList = voteOptionService.getVoteOptionListByThemeId(themeId, option);
//			VoteQuiz voteQuiz = quizList.get(i-1);
//			System.out.println(voteQuiz.getId());
//			System.out.println(voteOptionList.get(i-1).getVoteQuizId());			
//			VoteOption voteOption = voteOptionList.get(i-1);			
//			voteOption.setVote(voteOption.getVote()+1);			
//		}		
		
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
		
		
		
		return new ModelAndView("voteResult", map);
		
		
	}
}
