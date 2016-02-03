package com.na.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.openid4java.util.HttpResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.yiban.open.FrameUtil;

import com.na.entity.Userinfo;
import com.na.service.UserinfoService;
import com.na.tools.AddressTools;

//页面跳转
@Controller
public class TurnPageController {
	
	@Autowired
	UserinfoService userinfoService;
	
	//应用首页
	@RequestMapping("/home")
	public String turnToHome(HttpServletRequest request){
		String display = request.getParameter("display");

		if (request.getSession().getAttribute("uid")!=null) {
			long uid = (long) request.getSession().getAttribute("uid");
			if (userinfoService.getUserinfo(uid)==null) {
				String account = (String) request.getSession().getAttribute("account");
				if(userinfoService.createUserinfo(uid, account)==11011){
					System.out.print("注册成功");
				}
			}
		}
		
		if(display!=null&&display.endsWith("mobile")){
			return "redirect:/mobilehome";
		}
		return "index";
	}
	
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
		try{
			if(request.getSession().getAttribute("uid")!=null){
				return "jsp/mobile/Home";
			}
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return "jsp/adminTurnError";
		
	}


}
