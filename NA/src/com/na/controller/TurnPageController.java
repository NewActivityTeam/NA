package com.na.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.na.entity.Userinfo;
import com.na.service.UserinfoService;

//页面跳转
@Controller
public class TurnPageController {
	
	@Autowired
	UserinfoService userinfoService;
	
	@RequestMapping("/adminhome")
	public String turnToAdminHome(HttpServletRequest request){
		//从session中获取ID
		long uid = (long) request.getSession().getAttribute("uid");
		Userinfo userinfo = userinfoService.getUserinfo(uid);
		if (userinfo!=null) {
			if (userinfo.getAuthority()==1) {
				return "jsp/home";
			}
		}
		return "jsp/adminTurnError";
	}
	@RequestMapping("/mobilehome")
	public String turnToMobileHome(HttpServletRequest request){
		
		request.getSession().setAttribute("uid", (long)1188164);
		try{
			long uid = (long) request.getSession().getAttribute("uid");
			if (uid==1188164) {
				return "jsp/mobile/Home";
			}
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return "jsp/adminTurnError";
		
	}
}
