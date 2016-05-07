<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>
<html>
	<head>
		<meta name="viewport" content="width=device-width,initial-sacle=1">
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
				<ul data-role="listview" >
			  	<c:if test="${code%10==1}">
				  	<c:if test="${list!=null}">
					  	<c:forEach var="group" items="${list}">
					  		<li data-role="list-divider">${group.groupname}</li>
					  		<li data-icon="false" >
					  		<a data-ajax="false"  href="${pageContext.request.contextPath}/test/groupapply/showapplaybygid?display=mobile&gid=${group.id}">
					  			<p>描述：<b>${group.description}</b></p>
					  			<p>人数上限：<b>${group.maxcount}</b></p>
					  		</a></li>
					  	</c:forEach>
				  	</c:if>
			  	</c:if>
			  	<c:if test="${code%10==2}">
			  		<h1>您尚未创建小组或并未担任小组组长</h1>
			  	</c:if>
			  	</ul>
			</div>
		</div>
	</body>
</html>
