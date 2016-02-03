<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.na.entity.Userinfo"%>
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

<title>My JSP 'PartiInfo.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<style type="text/css">
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
.tcdPageCode {
	padding: 15px 20px;
	text-align: left;
	color: #ccc;
}
</style>



</head>

<body>
	<div class="content">

		<table width="100%" border="1px" style="text-align: center;">
			<tr>
				<th>序号</th>
				<th>姓名</th>
				<th>性别</th>
				<th>身高</th>
				<th>体重</th>
				<th>年龄</th>
				<th>手机号</th>
				<th>Email</th>
			</tr>

			<%
				int i = 1;
			%>
			<%
				Object p = request.getAttribute("map");
				//request.setAttribute("map", p);
				if (p == null) {
					//	System.out.println("没数据");
				} else {
					Map map = (Map) p;
					List<Userinfo> list = (List<Userinfo>) map.get("list");
					if (list == null) {
					} else {
						for (Userinfo userinfo : list) {
						
			%>

			<tr>
				<td><%=i++%></td>
				<td><%=userinfo.getName()%></td>
				<td><%=userinfo.getSex()%></td>
				<td><%=userinfo.getHeight()%></td>
				<td><%=userinfo.getWeight()%></td>
				<td><%=userinfo.getAge()%></td>
				<td><%=userinfo.getPhonenumber()%></td>
				<td><%=userinfo.getEmail()%></td>
			</tr>

			<%
				}
					}
				}
			%>
			<tr>
				<td colspan="8">
					<div class="tcdPageCode"></div>
				</td>
			</tr>
		</table>
	</div>
	
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
