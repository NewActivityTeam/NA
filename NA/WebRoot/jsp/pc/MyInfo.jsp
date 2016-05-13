<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

<title>My JSP 'MyInfo.jsp' starting page</title>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/jsp/pc/css/css.css">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/jsp/pc/css/myactivity.css">
<!-- <!-- 新 Bootstrap 核心 CSS 文件 -->
<link rel="stylesheet"
	href="http://cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css">
<link rel="stylesheet"
	href="http://cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap-theme.min.css">

<script src="http://cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>

<script src="http://cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/jsp/pc/css/info.css">


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
						href="${pageContext.request.contextPath}/jsp/user/getJoinedActivitiesInPC?page=1"
						style="text-decoration:none;">我的活动</a></li>
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
				<div class="line"></div>
				<div class="loginbox registbox">
					<div class="login-content reg-content">
					<c:if test="${isRegister == 0 }">
						<div class="loginbox-title">
							<h2>注册</h2>
						</div>
						<form class="form-horizontal">
							  <div class="form-group">
							    <label for="inputEmail3" class="col-sm-2 control-label">姓名</label>
							    <div class="col-sm-4">
							      <input type="text" class="form-control" id="name" placeholder="name">
							    </div>
							  </div>
							  <div class="form-group">
							    <label for="inputPassword3" class="col-sm-2 control-label">性別</label>
							    <div class="col-sm-4">
							      <select class="form-control" id="sex">
							      	<option>男</option>
							      	<option>女</option>
							      </select>
							    </div>
							  </div>
							  <div class="form-group">
							    <label for="inputEmail3" class="col-sm-2 control-label">年齡</label>
							    <div class="col-sm-4">
							      <input type="text" class="form-control" id="age" placeholder="age">
							    </div>
							  </div>
							  <div class="form-group">
							    <label for="inputEmail3" class="col-sm-2 control-label">身高(cm)</label>
							    <div class="col-sm-4">
							      <input type="text" class="form-control" id="stature" placeholder="stature">
							    </div>
							  </div>
							  <div class="form-group">
							    <label for="inputEmail3" class="col-sm-2 control-label">体重(kg)</label>
							    <div class="col-sm-4">
							      <input type="text" class="form-control" id="weight" placeholder="weight">
							    </div>
							  </div>
							  <div class="form-group">
							    <label for="inputEmail3" class="col-sm-2 control-label">手机</label>
							    <div class="col-sm-4">
							      <input type="text" class="form-control" id="telephone" placeholder="telephone">
							    </div>
							  </div>
							  <div class="form-group">
							    <label for="inputEmail3" class="col-sm-2 control-label">Email</label>
							    <div class="col-sm-4">
							      <input type="text" class="form-control" id="email" placeholder="Email">
							    </div>
							  </div>
							<div class="row btnArea">
								<a class="login-btn" id="submit" style="text-decoration:none" onclick="register()">注册</a>
							</div>
						</form>
						</c:if>
						<c:if test="${isRegister == 1 }">
							<div class="loginbox-title">
								<h3>个人信息</h3>
							</div>
							<form class="form-horizontal">
							  <div class="form-group">
							    <label for="inputEmail3" class="col-sm-2 control-label">姓名</label>
							    <div class="col-sm-4">
							      <input type="text" class="form-control" id="name" value="${user.name }">
							    </div>
							  </div>
							  <div class="form-group">
							    <label for="inputPassword3" class="col-sm-2 control-label">性別</label>
							    <div class="col-sm-4">
							      <select class="form-control" id="sex">
							      	<option>男</option>
							      	<option>女</option>
							      </select>
							    </div>
							  </div>
							  <div class="form-group">
							    <label for="inputEmail3" class="col-sm-2 control-label">年齡</label>
							    <div class="col-sm-4">
							      <input type="text" class="form-control" id="age" value="${user.age }">
							    </div>
							  </div>
							  <div class="form-group">
							    <label for="inputEmail3" class="col-sm-2 control-label">身高(cm)</label>
							    <div class="col-sm-4">
							      <input type="text" class="form-control" id="stature" value="${user.height }">
							    </div>
							  </div>
							  <div class="form-group">
							    <label for="inputEmail3" class="col-sm-2 control-label">体重(kg)</label>
							    <div class="col-sm-4">
							      <input type="text" class="form-control" id="weight" value="${user.weight }">
							    </div>
							  </div>
							  <div class="form-group">
							    <label for="inputEmail3" class="col-sm-2 control-label">手机</label>
							    <div class="col-sm-4">
							      <input type="text" class="form-control" id="telephone" value="${user.phonenumber }">
							    </div>
							  </div>
							  <div class="form-group">
							    <label for="inputEmail3" class="col-sm-2 control-label">Email</label>
							    <div class="col-sm-4">
							      <input type="text" class="form-control" id="email" value="${user.email }">
							    </div>
							  </div>
							<div class="row btnArea">
								<a class="login-btn" id="submit" style="text-decoration:none" onclick="update()">更新个人信息</a>
							</div>
						</form>
						</c:if>
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
	</div>
<script>
	function register(){
		var name = $("#name").val();
		var sex = $("#sex  option:selected").text();
		if(sex == '男'){
			sex = 0;
		}else{
			sex = 1;
		}
		var age = $("#age").val();
		var stature = $("#stature").val();
		var weight = $("#weight").val();
		var telephone = $("#telephone").val();
		var email = $("#email").val();
		$.ajax({
			url : "${pageContext.request.contextPath}/user/saveinfo",
			type : "POST",
			data : {
				name : name,
				sex : sex,
				age : age,
				height : stature,
				weight : weight,
				phone : telephone,
				email : email
			},
			dataType : "json",
			success : function(data){
				alert(data.code);
			},
			error : function(){
				alert("error");
			}
		});
	}
	function update(){
	
	}
</script>
</body>
</html>
