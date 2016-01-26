<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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

<title>My JSP 'GroupManage.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link rel="stylesheet"
	href="http://cdn.bootcss.com/twitter-bootstrap/3.0.3/css/bootstrap.min.css">
<link
	href="http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.min.css"
	rel="stylesheet">
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
#divbtn {
	height: 50px;
	width: 200px;
	margin-left: 100px;
	margin-top: 100px;
}

#chooseDiv {
	height: 500px;
	width: 500px;
	margin-left: 100px;
	border: 2px solid grey;
}

</style>

</head>

<body>
	<div>
		<div id="divbtn">
			<a href="<%=request.getContextPath()%>/jsp/PartiInfo.jsp" target="PartiInfo"><button type="button" class="btn btn-primary">人员信息</button></a>
			<a href="<%=request.getContextPath()%>/jsp/Ungrouplist.jsp" target="PartiInfo"><button type="button" class="btn btn-primary">分组情况</button></a>
		</div>
		<div id="chooseDiv">
		<iframe height="100%" width="100%" name="PartiInfo" src="<%=request.getContextPath() %>/jsp/PartiInfo.jsp" height="80px" width="100%"></iframe>
		</div>
	</div>
</body>
</html>
