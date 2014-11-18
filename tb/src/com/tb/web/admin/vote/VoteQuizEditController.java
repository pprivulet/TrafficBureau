package com.tb.web.admin.vote;

import java.io.IOException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
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

import com.tb.domain.VoteQuiz;
import com.tb.service.VoteQuizService;

@Controller
@RequestMapping("/admin/voteQuizEdit.html")
public class VoteQuizEditController {
	@Autowired
	private VoteQuizService voteQuizService;
	
	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView doGet(HttpServletRequest request,
			HttpServletResponse response) throws IOException {		
		int id = Integer.parseInt(request.getParameter("id"));		
		VoteQuiz voteQuiz = voteQuizService.findById(id);			
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("idx", 48);
		map.put("voteQuiz", voteQuiz);
		//map.put("voteQuizList", voteQuizList);
		return new ModelAndView("admin/voteQuizEdit", map);
	}
	
	@RequestMapping(method = RequestMethod.POST)
	public ModelAndView quizSavePage(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		//int themeId = Integer.parseInt(request.getParameter("themeId"));
		VoteQuiz voteQuiz  = buildObject(request);
		voteQuizService.updateVoteQuiz(voteQuiz);
		return new ModelAndView(
				"redirect:/admin/voteDetail.html?id="+voteQuiz.getVoteThemeId());
	}

	private VoteQuiz buildObject(HttpServletRequest request) {
		String category = request.getParameter("entryCategory");
		
		String content = request.getParameter("quiz");
		int id = Integer.parseInt(request.getParameter("quizId"));
		if (content != null) {
			if (content.trim().length() > 128) {
				content = content.substring(0, 127);
			}
		}

		VoteQuiz voteQuiz = voteQuizService.findById(id);
		//voteQuiz.setVoteThemeId(themeId);
		
		voteQuiz.setContent(null == content || "".equals(content.trim()) ? null
						: content.trim());
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Timestamp now = new Timestamp(System.currentTimeMillis());
		String createDate = df.format(now);
		voteQuiz.setUpdated(createDate);	

		return voteQuiz;
	}
}
