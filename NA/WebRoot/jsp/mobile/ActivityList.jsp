<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.sql.Timestamp"%>
<c:set var="now" value="<%=System.currentTimeMillis()%>" />


<!DOCTYPE>
<html>
  <head>
  	<title>轻活动</title>
  	<meta charset="UTF-8">

	<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 新 Bootstrap 核心 CSS 文件 -->
<link rel="stylesheet"
	href="http://cdn.bootcss.com/twitter-bootstrap/3.0.3/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/js/jquery.mobile-1.4.5/jquery.mobile-1.4.5.min.css">
<script
	src="${pageContext.request.contextPath}/js/jQuery/jquery-1.12.0.min.js"></script>
<script
	src="${pageContext.request.contextPath}/js/jquery.mobile-1.4.5/jquery.mobile-1.4.5.min.js"></script>
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
<script>
$(function(){
    var winWidth,winHeight;
    Resize = function(){
        winWidth = $(window).width(),
        winHeight= $(window).height();
    }
});
function sign(aid){
  				$.ajax({
  					url : "${pageContext.request.contextPath}/user/join",
  					type : "POST",
  					data : {
  						aid : aid
  					},
  					dataType : "json",
  					success : function(data){
  						if(data.code!=null){
  							if(data.code%10==1){
  								$("#toset").hide();
  								$("#messageConent").text("参与成功");
  								$("#messageBox").popup("open");
  							}
  							else if(data.code%10==2){
  								$("#toset").hide();
  								$("#messageConent").text("您已参与或该活动，无需重复参加");
  								$("#messageBox").popup("open");
  							}
  							else if(data.code%10==6){
  								$("#messageConent").text("您尚未填写个人信息，请完善个人信息后参与活动");
  								$("#toset").show();
  								$("#messageBox").popup("open");
  							}
  							else if(data.code%10==9){
  								$("#toset").hide();
  								$("#messageConent").text("您暂时被管理员禁止参与活动，参与失败");
  								$("#messageBox").popup("open");
  							}
  							else{
  								$("#toset").hide();
  								$("#messageConent").text("参与失败");
  								$("#messageBox").popup("open");
  							}
  						}
  					},
  					error : function(){
  						alert("AJAX失败");
  					}
  				});
  			}

</script>
 </head>
  <body onResize="Resize()" onLoad="Resize()">
<div data-role="page">
	<div data-role="header" data-position="fixed" data-theme="b">
			<a data-ajax="false"  data-role="button" data-icon="home" data-iconpos="notext">返回</a>
		<h1>轻活动</h1>
		<%-- <a data-ajax="false" id="touser"
			href="${pageContext.request.contextPath}/user/toNavigation?display=mobile"
			data-role="button" data-icon="user">个人中心</a> --%>
		<div data-role="navbar" style="text-align:center;">
			<ul style="height:20px;">
				<li><a href="${pageContext.request.contextPath}/activity/activity_list?display=mobile&state=true" style="background-color:#29c1e8;"><h5 style="margin:0">进行中</h5></a></li>
				<li><a href="${pageContext.request.contextPath}/activity/activity_list?display=mobile&state=false" style="background-color:#29c1e8;"><h5 style="margin:0">已结束</h5></a></li>
					<li><a href="${pageContext.request.contextPath}/activity/activity_list?display=mobile&state=true" style="background-color:#29c1e8;"><h5 style="margin:0">最新</h5></a></li>
				<li><a href="${pageContext.request.contextPath}/activity/activity_list?display=mobile&state=true" style="background-color:#29c1e8;"><h5 style="margin:0">最热</h5></a></li>
			</ul>
		</div>
	</div>
	<div data-role="content" id="main" class="ui-content" style="background-color:#DDDDDD">
		<ul data-role="listview">
			<c:if test="${code%10==1}">
				<c:if test="${list!=null}">
					<c:forEach var="activitywith" items="${list}">
						<li data-icon="false" style="margin-top:1%;">
							<div>
							<div>
									<a data-ajax="false"
							href="${pageContext.request.contextPath}/activity/activity_show?display=mobile&aid=${activitywith.activity.id}"
							target="_parent"><img
										src="<%=request.getContextPath() %>/upload/${activitywith.activity.logo}" style="float:left;width:25%;height:14%;"></a>
								</div>
								<div style="float:left;margin-left:3%;width:72%;height:14%;"> 
									<p class="title" style="margin-top:0;font-size:1.0em;">
										<a data-ajax="false" style="color:black;font-family:楷体"
							href="${pageContext.request.contextPath}/activity/activity_show?display=mobile&aid=${activitywith.activity.id}"
							target="_parent">${activitywith.activity.title}</a>
									
									</p>
									<span style="color:silver;float:right;font-size:0.8em;margin-top:0.4em">${activitywith.activity.starttime.toString().substring(0,10)}</span>
									<c:if test="${activitywith.number > 3 }">
										<img src="<%=request.getContextPath()%>/images/hot.bmp"
											style="margin-top:0.2em;margin-left:0.2em;width:1.0em;height:1.0em;">
									</c:if>
									<c:if
										test="${(now - activitywith.activity.createtime.getTime()) / (1000 * 86400) < 3 }">
										<img src="<%=request.getContextPath()%>/images/new.bmp"
											style="margin-top:0.2em;margin-left:0.2em;width:1.0em;height:1.0em;">
									</c:if>
									
									<p class="address">
										<i class="glyphicon glyphicon-map-marker" style="color:silver;font-size:0.8em;"></i>&nbsp;${activitywith.activity.address}
									</p>
									<p class="address">
										<i class="glyphicon glyphicon-time" style="color:silver;font-size:0.8em"></i>&nbsp;报名截止：${activitywith.activity.endsigntime.toString().substring(0,16)}
									</p>
									<hr style="margin-top:0;margin-bottom:0;clear:both;width:100%">
									<c:if test="${activitywith.activity.number == 1 }">
										<p class="people" style="font-size:1.0em;">参与方式：单人</p>
									</c:if>
									<c:if test="${activitywith.activity.number != 1 }">
										<p class="people" style="font-size:1.0em;">参与方式：${activitywith.activity.number }人</p>
									</c:if>
									<button onclick="sign(${activitywith.activity.id})" style="background:#ff8e1b;color:white;font-family:楷体;border:1;padding:2;display:inline;float:right;width:30%;">报名</button>
								</div>
								</div>
						</li>
					</c:forEach>
				</c:if>
				<c:if test="${list==null}">
					<h2 style="text-align: center; color: blue;">此类活动暂时为空</h2>
				</c:if>
			</c:if>
			<c:if test="${code%10!=1}">
				<h1>查询异常</h1>
			</c:if>
		</ul>
	</div>
<div data-role="popup" id="messageBox" class="ui-content" data-overlay-theme="b" style="text-align: center;" >
	  	  <a data-rel="back" class="ui-btn ui-corner-all ui-shadow ui-btn ui-icon-delete ui-btn-icon-notext ui-btn-right" >关闭</a>
	  		<div id="messageConent"></div>
	  		<a id="toset" data-ajax="false" href="${pageContext.request.contextPath}/test/user/setuserinfo?display=mobile" class="ui-btn" style="display: none;">去设置</a>
	  		<a data-rel="back" class="ui-btn">返回</a>
	  		
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