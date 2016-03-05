<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
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
			<c:if test="${code%10==1}">
				<ul data-role="listview" data-inset="true">
					<li data-role="list-divider">基本信息</li>
					<li data-icon="none">组名：<div style="float: right;" id ="groupname">${group.groupname}</div></li>
					<li data-icon="none">小组描述：<div style="float: right;" id ="description">${group.description}</div></li>
					<li data-icon="none">组长：<div style="float: right;" id ="leader">
					<c:if test="${leader!=null}">
						${leader.name}
					</c:if>
					<c:if test="${leader==null}">
						无
					</c:if></div></li>
					<li data-icon="none">人数上限：<div style="float: right;" id ="maxcount">${group.maxcount}</div></li>
					<li data-role="list-divider">组员名单</li>
					<c:forEach var="userinfo" items="${userinfos}">
						<li data-icon="none">姓名：<div style="float: right;">${userinfo.name}</div></li>
					</c:forEach>
				</ul>
			</c:if>
			<c:if test="${code%10==1}">
				
			</c:if>
			</div>
		</div>
	</body>
</html>
