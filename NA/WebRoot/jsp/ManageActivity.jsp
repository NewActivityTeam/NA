<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.na.entity.Activity" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'ManageActivity.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	
	
	
  </head>
  
  <body>
  <div style="height:600px,width:100%,overflow:hidden">
  	<iframe src="<%=request.getContextPath() %>/jsp/ManageActivityOfSearch.jsp" frameborder="0" height="25%" width="100%" name="search"></iframe>
  	 
  </div>
  <div>
  	<iframe src="<%=request.getContextPath() %>/jsp/ManageActivityOfShow.jsp" frameborder="0" height="75%" width="100%" name="show" scrolling="no"></iframe>
  </div>
 
  </body>
</html>
