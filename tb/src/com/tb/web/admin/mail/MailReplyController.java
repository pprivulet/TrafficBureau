package com.tb.web.admin.mail;

import java.io.IOException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;




import com.tb.domain.Mail;
import com.tb.service.MailService;


@Controller
@RequestMapping("/admin/mailReply.html")
public class MailReplyController {
	@Autowired
	private MailService mailService;
	

	
	@RequestMapping(method=RequestMethod.GET)
	public ModelAndView entryDetailPage(HttpServletRequest request,HttpServletResponse response) throws IOException{		
		int id = Integer.parseInt(request.getParameter("id"));
		//int ctg = Integer.parseInt(request.getParameter("category"));
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));
		Mail mail = mailService.findById(id);
		mail.setStatus(1);
		
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Timestamp now = new Timestamp(System.currentTimeMillis());
		String replied = df.format(now);	
		mail.setReplied(replied);
		mailService.updateMailStatus(mail);
		
		return new ModelAndView("redirect:/admin/maillist.html?category=1&pageNum="+pageNum);
	}
}
