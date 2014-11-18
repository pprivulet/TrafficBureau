package com.tb.web.admin.vote;

import java.io.IOException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.tb.common.Constant;
import com.tb.domain.VoteTheme;
import com.tb.service.VoteThemeService;

@Controller
@RequestMapping("/admin/voteThemeEdit.html")
public class VoteThemeEditController {
	@Autowired
	private VoteThemeService voteThemeService;
	
	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView voteThemeAdd(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		int category = Integer.parseInt(request.getParameter("category"));
		int id = Integer.parseInt(request.getParameter("id"));
		if (category > Constant.CTG_NUM && category < 1) {
			return new ModelAndView("error");
		}
		VoteTheme voteTheme = voteThemeService.findById(id);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("idx", category);
		map.put("voteTheme", voteTheme);
		return new ModelAndView("admin/voteThemeEdit", map);
	}

	
	
	@RequestMapping(method = RequestMethod.POST)
	public ModelAndView entrySavePage(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		VoteTheme voteTheme = buildObject(request);			
		voteThemeService.updateVoteTheme(voteTheme);		
		return new ModelAndView("redirect:/admin/voteThemeList.html?category=48&pageNum=1");
	}

	private VoteTheme buildObject(HttpServletRequest request) {
		String category = request.getParameter("entryCategory");		
		String content = request.getParameter("theme");
		int id = Integer.parseInt(request.getParameter("id"));
		if (content != null) {
			if (content.trim().length() > 128) {
				content = content.substring(0, 127);
			}
		}	
		VoteTheme voteTheme = voteThemeService.findById(id);
		voteTheme.setContent(null == content || "".equals(content.trim()) ? null
				: content.trim());
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Timestamp now = new Timestamp(System.currentTimeMillis());
		String updateDate = df.format(now);		
		voteTheme.setUpdated(updateDate);			
		return voteTheme;
	}
	
}
