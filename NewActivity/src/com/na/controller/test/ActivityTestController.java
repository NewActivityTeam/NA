package com.na.controller.test;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.na.entity.Activity;
import com.na.service.ActivityService;
import com.na.tools.UnicodeAndStringTools;

@Controller
@RequestMapping("/test/activity")
public class ActivityTestController {

	@Autowired
	ActivityService activityService;
	
	@ResponseBody
	@RequestMapping("/create")
	public Map<String, Object> createActivity(HttpServletRequest request){
		Map<String, Object> map = new HashMap<String, Object>();
		Date date = new Date();
		int code = 12015;
		try{
			code=activityService.newActicity(UnicodeAndStringTools.stringToUnicode("标题"), UnicodeAndStringTools.stringToUnicode("描述"), date.getTime(), date.getTime(), 1);
		
		}
		catch(Exception e){
			e.printStackTrace();
		}
		map.put("code", code);
		return map;
	}
	
	@RequestMapping("/activity_input")
	public String inputActivity(Model model){
		Activity activity = new Activity();
		model.addAttribute("activity", activity);
		return "test/ActivityAddForm";
	}
	
	@RequestMapping("/activity_save")
	public String saveActivity(@ModelAttribute Activity activity,HttpServletRequest request){
		System.out.println(activity.getTitle());
		System.out.println(activity.getStarttime());
		return "redirect:test/activity_list";
	}
	@RequestMapping("/activity_list")
	public String listActivities(Model model){
		List<Activity> list = activityService.getAllActivities();
		model.addAttribute("activities", list);
		return "test/ActivityList";
	}
}
