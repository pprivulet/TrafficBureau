package com.tb.web;

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

import com.tb.domain.Entry;
import com.tb.domain.Message;
import com.tb.domain.Phile;
import com.tb.service.EntryService;
import com.tb.service.MessageService;
import com.tb.service.PhileService;

@Controller
@RequestMapping("/messageboard.html")
public class MessageboardController {

	@Autowired
	private MessageService messageService;

	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView doGet(HttpServletRequest request,
			HttpServletResponse response) {
		return new ModelAndView("messageboard");
	}

	@RequestMapping(method = RequestMethod.POST)
	public ModelAndView entrySavePage(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		Message message = buildObject(request);
		messageService.insertMessage(message);
		// return new ModelAndView("redirect:messageDetail.html?id=" + id);

		PrintWriter out = response.getWriter();
		out.write("pass");
		return null;
	}

	private Message buildObject(HttpServletRequest request) {
		// String category = request.getParameter("messageCategory");
		String title = request.getParameter("title");
		if (title != null) {
			if (title.trim().length() > 128) {
				title = title.substring(0, 127);
			}
		}

		String content = request.getParameter("content");

		if (content != null) {
			if (content.trim().length() > 1000) {
				title = content.substring(0, 999);
			}
		}

		String name = request.getParameter("name");
		if (title != null) {
			if (title.trim().length() > 16) {
				title = title.substring(0, 15);
			}
		}

		String type = request.getParameter("type");

		String status = "0";
		Message message = new Message();

		message.setName(null == title || "".equals(name.trim()) ? null : name
				.trim());
		message.setTitle(null == title || "".equals(title.trim()) ? null
				: title.trim());
		message.setStatus(null == status || "".equals(status.trim()) ? 0
				: Integer.parseInt(status));
		message.setType(null == type || "".equals(type.trim()) ? 0 : Integer
				.parseInt(type));
		message.setContent(null == content || "".equals(content.trim()) ? null
				: content.trim());
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Timestamp now = new Timestamp(System.currentTimeMillis());
		String createDate = df.format(now);
		message.setCreated(createDate);
		message.setReplied(null);

		return message;

	}
}
