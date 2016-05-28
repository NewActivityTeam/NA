<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.sql.Timestamp"%>
<c:set var="now" value="<%=System.currentTimeMillis()%>" />
<!DOCTYPE>
<html>
<head>
<title>My JSP 'JoinedActivityList.jsp' starting page</title>
<meta name="viewport" content="width=device-width,initial-scale=1">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/js/jquery.mobile-1.4.5/jquery.mobile-1.4.5.min.css">
<link rel="stylesheet"
	href="http://cdn.bootcss.com/twitter-bootstrap/3.0.3/css/bootstrap.min.css">
<script
	src="${pageContext.request.contextPath}/js/jQuery/jquery-1.12.0.min.js"></script>
<script
	src="${pageContext.request.contextPath}/js/jquery.mobile-1.4.5/jquery.mobile-1.4.5.min.js"></script>
<style>
.activity:after {
	background-image:
		url("<%=request.getContextPath()%>/images/activity.png");
	background-size: 18px 18px;
}

.my:after {
	background-image: url("<%=request.getContextPath()%>/images/my.png");
	background-size: 18px 18px;
}

.team:after {
	background-image: url("<%=request.getContextPath()%>/images/team.png");
	background-size: 18px 18px;
}

.info:after {
	background-image: url("<%=request.getContextPath()%>/images/info.png");
	background-size: 18px 18px;
}

.title {
	font-family: "黑体";
	font-size: 40sp;
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
}
</style>
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
	<c:set var="nowDate" value="<%=new Date()%>"></c:set>
	<div data-role="page">
		<div data-role="header" data-theme="b">
			<a data-ajax="false" data-role="button" data-rel="back"
				data-icon="arrow-l" data-iconpos="notext">返回</a>
			<h1>已参与过的活动</h1>
		</div>
		<div data-role="content" class="ui-content"
			style="background-color:#DDDDDD">
			<c:if test="${state == 0 }">
			${message }
			</c:if>
			<c:if test="${state == 1 }">
			<ul data-role="listview" style="#FFFFFF">
				<c:if test="${list != null}">
					<c:forEach var="myactivity" items="${list }">
						<li data-icon="false" style="margin-top:1%;">
							<div>
								<a data-ajax="false"
									href="${pageContext.request.contextPath}/activity/activity_show?display=mobile&aid=${myactivity.activity.id}"
									target="_parent"> <img
									style="float:left;width:25%;height:14%;"
									src="<%=request.getContextPath() %>/upload/${myactivity.activity.logo}"></a>
							</div>
							<div style="float:left;margin-left:3%;width:72%;height:14%;">
								<p class="title" style="margin-top:0;font-size:1.0em;">
									<a data-ajax="false" style="color:black;font-family:楷体"
										href="${pageContext.request.contextPath}/activity/activity_show?display=mobile&aid=${myactivity.activity.id}"
										target="_parent"><b>${myactivity.activity.title}</b></a>
								</p>
								<span
									style="color:silver;float:right;font-size:0.8em;margin-top:0.4em">${myactivity.activity.starttime.toString().substring(0,10)}</span>

								<p class="address">
									<i class="glyphicon glyphicon-map-marker"
										style="color:silver;font-size:0.8em;"></i>&nbsp;${myactivity.activity.address}
								</p>
								<c:if
									test="${(now - myactivity.activity.starttime.getTime()) < 0 }">
									<p class="address">
										<i class="glyphicon glyphicon-time"
											style="color:silver;font-size:0.8em;"></i>&nbsp;活动状态：<span
											style="color:red">未开始</span>
									</p>
								</c:if>
								<c:if
									test="${(now - myactivity.activity.starttime.getTime()) >= 0 && (now - myactivity.activity.endtime.getTime() < 0) }">
									<p class="address">
										<i class="glyphicon glyphicon-time"
											style="color:silver;font-size:0.8em;"></i>&nbsp;活动状态：<span
											style="color:red">进行中</span>
									</p>
								</c:if>
								<c:if
									test="${(now - myactivity.activity.endtime.getTime()) > 0 }">
									<p class="address">
										<i class="glyphicon glyphicon-time"
											style="color:silver;font-size:0.8em;"></i>&nbsp;活动状态：<span
											style="color:red">已结束</span>
									</p>
								</c:if>
								<hr style="width:100%;margin-top:0;margin-bottom:0;clear:both;">
								<c:if test="${myactivity.activity.number == 1 }">
									<span style="margin-right:6px;" class="address"><span>单人报名</span></span>
								</c:if>
								<c:if
									test="${myactivity.activity.number > 1 && myactivity.group != null }">
									<span style="margin-right:6px;" class="address"><span><strong>组名</strong></span><span>:</span><span>${myactivity.group.groupname }</span></span>
								</c:if>
								<div data-type="horizontal" style="float:right">
									<c:if
										test="${myactivity.activity.number > 1 && myactivity.group == null }">
										<a data-ajax="false"
											href="${pageContext.request.contextPath}/test/group/tocreate?display=mobile&aid=${myactivity.activity.id}"
											data-role="button" data-corners="true"
											style="background:#ff8e1b;font-family:楷体;color:white;margin:5;border:1;padding:2;float:left;">创建队伍</a>
										<a data-ajax="false"
											href="${pageContext.request.contextPath}/test/group/tojoin?display=mobile&aid=${myactivity.activity.id}"
											data-role="button" data-corners="true"
											style="background:#ff8e1b;font-family:楷体;color:white;margin:5;border:1;padding:2;float:left;">选择队伍</a>
									</c:if>
									<c:if test="${now > myactivity.activity.endtime.getTime() }">
										<a href="#anylink" data-role="button" data-corners="true"
											style="background:#ff8e1b;font-family:楷体;color:white;margin:5;border:1;padding:2;float:left;">评分</a>
									</c:if>
								</div>
							</div> <c:if
								test="${myactivity.activity.number > 1 && myactivity.group == null }">
								<p style="color:red;clear:both">您尚未有队伍，请创建或者加入队伍！</p>
							</c:if>
						</li>
					</c:forEach>
				</c:if>
				<c:if test="${list == null }">
					<p>您还未参加任何活动!</p>
				</c:if>
			</ul>
			</c:if>
			
		</div>
		<div data-role="footer" data-position="fixed">
			<div data-role="navbar" data-iconpos="top" class="nav">
				<ul>
					<li style="border:0"><a data-ajax="false"
						href="${pageContext.request.contextPath}/activity/activity_list?display=mobile&state=true"
						class="ui-btn ui-shadow  ui-btn-icon-top activity">活动</a></li>
					<li style="border:0"><a data-ajax="false"
						href="${pageContext.request.contextPath}/user/getJoinedActivities?display=mobile"
						class="ui-btn ui-shadow  ui-btn-icon-top my">我的活动</a></li>
					<li style="border:0"><a data-ajax="false"
						href="${pageContext.request.contextPath}/test/group/mygroupmanage?display=mobile"
						class="ui-btn ui-shadow  ui-btn-icon-top team">我的小组</a></li>
					<li style="border:0"><a data-ajax="false"
						href="${pageContext.request.contextPath}/user/getuserinfo?display=mobile"
						class="ui-btn ui-shadow  ui-btn-icon-top info">个人信息</a></li>
				</ul>
			</div>
		</div>
	</div>
</body>
</html>
