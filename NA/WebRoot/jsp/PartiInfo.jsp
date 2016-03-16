<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.na.entity.Userinfo"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
	+ request.getServerName() + ":" + request.getServerPort()
	+ path + "/";
%>

<!DOCTYPE>
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
	<script src="${pageContext.request.contextPath}/js/jQuery/jquery-1.12.0.min.js"></script>
	
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
.nameu,.sexu,.heightu,.weightu,.ageu,.phoneu,.emailu{
	display: none;
}
</style>


	<script type="text/javascript">
		<%-- var current =
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
		}); --%>

		$(function() {
	
			$("#btncheck").on('click',function() {
				if ($("#uname").prop('checked')) {
					$('.nameu').show();
				} else {
					$('.nameu').hide();
				}
				if($("#usex").prop('checked')){
					$('.sexu').show();
				}else{
					$('.sexu').hide();
				}
				
				if($("#uheight").prop('checked')){
					$('.heightu').show();
				}else{
					$('.heightu').hide();
				}
				
				if($("#uweight").prop('checked')){
					$('.weightu').show();
				}else{
					$('.weightu').hide();
				}
				
				if($("#uage").prop('checked')){
					$('.ageu').show();
				}else{
					$('.ageu').hide();
				}
				
				if($("#uphone").prop('checked')){
					$('.phoneu').show();
				}else{
					$('.phoneu').hide();
				}
				
				if($("#uemail").prop('checked')){
					$('.emailu').show();
				}else{
					$('.emailu').hide();
				}
			});
		});
	</script>
</head>

<body>
	<div class="content">
		<label><input id="uname" type="checkbox" />姓名</label> <label><input
			id="usex" type="checkbox" />性别</label> <label><input id="uheight"
			type="checkbox" />身高</label> <label><input id="uweight"
			type="checkbox" />体重</label> <label><input id="uage" type="checkbox" />年龄</label>
		<label><input id="uphone" type="checkbox" />手机</label> <label><input
			id="uemail" type="checkbox" />Email</label>
		<button id="btncheck">确定</button>


		<table width="100%" border="1px" style="text-align: center;">
			<tr>
				<th >序号</th>
				<th class="nameu">姓名</th>
				<th class="sexu">性别</th>
				<th class="heightu">身高</th>
				<th class="weightu">体重</th>
				<th class="ageu">年龄</th>
				<th class="phoneu">手机号</th>
				<th class="emailu">Email</th>
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
				<td class="nameu" style="display: none;"><%=userinfo.getName()%></td>
				<td class="sexu" style="display: none;"><%=userinfo.getSex()%></td>
				<td class="heightu" style="display: none;"><%=userinfo.getHeight()%></td>
				<td class="weightu" style="display: none;"><%=userinfo.getWeight()%></td>
				<td class="ageu" style="display: none;"><%=userinfo.getAge()%></td>
				<td class="phoneu" style="display: none;"><%=userinfo.getPhonenumber()%></td>
				<td class="emailu" style="display: none;"><%=userinfo.getEmail()%></td>
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


</body>
</html>
