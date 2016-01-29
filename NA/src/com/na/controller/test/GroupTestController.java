package com.na.controller.test;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.annotation.JsonTypeInfo.Id;
import com.na.entity.Activity;
import com.na.entity.Userinfo;
import com.na.service.ActivityService;
import com.na.service.GroupService;
import com.na.service.PCPService;
import com.na.service.UserinfoService;

@Controller
@RequestMapping("/test/group")
public class GroupTestController {

	@Autowired
	UserinfoService userinfoService;
	@Autowired
	GroupService groupService;
	@Autowired
	ActivityService activityService;
	@Autowired
	PCPService pcpService;
	
	@ResponseBody
	@RequestMapping("/pcp")
	public Map<String, Object> pcpActivity(HttpServletRequest request){
		Map<String, Object> map = new HashMap<String, Object>();
		int code = 90125;
		try{
			int count = 0;
			List<Userinfo> userinfos = userinfoService.getAllUserinfos();
			if (userinfos!=null&&userinfos.size()!=0) {
				
				for (Userinfo userinfo : userinfos) {
					pcpService.newPCP(userinfo.getUid(), 16);
					count++;
				}
				if (count==userinfos.size()) {
					code = 90121;
				}
				else{
					code = 90123;
				}
			}
			else{
				code = 90124;
			}
		}
		catch(Exception exception){
			exception.printStackTrace();
		}
		map.put("code", code);
		return map;
	}

	//一键分组
	@ResponseBody
	@RequestMapping("/fast")
	public Map<String, Object> fastAllot(HttpServletRequest request){
		Map<String, Object> map = new HashMap<String, Object>();
		int code = 90135;
		try{
			long aid =Long.parseLong(request.getParameter("aid"));
			Activity activity = activityService.getActicity(aid);
			List<Userinfo> userinfos = userinfoService.getAllUserinfos();
			List<Long> groups = groupService.fastCreateGroups(aid, userinfos.size(), activity.getNumber());
			if (groups!=null&&groups.size()!=0) {
				List<Long> pcpids = pcpService.getPCPIDsByAIDNoGroup(aid);
				if(pcpids!=null&&pcpids.size()!=0){
					if(pcpService.fastAllot(pcpids, groups, activity.getNumber())==14001){
						code = groupService.fastGroupResultHandle(aid, true);
					}
					else{
						code = groupService.fastGroupResultHandle(aid, false);
					}
				}
			}
		}
		catch(Exception exception){
			exception.printStackTrace();
		}
		map.put("code", code);
		return map;
	}

}
