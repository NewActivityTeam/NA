<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.sql.Timestamp"%>

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
		<div class="main">
			<div class="left">
				<div class="image">
					<div id="myCarousel" class="carousel slide" style="height:60%;">
						<!-- 轮播（Carousel）指标 -->
						<ol class="carousel-indicators">
							<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
							<li data-target="#myCarousel" data-slide-to="1"></li>
							<li data-target="#myCarousel" data-slide-to="2"></li>
						</ol>
						<!-- 轮播（Carousel）项目 -->
						<div class="carousel-inner">
							<div class="item active">
								<img src="<%=request.getContextPath()%>/images/bg1.jpg"
									alt="First slide">
							</div>
							<div class="item">
								<img src="<%=request.getContextPath()%>/images/bg2.jpg"
									alt="Second slide">
							</div>
							<div class="item">
								<img src="<%=request.getContextPath()%>/images/bg3.jpg"
									alt="Third slide">
							</div>
						</div>
						<!-- 轮播（Carousel）导航 -->
						<a class="carousel-control left" href="#myCarousel"
							data-slide="prev">&lsaquo;</a> <a class="carousel-control right"
							href="#myCarousel" data-slide="next">&rsaquo;</a>
					</div>
				</div>
				<input type="hidden" value="${total }" id="total"/>
				<div class="content">
					<div class="pagetab">
						<ul class="pagetab-list">
							<li class="p-list1"><a href="javascript:void(0)" class="pagetab-list-lnk" id="allActivities">全部活动</a></li>
							<li class="p-list2"><a href="javascript:void(0)" class="pagetab-list-lnk" id="on">正在进行</a></li>
							<li class="p-list3"><a href="javascript:void(0)" class="pagetab-list-lnk" id="over">已经结束</a></li>
						</ul>
					</div>
					<ul id="activitiesListBox" class="activitieslistbox">
						<!-- <li class="activities-lst">
							<p>
								<a class="lnk-type" href="#">[正在进行]</a> <a href="#">活动名称</a>
							</p> <span class="date">2014-11-20</span>
						</li>-->
						<c:set var="now" value="<%=new Timestamp(System.currentTimeMillis())%>"/>
						<c:if test="${list!=null}">
							<c:forEach var="activity" items="${list }">
								<li class="activities-lst">
									<p>
									<c:if test="${activity.endtime >= now }">
									<a class="lnk-type" href="#">[正在进行]</a>
									</c:if>
									<c:if test="${activity.endtime < now }">
									<a class="lnk-type" href="#">[已经结束]</a>
									</c:if>
										 <a href="getActivity?aid=${activity.id }" target="_blank">${activity.title }</a>
									</p> <span class="date">${activity.createtime }</span>
								</li>
							</c:forEach>
						</c:if>
					</ul>
					<div class="line">
					</div>
					<div class="pages" id="jNewsPager">
						<a href="javascript:void(0)" class="previouspage" onclick="choosepage(1)">首页</a>
						<a href="javascript:void(0)" class="previouspage" onclick="choosepage(-1)" id="last">上一页</a>
						<span id="page"></span>
						<a href="javascript:void(0)" class="pagenext" onclick="choosepage(-2)" id="next">下一页</a>
						<a href="javascript:void(0)" class="previouspage" onclick="choosepage(-3)">最后一页</a>
					</div>
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
		<div class="footer">
		</div>
	</div>
	<script type="text/javascript">
		var current = 1;
		var flag=0;
		var total = $("#total").val();
		pagingshow();
		jsDec();
		/*js效果*/
		function jsDec(){
			var sw = document.getElementById("activitiesListBox").childNodes;
			for (var i = sw.length; i--;) {
				sw[i].onmouseover = function() {
					this.className = "activities-lst activities-current";
				}
				sw[i].onmouseout = function() {
				this.className = "activities-lst";
				}
			};
		}
		/*页面选择*/
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
					str += "<a href='javascript:void(0)' class='pagenext' onclick='choosepage(" + i +")'>" + i + "</a>";
				}
			}else{
				if(current >= 5 && current <= total - 5){
					for(var i = current - 3;i <= current + 1;i++){
						str += "<a href='javascript:void(0)' class='pagenext' onclick='choosepage(" + i +")'>" + i + "</a>";
					}
					str += "......";
					str += "<a href='javascript:void(0)' class='pagenext' onclick='choosepage(" + total +")'>" + total + "</a>";
				}else if(current > total - 5){
					str += "<a href='javascript:void(0)' class='pagenext' onclick='choosepage(" + 1 +")'>" + 1 + "</a>";
					str += "......";
					for(var i = total - 4;i <= total;i++){
						str += "<a href='javascript:void(0)' class='pagenext' onclick='choosepage(" + i +")'>" + i + "</a>";
					}
				}else{
					for(var i = 1;i <= 5;i++){
						str += "<a href='javascript:void(0)' class='pagenext' onclick='choosepage(" + i +")'>" + i + "</a>";
					}
					str += "......";
					str += "<a href='javascript:void(0)' class='pagenext' onclick='choosepage(" + total +")'>" + total + "</a>";
				}
			}
			$("#page").append(str);
		}
		function choosepage(i){
			if(i == -1){
				current -= 1;
			}else if(i == -2){
				current += 1;
			}else if(i == -3){
				current = total;
			}else{
				current = i;
			}
			$.ajax({
					url : "getAllActivitiesOfPC",
					type : "POST",
					data : {
						page : current,
						flag: flag
						
					},
					dataType : "json",
					success : function(data,status){
					$("#page").empty();
					$("#activitiesListBox").empty();
						$.each(data.list,function(index,array){
						if(array['endtime'] >= $.now()){
							var str = "<li class='activities-lst'><p><a class='lnk-type' href='#'>[正在进行]</a> <a href='getActivity?aid=" + array['id'] + "' target='_blank'>" + array['title'] +
							"</p> <span class='date'>" + array['createtime'] +"</span></li>";
							}else{
							var str = "<li class='activities-lst'><p><a class='lnk-type' href='#'>[已经结束]</a> <a href='getActivity?aid=" + array['id'] + "' target='_blank'>" + array['title'] +
							"</p> <span class='date'>" + array['createtime'] +"</span></li>";
							}
							$("#activitiesListBox").append(str);
						});
						jsDec();
						pagingshow();
					},
					error : function(){
						alert("error");
					}
				});
		}
		
		$(document).ready(function(){
			 $("#allActivities").click(function(){
			 flag = 0;
				$.ajax({
					url : "getAllActivitiesOfPC",
					type : "POST",
					data : {
						page : 1,
						flag : 0
					},
					dataType : "json",
					success : function(data,status){
					$("#page").empty();
					$("#activitiesListBox").empty();
						$.each(data.list,function(index,array){
						//alert(array['endtime']);
						//alert($.now());
						if(array['endtime'] >= $.now()){
						
							var str = "<li class='activities-lst'><p><a class='lnk-type' href='#'>[正在进行]</a> <a href='getActivity?aid=" + array['id'] + "' target='_blank'>" + array['title'] +
							"</a></p> <span class='date'>" + array['createtime'] +"</span></li>";
							}else{
							var str = "<li class='activities-lst'><p><a class='lnk-type' href='#'>[已经结束]</a> <a href='getActivity?aid=" + array['id'] + "' target='_blank'>" + array['title'] +
							"</a></p> <span class='date'>" + array['createtime'] +"</span></li>";
							}$("#activitiesListBox").append(str);
						});
						jsDec();
						total = data.total;
						pagingshow();
					},
					error : function(){
						alert("error");
					}
				});
			}); 
			
			 $("#on").click(function(){
			 flag = 1;
				$.ajax({
					url : "getAllActivitiesOfPC",
					type : "POST",
					data : {
						page : 1,
						flag : 1
					},
					dataType : "json",
					success : function(data,status){
					$("#page").empty();
					$("#activitiesListBox").empty();
						$.each(data.list,function(index,array){
							var str = "<li class='activities-lst'><p><a class='lnk-type' href='#'>[正在进行]</a> <a href='getActivity?aid=" + array['id'] + "' target='_blank'>" + array['title'] +
							"</a></p> <span class='date'>" + array['createtime'] +"</span></li>";
							$("#activitiesListBox").append(str);
						});
						jsDec();
						total = data.total;
						pagingshow();
					},
					error : function(){
						alert("error");
					}
				});
			});
			 
			$("#over").click(function(){
			flag = 2;
				$.ajax({
					url : "getAllActivitiesOfPC",
					type : "POST",
					data : {
						page : 1,
						flag : 2
					},
					dataType : "json",
					success : function(data,status){
					$("#page").empty();
					$("#activitiesListBox").empty();
					
						$.each(data.list,function(index,array){
							var str = "<li class='activities-lst'><p><a class='lnk-type' href='#'>[已经结束]</a> <a href='getActivity?aid=" + array['id'] + "' target='_blank'>" + array['title'] +
							"</a></p> <span class='date'>" + array['createtime'] +"</span></li>";
							$("#activitiesListBox").append(str);
						});
						jsDec();
						total = data.total;
						pagingshow();
					},
					error : function(){
						alert("error");
					}
				});
			});
		});
		
		
	
	</script>
</body>
</html>
