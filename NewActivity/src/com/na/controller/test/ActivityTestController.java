package com.na.controller.test;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.na.service.ActivityService;
import com.na.tools.UnicodeAndStringTools;

@Controller
@RequestMapping("/test/activity")
public class ActivityTestController {

	@Autowired
	@Qualifier("activityService")
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
}
