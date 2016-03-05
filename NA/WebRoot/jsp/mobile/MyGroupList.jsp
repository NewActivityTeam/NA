<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE>
<html>
	<head>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/js/jquery.mobile-1.4.5/jquery.mobile-1.4.5.min.css">
		<script src="${pageContext.request.contextPath}/js/jQuery/jquery-1.12.0.min.js"></script>
		<script src="${pageContext.request.contextPath}/js/jquery.mobile-1.4.5/jquery.mobile-1.4.5.min.js"></script>
		<title>我的小组</title>
	</head>

	<body>
		<div data-role="page">
			<div data-role="header">
		  		<a data-role="button" data-rel="back" data-icon="back">返回</a>
			   	<h1>我的小组</h1>
			</div>
			
			<div data-role="content" id="main" class="ui-content">
				
			</div>
		</div>
	</body>
</html>
