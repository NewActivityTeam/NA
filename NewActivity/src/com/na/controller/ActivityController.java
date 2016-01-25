package com.na.controller;




import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;
















import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.na.entity.Activity;
import com.na.service.ActivityService;



@Controller
public class ActivityController extends BaseController{
	
	@Autowired
	@Qualifier("activityService")
	public ActivityService activityService;
	
	@RequestMapping("PublishActivity")
	public String publishActivity() throws ParseException{
		Activity activity = new Activity();
		activity.setTitle(request.getParameter("title"));
		activity.setStarttime(Timestamp.valueOf(request.getParameter("startDate") + " " + request.getParameter("startTime") + ":00"));
		activity.setEndtime(Timestamp.valueOf(request.getParameter("endDate") + " " + request.getParameter("endTime") + ":00"));
		activity.setEndsigntime(Timestamp.valueOf(request.getParameter("endSignDate") + " " + request.getParameter("endSignTime") + ":00"));
		activity.setCreatetime(Timestamp.valueOf(request.getParameter("createDate") + " " + request.getParameter("createTime") + ":00"));
		activity.setAddress(request.getParameter("address"));
		activity.setVoteaddress(request.getParameter("voteaddress"));
		activity.setContent(request.getParameter("content"));
		activityService.addActivity(activity);
		return "redirect:GetAllActivities";
	}
	
	@RequestMapping("GetActivities")
	public String GetActivities(ModelMap map){
		Timestamp start = null;
		Timestamp end = null;
		String title = null;
		if(!request.getParameter("title").equals("")){
			title = request.getParameter("title");
		}
		if(!request.getParameter("startDate").equals("")){
			start = Timestamp.valueOf(request.getParameter("startDate") + " 00:00:00");
		}
		if(!request.getParameter("endDate").equals("")){
			end = Timestamp.valueOf(request.getParameter("endDate") + " 23:59:59");
		}
		if(title == null && start == null && end == null){
			return "redirect:GetAllActivities";
		}
		else{
			System.out.println("oh no no no");
			List<Activity> list = activityService.getActivitiesByConditions(title,start,end);
			map.addAttribute("activities",list);
			//System.out.println(list.size());
			return "/jsp/ManageActivity";
		}
	}
	@RequestMapping("GetAllActivities")
	public String GetAllAcitvities(ModelMap map){
		List<Activity> list = activityService.getAllActivities();
		map.addAttribute("activities", list);
		return "/jsp/ManageActivity";
	}
	@RequestMapping(value = "test1", method = RequestMethod.POST)
	public String test(ModelMap map){
		System.out.println("123");
		return "redirect:/hello";
	}
}
