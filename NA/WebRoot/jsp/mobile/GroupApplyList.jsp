<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE>
<html>
<head>
<title>小组列表</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/js/jquery.mobile-1.4.5/jquery.mobile-1.4.5.min.css">
<script
	src="${pageContext.request.contextPath}/js/jQuery/jquery-1.12.0.min.js"></script>
<script
	src="${pageContext.request.contextPath}/js/jquery.mobile-1.4.5/jquery.mobile-1.4.5.min.js"></script>
<script>
	$(function() {
		var winWidth, winHeight;
		Resize = function() {
			winWidth = $(window).width(), winHeight = $(window).height();
		}
	});
</script>
	<style>
.activity:after {
	background-image:
		url("<%=request.getContextPath() %>/images/activity.png");
	background-size: 18px 18px;
}

.title {
	font-family: "黑体";
	float: left;
}

.address {
	font-family: "楷体";
	font-size: 30sp;
	font-style: oblique;
	clear: both;
}
.people {
	font-family: "楷体";
	font-size: 30sp;
	margin-top: -20px;
	font-style: oblique;
	display: inline;
	float:left;
}

.my:after {
	background-image: url("<%=request.getContextPath() %>/images/my.png");
	background-size: 18px 18px;
}

.team:after {
	background-image: url("<%=request.getContextPath() %>/images/team.png");
	background-size: 18px 18px;
}

.info:after {
	background-image: url("<%=request.getContextPath() %>/images/info.png");
	background-size: 18px 18px;
}
</style>
</head>
<body onResize="Resize()" onLoad="Resize()">
	<div data-role="page">
		<div data-role="header" data-theme="b">
			<a data-role="button" data-rel="back" data-icon="arrow-l"
				data-iconpos="notext">返回</a>
			<h1>小组信息</h1>
		</div>
		<div data-role="content" id="main" class="ui-content"
			style="background-color:#f5f5f5;padding-top:0;padding-right:0;padding-left:0;">
			<div style="background:#ffffff;width:100%;margin:0">
				<a data-ajax="false"
					href="${pageContext.request.contextPath}/activity/activity_show?display=mobile&aid=${activity.id}"
					target="_parent"> <img
					style="width:20%;height:10%;padding-left:40%;padding-top:3%;"
					src="<%=request.getContextPath() %>/upload/${activity.logo}">
				</a>
				<p style="text-align:center;margin-top:0">${activity.title}</p>
			</div>
				<ul data-role="listview" style="margin-top:2%">
					<c:if test="${list!=null}">
						<c:forEach var="group" items="${list}">
							<%-- <li data-role="list-divider">${group.groupname}</li> --%>
							<li data-icon="false" style="margin-bottom:2%"><a
								style="background:#ffffff;font-size:1.0em;font-family:楷体;"
								data-ajax="false"
								href="${pageContext.request.contextPath}/test/group/showinfo?display=mobile&gid=${group.id}">
									<div style="padding-left:3%;">${group.groupname }<img
											src="${pageContext.request.contextPath}/images/jiantou.png"
											style="width:20px;height:20px;float:right;">
									</div>
							</a></li>
						</c:forEach>
					</c:if>
					<c:if test="${list==null}">
						<h2 style="text-align: center; color: blue;">此活动暂无可加入小组，请等待管理员分组或创建小组！</h2>
						<a
							href="${pageContext.request.contextPath}/test/group/tocreate?display=mobile&aid=${aid}"
							data-role="button">创建一个小组</a>
					</c:if>
				</ul>
		</div>
		<div data-role="footer" data-position="fixed">
		<div data-role="navbar" data-iconpos="top" class="nav" style="margin-bottom:-5">
			<ul>
				<li><a data-ajax="false"
					href="${pageContext.request.contextPath}/activity/activity_list?display=mobile&state=true"
					class="ui-btn ui-shadow  ui-btn-icon-top activity">活动</a></li>
				<li><a data-ajax="false"
					href="${pageContext.request.contextPath}/user/getJoinedActivities?display=mobile"
					class="ui-btn ui-shadow  ui-btn-icon-top my">我的活动</a></li>
				<li><a data-ajax="false"
					href="${pageContext.request.contextPath}/test/group/mygroupmanage?display=mobile"
					class="ui-btn ui-shadow  ui-btn-icon-top team">我的小组</a></li>
				<li><a data-ajax="false"
					href="${pageContext.request.contextPath}/user/getuserinfo?display=mobile"
					class="ui-btn ui-shadow  ui-btn-icon-top info">个人信息</a></li>
			</ul>
		</div>
	</div>
	</div>
</body>
</html>
