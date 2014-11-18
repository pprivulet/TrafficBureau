package com.tb.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.tb.domain.VoteTheme;
import com.tb.service.VoteThemePagingService;
import com.tb.service.VoteThemeService;

@Controller
@RequestMapping("/voted.html")
public class VoteClosedListController {
	@Autowired
	private VoteThemeService voteThemeService;

	@Autowired
	private VoteThemePagingService voteThemePagingService;

	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView doGet(HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		//int category = Integer.parseInt(request.getParameter("category"));
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));
		int status = 2;//closed

		voteThemePagingService.setCurrentPage(pageNum);
		voteThemePagingService.setPageSize(17);
		voteThemePagingService.setPageDelta(4);
		voteThemePagingService.setCurrentPage(pageNum);

		int pageCount = voteThemePagingService.getPageCount(status);
		if (pageNum - 1 > pageCount || pageNum < 1) {
			return new ModelAndView("error");
		}

		int pageBegin = voteThemePagingService.getFirstLinkedPage();
		int pageLast = voteThemePagingService.getLastLinkedPage();
		ArrayList<VoteTheme> voteThemeList = new ArrayList<VoteTheme>();

		voteThemeList = (ArrayList<VoteTheme>) voteThemePagingService.getClosedList(status); //

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("category", 1);
		map.put("voteThemes", voteThemeList);		
		map.put("pageSize", voteThemeList.size());
		map.put("pageCount", pageCount);
		map.put("currentPage", pageNum);
		map.put("pageBegin", pageBegin);
		map.put("pageLast", pageLast);
		
		
		
		// return new ModelAndView("admin/entry", map);

		return new ModelAndView("voted", map);
	}
}
