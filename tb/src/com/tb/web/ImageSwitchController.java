package com.tb.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.tb.domain.Phile;
import com.tb.service.PhileService;

@Controller
@RequestMapping("/imageSwitch.html")
public class ImageSwitchController {

	@Autowired
	private PhileService fileService;

	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView doPost(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		PrintWriter out = response.getWriter();
		Random random = new Random();
		
		try {
			List<Phile> images = fileService.findByStatus(1, 2);
			int id = random.nextInt(images.size());
			String path = images.get(id).getPath();
			System.out.println(path);
			out.write(path);
			return null;
		} catch (Exception e) {
			out.write("error");
			return null;
		}
	}
}
