package com.na.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.na.entity.Activity;
import com.na.entity.Group;
import com.na.entity.PCP;
import com.na.entity.Userinfo;
import com.na.entity.nodb.ReturnMyActivity;
import com.na.service.ActivityService;
import com.na.service.AssessService;
import com.na.service.CommentService;
import com.na.service.GroupService;
import com.na.service.PCPService;
import com.na.service.UserinfoService;

@Controller
@RequestMapping("/user")
public class UserController {
	private final static int PAGE_SIZE = 4;
	@Autowired
	UserinfoService userinfoService;
	@Autowired
	PCPService pcpService;
	@Autowired
	ActivityService activitySercice;
	@Autowired
	GroupService groupService;
	@Autowired
	AssessService assessService;
	//获取用户个人信息
	@RequestMapping("/getuserinfo")
	public String getUserinfo(HttpServletRequest request){
		String display = request.getParameter("display");
		try {
			if(request.getSession().getAttribute("uid") != null){
				request.setAttribute("state", 1);
				long uid =Long.parseLong(request.getSession().getAttribute("uid").toString());
				Userinfo userinfo = userinfoService.getUserinfo(uid);
				if (userinfo!=null) {
					request.setAttribute("userinfo", userinfo);
				}	
			}else{
				request.setAttribute("state", 0);
				request.setAttribute("message", "对不起，请先登录易班!");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		if (display!=null&&display.endsWith("mobile")) {
			return "jsp/mobile/Userinfo";
		}
		return "";
	}
	
	//跳转到用户中心页面
	@RequestMapping("/toNavigation")
	public String toNav(HttpServletRequest request){
		String display = request.getParameter("display");
		if(display != null && display.endsWith("mobile")){
			return "jsp/mobile/PersonalInfoNav";
		}
		return "";
	}
	
	@RequestMapping("/getJoinedActivities")
	public String getJoinedActivities(HttpServletRequest request){
		String display = request.getParameter("display");
		if(request.getSession().getAttribute("uid") != null){
			request.setAttribute("state", 1);
			long uid = Long.parseLong(request.getSession().getAttribute("uid").toString());
			List<ReturnMyActivity> mylist = new ArrayList<ReturnMyActivity>();
			List<Long> listOfAid = pcpService.getAIDsByUID(uid); 
			if(listOfAid != null && listOfAid.size() != 0){
				long[] ids = new long[listOfAid.size()];
				for(int i = 0;i < listOfAid.size();i++){
					ids[i] = listOfAid.get(i);
				}
				List<Activity> list = activitySercice.getActivitiesByIds(ids);
				if(list != null && list.size() > 0){
					for(int i = 0;i < list.size();i++){
						Activity activity = list.get(i);
						ReturnMyActivity myActivity = new ReturnMyActivity();
						myActivity.setActivity(activity);
						PCP pcp = pcpService.getPcp(uid, activity.getId());
						myActivity.setPcp(pcp);
						if(pcp.getGroupid() != null){
							Group group = groupService.getGroup(pcp.getGroupid());
							myActivity.setGroup(group);
						}
						if(assessService.getAssess(uid, activity.getId()) != null){
							myActivity.setComment(true);
						}else{
							myActivity.setComment(false);
						}
						mylist.add(myActivity);
					}
				}
				request.setAttribute("list", mylist);
			}
		}else{
			request.setAttribute("state", 0);
			request.setAttribute("message", "对不起，请先登录易班!");
		}
		if(display != null && display.equals("mobile")){
			return "jsp/mobile/JoinedActivityList";
		}
		return "jsp/pc/MyActivity";
	}
	public int getJoinedActivitiesCount(long uid){
		return userinfoService.getJoinedActivityNumber(uid);
	}
	@RequestMapping("/getJoinedActivitiesInPC")
	public String getJoinedActivitiesInPC(HttpServletRequest request){
		if(request.getSession().getAttribute("uid") != null){
			request.setAttribute("state", 1);
			long uid = Long.parseLong(request.getSession().getAttribute("uid").toString());
			int total = 0;
			int page = 0;
			int pages = 0;
			List<ReturnMyActivity> mylist = new ArrayList<ReturnMyActivity>();
			List<Long> listOfAid = pcpService.getAIDsByUID(uid);
			if(listOfAid != null && listOfAid.size() != 0){
				long[] ids = new long[listOfAid.size()];
				for(int i = 0;i < listOfAid.size();i++){
					ids[i] = listOfAid.get(i);
				}
				List<Activity> list = activitySercice.getActivitiesByIds(ids);
				total = list.size();
				page = Integer.parseInt(request.getParameter("page"));
				if(total % PAGE_SIZE == 0){
					pages = total / PAGE_SIZE;
				}else{
					pages = total / PAGE_SIZE + 1;
				}
				if(list != null){
					/*for(Activity activity : list)*/
					for(int i = (page - 1) * PAGE_SIZE;i < page * PAGE_SIZE;i++){
						if(i < total){
							Activity activity = list.get(i);
							ReturnMyActivity myActivity = new ReturnMyActivity();
							myActivity.setActivity(activity);
							PCP pcp = pcpService.getPcp(uid, activity.getId());
							myActivity.setPcp(pcp);
							if(pcp.getGroupid() != null){
								Group group = groupService.getGroup(pcp.getGroupid());
								myActivity.setGroup(group);
							}
							if(assessService.getAssess(uid, activity.getId()) != null){
								myActivity.setComment(true);
							}else{
								myActivity.setComment(false);
							}
							mylist.add(myActivity);
						}
					}
				}
			}
			List<Activity> res = activitySercice.getNewestActivities();
			List<Activity> newlist = new ArrayList<Activity>();
			if(res.size() > 4){
				for(int i = 0;i < 4;i++){
					newlist.add(res.get(i));
				}
			}else{
				newlist = res;
			}
			request.setAttribute("total", pages);
			request.setAttribute("newlist", newlist);
			request.setAttribute("list", mylist);
			request.setAttribute("current", page);
		}else{
			request.setAttribute("state", 0);
			request.setAttribute("message", "请先登录易班!");
		}
		return "jsp/pc/MyActivity"; 
	}
	@ResponseBody
	@RequestMapping("/getJoinedActivitiesInPCOfPaging")
	public Map<String,Object> getJoinedActivitiesInPCOfPaging(HttpServletRequest request){
		Map<String,Object> map = new HashMap<String,Object>();
		if(request.getSession().getAttribute("uid") != null){
			long uid = Long.parseLong(request.getSession().getAttribute("uid").toString());
			int total = getJoinedActivitiesCount(uid);
			int page = Integer.parseInt(request.getParameter("page"));
			int pages = 0;
			if(total % PAGE_SIZE == 0){
				pages = total / PAGE_SIZE;
			}else{
				pages = total / PAGE_SIZE + 1;
			}
			List<ReturnMyActivity> mylist = new ArrayList<ReturnMyActivity>();
			List<Long> listOfAid = pcpService.getAIDsByUID(uid); 
			long[] ids = new long[listOfAid.size()];
			for(int i = 0;i < listOfAid.size();i++){
				ids[i] = listOfAid.get(i);
			}
			List<Activity> list = activitySercice.getActivitiesByIds(ids);
			if(list != null){
				/*for(Activity activity : list)*/
				for(int i = (page - 1) * PAGE_SIZE;i < page * PAGE_SIZE;i++){
					if(i < total){
						Activity activity = list.get(i);
						ReturnMyActivity myActivity = new ReturnMyActivity();
						myActivity.setActivity(activity);
						PCP pcp = pcpService.getPcp(uid, activity.getId());
						myActivity.setPcp(pcp);
						if(pcp.getGroupid() != null){
							Group group = groupService.getGroup(pcp.getGroupid());
							myActivity.setGroup(group);
						}
						if(assessService.getAssess(uid, activity.getId()) != null){
							myActivity.setComment(true);
						}else{
							myActivity.setComment(false);
						}
						mylist.add(myActivity);
					}
				}
			}
			List<Activity> res = activitySercice.getNewestActivities();
			List<Activity> newlist = new ArrayList<Activity>();
			if(res.size() > 4){
				for(int i = 0;i < 4;i++){
					newlist.add(res.get(i));
				}
			}else{
				newlist = res;
			}
			map.put("total", pages);
			map.put("newlist", newlist);
			map.put("list", mylist);
		}else{
			request.setAttribute("state", 0);
			request.setAttribute("message", "请先登录易班!");
		}
		
		return map; 
	}

	//设置用户个人信息
	@RequestMapping("/setuserinfo")
	public String setuserinfo(HttpServletRequest request){
		String display = request.getParameter("display");
		try {
			long uid =Long.parseLong(request.getSession().getAttribute("uid").toString());
			Userinfo userinfo = userinfoService.getUserinfo(uid);
			if (userinfo!=null) {
				request.setAttribute("userinfo", userinfo);
			}
		}
		catch(Exception e){
			e.printStackTrace();
		}
		if (display!=null&&display.endsWith("mobile")) {
			return "jsp/mobile/Setinfo";
		}
		return "";
	}
	//修改用户个人信息
	@ResponseBody
	@RequestMapping("/changeinfo")
	public Map<String, Integer> changeUserinfo(HttpServletRequest request){
		Map<String, Integer> map = new HashMap<String, Integer>();
		int code = 11025;
		try {
			long uid =(long) request.getSession().getAttribute("uid");
			Userinfo userinfo = userinfoService.getUserinfo(uid);
			int subject = Integer.parseInt(request.getParameter("subject"));
			String content = request.getParameter("content");
			code = userinfoService.updateUserinfo(uid, subject, content);
			
		}
		catch(Exception e){
			e.printStackTrace();
		}
		map.put("code", code);
		return map;
	}

	/***
	 * 获取用户信息，通过AID
	 *
	 * @param request
	 * 		id		活动id
	 * 
	 * @return
	 * 
	 * 		code	返回值
	 * 		list	用户信息列表
	 */
	@RequestMapping("/getusersbyids")
	public String getUserinfoByAID(HttpServletRequest request){
		Map<String, Object> map = new HashMap<String, Object>();
		int code = 90135;
		try {
			long aid = (long)Integer.parseInt(request.getParameter("id"));
			List<Long> uidList = pcpService.getUIDsByAID(aid);
			if(uidList != null){
				long[] ids = new long[uidList.size()];
				for (int i = 0; i < uidList.size(); i++) {
					ids[i] = uidList.get(i);
				}
				List<Userinfo> userinfos = userinfoService.getUserinfos(ids);
				if (userinfos!=null&&userinfos.size()!=0) {
					map.put("list", userinfos);
					code = 90131;
				}
				else{
					code = 90134;
				}
			}
			else{
				map.put("list", null);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		map.put("code", code);
		request.setAttribute("map", map);
		return "/jsp/PartiInfo";
	}
	
	@RequestMapping(value = "/upload",method = RequestMethod.POST)
	public String upload(HttpServletRequest request){
		return "";
	}
	
	/***
	 * 
	 * @param request
	 * uid		被ban用户ID
	 * bandays	禁止天数
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/banuser")
	public Map<String, Object> BanUser(HttpServletRequest request){
		Map<String, Object> map = new HashMap<String, Object>();
		int code = 70015;
		try {
			long uid = Long.parseLong(request.getParameter("uid"));
			int bandays = Integer.parseInt(request.getParameter("bandays"));
			code = userinfoService.banUser(uid, bandays);
		} catch (Exception e) {
			e.printStackTrace();
		}
		map.put("code", code);
		return map;
	}
	
	/***
	 * 参与活动
	 * @param 	
	 * 		uid		后台获取session
	 * 		aid		要参与的活动id
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/join")
	public  Map<String, Integer> joinToActivity(HttpServletRequest request){
		Map<String, Integer> map = new HashMap<String, Integer>();
		int code = 14015;
		try {
			 if(request.getSession().getAttribute("uid")!=null){
				long uid = (long) request.getSession().getAttribute("uid");
				if (userinfoService.getUserinfo(uid).getSex()==null) {
					code = 14016;
				}
				else if (userinfoService.testBan(uid)) {
					code = 14019;
				}
				else{
					long aid = Long.parseLong(request.getParameter("aid"));
					code = pcpService.newPCP(uid, aid);
				}
			 }
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
		map.put("code", code);
		return map;
	}
	
	/***
	 * 保存用户信息
	 * @param 
	 * 		uid		用户id
	 * 		name	用户名
	 * 		height	身高
	 * 		weight	体重
	 * 		age		年龄
	 * 		sex		性别
	 * 		phone	手机号
	 * 		email	电子邮箱
	 */
	@ResponseBody
	@RequestMapping("/saveinfo")
	public Map<String, Integer> saveUserinfo(HttpServletRequest request){
		Map<String, Integer> map = new HashMap<String, Integer>();
		int code = 11015;
		try {
			long uid =(long) request.getSession().getAttribute("uid");
			String name = request.getParameter("name");
			float height = Float.parseFloat(request.getParameter("height"));
			float weight = Float.parseFloat(request.getParameter("weight"));
			int age = Integer.parseInt(request.getParameter("age"));
			int sex = Integer.parseInt(request.getParameter("sex"));
			String phonenumber = request.getParameter("phone");
			String email = request.getParameter("email");
			Userinfo userinfo = userinfoService.getUserinfo(uid);
			code = userinfoService.setUserinfo(uid, name, height, weight, age, sex, phonenumber, email);
		}
		catch(Exception e){
			e.printStackTrace();
		}
		map.put("code", code);
		return map;
	}
	
	@RequestMapping("turnToPerInfo")
	public String turnToPerInfo(HttpServletRequest request){
		if(request.getSession().getAttribute("uid") != null){
			request.setAttribute("state", 1);
			long uid =Long.parseLong(request.getSession().getAttribute("uid").toString());
			Userinfo user = userinfoService.getUserinfo(uid);
			if(user.getSex() == null){
				request.setAttribute("isRegister", 0);
			}else{
				request.setAttribute("isRegister", 1);
				request.setAttribute("user", user);
			}
			List<Activity> res = activitySercice.getNewestActivities();
			List<Activity> newlist = new ArrayList<Activity>();
			if(res.size() > 4){
				for(int i = 0;i < 4;i++){
					newlist.add(res.get(i));
				}
			}else{
				newlist = res;
			}
			request.setAttribute("newlist", newlist);
		}else{
			request.setAttribute("state", 0);
			request.setAttribute("message", "请先登录易班!");
		}
		
		return "jsp/pc/MyInfo";
	}

}
