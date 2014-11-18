package com.tb.web.admin.entry;

import java.io.File;
import java.io.IOException;


import java.io.PrintWriter;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.ContextLoader;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.support.DefaultMultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;








import com.tb.common.Constant;




import com.tb.service.EntryService;

@Controller
@RequestMapping("/admin/uploadimage.html")
public class FileUploadController {
	@Autowired
	private EntryService entryService;
	
	@RequestMapping(method = RequestMethod.POST)
	public ModelAndView processImageUpload(@RequestParam(value="entryInputFile") MultipartFile image, HttpServletResponse response,
			HttpServletRequest request) throws IOException {
		String imgPath = Constant.UPLOAD_ENTRY_PICTURE_PATH;		
		SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");
		Timestamp now = new Timestamp(System.currentTimeMillis());
		String publishDate = df.format(now); 		
		String originImageName = image.getOriginalFilename();		
		PrintWriter out = response.getWriter();
		if(originImageName.lastIndexOf(".")<1){
			out.print("illegal");
			return null;
		}
		
		String suffix = originImageName.substring(originImageName.lastIndexOf("."));
		String imgSaveName = publishDate+suffix;		
		
		JSONObject json=new JSONObject();
		json.put("filename", imgSaveName);
		json.put("imgId", publishDate);		
		
		String realPath = request.getSession().getServletContext().getRealPath("/"+imgPath);
		System.out.println(realPath);		
		
		try{
			FileUtils.copyInputStreamToFile(image.getInputStream(), new File(realPath, imgSaveName));
		} catch (Exception e){
			System.out.println(e);
			json.put("status", "error");
			out.print(json);	
			return null;
		}
		System.out.println(imgSaveName);	
		json.put("status", "success");
		out.print(json);		
		return null;   
	} 
}
