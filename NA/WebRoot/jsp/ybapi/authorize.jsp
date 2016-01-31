<%@page import="cn.yiban.open.FrameUtil"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
		String appid = "4d66c2ae613bf94d";
		String secrt = "fee6214c7160d328207e1f8fa25869bd";
		String cburl = "http://f.yiban.cn/iapp28291";
		
		FrameUtil util = new FrameUtil(request, response, appid, secrt, cburl);
		boolean result = util.perform();
		if(result){
			String userid    = util.getUserId();
			String username = util.getUserName();
			String acctoken  = util.getAccessToken();
			System.out.println("uid:"+userid+" username:"+username+ " acctoken:"+acctoken);
			
		}
%>
