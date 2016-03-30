<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.na.entity.Activity"%>
<%
	String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'ManageActivityOfShow.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<!-- 新 Bootstrap 核心 CSS 文件 -->
<link rel="stylesheet"
	href="http://cdn.bootcss.com/twitter-bootstrap/3.0.3/css/bootstrap.min.css">
<style>
.input-group {
	width: 110px;
	margin-bottom: 10px;
}
</style>


<style>
.top {
	margin-right: auto;
	margin-left: auto;
	width: 95%;
	height: 25%;
	border: 1px solid black;
}

.content {
	margin-right: auto;
	margin-left: auto;
	width: 95%;
	height: 75%;
	border: 1px solid black;
}

th {
	align: center;
	text-align: center;
}
</style>
<style>
* {
	margin: 0;
	padding: 0;
	list-style: none;
}

a {
	text-decoration: none;
}

a:hover {
	text-decoration: none;
}

.tcdPageCode {
	padding: 15px 20px;
	text-align: left;
	color: #ccc;
}

.tcdPageCode a {
	display: inline-block;
	color: #428bca;
	display: inline-block;
	height: 25px;
	line-height: 25px;
	padding: 0 10px;
	border: 1px solid #ddd;
	margin: 0 2px;
	border-radius: 4px;
	vertical-align: middle;
}

.tcdPageCode a:hover {
	text-decoration: none;
	border: 1px solid #428bca;
}

.tcdPageCode span.current {
	display: inline-block;
	height: 25px;
	line-height: 25px;
	padding: 0 10px;
	margin: 0 2px;
	color: #fff;
	background-color: #428bca;
	border: 1px solid #428bca;
	border-radius: 4px;
	vertical-align: middle;
}

.tcdPageCode span.disabled {
	display: inline-block;
	height: 25px;
	line-height: 25px;
	padding: 0 10px;
	margin: 0 2px;
	color: #bfbfbf;
	background: #f2f2f2;
	border: 1px solid #bfbfbf;
	border-radius: 4px;
	vertical-align: middle;
}
</style>
</head>

<body>


	<div class="content">
		<center>
			<h4>活动列表</h4>
		</center>
		<table width="100%" border="1px" style="text-align:center">
			<tr>
				<th>编号</th>
				<th>活动名称</th>
				<th>开始时间</th>
				<th>结束时间</th>
				<th>地点</th>
				<th>编辑</th>
				<th>删除</th>
				<th>管理</th>
			</tr>

			<%
				int i = 1;
			%>
			<%
				List<Activity> list = (List<Activity>)request.getAttribute("activities");
			    			
			    			if(list == null){
			    			}else{
			    				for(Activity activity : list ) {
			    				System.out.println("title=" + activity.getTitle());
			%>

			<tr>
				<td><%=i++%></td>
				<td><%=activity.getTitle()%></td>

				<td><%=activity.getStarttime()%></td>
				<td><%=activity.getEndsigntime()%></td>
				<td><%=activity.getAddress()%></td>
				<td><a href="UpdateActivity?id=<%=activity.getId()%>"
					target="right"><span class="glyphicon glyphicon-pencil"></span></a></td>
				<td><a
					href="DeleteActivity?id=<%=activity.getId()%>&current=${current}&title=${title}&startDate=${start}&endDate=${end}"><img
						src="" /><span class="glyphicon glyphicon-remove"></span></a></td>
				<td><a href=""
					onclick="window.open(
							'ManageActivity?id=<%=activity.getId()%>',
							'',
							'height=800, width=1000, top=0, left=0, toolbar=no, menubar=no, scrollbars=no,resizable=no,location=no, status=no');"><span class="glyphicon glyphicon-user"></span></a></td>
			</tr>

			<%
				}}
			%>
			<tr>
				<td colspan="8">
					<div class="tcdPageCode"></div>
				</td>
			</tr>
		</table>
	</div>

	<input id="func" name="func" value="${func}" type="hidden">
	<input id="title" name="title" value="${title}" type="hidden">
	<input id="startDate" name="startDate" value="${start}" type="hidden">
	<input id="endDate" name="endDate" value="${end}" type="hidden">
	<input id="current" name="current" value="${current }" type="hidden">

	<!-- jQuery文件，在bootstrap.min.js之前引入 -->
	<script src="http://cdn.bootcss.com/jquery/1.10.2/jquery.min.js"></script>
	<!-- Bootstrap核心JavaScript文件 -->
	<script
		src="http://cdn.bootcss.com/twitter-bootstrap/3.0.3/js/bootstrap.min.js"></script>

	<script type="text/javascript"
		src="<%=request.getContextPath()%>/js/jquery.page.js"></script>

	<script>
		var current =
	<%=request.getAttribute("current")%>
		;
		var method = $('#func').val();
		var pageCount =
	<%=request.getAttribute("pageCount")%>
		var parameters = "title=" + $('#title').val() + "&startDate="
				+ $('#startDate').val() + "&endDate=" + $('#endDate').val();
		if (current == null)
			current = 1;
		$(".tcdPageCode").createPage({
			pageCount : pageCount,
			current : current,
			tag : method,
			parm : parameters,
			backFn : function(p) {
				console.log(p);
			}
		});
		function oncli() {
			
		}
	</script>
</body>
</html>
