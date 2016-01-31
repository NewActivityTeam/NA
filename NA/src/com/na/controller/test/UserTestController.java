package com.na.controller.test;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.na.entity.Userinfo;
import com.na.service.PCPService;
import com.na.service.UserinfoService;

@Controller
@RequestMapping("/test/user")
public class UserTestController {
	
	@Autowired
	UserinfoService userinfoService;
	@Autowired
	PCPService pcpService;
	
	//随机创建Users
	@ResponseBody
	@RequestMapping("/newusers")
	public Map<String, Object> newUsers(HttpServletRequest request){
		Map<String, Object> map = new HashMap<String, Object>();
		int code = 90115;

		try {
			int count = Integer.parseInt(request.getParameter("count"));
			Random random = new Random();
			int sum = 0;
			for (int i = 0; i < count; i++) {
				long id = random.nextInt(999999)+1000000;
				while (userinfoService.getUserinfo(id)!=null) {
					id = random.nextInt(1000000)+1000000;
				}
				float height = (random.nextFloat()+1)*100;
				float weight = (random.nextFloat()+1)*50;
				int age = random.nextInt(50)+10;
				int sex = random.nextInt(2);
				if(userinfoService.createAndSetUserinfo(id, "aa", 0,"编号"+id, height, weight, age, sex, "11111111111", "11111@163.com")==11011){
					sum++;
				}
			}
			if (sum==count) {
				code = 90111;
			}
			else{
				code = 90114;
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		map.put("code", code);
		return map;
	}

	//获取用户信息，通过AID
	@RequestMapping("/getusers")
	public String getUserinfoByAID(HttpServletRequest request){
		Map<String, Object> map = new HashMap<String, Object>();
		int code = 90135;
		try {
			long aid = Long.parseLong(request.getParameter("aid"));
			List<Long> uidList = pcpService.getUIDsByAID(aid);
			long[] ids = new long[uidList.size()];
			for (int i = 0; i < uidList.size(); i++) {
				ids[i] = uidList.get(i);
			}
			List<Userinfo> userinfos = userinfoService.getUserinfos(ids);
			if (userinfos!=null&&userinfos.size()!=0) {
				System.out.println("成功了，有"+userinfos.size()+"条记录");
				map.put("list", userinfos);
				code = 90131;
			}
			else{
				code = 90134;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		map.put("code", code);
		request.setAttribute("map", map);
		return "jsp/PartInfo";
	}

	//获取用户个人信息
	@RequestMapping("/getuserinfo")
	public String getUserinfo(HttpServletRequest request){
		String display = request.getParameter("display");
		try {
			long uid =Long.parseLong(request.getSession().getAttribute("uid").toString());
			Userinfo userinfo = userinfoService.getUserinfo(uid);
			if (userinfo!=null) {
				request.setAttribute("userinfo", userinfo);
			}	
		} catch (Exception e) {
			e.printStackTrace();
		}
		if (display!=null&&display.endsWith("mobile")) {
			return "jsp/mobile/Userinfo";
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

	//参与活动
	@ResponseBody
	@RequestMapping("/join")
	public  Map<String, Integer> joinToActivity(HttpServletRequest request){
		Map<String, Integer> map = new HashMap<String, Integer>();
		int code = 14015;
		try {
			 if(request.getSession().getAttribute("uid")!=null){
				long uid = (long) request.getSession().getAttribute("uid");
				long aid = Long.parseLong(request.getParameter("aid"));
				code = pcpService.newPCP(uid, aid);
			 }
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
		map.put("code", code);
		return map;
	}


}
