package com.tb.web.admin.entry;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;



import java.util.Random;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.context.ContextLoader;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.servlet.ModelAndView;

import com.tb.common.Constant;
import com.tb.service.EntryService;

@Controller
@RequestMapping("/admin/deleteFile.html")
public class FileDeleteController {
	
	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView entryDetailPage(HttpServletRequest request,HttpServletResponse response) throws IOException{
		String imgPath = Constant.UPLOAD_ENTRY_PICTURE_PATH;
		//WebApplicationContext webApplicationContext = ContextLoader.getCurrentWebApplicationContext();
		//ServletContext servletContext = webApplicationContext.getServletContext(); 
		//String dirPath = servletContext.getRealPath("/WEB-INF/"+imgPath);			
		String realPath = request.getSession().getServletContext().getRealPath("/"+imgPath);
		System.out.println(realPath);
		String filename = request.getParameter("filename");	
		PrintWriter out = response.getWriter();
		File file = new File(realPath, filename);
		if(file.delete()){			
			
			JSONObject json=new JSONObject();
			json.put("status", "deleted");
			json.put("imgId", 1);
			
			out.print(json);
		} else {
			out.print("{status:error}");
		}			
		return null; 
	}
}
