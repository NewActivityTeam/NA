<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE>
<html>
  <head>
  	<title>轻活动</title>
  	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
  	<link rel="stylesheet" href="${pageContext.request.contextPath}/js/jquery.mobile-1.4.5/jquery.mobile-1.4.5.min.css">
  	<script src="${pageContext.request.contextPath}/js/jQuery/jquery-1.12.0.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/jquery.mobile-1.4.5/jquery.mobile-1.4.5.min.js"></script>
  	<script type="text/javascript">
  		$(document).ready(function(){
  			$("#main").load("${pageContext.request.contextPath}/test/activity/activity_list?display=mobile&state=true");
  			$("#running").on("click",function(){
  				$("#main").load("${pageContext.request.contextPath}/test/activity/activity_list?display=mobile&state=true");
  			});
  			$("#end").on("click",function(){
  				$("#main").load("${pageContext.request.contextPath}/test/activity/activity_list?display=mobile&state=false");
  			});
  		});
  	</script>
  </head>
  <body>

	  <div data-role="page">
		  <div data-role="header" data-position="fixed">
		  	<a data-ajax="false" data-role="button" data-rel="back" data-icon="delete">关闭</a>
			   	<h1>轻活动</h1>
			<a data-ajax="false" id="touser" href="${pageContext.request.contextPath}/test/user/toNavigation?display=mobile" data-role="button" data-icon="user">个人中心</a>  
		  </div>
		
		  <div data-role="content" id="main" class="ui-content">
		  		
		  </div>
		  
			<div data-role="footer" data-position="fixed">
				<div data-role="navbar">
				    <ul>
				      <li><a id="running">进行中</a></li>
				      <li><a id="end">已结束</a></li>
				    </ul>
				 </div>
			</div>
	  </div>
	  

  </body>
</html>
