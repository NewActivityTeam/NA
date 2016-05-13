<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.sql.Timestamp"%>
<c:set var="now" value="<%=new Timestamp(System.currentTimeMillis())%>"/> 
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML5>
<html>
<head>
<base href="<%=basePath%>">
<title>My JSP 'index.jsp' starting page</title>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/jsp/pc/css/css.css">
<link rel="stylesheet" type="text/css" media="all" href="<%=request.getContextPath() %>/jsp/pc/css/style.css">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/jsp/pc/css/myactivity.css">
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
</head>

<body>
	<div>
		<div class="header">
			<div class="logo"></div>
			<div class="navigator">
				<ul>
					<li><a href="${pageContext.request.contextPath}/pc/home" style="text-decoration:none;">首页</a></li>
					<li><a href="${pageContext.request.contextPath}/user/getJoinedActivitiesInPC?page=1" style="text-decoration:none;">我的活动</a></li>
					<li><a href="${pageContext.request.contextPath}/test/group/mypcgroupmanage">我的团队</a></li>
					<li><a href="${pageContext.request.contextPath}/user/turnToPerInfo" style="text-decoration:none;">个人中心</a></li>
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
		<input type="hidden" value="${total }" id="total"/>
		<div class="main">
			<div class="left">
				<div class="line"></div>
				<ul id="activitiesListBox">
					<c:if test="${list!=null }">
						<c:forEach var="myactivity" items="${list }">
							<table
								style="width:100%;border-collapse:collapse;border-spacing:0px;margin-top:30px;">
								<tr style="background-color:#F5F5F5;">
									<td style="padding:10px 20px;text-align:left;"><label>
											<input type="checkbox" disabled="" style="margin-right:8px;">
											<strong style="margin-right:8px;font-weight:bold;">报名时间:${myactivity.pcp.createtime }</strong>
									</label>
									</td>
									<td colspan="2" style="padding:10px 20px;text-align:center;">
										<span> <span></span> <span></span>
									</span>
									</td>
									<td style="padding:10px 20px;text-align:center;"><span>参与方式:${myactivity.activity.number }人</span>
									</td>
									<td colspan="3" style="padding:10px 20px;text-align:right;">
										<span style="margin-right: 12px; visibility: hidden;">
											<a class="tp-tag-a" href="#" target="_blank"></a>
									</span>
									</td>
								</tr>
							</table>
							<table
								style="width:100%;border-collapse:collapse;border-spacing:0px;margin-bottom:10px;">
								<tr>
									<td
										style="text-align:left;vertical-align:top;padding-top:10px;padding-bottom:10px;border-right-width:0;border-right-style:solid;border-right-color:#E8E8E8;border-top-width:0;border-top-style:solid;border-top-color:#E8E8E8;padding-left:20px;">
										<div style="overflow:hidden;">
											<a class="tp-tag-a" href="#"
												style="float:left;width:27%;margin-right:2%;text-align:center;"
												target="_blank"><img
												src="${pageContext.request.contextPath}/images/activity.jpg"
												style="border:1px solid #E8E8E8;max-width:80px;"></a>
											<div style="float:left;width:71%;word-wrap:break-word;">
												<div style="margin:0px;">
													<a class="tp-tag-a" href="getActivity?aid=${myactivity.activity.id }" target="_blank" style="text-decoration:none;"> <span>${myactivity.activity.title }</span>
													</a>
												</div>
												<div style="margin-top:8px;margin-bottom:0;color:#9C9C9C;">
												<c:if test="${myactivity.activity.number == 1 }">
													<span style="margin-right:6px;"><span><strong>单人报名</strong></span></span>
												</c:if>
												<c:if test="${myactivity.activity.number > 1 && myactivity.group != null }">
													<span style="margin-right:6px;"><span><strong>组名</strong></span><span>:</span><span>${myactivity.group.groupname }</span></span>
												</c:if>
												<c:if test="${myactivity.activity.number > 1 && myactivity.group == null }">
													<a href="${pageContext.request.contextPath}/jsp/pc/CreateTeam.jsp?aid=${myactivity.activity.id }&title=${myactivity.activity.title }&number=${myactivity.activity.number }&uid=${myactivity.pcp.uid }">创建小组</a>
													<a href="${pageContext.request.contextPath}/test/group/topcjoin?aid=${myactivity.activity.id }">我要报名</a>
												</c:if>
												</div>
											</div>
										</div>
									</td>
									<td
										style="text-align:center;vertical-align:top;padding-top:10px;padding-bottom:10px;border-right-width:1px;border-right-style:solid;border-right-color:#E8E8E8;border-top-width:0;border-top-style:solid;border-top-color:#E8E8E8;">
									</td>
									<td
										style="text-align:center;vertical-align:top;padding-top:10px;padding-bottom:10px;border-right-width:1px;border-right-style:solid;border-right-color:#E8E8E8;border-top-width:0;border-top-style:solid;border-top-color:#E8E8E8;">
										<div>
											<div style="font-family:verdana;font-style:normal;">
												<c:if test="${myactivity.activity.starttime >= now }">
													<p>
													<strong>正在进行中</strong>
													</p>
												</c:if>
												<c:if test="${myactivity.activity.starttime < now }">
													<p>
													<strong>已结束</strong>
													</p>
												</c:if>
												
											</div>
											<p>
												<span>(${myactivity.activity.address })</span>
											</p>
										</div>
									</td>
									<td
										style="text-align:center;vertical-align:top;padding-top:10px;padding-bottom:10px;border-right-width:1px;border-right-style:solid;border-right-color:#E8E8E8;border-top-width:0;border-top-style:solid;border-top-color:#E8E8E8;">
										<div>
											<div>
												<div style="margin-bottom:3px;">
													<span style="display:block">报名成功</span>
													<span><a class="tp-tag-a"
														href="getActivity?aid=${myactivity.activity.id }" target="_blank" style="text-decoration:none;"> <span class="trade-operate-text">活动详情</span>
													</a> </span>
												</div>
											</div>
										</div>
									</td>
									<td
										style="width:120px;text-align:center;vertical-align:top;padding-top:10px;padding-bottom:10px;border-right-width:0;border-right-style:solid;border-right-color:#E8E8E8;border-top-width:0;border-top-style:solid;border-top-color:#E8E8E8;">
										<div>
										<c:if test="${myactivity.comment == false }">
											<div style="margin-bottom:3px;"><a href="turnToScore?aid=${myactivity.activity.id }&title=${myactivity.activity.title}" target="_blank" class="flatbtn">评价</a></div>
										</c:if>
										<c:if test="${myactivity.comment == true }">
											<div style="margin-bottom:3px;">已评价</div>
										</c:if>
										</div>
									</td>
								</tr>
							</table>
						</c:forEach>
					</c:if>
				</ul>
				<div class="line">
					</div>
					<div class="pages" id="jNewsPager">
						<a href="${pageContext.request.contextPath}/user/getJoinedActivitiesInPC?page=1" class="previouspage" onclick="choosepage(1)">首页</a>
						<a href="${pageContext.request.contextPath}/user/getJoinedActivitiesInPC?page=${current - 1}" class="previouspage" onclick="choosepage(-1)" id="last">上一页</a>
						<span id="page"></span>
						<a href="${pageContext.request.contextPath}/user/getJoinedActivitiesInPC?page=${current + 1}" class="pagenext" onclick="choosepage(-2)" id="next">下一页</a>
						<a href="${pageContext.request.contextPath}/user/getJoinedActivitiesInPC?page=${total}" class="previouspage" onclick="choosepage(-3)">最后一页</a>
					</div>
			</div>
			<div class="right">
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
								<figure class="clearfix">
									<figcaption class="pull-left">
										<h4>
											<a href="getActivity?aid=${activity.id }"
												target="_blank" style="text-decoration:none;">${activity.title }</a>
										</h4>
									</figcaption>
								</figure>
								<DIV style="BORDER-TOP: #00686b 1px dashed; OVERFLOW: hidden; HEIGHT: 1px;"></DIV>
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
	</div>
	
<script>
	var current = ${current };
	var total = ${total};
	pagingshow();
	function pagingshow(){
			if(current == 1){
						$("#last").css("display","none");
					}else{
						$("#last").css("display","inline-block");
					}
					if(current == total){
						$("#next").css("display","none");
					}else{
						$("#next").css("display","inline-block");
					}
			var str = "";
			if(total <= 6){
				for(var i = 1;i <= total;i++){
					str += "<a href='${pageContext.request.contextPath}/user/getJoinedActivitiesInPC?page=" + i + "' class='pagenext' onclick='choosepage(" + i +")'>" + i + "</a>";
				}
			}else{
				if(current >= 5 && current <= total - 5){
					for(var i = current - 3;i <= current + 1;i++){
						str += "<a href='${pageContext.request.contextPath}/user/getJoinedActivitiesInPC?page=" + i + "' class='pagenext' onclick='choosepage(" + i +")'>" + i + "</a>";
					}
					str += "......";
					str += "<a href='${pageContext.request.contextPath}/user/getJoinedActivitiesInPC?page=" + i + "' class='pagenext' onclick='choosepage(" + total +")'>" + total + "</a>";
				}else if(current > total - 5){
					str += "<a href='${pageContext.request.contextPath}/user/getJoinedActivitiesInPC?page=" + i + "' class='pagenext' onclick='choosepage(" + 1 +")'>" + 1 + "</a>";
					str += "......";
					for(var i = total - 4;i <= total;i++){
						str += "<a href='${pageContext.request.contextPath}/user/getJoinedActivitiesInPC?page=" + i + "' class='pagenext' onclick='choosepage(" + i +")'>" + i + "</a>";
					}
				}else{
					for(var i = 1;i <= 5;i++){
						str += "<a href='${pageContext.request.contextPath}/user/getJoinedActivitiesInPC?page=" + i + "' class='pagenext' onclick='choosepage(" + i +")'>" + i + "</a>";
					}
					str += "......";
					str += "<a href='${pageContext.request.contextPath}/user/getJoinedActivitiesInPC?page=" + i + "' class='pagenext' onclick='choosepage(" + total +")'>" + total + "</a>";
				}
			}
			$("#page").append(str);
		}
</script>
</body>
</html>
