<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE>
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'index.jsp' starting page</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/js/jquery.mobile-1.4.5/jquery.mobile-1.4.5.min.css">
<script
	src="${pageContext.request.contextPath}/js/jQuery/jquery-1.12.0.min.js"></script>
<script
	src="${pageContext.request.contextPath}/js/jquery.mobile-1.4.5/jquery.mobile-1.4.5.min.js"></script>
<style>
.logo:after{
	background-image:url("<%=request.getContextPath() %>/images/1.png");
 	background-size: 300px 300px;
}
li{
	width:150px;
	height:150px;
}
</style>
</head>

<body>
	<div data-role="page" id="pageone">
		<div data-role="header">
			<h1>欢迎来到我的首页</h1>
		</div>
		<div data-role="content">
			<div>
				<ul>
					<li><a href="#" class="logo">更多</a></li>
					<li><a href="#" data-icon="minus">更少</a></li>
					<li><a href="#" data-icon="delete">删除</a></li>
					<li><a href="#" data-icon="check">喜爱</a></li>
					<li><a href="#" data-icon="info">信息</a></li>
					<li><a href="#" data-icon="forward">向前</a></li>
				</ul>
			</div>
			<p>该例演示当导航栏包含超过五个按钮时的情况。</p>
		</div>
		<div data-role="footer">
			<h1>My Footer</h1>
		</div>
	</div>
</body>
</html>
