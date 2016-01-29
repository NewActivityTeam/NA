<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'home.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  <body style="overflow:scroll">
  	<table width="100%" height="180%" border="0" cellspacing="0" cellpadding="0">
  		<tr height="80px">
  			<td colspan="3" style="background:white"><iframe name="head" src="<%=request.getContextPath() %>/jsp/head.jsp" width="100%" height="80px"></iframe></td>
  		</tr>
  		<tr>
  			<td width="15%" height="80%"><iframe name="left" src="<%=request.getContextPath()%>/jsp/navigation.jsp" width="100%" height="100%" scrolling="no"></iframe></td>
  			<td width="5%" style="background:white" height="80%"></td>
  			<td width="80%" height="80%"><iframe name="right" src="<%=request.getContextPath()%>/jsp/PublishActivity.jsp" width="100%" height="100%"></iframe></td>
  		</tr>
  		<tr height="80px">
  			<td colspan="3"><iframe name="foot" src="<%=request.getContextPath() %>/jsp/foot.jsp" height="80px" width="100%"></iframe></td>
   		</tr>
  	</table>
  </body>
</html>
