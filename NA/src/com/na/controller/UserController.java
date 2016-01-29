package com.na.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.na.entity.Userinfo;
import com.na.service.PCPService;
import com.na.service.UserinfoService;

@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	UserinfoService userinfoService;
	@Autowired
	PCPService pcpService;
	

	//获取用户信息，通过AID
	@RequestMapping("/getusersbyids")
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
}
