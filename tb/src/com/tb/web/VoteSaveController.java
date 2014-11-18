package com.tb.web;

import java.io.IOException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.tb.domain.VoteOption;
import com.tb.domain.VoteQuiz;
import com.tb.service.VoteOptionService;
import com.tb.service.VoteQuizService;
import com.tb.service.VoteThemeService;

@Controller
@RequestMapping("/voteSave.html")
public class VoteSaveController {
	
	@Autowired
	private VoteThemeService voteThemeService;
	
	@Autowired
	private VoteQuizService voteQuizService;
	
	@Autowired
	private VoteOptionService voteOptionService;
	
	@RequestMapping(method = RequestMethod.POST)
	public ModelAndView quizSavePage(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		int themeId = Integer.parseInt(request.getParameter("themeId"));
		List<VoteQuiz> quizList = voteQuizService.getVoteQuizListByThemeId(themeId);
		int quizListLength = quizList.size();		
		for(int i=1;i<quizListLength+1;i++){
			int option = Integer.parseInt(request.getParameter("quiz"+i));
			List<VoteOption> voteOptionList = voteOptionService.getVoteOptionListByThemeId(themeId, option);
			VoteQuiz voteQuiz = quizList.get(i-1);
			System.out.println(voteQuiz.getId());
			System.out.println(voteOptionList.get(i-1).getVoteQuizId());			
			VoteOption voteOption = voteOptionList.get(i-1);			
			voteOption.setVote(voteOption.getVote()+1);	
			voteOptionService.updateVoteOption(voteOption);
		}		
		return new ModelAndView("redirect:/voteResult.html?themeId="+themeId);
	}

	
	
}
