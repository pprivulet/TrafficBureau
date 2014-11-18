package com.tb.web.admin.message;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.tb.domain.Message;
import com.tb.service.MessageService;

@Controller
@RequestMapping("/admin/messageReply.html")
public class MessageReplyController {
	@Autowired
	private MessageService messageService;

	@RequestMapping(method = RequestMethod.POST)
	public ModelAndView entryDetailPage(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		String reply = request.getParameter("reply");
		Message message = messageService.findById(id);
		message.setStatus(1);
		message.setReply(reply);

		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Timestamp now = new Timestamp(System.currentTimeMillis());
		String replied = df.format(now);
		message.setReplied(replied);
		messageService.updateMessageStatus(message);

		PrintWriter out = response.getWriter();
		out.print("pass");
		return null;
	}

}
