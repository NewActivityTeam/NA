package com.na.controller.test;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.na.entity.Comment;
import com.na.entity.Userinfo;
import com.na.service.ActivityService;
import com.na.service.CommentService;
import com.na.service.UserinfoService;

@Controller
@RequestMapping("/test/comment")
public class CommentTestController {

	@Autowired
	CommentService commentService;
	@Autowired
	UserinfoService userinfoService;
	@Autowired
	ActivityService activityService;
	
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
}
