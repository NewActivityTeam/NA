package com.na.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.function.LongPredicate;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.na.entity.Activity;
import com.na.entity.Group;
import com.na.entity.Userinfo;
import com.na.entity.nodb.ReturnInfo;
import com.na.service.ActivityService;
import com.na.service.GroupService;
import com.na.service.PCPService;
import com.na.service.UserinfoService;

@Controller
@RequestMapping("/group")
public class GroupController {

	@Autowired
	UserinfoService userinfoService;
	@Autowired
	GroupService groupService;
	@Autowired
	ActivityService activityService;
	@Autowired
	PCPService pcpService;
	//一键分组
	@ResponseBody
	@RequestMapping("/fastallot")
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

	//显示分组信息
	@RequestMapping("getinfo")
	public String getGroupinfo(HttpServletRequest request){
		List<ReturnInfo> returnList = new ArrayList<ReturnInfo>();
		int code = 90155;
		try {
			
			long aid = Long.parseLong(request.getParameter("aid"));
			String attr = request.getParameter("attr");
			if (attr==null) {
				//默认进入界面，分组和未分组均显示
				//已分组部分
				List<Group> groups = groupService.getGroupsByAID(aid);
				for (Group group : groups) {
					List<Long> uidlList = pcpService.getUIDsByGID(group.getId());
					long[] ids = new long[uidlList.size()];
					for (int i = 0; i < uidlList.size(); i++) {
						ids[i] = uidlList.get(i);
					}
					List<Userinfo> members = userinfoService.getUserinfos(ids);
					ReturnInfo returnInfo = new ReturnInfo();
					returnInfo.setGroupName(group.getGroupname());
					returnInfo.setMembers(members);
					returnList.add(returnInfo);
				}
				//未分组部分
				List<Long> uidlList = pcpService.getUIDsByAIDNoGroup(aid);
				if (uidlList!=null&&uidlList.size()!=0) {
					long[] ids = new long[uidlList.size()];
					for (int i = 0; i < uidlList.size(); i++) {
						ids[i] = uidlList.get(i);
					}
					List<Userinfo> members = userinfoService.getUserinfos(ids);
					ReturnInfo returnInfo = new ReturnInfo();
					returnInfo.setGroupName("未分组");
					returnInfo.setMembers(members);
					returnList.add(returnInfo);
				}
				if (returnList.size()>0) {
					code = 90151;
				}
				else{
					code = 90152;
				}
			}
			else if (attr.endsWith("0")) {
				//未分组
			
				//获取所有未分组用户UID
				List<Long> uidlList = pcpService.getUIDsByAIDNoGroup(aid);
				if (uidlList!=null&&uidlList.size()!=0) {
					long[] ids = new long[uidlList.size()];
					for (int i = 0; i < uidlList.size(); i++) {
						ids[i] = uidlList.get(i);
					}
					//获得所有未分组用户
					List<Userinfo> members = userinfoService.getUserinfos(ids);
					ReturnInfo returnInfo = new ReturnInfo();
					returnInfo.setGroupName("未分组");
					returnInfo.setMembers(members);
					returnList.add(returnInfo);
					code = 90151;
				}
				else{
					code = 90152;
				}
				
			}
			else if (attr.endsWith("1")) {
				//已分组
				//获得所有小组
				List<Group> groups = groupService.getGroupsByAID(aid);
				for (Group group : groups) {
					//获得小组内所有用户UID
					List<Long> uidlList = pcpService.getUIDsByGID(group.getId());
					long[] ids = new long[uidlList.size()];
					for (int i = 0; i < uidlList.size(); i++) {
						ids[i] = uidlList.get(i);
					}
					//获得小组内所有用户
					List<Userinfo> members = userinfoService.getUserinfos(ids);
					ReturnInfo returnInfo = new ReturnInfo();
					returnInfo.setGroupName(group.getGroupname());
					returnInfo.setMembers(members);
					returnList.add(returnInfo);
				}
				
				code = 90151;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		request.setAttribute("code", code);
		request.setAttribute("list", returnList);
		return "jsp/GroupList";
	}

}
