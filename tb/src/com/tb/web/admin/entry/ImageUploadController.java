package com.tb.web.admin.entry;

import java.io.File;
import java.io.IOException;


import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;





import com.tb.service.EntryService;

@Controller
@RequestMapping("/admin/uploadimage.html")
public class ImageUploadController {
	@Autowired
	private EntryService entryService;
	
	@RequestMapping(method = RequestMethod.POST)
	public ModelAndView processImageUpload(@RequestParam("entryInputFile") MultipartFile image, HttpServletResponse response) throws IOException {
		FileCopyUtils.copy(image.getBytes(),new File("c:/"+image.getOriginalFilename()));  
		PrintWriter out = response.getWriter();
		out.print("c:/"+image.getOriginalFilename());
		out.flush();
		return null;  
	} 
}
