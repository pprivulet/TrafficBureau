package com.tb.web.admin.message;

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

import com.tb.domain.Mail;
import com.tb.domain.Message;
import com.tb.service.MessagePagingService;
import com.tb.service.MessageService;

@Controller
@RequestMapping("/admin/message.html")
public class MessageController {
	
	@Autowired
	private MessageService messageService;

	@Autowired
	private MessagePagingService messagePagingService;

	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView doGet(HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		int category = Integer.parseInt(request.getParameter("category"));
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));
		

		messagePagingService.setCurrentPage(pageNum);
		messagePagingService.setPageSize(17);
		messagePagingService.setPageDelta(4);
		messagePagingService.setCurrentPage(pageNum);

		int pageCount = messagePagingService.getPageCount(category);
		if (pageNum - 1 > pageCount || pageNum < 1) {
			return new ModelAndView("error");
		}

		int pageBegin = messagePagingService.getFirstLinkedPage();
		int pageLast = messagePagingService.getLastLinkedPage();
		ArrayList<Message> messageList = new ArrayList<Message>();

		messageList = (ArrayList<Message>) messagePagingService.getList(category); //

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("messages", messageList);
		map.put("idx", category);
		map.put("pageSize", messageList.size());
		map.put("pageCount", pageCount);
		map.put("currentPage", pageNum);
		map.put("pageBegin", pageBegin);
		map.put("pageLast", pageLast);
		// return new ModelAndView("admin/entry", map);

		return new ModelAndView("admin/message", map);
	}
}
