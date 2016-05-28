<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/js/jquery.mobile-1.4.5/jquery.mobile-1.4.5.min.css">
		<script src="${pageContext.request.contextPath}/js/jQuery/jquery-1.12.0.min.js"></script>
		<script src="${pageContext.request.contextPath}/js/jquery.mobile-1.4.5/jquery.mobile-1.4.5.min.js"></script>
		<title>创建小组</title>
		<style>
.activity:after {
	background-image:
		url("<%=request.getContextPath() %>/images/activity.png");
	background-size: 18px 18px;
}

.my:after {
	background-image: url("<%=request.getContextPath() %>/images/my.png");
	background-size: 18px 18px;
}

.team:after {
	background-image: url("<%=request.getContextPath() %>/images/team.png");
	background-size: 18px 18px;
}

.info:after {
	background-image: url("<%=request.getContextPath() %>/images/info.png");
	background-size: 18px 18px;
}

</style>
		<script>
			$(document).on('pagecreate',function(){
				$('#submit').on('click',function(){
					AJAXTest();
				});
			});
			function AJAXTest(){
	  			var groupname = $("#groupname").prop("value");
	  			var maxcount = $("#maxcount").prop("value");
	  			var description =$("#description").prop("value");
	  			if(groupname == "" || groupname == null){
	  				alert("请输入小组名称!")
	  			}else{
	  				$.ajax({
	  				url : "${pageContext.request.contextPath}/test/group/create",
	  				type : "POST",
	  				data : {
	  					aid : ${activity.id},
						groupname : groupname,
						maxcount : maxcount,
						description : description
	  				},
	  				dataType : "json",
	  				success :function(data){
	  					if(data.code%10==1){
	  						alert("成功");
	  					}
	  					else{
	  						alert("失败");
	  					}
	  				},
	  				error : function(){
						alert("ajax失败");
	  				}
	  				
	  			});
	  			}
	  			
	  		}
		</script>
	</head>

	<body>
		<div data-role="page">
			<div data-role="header" data-theme="b">
		  		<a data-role="button" data-rel="back" data-icon="arrow-l" data-iconpos="notext">返回</a>
			   	<h1>创建小组</h1>
			</div>
			
			<div data-role="content" id="main" style="background-color:#DDDDDD;height:100%;" class="ui-content">
				<%-- <div class="ui-field-contain">
					<label for="groupname">小组名称:</label>
					<input type="text" id="groupname">
					<label for="name">活动名称:</label>
					<input type="text" id="name" value="<%=request.getParameter("name") %>">
					<label for="maxcount">成员个数:</label>
					<input type="text" id="maxcount" value="<%=request.getParameter("number") %>">
					
					<label for="description">小组描述:</label>
					<textarea id="description" placeholder="在此输入小组描述，文本框大小自动调整"></textarea>
					<button data-ajax="false" id="submit">提交</button>
				</div> --%>
				<div class="ui-field-contain">
				<div style="width:111%;font-family:宋体;font-size:24;font-weight:bold;margin-top:-15;height:30px;margin-left:-15;margin:right:-35;text-align:center;">
						${activity.title }			
				</div>
				<div style="padding-top:3px;padding-bottom:3px;background-color:#FFFFFF;width:111%;font-family:宋体;font-size:20;font-weight:bold;margin-left:-15;margin:right:-35;">
					<%-- <label id="maxcount">活动人数：<%=request.getParameter("number") %>人</label> --%>
					<label for="maxcount">成员人数:</label>
					<input type="text" id="maxcount" onfocus="this.blur()" value="${activity.number }" data-corners="false">
				</div>
				<div style="padding-top:3px;padding-bottom:3px;background-color:#FFFFFF;width:111%;font-family:宋体;font-size:20;font-weight:bold;margin-left:-15;margin:right:-35;">
					<label for="groupname">小组名称:</label>
					<input type="text" placeholder="请输入小组名称" data-corners="false" id="groupname">
				</div>
				<div style="padding-top:3px;padding-bottom:3px;background-color:#FFFFFF;width:111%;font-family:宋体;font-size:20;font-weight:bold;margin-left:-15;margin:right:-35;">
					<label for="description">小组描述:</label>
					<textarea placeholder="请输入小组描述信息" data-corners="false" id="description"></textarea>
				</div>
					
			</div>
			</div>
			<div data-role="footer" data-position="fixed">
			<button data-ajax="false" id="submit" style="width:100%;background:#29c1e8">创建小组</button>
			<div data-role="navbar" data-iconpos="top" class="nav">
				<ul>
					<li style="border:0"><a data-ajax="false"
						href="${pageContext.request.contextPath}/activity/activity_list?display=mobile&state=true"
						class="ui-btn ui-shadow  ui-btn-icon-top activity">活动</a></li>
					<li style="border:0"><a data-ajax="false"
						href="${pageContext.request.contextPath}/user/getJoinedActivities?display=mobile"
						class="ui-btn ui-shadow  ui-btn-icon-top my">我的活动</a></li>
					<li style="border:0"><a data-ajax="false"
						href="${pageContext.request.contextPath}/test/group/mygroupmanage?display=mobile"
						class="ui-btn ui-shadow  ui-btn-icon-top team">我的小组</a></li>
					<li style="border:0"><a data-ajax="false"
						href="${pageContext.request.contextPath}/user/getuserinfo?display=mobile"
						class="ui-btn ui-shadow  ui-btn-icon-top info">个人信息</a></li>
				</ul>
			</div>
		</div>
		</div>
	</body>
</html>
