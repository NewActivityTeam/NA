package com.na.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.openid4java.util.HttpResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.yiban.open.FrameUtil;

import com.na.entity.Activity;
import com.na.entity.Userinfo;
import com.na.service.ActivityService;
import com.na.service.UserinfoService;
import com.na.tools.AddressTools;

//页面跳转
@Controller
public class TurnPageController {
	private final static int PAGE_SIZE = 4;
	@Autowired
	UserinfoService userinfoService;
	@Autowired
	ActivityService activityService;
	
	public int getActivitiesCount(){
		return activityService.getAllActivityNumber();
	}
	@RequestMapping("/pc/home")
	public String turnToPcHome(HttpServletRequest request){
		List<Activity> list = activityService.getAllActivitiesByPage(1, PAGE_SIZE);
		int total = this.getActivitiesCount();
		int pages = 0;
		if(total % PAGE_SIZE == 0){
			pages = total / PAGE_SIZE;
		}else{
			pages = total / PAGE_SIZE + 1;
		}
		System.out.println("total = " + total + "," + "pages = " + pages);
		if(list != null){
			for(Activity activity : list){
				System.out.println(activity.getTitle());
			}
		}
		List<Activity> res = activityService.getNewestActivities();
		List<Activity> newlist = new ArrayList<Activity>();
		if(res.size() > 4){
			for(int i = 0;i < 4;i++){
				newlist.add(res.get(i));
			}
		}else{
			newlist = res;
		}
		request.setAttribute("newlist", newlist);
		request.setAttribute("total",pages);
		request.setAttribute("list", list);
		return "jsp/pc/index";
	}
	//应用首页
	@RequestMapping("/home")
	public String turnToHome(HttpServletRequest request){
		String display = request.getParameter("display");

		if (request.getSession().getAttribute("uid")!=null) {
			long uid = (long) request.getSession().getAttribute("uid");
			String account = (String) request.getSession().getAttribute("account");
			Userinfo userinfo = userinfoService.getUserinfo(uid);
			if (userinfo==null) {
				if(userinfoService.createUserinfo(uid, account)==11011){
					System.out.print("注册成功");
				}
			}
			else if (!userinfo.getYbaccount().endsWith(account)) {
				if (userinfoService.updateUserinfo(uid, 7, account)==11021) {
					System.out.print("修改成功");
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
	@RequestMapping("turnToScore")
	public String turnToScore(HttpServletRequest request){
		List<Activity> res = activityService.getNewestActivities();
		List<Activity> newlist = new ArrayList<Activity>();
		if(res.size() > 4){
			for(int i = 0;i < 4;i++){
				newlist.add(res.get(i));
			}
		}else{
			newlist = res;
		}
		request.setAttribute("newlist", newlist);
		return "jsp/pc/score";
	}

}
