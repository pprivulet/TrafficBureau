package com.tb.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.tb.service.EntryService;
import com.tb.service.PhileService;
import com.tb.service.UserService;
import com.tb.domain.Entry;
import com.tb.domain.Phile;

@Controller
@RequestMapping("/index.html")
public class IndexController {
	@Autowired
	private UserService userService;

	@Autowired
	private EntryService entryService;

	@Autowired
	private PhileService fileService;

	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView doGet(HttpServletRequest request,
			HttpServletResponse response) {
		int news = 1;
		int anounce = 2;
		int instant = 29;
		int status = -1;
		ArrayList<String> entryTitleList = new ArrayList<String>();
		List<Entry> newsList = entryService.getLastEntries(6, news, status);
		List<Entry> anounceList = entryService.getLastEntries(3, anounce,
				status);
		List<Entry> instantList = entryService.getLastEntries(3, instant,
				status);
		List<Phile> phileList = fileService.getSildeFileList(news, 4);

		for (Phile file : phileList) {
			Entry entry = entryService.findById(file.getEntryId());
			entryTitleList.add(entry.getTitle());
		}

		//System.out.println(phileList);
		//System.out.println(entryTitleList);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("newsList", newsList);
		map.put("anounceList", anounceList);
		map.put("phileList", phileList);
		map.put("entryTitleList", entryTitleList);
		map.put("instantList", instantList);
		return new ModelAndView("home", map);
	}
}
