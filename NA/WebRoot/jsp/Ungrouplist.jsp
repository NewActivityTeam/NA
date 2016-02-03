<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.na.entity.nodb.ReturnInfo" %>
<%@ page import="com.na.entity.Userinfo" %>
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

<title>My JSP 'Ungouplist.jsp' starting page</title>

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

</head>

<body>
	<table style="margin-top: 30px;margin-left:30px;">
		<tr style="wdith:300px;">
			<td><label>分组情况：</label></td>
			<td style="width:130px;text-align: center;">
				<div>
					<select class="form-control">
						<option>未分组</option>
						<option>已分组</option>
					</select>
				</div>
			</td>
		</tr>
	</table>
	<div class="content">
	<table width="100%" border="1px" style="text-align: center;">
		<tr>
			<th>序号</th>
			<th>组名</th>
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
			int code = Integer.parseInt(request.getAttribute("code").toString());
			if (code == 90152) {
				System.out.println("code=90152");
			} else if (code == 9015) {
				System.out.println("异常错误");
			} else if (code == 90151) {
			
			Object list = request.getAttribute("list");
			if(list == null){
				System.out.println("list为空!");
			}else{
			List<ReturnInfo> returnList = (List<ReturnInfo>)list;
			
			for(ReturnInfo retinfo : returnList){
			List<Userinfo> userinfo = retinfo.getMembers();
			 for(Userinfo user : userinfo){
			
		%>
		<tr>
		<td><%=i++%></td>
		<td><%=retinfo.getGroupName()%></td>
		<td><%=user.getName() %></td>
		<td><%=user.getSex() %></td>
		<td><%=user.getHeight() %></td>
		<td><%=user.getWeight() %></td>
		<td><%=user.getAge() %></td>
		<td><%=user.getPhonenumber() %></td>
		<td><%=user.getEmail() %></td>
		</tr>
		<%
			}
			}
			}
			}
		%>
	</table>
	</div>
	<a href="./group/fastallot?id=<%=request.getParameter("id")%>"><button type="button" class="btn btn-success"
		style="margin-left:auto;margin-right:auto;display:block;">一键分组</button></a>
</body>
</html>
