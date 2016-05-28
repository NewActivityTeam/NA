package com.na.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import com.na.service.AssessService;

@Controller
@RequestMapping("/assess")
public class AssessController {

	@Autowired
	AssessService assessService;
	@ResponseBody
	@RequestMapping("/uploadImage")
	public void upload(HttpServletRequest request,HttpServletResponse response) throws IllegalStateException, IOException{
		CommonsMultipartResolver multipartResover = new CommonsMultipartResolver(request.getSession().getServletContext());
		if(multipartResover.isMultipart(request)){
			String imageURL = "";
			MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) request;
			Iterator<String> iter = multiRequest.getFileNames();
			int i = 0;
			while(iter.hasNext()){
				int pre = (int) System.currentTimeMillis();
				MultipartFile file = multiRequest.getFile(iter.next());
				if(file != null){
					String myFileName = file.getOriginalFilename();
					if(myFileName.trim() != ""){
						imageURL += (myFileName + ";");
						request.getSession().setAttribute("imageURL", imageURL);
						String fileName = "demoUpload" + file.getOriginalFilename();
						String path = request.getSession().getServletContext().getRealPath("/") + "/upload/" + fileName;
						File localFile = new File(path);
						file.transferTo(localFile);
						
					}
				}
				else {
					System.out.println("读不出来");
				}
			}
		}
	}
	@ResponseBody
	@RequestMapping("/score")
	public Map<String,Object> score(HttpServletRequest request){
		String imageURL = (String) request.getSession().getAttribute("imageURL");
		Map<String,Object> map = new HashMap<String,Object>();
		long aid = Long.parseLong(request.getParameter("aid"));
		float score = Float.parseFloat(request.getParameter("score"));
		String comment = request.getParameter("comment");
		assessService.newAssess(1, aid, score, comment, imageURL);
		return map;
		
	}
}
