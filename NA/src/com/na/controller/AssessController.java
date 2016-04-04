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
		System.out.println(request.getParameter("aid") + " " + request.getParameter("comment") + " " + request.getParameter("score"));
		System.out.println("开始上传图片");
		
		CommonsMultipartResolver multipartResover = new CommonsMultipartResolver(request.getSession().getServletContext());
		if(multipartResover.isMultipart(request)){
			System.out.println(1);
			String imageURL = "";
			MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) request;
			System.out.println(1.5);
			Iterator<String> iter = multiRequest.getFileNames();
			System.out.println(2);
			int i = 0;
			System.out.println(3);
			while(iter.hasNext()){
				System.out.println(++i);
				int pre = (int) System.currentTimeMillis();
				MultipartFile file = multiRequest.getFile(iter.next());
				if(file != null){
					String myFileName = file.getOriginalFilename();
					System.out.print(myFileName);
					if(myFileName.trim() != ""){
						System.out.println(myFileName);
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
		System.out.println(imageURL);
		Map<String,Object> map = new HashMap<String,Object>();
		long aid = Long.parseLong(request.getParameter("aid"));
		float score = Float.parseFloat(request.getParameter("score"));
		String comment = request.getParameter("comment");
		System.out.println(aid + " " + score + " " + comment);
		assessService.newAssess(1, aid, score, comment, imageURL);
		return map;
		
	}
}
