package com.na.controller.test;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.na.entity.Group;
import com.na.entity.GroupApply;
import com.na.entity.PCP;
import com.na.entity.nodb.GroupApplyInfo;
import com.na.service.ActivityService;
import com.na.service.GroupApplyService;
import com.na.service.GroupService;
import com.na.service.PCPService;
import com.na.service.UserinfoService;

@Controller
@RequestMapping("/test/groupapply")
public class GroupApplyTestController {

	@Autowired
	GroupApplyService groupApplyService;
	@Autowired
	UserinfoService userinfoService;
	@Autowired
	GroupService groupService;
	@Autowired
	ActivityService activityService;
	@Autowired
	PCPService pcpService;
	
	//新的申请
	@ResponseBody
	@RequestMapping("newapply")
	public Map<String, Object> NewGroupApply(HttpServletRequest request){
		Map<String, Object> map = new HashMap<String, Object>();
		int code = 90005;
		long uid = (long) request.getSession().getAttribute("uid");
		try {
			long gid = Long.parseLong(request.getParameter("gid"));
			code = groupApplyService.newGroupApply(uid, gid);
		} catch (Exception e) {
			e.printStackTrace();
		}
		map.put("code", code);
		return map;
	}
	//展示我的小组的申请情况
	@RequestMapping("showapplaybygid")
	public String ShowApplyByGID(HttpServletRequest request){
		int code = 91225;
		String display = request.getParameter("display");
		
		try {
			long gid = Long.parseLong(request.getParameter("gid"));
			request.setAttribute("gid", gid);
			long uid = (long) request.getSession().getAttribute("uid");
			System.out.println("gid = " + gid);
			if (groupService.getGroup(gid).getLeader()==uid) {
				List<GroupApply> groupApplies = groupApplyService.getGroupAppliesByGID(gid);
				if (groupApplies!=null&&groupApplies.size()!=0) {
					List<GroupApplyInfo> groupApplyInfos = new ArrayList<GroupApplyInfo>();
					for (GroupApply groupApply : groupApplies) {
						GroupApplyInfo groupApplyInfo = new GroupApplyInfo();
						groupApplyInfo.groupApply = groupApply;
						groupApplyInfo.userinfo = userinfoService.getUserinfo(groupApply.getUid());
						groupApplyInfos.add(groupApplyInfo);
					}
					request.setAttribute("list",groupApplyInfos);
					
					code = 91221;
				}
				else{
					
					code = 91222;
				}
			}
			else{
				code = 91126;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		request.setAttribute("code", code);
		if (display!=null&&display.equals("mobile")) {
			return "jsp/mobile/MyGroupManage";
		}
		return "jsp/pc/GroupMembers";
	}
	
	@ResponseBody
	@RequestMapping("accept")
	public Map<String, Object> AcceptGroupApply(HttpServletRequest request){
		Map<String, Object> map = new HashMap<String, Object>();
		int code = 91225;
		try {
			long applyid = Long.parseLong(request.getParameter("gid"));
			GroupApply groupApply = groupApplyService.getGroupApply(applyid);
			Group group = groupService.getGroup(groupApply.getGid());
			if(pcpService.getGroupCount(group.getId())<group.getMaxcount()){
				PCP pcp = pcpService.getPcp(groupApply.getUid(), group.getAid());
				pcpService.joinGroup(pcp.getId(), group.getId());
				code = groupApplyService.acceptApply(applyid);
				
			}
			else{
				code = 91222;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		map.put("code", code);
		return map;
	}
	@ResponseBody
	@RequestMapping("refuse")
	public Map<String, Object> RefuseGroupApply(HttpServletRequest request){
		Map<String, Object> map = new HashMap<String, Object>();
		int code = 91225;
		try {
			long gid = Long.parseLong(request.getParameter("gid"));
			code = groupApplyService.refuseApply(gid);
		} catch (Exception e) {
			e.printStackTrace();
		}
		map.put("code", code);
		return map;
	}
}
