<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'CreateTeam.jsp' starting page</title>
    
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
<script>
	$(document).ready(function(){
		$("#sub").click(function(){
			var name = $("#name").val();
			var aid = $("#aid").val();
			var number = $("#number").val();
			var uid = $("#uid").val();
			var des = $("#des").val();
			alert(name + " " + number + " " + aid + " " + uid);
			$.ajax({
				url : "${pageContext.request.contextPath}//test/group/create",
				type : "POST",
				data : {
					groupname : name,
					aid : aid,
					maxcount : number,
					uid : uid,
					description : des
				},
				dataType : "json",
				success : function(data){
					alert("发表成功");
				},
				error : function(){
					alert("发表失败");
				}
			});
		});
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
				<div class="line"></div>
				<form class="form-horizontal" style="margin-top:30px;">
				  <div class="form-group">
				    <label for="inputEmail3" class="col-sm-2 control-label">小组名称</label>
				    <div class="col-sm-10">
				      <input type="text" class="form-control" id="name" placeholder="请为小组起名">
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="inputPassword3" class="col-sm-2 control-label">活动名称</label>
				    <div class="col-sm-10">
				      <input type="text" class="form-control" id="title" value="<%=request.getParameter("title") %>" disabled="true">
				    </div>
				  </div>
				  <input type="hidden" id="aid" value="<%=request.getParameter("aid") %>">
				  <input type="hidden" id="uid" value="<%=request.getParameter("uid") %>">
				  <input type="hidden" id="number" value="<%=request.getParameter("number") %>">
				  <div class="form-group">
				  	<label for="inputPassword3" class="col-sm-2 control-label">人数上限</label>
				     <div class="col-sm-10">
				      <input type="email" class="form-control" id="inputEmail3" value="<%=request.getParameter("number") %>人" disabled="true">
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="inputPassword3" class="col-sm-2 control-label">小组描述</label>
				    <div class="col-sm-10">
				    	<textarea class="form-control" rows="5" id="des"></textarea>
				    </div>
				  </div>
				  <div class="form-group">
				    <div class="col-sm-offset-2 col-sm-10">
				      <button type="submit" class="btn btn-default" id="sub">创建小组</button>
				    </div>
				  </div>
				</form>
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
	</div>
  </body>
</html>
