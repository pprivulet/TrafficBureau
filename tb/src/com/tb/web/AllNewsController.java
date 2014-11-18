package com.tb.web;

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

import com.tb.service.EntryService;
import com.tb.service.PagingService;
import com.tb.common.Constant;
import com.tb.domain.Entry;


@Controller
@RequestMapping("/allnews.html")
public class AllNewsController {
	
	
	@Autowired
	private EntryService entryService;

	@Autowired
	private PagingService pagingService;

	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView doGet(HttpServletRequest request,
			HttpServletResponse response) {

		int category = Integer.parseInt(request.getParameter("category"));
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));

		pagingService.setCurrentPage(pageNum);
		pagingService.setPageSize(17);
		pagingService.setPageDelta(4);
		pagingService.setCurrentPage(pageNum);

		if (category > Constant.CTG_NUM || category < 1) {
			return new ModelAndView("error");
		}

		int pageCount = pagingService.getPageCount(category);
		if (pageNum - 1 > pageCount || pageNum < 1) {
			return new ModelAndView("error");
		}

		// int pageDelta = pagingService.getPageDelta();
		int pageBegin = pagingService.getFirstLinkedPage();
		int pageLast = pagingService.getLastLinkedPage();
		ArrayList<Entry> entryList = new ArrayList<Entry>();

		entryList = (ArrayList<Entry>) pagingService.getPublishedEntryList(category);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("entries", entryList);
		map.put("category", category);
		map.put("pageSize", entryList.size());
		map.put("pageCount", pageCount);
		map.put("currentPage", pageNum);
		map.put("pageBegin", pageBegin);
		map.put("pageLast", pageLast);
		return new ModelAndView("allnews", map);
	}
}