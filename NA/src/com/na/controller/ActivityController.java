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
import com.na.tools.Pager;



@Controller
public class ActivityController extends BaseController{
	private int currentPage = 1;
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
		activity.setWebAddress(request.getParameter("voteaddress"));
		activity.setDescription(request.getParameter("content"));
		activity.setManager(request.getParameter("manager"));
		activityService.addActivity(activity);
		return "/jsp/PublishActivity";
	}
	
	@RequestMapping("GetActivities")
	public ModelAndView GetActivities(ModelMap map){
		currentPage = Integer.parseInt(request.getParameter("current"));
		Timestamp start = null;
		Timestamp end = null;
		String title = null;
		if(request.getParameter("title") != ""){
			title = request.getParameter("title");
		}
		if(request.getParameter("startDate") != ""){
			start = Timestamp.valueOf(request.getParameter("startDate") + " 00:00:00");
		}
		if( request.getParameter("endDate") != ""){
			end = Timestamp.valueOf(request.getParameter("endDate") + " 23:59:59");
		}
		if(title == null && start == null && end == null){
			request.setAttribute("current", currentPage);
			 return new ModelAndView("redirect:/GetAllActivities?current=" + currentPage + "&method=GetAllActivities");
		}
		else{
			int totalSize = 6;
			Pager page = new Pager(currentPage,totalSize);
			currentPage = Integer.parseInt(request.getParameter("current"));
			request.setAttribute("current", currentPage);
			request.setAttribute("pageCount", 6);
			request.setAttribute("func", "GetActivities");
			request.setAttribute("title", title);
			request.setAttribute("start", request.getParameter("startDate"));
			request.setAttribute("end", request.getParameter("endDate"));
			List<Activity> list = activityService.getActivitiesByConditions(title,start,end,currentPage,page.getPageSize());
			map.addAttribute("activities",list);
			return new ModelAndView("/jsp/ManageActivityOfShow");
		}
	}
	@RequestMapping("GetAllActivities")
	public String GetAllActivities(ModelMap map){
		int totalSize = 6;
		currentPage = Integer.parseInt(request.getParameter("current"));
		request.setAttribute("current", currentPage);
		request.setAttribute("pageCount", 6);
		request.setAttribute("func", "GetAllActivities");
		Pager page = new Pager(currentPage,totalSize);
		List<Activity> list = activityService.getAllActivitiesByPage(currentPage,page.getPageSize());
		map.addAttribute("activities", list);
		return "/jsp/ManageActivityOfShow";
	}
	@RequestMapping("DeleteActivity")
	public ModelAndView DeleteActivity(){
		currentPage = Integer.parseInt(request.getParameter("current"));
		String start = request.getParameter("startDate");
		String end = request.getParameter("endDate");
		String title = request.getParameter("title");
		Long id = (long) Integer.parseInt(request.getParameter("id"));
		activityService.deleteActivity(id);
		return new ModelAndView("redirect:/GetActivities?current=" + currentPage + "&title=" + title + "&startDate=" + start + "&endDate=" + end);
	}
}