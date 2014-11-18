package com.tb.web.admin.vote;

import java.io.IOException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
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

import com.tb.common.Constant;
import com.tb.domain.VoteOption;
import com.tb.domain.VoteQuiz;
import com.tb.domain.VoteTheme;
import com.tb.service.VoteOptionService;
import com.tb.service.VoteQuizService;
import com.tb.service.VoteThemeService;

@Controller
@RequestMapping("/admin/voteQuizAdd.html")
public class VoteQuizAddController {
	@Autowired
	private VoteThemeService voteThemeService;

	@Autowired
	private VoteQuizService voteQuizService;

	@Autowired
	VoteOptionService voteOptionService;
	
	private void autoCreateOptions(int themeId, int quizId){
		ArrayList<String> options = new ArrayList<String>();
		options.add("非常满意");
		options.add("满意");
		options.add("一般");
		options.add("不满意");
		VoteOption voteOption = new VoteOption();
		int i = 1;
		for(String option : options){
			voteOption.setIndex(i++);
			voteOption.setContent(option);
			voteOption.setVote(0);
			voteOption.setVoteQuizId(quizId);
			voteOption.setVoteThemeId(themeId);
			voteOptionService.insertVoteOption(voteOption);
			System.out.println(option);			
		}
		
	}
	
	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView voteQuizAdd(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		int themeId = Integer.parseInt(request.getParameter("themeId"));
				
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("themeId", themeId);
		map.put("idx",48);
		return new ModelAndView("admin/voteQuizAdd", map);
	}

	@RequestMapping(method = RequestMethod.POST)
	public ModelAndView quizSavePage(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		//int themeId = Integer.parseInt(request.getParameter("themeId"));
		VoteQuiz voteQuiz  = buildObject(request);
		int id = voteQuizService.insertVoteQuiz(voteQuiz);
		
		voteQuiz = voteQuizService.findById(id);
		
		autoCreateOptions(voteQuiz.getVoteThemeId(), voteQuiz.getId());
		
		return new ModelAndView(
				"redirect:/admin/voteDetail.html?id="+voteQuiz.getVoteThemeId());
	}

	private VoteQuiz buildObject(HttpServletRequest request) {
		String category = request.getParameter("entryCategory");
		String content = request.getParameter("quiz");
		int themeId = Integer.parseInt(request.getParameter("themeId"));
		if (content != null) {
			if (content.trim().length() > 128) {
				content = content.substring(0, 127);
			}
		}

		VoteQuiz voteQuiz = new VoteQuiz();
		voteQuiz.setVoteThemeId(themeId);
		
		voteQuiz.setContent(null == content || "".equals(content.trim()) ? null
						: content.trim());
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Timestamp now = new Timestamp(System.currentTimeMillis());
		String createDate = df.format(now);
		voteQuiz.setCreated(createDate);
		voteQuiz.setUpdated(createDate);			
		return voteQuiz;
	}

}
