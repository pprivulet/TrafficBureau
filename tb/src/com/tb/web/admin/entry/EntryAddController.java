package com.tb.web.admin.entry;

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
import com.tb.domain.Entry;
import com.tb.domain.Phile;
import com.tb.service.EntryService;
import com.tb.service.PhileService;

@Controller
@RequestMapping("/admin/entryAdd.html")
public class EntryAddController {

	@Autowired
	private EntryService entryService;

	@Autowired
	private PhileService fileService;

	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView entryAddPage(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		int category = Integer.parseInt(request.getParameter("category"));
		if (category > Constant.CTG_NUM && category < 1) {
			return new ModelAndView("error");
		}
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("idx", category);
		return new ModelAndView("admin/entryAdd", map);
	}

	@RequestMapping(method = RequestMethod.POST)
	public ModelAndView entrySavePage(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		Entry entry = buildObject(request);		
		String imgPath = request.getParameter("entryImages");
		System.out.println(imgPath);
		if (imgPath.length() > 0) {
			entry.setFile(1);
		}		
		Integer id = entryService.insertEntry(entry);
		Phile file = fileService.findByEntryID(id);
		if (file != null)
			fileService.delete(file.getId());
		if (imgPath.length() > 0) {
			file = new Phile();
			file.setEntryId(id);
			file.setPath(imgPath);
			file.setStatus(0);
			file.setType(0);
			file.setCategory(entry.getCategory());
			file.setCreateDate(entry.getPublishDate());
			fileService.insert(file);
		}		
		return new ModelAndView("redirect:/admin/entryDetail.html?id=" + id);
	}

	private Entry buildObject(HttpServletRequest request) {
		String category = request.getParameter("entryCategory");
		String importance = request.getParameter("entryImportance");
		String title = request.getParameter("entryInputTitle");
		if (title != null) {
			if (title.trim().length() > 500) {
				title = title.substring(0, 499);
			}
		}
		String content = request.getParameter("entryInputContent");
		String status = "0";
		Entry entry = new Entry();
		entry.setCategory((null == category || "".equals(category.trim()) ? null
				: Integer.parseInt(category.trim())));
		entry.setImportance((null == importance || "".equals(importance.trim()) ? 0
				: 1));
		entry.setTitle(null == title || "".equals(title.trim()) ? null : title
				.trim());
		entry.setStatus(null == status || "".equals(status.trim()) ? 0
				: Integer.parseInt(status));
		entry.setContent(null == content || "".equals(content.trim()) ? null
				: content.trim());
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Timestamp now = new Timestamp(System.currentTimeMillis());
		String createDate = df.format(now);
		entry.setCreateDate(createDate);
		entry.setUpdateDate(createDate);
		entry.setPublishDate(null);
		entry.setListOrder(0);
		return entry;
	}

}