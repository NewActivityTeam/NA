<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.sql.Timestamp"%>
<c:set var="now" value="<%=new Timestamp(System.currentTimeMillis())%>" />
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'score.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/jsp/pc/css/css.css">
<link rel="stylesheet" type="text/css" media="all"
	href="<%=request.getContextPath()%>/jsp/pc/css/style.css">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/jsp/pc/css/myactivity.css">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/jsp/pc/css/activity.css">
<!-- 新 Bootstrap 核心 CSS 文件 -->
<link rel="stylesheet"
	href="http://cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css">
<!-- 可选的Bootstrap主题文件（一般不用引入） -->
<link rel="stylesheet"
	href="http://cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap-theme.min.css">
	
	
	
<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="http://cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>
<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="http://cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
	
<style type="text/css">
* {
	margin: 0;
	padding: 0;
	list-style-type: none;
}

body {
	color: #666;
	font: 12px/1.5 Arial;
}
/* star */
#star {
	position: relative;
	width: 600px;
	margin: 20px auto;
	height: 24px;
}

#star ul, #star span {
	float: left;
	display: inline;
	height: 19px;
	line-height: 19px;
}

#star ul {
	margin: 0 10px;
}

#star li {
	float: left;
	width: 24px;
	cursor: pointer;
	text-indent: -9999px;
	background: url(<%=request.getContextPath()%>/images/star.png)
		no-repeat;
}

#star strong {
	color: #f60;
	padding-left: 10px;
}

#star li.on {
	background-position: 0 -28px;
}

#star p {
	position: absolute;
	top: 20px;
	width: 159px;
	height: 60px;
	display: none;
	background: url(<%=request.getContextPath()%>/images/icon.gif)
		no-repeat;
	padding: 7px 10px 0;
}

#star p em {
	color: #f60;
	display: block;
	font-style: normal;
}
</style>

<script type="text/javascript">
	$(document).ready(
			function() {
				var oStar = document.getElementById("star");
				var aLi = oStar.getElementsByTagName("li");
				var oUl = oStar.getElementsByTagName("ul")[0];
				var oSpan = oStar.getElementsByTagName("span")[1];
				var oP = oStar.getElementsByTagName("p")[0];
				var i = iScore = iStar = 0;
				var aMsg = [ "很不满意|活动太离谱", "不满意|活动差强人意", "一般|哈哈蛮去", "满意|活动很不错",
						"非常满意|活动非常好" ]

				for (i = 1; i <= aLi.length; i++) {
					aLi[i - 1].index = i;

					//鼠标移过显示分数
					aLi[i - 1].onmouseover = function() {
						fnPoint(this.index);
						//浮动层显示
						oP.style.display = "block";
						//计算浮动层位置
						oP.style.left = oUl.offsetLeft + this.index
								* this.offsetWidth - 104 + "px";
						//匹配浮动层文字内容
						oP.innerHTML = "<em><b>" + this.index + "</b> 分 "
								+ aMsg[this.index - 1].match(/(.+)\|/)[1]
								+ "</em>"
								+ aMsg[this.index - 1].match(/\|(.+)/)[1]
					};

					//鼠标离开后恢复上次评分
					aLi[i - 1].onmouseout = function() {
						fnPoint();
						//关闭浮动层
						oP.style.display = "none"
					};

					//点击后进行评分处理
					aLi[i - 1].onclick = function() {
						iStar = this.index;
						$("#score").val(iStar);
						oP.style.display = "none";
						oSpan.innerHTML = "<strong>" + (this.index)
								+ " 分</strong> ("
								+ aMsg[this.index - 1].match(/\|(.+)/)[1] + ")"
					}
				}

				//评分处理
				function fnPoint(iArg) {
					//分数赋值
					iScore = iArg || iStar;
					for (i = 0; i < aLi.length; i++)
						aLi[i].className = i < iScore ? "on" : "";
				}

			});
</script>

<script>
	$(document).ready(function() {
		$('#sub').click(function() {
			var score = $("#score").val()
			var aid = $("#aid").val();
			alert(aid);
			$.ajax({
				url : "${pageContext.request.contextPath}/assess/score",
				type : "POST",
				data : {
					score : score,
					aid : aid
				},
				dataType : "json",
				success : function(data){
					alert("发表成功");
				},
				error : function(){
					alert("发表失败");
				}
			})
		})
	});
</script>
</head>

<body>
	<div>
		<div class="header">
			<div class="logo"></div>
			<div class="navigator">
				<ul>
					<li><a href="${pageContext.request.contextPath}/pc/home"
						style="text-decoration:none;">首页</a></li>
					<li><a
						href="${pageContext.request.contextPath}/user/getJoinedActivitiesInPC?page=1"
						style="text-decoration:none;">我的活动</a></li>
					<li><a href="${pageContext.request.contextPath}/test/group/mypcgroupmanage">我的团队</a></li>
					<li><a
						href="${pageContext.request.contextPath}/user/turnToPerInfo"
						style="text-decoration:none;">个人中心</a></li>
				</ul>
			</div>
			<div class="search">
				<div class="row">
					<div class="col-lg-6">
						<div class="input-group">
							<input type="text" class="form-control"
								placeholder="Search for..."><span
								class="input-group-btn">
								<button class="btn btn-default" type="button">搜索</button>
							</span>
						</div>
						<!-- /input-group -->
					</div>
					<!-- /.col-lg-6 -->
				</div>
				<!-- /.row -->
			</div>
		</div>

		<div class="main">
			<div class="left">
				<div class="location">
					<span>我的活动 > 我的评论 <i>&gt;</i> <%=request.getParameter("title") %>
					</span>
				</div>
				<div class="line">
				</div>
				<div class="wb activity">
					<div class="activity-detail" id="activity-content-div">
						<h3 class="activity-title" id="subtitle"><%=request.getParameter("title") %></h3>
						<div class="activity-info">
							<div class="activity-basic">
								<span class="author" id="authorname">官方</span> <span class="date" id="activitytime">${activity.createtime }</span> 
								<span class="font">字体：【 <a href="javascript:doZoom(16);">大</a> <a href="javascript:doZoom(14);">中</a> <a href="javascript:doZoom(12);">小</a> 】</span>
							</div>
						</div>
					</div>
				</div>
				<input type="hidden" value=<%=request.getParameter("aid") %> name="aid" id="aid">
				<div id="star">
					<span>星级打分</span>
					<ul id="ul">
						<li><a href="javascript:;">1</a></li>
						<li><a href="javascript:;">2</a></li>
						<li><a href="javascript:;">3</a></li>
						<li><a href="javascript:;">4</a></li>
						<li><a href="javascript:;">5</a></li>
					</ul>
					<span></span>
					<p></p>
					<input type="hidden" id="score" name="score">
				</div>
				<input type="button" id="sub" class="btn btn-success" value="提交">
				<HR style="border:3 double #987cb9" width="100%" color=#987cb9
					SIZE=3>
			</div>
		</div>
		<div class="right" style="width:18%;">
			<div class="hot">
				<div class="aside-head orange">
					<h3>
						热 门 活 动<em>hot activities</em>
					</h3>
				</div>
				<div class="aside-body">
					<div id="myCarousel" class="carousel slide"
						style="width:100%;height:10%;">
						<!-- 轮播（Carousel）指标 -->
						<ol class="carousel-indicators">
							<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
							<li data-target="#myCarousel" data-slide-to="1"></li>
							<li data-target="#myCarousel" data-slide-to="2"></li>
						</ol>
						<!-- 轮播（Carousel）项目 -->
						<div class="carousel-inner">
							<div class="item active">
								<img src="<%=request.getContextPath()%>/images/hot1.jpg"
									alt="First slide">
							</div>
							<div class="item">
								<img src="<%=request.getContextPath()%>/images/hot1.jpg"
									alt="Second slide">
							</div>
							<div class="item">
								<img src="<%=request.getContextPath()%>/images/hot1.jpg"
									alt="Third slide">
							</div>
						</div>
						<!-- 轮播（Carousel）导航 -->
						<a class="carousel-control left" href="#myCarousel"
							data-slide="prev">&lsaquo;</a> <a class="carousel-control right"
							href="#myCarousel" data-slide="next">&rsaquo;</a>
					</div>
				</div>
				<div class="aside-body" style="margin-top:50px;">
					<dl class="topic-list">
						<c:if test="${newlist!=null }">
							<c:forEach var="activity" items="${newlist }">
								<dd class="topic-item topic-item-0 odd">
									<figure class="clearfix"> <figcaption
										class="pull-left">
									<h4>
										<a href="getActivity?aid=${activity.id }" target="_blank"
											style="text-decoration:none;">${activity.title }</a>
									</h4>
									</figcaption> </figure>
									<DIV
										style="BORDER-TOP: #00686b 1px dashed; OVERFLOW: hidden; HEIGHT: 1px;"></DIV>
								</dd>
							</c:forEach>
						</c:if>
					</dl>
				</div>
			</div>
			<div class="newest">
				<div class="aside-head blue">
					<h3>
						最 新 活 动<em>newest activities</em>
					</h3>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
