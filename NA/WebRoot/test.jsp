<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'test.jsp' starting page</title>
    
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
    This is a test
    <div id="myDiv" style="background:red;width:400px;height:400px">
    
    </div>
    <form action="test1" method="post">
    <button id="btn1"  style="height:30px;width:30px;"></button>
    </form>
   <!-- jQuery文件，在bootstrap.min.js之前引入 -->
	<script src="http://cdn.bootcss.com/jquery/1.10.2/jquery.min.js"></script>
	<!-- Bootstrap核心JavaScript文件 -->
	<script src="http://cdn.bootcss.com/twitter-bootstrap/3.0.3/js/bootstrap.min.js"></script>

  </body>
  
  
</html>
