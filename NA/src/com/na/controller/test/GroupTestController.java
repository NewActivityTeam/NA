package com.na.controller.test;

import java.util.ArrayList;
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
import com.na.entity.Group;
import com.na.entity.PCP;
import com.na.entity.Userinfo;
import com.na.entity.nodb.ReturnInfo;
import com.na.entity.nodb.ReturnMyGroup;
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
			long aid = Long.parseLong(request.getParameter("aid"));
			if (userinfos!=null&&userinfos.size()!=0) {
				
				for (Userinfo userinfo : userinfos) {
					pcpService.newPCP(userinfo.getUid(), aid);
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
						code = groupService.fastGroupResultHandle(aid, true,activity.getFgc());
						activityService.addFastGroupedCount(aid, groups.size());
					}
					else{
						code = groupService.fastGroupResultHandle(aid, false,0);
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
	@ResponseBody
	@RequestMapping("getinfo")
	public Map<String, Object> getGroupinfo(HttpServletRequest request){
		Map<String, Object> map = new HashMap<String, Object>();
		List<ReturnInfo> returnList = new ArrayList<ReturnInfo>();
		int code = 90155;
		try {

			long aid = Long.parseLong(request.getParameter("aid"));
			int num =pcpService.getUIDsByAID(aid).size();
			request.setAttribute("num", num);
			System.out.print(num);
			String attr = request.getParameter("attr");
			if (attr==null) {
				//默认进入界面，分组和未分组均显示
				//已分组部分
				List<Group> groups = groupService.getGroupsByAID(aid);
				for (Group group : groups) {
					List<Long> uidlList = pcpService.getUIDsByGID(group.getId());
						if(uidlList!=null&&uidlList.size()!=0){
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
					if(uidlList!=null&&uidlList.size()!=0){
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
					else{
						code = 90152;
					}
				}
				
				code = 90151;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		map.put("code", code);
		map.put("list", returnList);
		return map;
	}
	//显示分组信息
	@RequestMapping("showinfo")
	public String ShowGroupinfo(HttpServletRequest request){
		int code = 91115;
		String display = request.getParameter("display");
		try {
			long gid = Long.parseLong(request.getParameter("gid"));
			Group group = groupService.getGroup(gid);
			if(group!=null){
				request.setAttribute("group", group);
				if (group.getLeader()!=null) {
					Userinfo leader = userinfoService.getUserinfo(group.getLeader());
					request.setAttribute("leader", leader);
				}
				int count = pcpService.getGroupCount(group.getId());
				request.setAttribute("count", count);
				List<Long> list = pcpService.getUIDsByGID(group.getId());
				if (list!=null&&list.size()!=0) {
					long []ids = new long[list.size()];
					for (int i = 0; i < list.size(); i++) {
						ids[i] = list.get(i);
					}
					List<Userinfo> userinfos = userinfoService.getUserinfos(ids);
					request.setAttribute("userinfos", userinfos);
					code = 91111;
				}
			}
			else {
				code = 91112;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		request.setAttribute("code", code);
		if (display!=null&&display.equals("mobile")) {
			return "jsp/mobile/Groupinfo";
		}
		return "";
	}
	//显示我的分组
	@RequestMapping("mygroup")
	public String MyGroupinfo(HttpServletRequest request){
		int code = 91115;
		String display = request.getParameter("display");
		try {
			long aid = Long.parseLong(request.getParameter("aid"));
			long uid = (long) request.getSession().getAttribute("uid");
			PCP pcp = pcpService.getPcp(uid, aid);
			if (pcp.getGroupid()!=null) {
				Group group = groupService.getGroup(pcp.getGroupid());
				request.setAttribute("group", group);
				if (group.getLeader()!=null) {
					Userinfo leader = userinfoService.getUserinfo(group.getLeader());
					request.setAttribute("leader", leader);
				}
				int count = pcpService.getGroupCount(pcp.getGroupid());
				request.setAttribute("count", count);
				List<Long> list = pcpService.getUIDsByGID(pcp.getGroupid());
				if (list!=null&&list.size()!=0) {
					long []ids = new long[list.size()];
					for (int i = 0; i < list.size(); i++) {
						ids[i] = list.get(i);
					}
					List<Userinfo> userinfos = userinfoService.getUserinfos(ids);
					request.setAttribute("userinfos", userinfos);
					code = 91111;
				}
			}
			else {
				code = 91112;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		request.setAttribute("code", code);
		if (display!=null&&display.equals("mobile")) {
			return "jsp/mobile/MyGroupInfo";
		}
		return "jsp/pc/team";
	}
	//显示我的分组列表
	@RequestMapping("mygroupmanage")
	public String MyGroupList(HttpServletRequest request){
		int code = 91125;
		String display = request.getParameter("display");
		try {
			long uid = (long) request.getSession().getAttribute("uid");
			List<Group> list = groupService.getGroupsByLeader(uid);
			if(list!=null&&list.size()!=0){
				request.setAttribute("list", list);
				code = 90121;
			}
			else{
				code = 90122;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		request.setAttribute("code", code);
		if (display!=null&&display.equals("mobile")) {
			return "jsp/mobile/MyGroupList";
		}
		return "";
	}
	
	
	@RequestMapping("mypcgroupmanage")
	public String MyGroupListInPC(HttpServletRequest request){
		int code = 91125;
		String display = request.getParameter("display");
		try {
			long uid = (long) request.getSession().getAttribute("uid");
			List<PCP> list = pcpService.getPcpByUID(uid);
			System.out.println("list size:" + list.size());
			long[] groupids = new long[list.size()];
			if(list.size() != 0 && list != null){
				for(int i = 0;i < list.size();i++){
					if(list.get(i).getGroupid() != null){
						groupids[i] = list.get(i).getGroupid();
					}
				}
			}
			List<ReturnMyGroup> grouplist = groupService.getGroupsByGID(groupids);
			if(grouplist!=null&&grouplist.size()!=0){
				request.setAttribute("list", grouplist);
				code = 90121;
			}
			else{
				code = 90122;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		request.setAttribute("code", code);
		if (display!=null&&display.equals("mobile")) {
			return "jsp/mobile/MyGroupList";
		}
		return "jsp/pc/team";
	}
	
	@RequestMapping("tocreate")
	public String ToCreateGroup(HttpServletRequest request){
		String display = request.getParameter("display");
		try {
			long aid = Long.parseLong(request.getParameter("aid"));
			Activity activity = activityService.getActicity(aid);
			request.setAttribute("activity", activity);
		} catch (Exception e) {
			e.printStackTrace();
		}
		if (display!=null&&display.equals("mobile")) {
			return "jsp/mobile/CreateGroup";
		}
		return "";
	}
	//创建小组
	@ResponseBody
	@RequestMapping("create")
	public Map<String, Object> CreateGroup(HttpServletRequest request){
		Map<String, Object> map = new HashMap<String, Object>();
		int code = 91135;
		
		long uid = (long) request.getSession().getAttribute("uid");
		try {
			long aid = Long.parseLong(request.getParameter("aid"));
			String groupname = request.getParameter("groupname");
			String description = request.getParameter("description");
			int maxcount = Integer.parseInt(request.getParameter("maxcount"));
			code = groupService.createGroup(aid, uid,groupname, description, maxcount);
			if(code%10==1){
				Group group = groupService.getGroupByAIDAndLeader(aid, uid);
				System.out.println(group.getId());
				PCP pcp = pcpService.getPcp(uid, aid);
				System.out.println(pcp.getId());
				if(pcp!=null){
					code = pcpService.setGroup(pcp.getId(), group.getId());
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		map.put("code", code);
		return map;
	}
	@RequestMapping("tojoin")
	public String ToJoinGroup(HttpServletRequest request){
		String display = request.getParameter("display");
		try {
			long aid = Long.parseLong(request.getParameter("aid"));
			List<Group> AllList = groupService.getGroupsByAID(aid);
			List<Group> acceptable = new ArrayList<Group>();
			for (Group group : AllList) {
				if(!pcpService.testGroupIsFull(group.getId(), group.getMaxcount())){
					acceptable.add(group);
				}
			}
			if(acceptable.size()==0){
				request.setAttribute("aid", aid);
				acceptable=null;
			}
			request.setAttribute("list", acceptable);
		} catch (Exception e) {
			e.printStackTrace();
		}
		if (display!=null&&display.equals("mobile")) {
			return "jsp/mobile/GroupApplyList";
		}
		return "jsp/pc/GroupApplyList";
	}
	@RequestMapping("topcjoin")
	public String ToPCJoinGroup(HttpServletRequest request){
		String display = request.getParameter("display");
		try {
			long aid = Long.parseLong(request.getParameter("aid"));
			List<ReturnMyGroup> AllList = groupService.getPCGroupsByAID(aid);
			List<ReturnMyGroup> acceptable = new ArrayList<ReturnMyGroup>();
			for (ReturnMyGroup group : AllList) {
				if(!pcpService.testGroupIsFull(group.getId(), group.getNumber())){
					acceptable.add(group);
				}
			}
			if(acceptable.size()==0){
				request.setAttribute("aid", aid);
				acceptable=null;
			}
			request.setAttribute("list", acceptable);
		} catch (Exception e) {
			e.printStackTrace();
		}
		if (display!=null&&display.equals("mobile")) {
			return "jsp/mobile/GroupApplyList";
		}
		return "jsp/pc/GroupApplyList";
	}
}
