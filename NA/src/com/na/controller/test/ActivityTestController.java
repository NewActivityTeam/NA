package com.na.controller.test;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collector;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.na.entity.Activity;
import com.na.entity.nodb.ActivityWithNum;
import com.na.service.ActivityService;
import com.na.service.PCPService;

@Controller
@RequestMapping("/test/activity")
public class ActivityTestController {

	@Autowired
	ActivityService activityService;
	@Autowired
	PCPService pcpService;
	
	@ResponseBody
	@RequestMapping("/create")
	public Map<String, Object> createActivity(HttpServletRequest request){
		Map<String, Object> map = new HashMap<String, Object>();
		Date date = new Date();
		int code = 12015;
		try{
			//code=activityService.newActicity(UnicodeAndStringTools.stringToUnicode("标题"), UnicodeAndStringTools.stringToUnicode("描述"), date.getTime(), date.getTime(), 1);
		
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
		return "redirect:test/activity_list";
	}
	@RequestMapping("/activity_list")
	public String listActivities(HttpServletRequest request){
		int code = 90165;
		String display = request.getParameter("display");
		try{
			boolean state =  Boolean.parseBoolean(request.getParameter("state"));
			List<Activity> list = activityService.getAllActvityByState(state);
			List<ActivityWithNum> list1 = list.stream()
					.map(activity->new ActivityWithNum(activity,pcpService.getUIDsByAID(activity.getId()).size()))
					.collect(Collectors.toList());
			list1.forEach(System.out::println);
			request.setAttribute("list", list1);
			code = 90161;
		}
		catch(Exception e){
			e.printStackTrace();
		}
		request.setAttribute("code", code);
		if(display!=null&&display.endsWith("mobile")){
			return "jsp/mobile/ActivityList";
		}
		return "jsp/ActivityList";
	}
	@RequestMapping("/activity_show")
	public String showActivity(HttpServletRequest request){
		String display = request.getParameter("display");
		int code = 90215;
		try {
			long aid = Long.parseLong(request.getParameter("aid"));
			Activity activity = activityService.getActicity(aid);
			if (activity!=null) {
				request.setAttribute("activity", activity);
				code = 90211;
			}
			else{
				code = 90212;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		request.setAttribute("code", code);
		if (display!=null&&display.equals("mobile")) {
			return "jsp/mobile/ActivityShow";
		}
		return "jsp/ActivityContent";
	}
	
}
