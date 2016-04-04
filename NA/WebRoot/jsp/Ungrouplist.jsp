<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.na.entity.nodb.ReturnInfo"%>
<%@ page import="com.na.entity.Userinfo"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
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
<c:set value="0" var="isgroup" />

<style type="text/css">
.th2{
border:1px solid black;
background-color: #a7e8f8;
}
.iu,.groupu,.nameu, .sexu, .heightu, .weightu, .ageu, .phoneu, .emailu {
	display: none;
}
</style>
<script type="text/javascript">
	function groupornot(o) {
		if (o == "未分组") {
			$(".isgrouped").hide();
			$(".ungrouped").show();
			$("#btngroup").show();

		} else if (o == "已分组") {
			$(".isgrouped").show();
			$(".ungrouped").hide();
			$("#btngroup").hide();
		}
		else if(o =="全部"){
			$(".isgrouped").show();
			$(".ungrouped").show();
			$("#btngroup").show();
		}
	}
	
	$(function() {
		$("#btncheck").on('click',function() {
		var test = ${num};
		var flag = false;
					for (i = 0; i < 9; i++) {
						if (($(".content label").eq(i).find("input")
								.prop('checked'))) {
							$("#tb th").addClass("th2");							
							flag = true;
							$(".content table tr").eq(0).find("th").eq(0).show();
							$(".content table tr").eq(0).find("th").eq(i+1).show();
							for (k = 0; k <= test; k++)
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
<style type="text/css">
.isgrouped{
}
.ungrouped{
}
</style>
</head>

<body>
	<table style="margin-top: 30px;margin-left:30px;">
		<tr style="wdith:300px;">
			<td><label>分组情况：</label></td>
			<td style="width:130px;text-align: center;">
				<div>
					<select class="form-control" id="selectGroup"
						onchange="groupornot(this.value)">
						<option>全部</option>
						<option>未分组</option>
						<option>已分组</option>
					</select>
				</div>
			</td>
		</tr>
	</table>
	<div class="content">
	<label><input id="ugroup" type="checkbox" />组名</label>
	<label><input id="uname" type="checkbox" />姓名</label> <label><input
			id="usex" type="checkbox" />性别</label> <label><input id="uheight"
			type="checkbox" />身高</label> <label><input id="uweight"
			type="checkbox" />体重</label> <label><input id="uage" type="checkbox" />年龄</label>
		<label><input id="uphone" type="checkbox" />手机</label> <label><input
			id="uemail" type="checkbox" />Email</label>
		<button id="btncheck">确定</button>
		<br>
		<br>
		<table id="tb" width="100%" border="1px" style="text-align: center;" class ="table table-bordered">
			<tr>
				<th class="iu">序号</th>
				<th class="groupu">组名</th>
				<th class="nameu">姓名</th>
				<th class="sexu">性别</th>
				<th class="heightu">身高</th>
				<th class="weightu">体重</th>
				<th class="ageu">年龄</th>
				<th class="phoneu">手机号</th>
				<th class="emailu">Email</th>
			</tr>

			<c:choose>
				<c:when test="${list==null}">
					<c:out value="list为空" />
				</c:when>
				<c:otherwise>
					<c:set value="${list}" var="returnList" />
					<c:set value="1" var="i" />
					<c:forEach items="${returnList}" var="retinfo">
						<c:if test="${retinfo.groupName!='未分组'}">
							<c:set value="${retinfo.members}" var="userinfo" />
							<td class="iu" rowspan="${fn:length(userinfo)+1}"><c:out value="${i}" /></td>
							<td class="groupu" rowspan="${fn:length(userinfo)+1}" ><c:out value="${retinfo.groupName}" /></td>
							<c:set var="i"  value="${i+1}" />
							<c:forEach items="${userinfo}" var="user">
								<tr class="isgrouped">
									<td class="nameu"><c:out value="${user.name}" /></td>
									<td class="sexu"><c:out value="${user.sex}" /></td>
									<td class="heightu"><c:out value="${user.height}" /></td>
									<td class="weightu"><c:out value="${user.weight}" /></td>
									<td class="ageu"><c:out value="${user.age}" /></td>
									<td class="phoneu"><c:out value="${user.phonenumber}" /></td>
									<td class="emailu"><c:out value="${user.email}" /></td>
								</tr>
							</c:forEach>
						</c:if>
						<c:if test="${retinfo.groupName=='未分组'}">
							<c:set value="${retinfo.members}" var="userinfo" />
							<c:forEach items="${userinfo}" var="user">
							<c:set var="i" value="${i+1}" />
								<tr class="ungrouped">
									<td class="iu"><c:out value="${i}" /></td>
									<td class="groupu"><c:out value="${retinfo.groupName}" /></td>
									<td class="nameu"><c:out value="${user.name}" /></td>
									<td class="sexu"><c:out value="${user.sex}" /></td>
									<td class="heightu"><c:out value="${user.height}" /></td>
									<td class="weightu"><c:out value="${user.weight}" /></td>
									<td class="ageu"><c:out value="${user.age}" /></td>
									<td class="phoneu"><c:out value="${user.phonenumber}" /></td>
									<td class="emailu"><c:out value="${user.email}" /></td>
								</tr>
							</c:forEach>
						</c:if>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</table>
	</div>
	<a href="./test/group/fast?aid=<%=request.getParameter("id")%>"><button id="btngroup"
			type="button" class="btn btn-success"
			style="margin-left:auto;margin-right:auto;display:block;">一键分组</button></a>
</body>
</html>
