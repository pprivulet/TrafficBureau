package com.tb.web.admin.mail;

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
import com.tb.service.MailPagingService;
import com.tb.service.MailService;
import com.tb.service.impl.MailServiceImpl;

@Controller
@RequestMapping("/admin/maillist.html")
public class MailListController {

	@Autowired
	private MailService mailService;

	@Autowired
	private MailPagingService mailPagingService;

	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView showAnnoucementPage(HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		int category = Integer.parseInt(request.getParameter("category"));
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));
		

		mailPagingService.setCurrentPage(pageNum);
		mailPagingService.setPageSize(17);
		mailPagingService.setPageDelta(4);
		mailPagingService.setCurrentPage(pageNum);

		int pageCount = mailPagingService.getPageCount(category);
		if (pageNum - 1 > pageCount || pageNum < 1) {
			return new ModelAndView("error");
		}

		int pageBegin = mailPagingService.getFirstLinkedPage();
		int pageLast = mailPagingService.getLastLinkedPage();
		ArrayList<Mail> mailList = new ArrayList<Mail>();

		mailList = (ArrayList<Mail>) mailPagingService.getList(category); //

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("mails", mailList);
		// map.put("idx", category);
		map.put("pageSize", mailList.size());
		map.put("pageCount", pageCount);
		map.put("currentPage", pageNum);
		map.put("pageBegin", pageBegin);
		map.put("pageLast", pageLast);
		// return new ModelAndView("admin/entry", map);

		return new ModelAndView("admin/mailList", map);
	}
}