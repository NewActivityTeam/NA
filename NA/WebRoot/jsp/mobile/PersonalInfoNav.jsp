<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
  <head> 
    <title>My JSP 'PersonalInfoNav.jsp' starting page</title>
	<meta name="viewport" content="width=device-width,initial-sacle=1">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/js/jquery.mobile-1.4.5/jquery.mobile-1.4.5.min.css">
  	<script src="${pageContext.request.contextPath}/js/jQuery/jquery-1.12.0.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/jquery.mobile-1.4.5/jquery.mobile-1.4.5.min.js"></script>
  </head>
  
  <body>
    <div data-role="page">
    	<div data-role="header">
    		<a href="" data-rel="back">返回</a>
    		<h1>信息设置</h1>
    	</div>
    	<div data-role="content">
    		<ul data-role="listview" data-inset="true">
    			<li><a data-ajax="false" href="${pageContext.request.contextPath}/user/getuserinfo?display=mobile">用户信息</a></li>
    			<li><a data-ajax="false"  href="${pageContext.request.contextPath}/user/getJoinedActivities?display=mobile">我的活动</a></li>
    			<li><a data-ajax="false"  href="${pageContext.request.contextPath}/test/group/mygroupmanage?display=mobile">小组管理</a></li>
    			<li><a href="#">设置</a></li>
    		</ul>
    	</div>
    </div>
  </body>
</html>
