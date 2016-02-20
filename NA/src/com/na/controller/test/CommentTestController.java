package com.na.controller.test;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
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

import com.na.entity.Comment;
import com.na.entity.Userinfo;
import com.na.service.ActivityService;
import com.na.service.AssessService;
import com.na.service.CommentService;
import com.na.service.UserinfoService;

@Controller
@RequestMapping("/test/comment")
public class CommentTestController {
	private String imageURL = "";
	@Autowired
	CommentService commentService;
	@Autowired
	UserinfoService userinfoService;
	@Autowired
	ActivityService activityService;
	@Autowired
	AssessService assessService;
	@ResponseBody
	@RequestMapping("/new")
	public Map<String, Object> newComment(HttpServletRequest request){
		Map<String, Object> map = new HashMap<String, Object>();
		int code = 13015;
		try {
			long uid = (long) request.getSession().getAttribute("uid");
			Userinfo userinfo = userinfoService.getUserinfo(uid);
			long aid = Long.parseLong(request.getParameter("aid"));
			String content = request.getParameter("content");
			String uname = userinfo.getName();
			code = commentService.newComment(uid, aid,uname, content);
		} catch (Exception e) {
			e.printStackTrace();
		}
		map.put("code", code);
		return map;
	}
	@ResponseBody
	@RequestMapping("/update")
	public Map<String, Object> updateComment(HttpServletRequest request){
		Map<String, Object> map = new HashMap<String, Object>();
		int code = 13025;
		try {
			long uid = (long) request.getSession().getAttribute("uid");
			long cid = Long.parseLong(request.getParameter("cid"));
			Comment comment = commentService.getComment(cid);
			if (comment.getUid()==uid) {
				String content = request.getParameter("content");
				code = commentService.updateComment(cid, content);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		map.put("code", code);
		return map;
	}
	@ResponseBody
	@RequestMapping("/delete")
	public Map<String, Object> deleteComment(HttpServletRequest request){
		Map<String, Object> map = new HashMap<String, Object>();
		int code = 13035;
		try {
			long uid = (long) request.getSession().getAttribute("uid");
			long cid = Long.parseLong(request.getParameter("cid"));
			Comment comment = commentService.getComment(cid);
			if (comment.getUid()==uid) {
				code = commentService.deleteComment(cid);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		map.put("code", code);
		return map;
	}
	@RequestMapping("/show")
	public String showComments(HttpServletRequest request){
		String display = request.getParameter("display");
		List<Comment> comments = null;
		int code = 91005;
		try {
			long aid = Long.parseLong(request.getParameter("aid"));
			comments = commentService.getAllCommentsByAID(aid);
		} catch (Exception e) {
			e.printStackTrace();
		}
		if (comments!=null&&comments.size()!=0) {
			code = 91001;
		}
		request.setAttribute("code", code);
		request.setAttribute("comments", comments);
		if (display!=null&&display.equals("mobile")) {
			return "jsp/mobile/ShowComments";
		}
		return "";
	}
	@ResponseBody
	@RequestMapping("/uploadImage")
	public void upload(HttpServletRequest request,HttpServletResponse response) throws IllegalStateException, IOException{
		//System.out.println(request.getParameter("aid") + " " + request.getParameter("comment") + " " + request.getParameter("score"));
		System.out.println("开始上传图片");
		
		CommonsMultipartResolver multipartResover = new CommonsMultipartResolver(request.getSession().getServletContext());
		if(multipartResover.isMultipart(request)){
			MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) request;
			Iterator<String> iter = multiRequest.getFileNames();
			int i = 0;
			while(iter.hasNext()){
				System.out.println(++i);
				int pre = (int) System.currentTimeMillis();
				MultipartFile file = multiRequest.getFile(iter.next());
				if(file != null){
					String myFileName = file.getOriginalFilename();
					if(myFileName.trim() != ""){
						System.out.println(myFileName);
						imageURL += (myFileName + ";");
						String fileName = "demoUpload" + file.getOriginalFilename();
						String path = "D:/apache-tomcat-8.0.30-windows-x64/apache-tomcat-8.0.30/webapps/NA/upload/" + fileName;
						File localFile = new File(path);
						file.transferTo(localFile);
						
					}
				}
			}
		}
	}
	@ResponseBody
	@RequestMapping("/score")
	public Map<String,Object> score(HttpServletRequest request){
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
