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
<!-- 新 Bootstrap 核心 CSS 文件 -->
<link rel="stylesheet"
	href="http://cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css">

<!-- 可选的Bootstrap主题文件（一般不用引入） -->
<link rel="stylesheet"
	href="http://cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap-theme.min.css">
<!-- jQuery文件，在bootstrap.min.js之前引入 -->
<script src="http://cdn.bootcss.com/jquery/1.10.2/jquery.min.js"></script>
<!-- Bootstrap核心JavaScript文件 -->
<script
	src="http://cdn.bootcss.com/twitter-bootstrap/3.0.3/js/bootstrap.min.js"></script>

<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/jquery.page.js"></script>
<style type="text/css">
.content {
	margin-right: auto;
	margin-left: auto;
	width: 95%;
	
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

.iu,.nameu, .sexu, .heightu, .weightu, .ageu, .phoneu, .emailu {
	display: none;
}

.th2{
border:1px solid black;
background-color: #a7e8f8;

}
</style>


<script type="text/javascript">
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
<%Object p = request.getAttribute("map");
				if (p == null) {
				}else{
				Map map = (Map)p;
				if(map.get("list")!=null){
				List<Userinfo> list = (List<Userinfo>)map.get("list");
				int num = list.size();
				request.setAttribute("num", num);
				} 
				}%>
	$(function() {
		$("#btncheck").on('click',function() {
		var test = ${num};
		var flag = false;
					for (i = 0; i < 8; i++) {
						if (($(".content label").eq(i).find("input")
								.prop('checked'))) {
							$("#tb th").addClass("th2");							
							flag = true;
							$(".content table tr").eq(0).find("th").eq(0).show();
							$(".content table tr").eq(0).find("th").eq(i+1).show();
							for (k = 0; k <=test; k++)
							{
								$(".content table tr").eq(k).find("td").eq(0).show();
								$(".content table tr").eq(k).find("td").eq(i+1).show();
							}

						} else {
							$(".content table tr").eq(0).find("th").eq(i+1).hide();
							for (k = 0; k <=test; k++)
							{
								$(".content table tr").eq(k).find("td").eq(i+1).hide();
							}								
						}
					}
					
					if(flag == false)
					{
						$(".content table tr").eq(0).find("th").eq(0).hide();
						for (k = 0; k <test; k++)
						$(".content table tr").eq(k).find("td").eq(0).hide();
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

		<br>
		<br>
		<table id="tb" width="100%" style="text-align: center;" class ="table table-bordered">
			<tr>
				<th class="iu">序号</th>
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
				if (p == null) {
				} else {
					Map map = (Map) p;
					List<Userinfo> list = (List<Userinfo>) map.get("list");
					if (list == null) {
					} else {
						for (Userinfo userinfo : list) {
			%>

			<tr>
				<td class="iu"><%=i++%></td>
				<td class="nameu"><%=userinfo.getName()%></td>
				<%
				String s=null ;
				if (userinfo.getSex()== 0)
				{
				 	s = "男";
				}else if(userinfo.getSex()== 1)
				{
				 	s= "女";
				}
				 %>
				<td class="sexu"><%=s%></td>
				<%
					String h = userinfo.getHeight().toString().substring(0, 5);
					String w = userinfo.getWeight().toString().substring(0, 4);
				 %>
				<td class="heightu"><%=h%></td>
				<td class="weightu"><%=w%></td>
				<td class="ageu"><%=userinfo.getAge()%></td>
				<td class="phoneu"><%=userinfo.getPhonenumber()%></td>
				<td class="emailu"><%=userinfo.getEmail()%></td>
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
