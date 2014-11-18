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
@RequestMapping("/admin/entryEdit.html")
public class EntryEditController {

	@Autowired
	private EntryService entryService;

	@Autowired
	private PhileService fileService;
	
	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView entryEditPage(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		int category = Integer.parseInt(request.getParameter("category"));
		if(category>Constant.CTG_NUM && category<1){
			return new ModelAndView("error");
		}		
		Entry entry = entryService.findById(id);
		if(entry == null){
			return new ModelAndView("error");
		}		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("entry", entry);
		map.put("idx", category);
		return new ModelAndView("admin/entryEdit", map);
	}

	@RequestMapping(method = RequestMethod.POST)
	public ModelAndView entrySavePage(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		Entry entry = buildObject(request);
		int status = 0;
		String imgPath = request.getParameter("entryImages");
		System.out.println(imgPath.length());
		Phile file = fileService.findByEntryID(entry.getId());
		if (file != null){
			status = file.getStatus();
			fileService.delete(file.getId());			
		}
		if (imgPath.length() > 0) {
			entry.setFile(1);
			file = new Phile();
			file.setEntryId(entry.getId());
			file.setPath(imgPath);
			file.setStatus(status);
			file.setType(0);
			file.setCategory(entry.getCategory());					
			file.setCreateDate(entry.getPublishDate());
			fileService.insert(file);
		} else {
			entry.setFile(0);
		}		
		entryService.updateEntry(entry);
		return new ModelAndView("redirect:/admin/entryDetail.html?id=" + entry.getId());
	}

	private Entry buildObject(HttpServletRequest request) {
		String category = request.getParameter("entryCategory");
		String importance = request.getParameter("entryImportance");
		String title = request.getParameter("entryInputTitle");
		String id = request.getParameter("entryId");
		if (title != null) {
			if (title.trim().length() > 500) {
				title = title.substring(0, 499);
			}
		}
		String content = request.getParameter("entryInputContent");
		String status = request.getParameter("entryStatus");
		Entry entry = new Entry();
		entry.setId(Integer.parseInt(id));
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
		String updateDate = df.format(now);
		//entry.setCreateDate(createDate);
		entry.setUpdateDate(updateDate);
		entry.setPublishDate(updateDate);
		entry.setListOrder(0);
		return entry;
	} 

}
