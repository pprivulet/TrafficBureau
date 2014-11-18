package com.tb.web.admin.vote;

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

import com.tb.common.Constant;
import com.tb.domain.VoteTheme;
import com.tb.domain.VoteQuiz;
import com.tb.service.VoteThemeService;
import com.tb.service.VoteQuizService;

@Controller
@RequestMapping("/admin/voteDetail.html")
public class VoteDetailController {
	@Autowired
	private VoteThemeService voteThemeService;
	@Autowired
	private VoteQuizService voteQuizService;
	
	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView doGet(HttpServletRequest request,
			HttpServletResponse response) throws IOException {		
		int id = Integer.parseInt(request.getParameter("id"));		
		VoteTheme voteTheme = voteThemeService.findById(id);
		
		List<VoteQuiz> voteQuizList = voteQuizService.getVoteQuizListByThemeId(voteTheme.getId());
		
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("idx", 48);
		map.put("voteTheme", voteTheme);
		map.put("voteQuizList", voteQuizList);
		return new ModelAndView("admin/voteQuizzes", map);
	}
}
