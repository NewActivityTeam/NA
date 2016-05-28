<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/js/jquery.mobile-1.4.5/jquery.mobile-1.4.5.min.css">
		<script src="${pageContext.request.contextPath}/js/jQuery/jquery-1.12.0.min.js"></script>
		<script src="${pageContext.request.contextPath}/js/jquery.mobile-1.4.5/jquery.mobile-1.4.5.min.js"></script>
		<title>组队信息</title>
		<script>
	$(function() {
		var winWidth, winHeight;
		Resize = function() {
			winWidth = $(window).width(), winHeight = $(window).height();
		}
	});
</script>
	</head>

	<body onResize="Resize()" onLoad="Resize()">
		<div data-role="page">
			<div data-role="header" data-theme="b">
		  		<a data-role="button" data-rel="back" data-icon="arrow-l"
				data-iconpos="notext">返回</a>
			   	<h1>组队信息</h1>
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
						待定
					</c:if></div></li>
					<li data-icon="none">人数上限：<div style="float: right;" id ="maxcount">${group.maxcount}</div></li>
					<li data-role="list-divider">组员名单</li>
					<c:forEach var="userinfo" items="${userinfos}">
						<li data-icon="none">姓名：<div style="float: right;">${userinfo.name}</div></li>
					</c:forEach>
				</ul>
			</c:if>
			<c:if test="${code%10==2}">	
				<p style="text-align: center; font-size: 3ex;">您还未参加任何小组，请等待管理员分配或点击下面按钮创建或参加小组</p>
				<a data-ajax="false"  href="${pageContext.request.contextPath}/test/group/tojoin?display=mobile&aid=${aid}" data-role="button" style="background: #55ccff">参加小组</a>
				<a data-ajax="false"  href="${pageContext.request.contextPath}/test/group/tocreate?display=mobile&aid=${aid}" data-role="button">创建一个小组</a>
				
			</c:if>
			</div>
		</div>
		<div id="foot-sign" data-role="footer" data-position="fixed">
		</div>
	</body>
</html>
