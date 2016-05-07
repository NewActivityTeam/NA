<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/js/jquery.mobile-1.4.5/jquery.mobile-1.4.5.min.css">
		<script src="${pageContext.request.contextPath}/js/jQuery/jquery-1.12.0.min.js"></script>
		<script src="${pageContext.request.contextPath}/js/jquery.mobile-1.4.5/jquery.mobile-1.4.5.min.js"></script>
		<title>组队信息</title>
		<script>
		$(document).on('pagecreate',function(){
			$("#apply").on('click',function(){
				$.ajax({
					url: "${pageContext.request.contextPath}/test/groupapply/newapply",
					type: "POST",
					data:{
						gid : ${group.id}
					},
					dataType: "json",
					success : function(data){
	  						if(data.code%10==1){
	  							alert("成功了");
	  						}
	  						else if(data.code%10==2){
	  							alert("您已申请过该小组，无需重复申请");
	  						}
	  						else{
	  							alert("出错了");
	  						}
	  					},
  					error : function(){
  						alert("AJAX失败");
  					}
				});
			});
		});
		</script>
	</head>

	<body>
		<div data-role="page">
			<div data-role="header">
		  		<a data-role="button" data-rel="back" data-icon="back">返回</a>
			   	<h1>组队信息</h1>
			</div>
			
			<div data-role="content" id="main" class="ui-content">
				<c:if test="${code%10==1}">
					<ul data-role="listview" data-inset="true">
						<li data-role="list-divider">基本信息</li>
						<li data-icon="none">组名：<div style="float: right;" id ="groupname">${group.groupname}</div></li>
						<li data-icon="none">小组描述：<div style="float: right;" id ="description">${group.description}</div></li>
						<li data-icon="none">组长：<div style="float: right;" id ="leader">
						<c:if test="${leader!=null}">
							${leader.name}
						</c:if>
						<c:if test="${leader==null}">
							待定
						</c:if></div></li>
						<li data-icon="none">人数上限：<div style="float: right;" id ="maxcount">${group.maxcount}</div></li>
						<li data-role="list-divider">组员名单</li>
						
						<c:forEach var="userinfo" items="${userinfos}">
							<li data-icon="none">姓名：<div style="float: right;">${userinfo.name}</div></li>
						</c:forEach>
					</ul>
				</c:if>
			</div>
		
			<div id="foot-sign" data-role="footer" data-position="fixed" data-fullscreen="true" style="text-align: center;">
				<div data-role="navbar">
				    <ul>
					 	<c:if test="${(fn:length(userinfos)) < group.maxcount}">
					    	<li><a id="apply" href="#messageBox" data-icon="plus">申请参与</a></li>
					    </c:if>
					    <c:if test="${(fn:length(userinfos)) >= group.maxcount}">
					    	<li>满员</li>
					    </c:if>
				    </ul>
				</div>
			</div>
			<div data-role="popup" id="messageBox" class="ui-content" data-overlay-theme="b" style="text-align: center;" >
				<a data-rel="back" class="ui-btn ui-corner-all ui-shadow ui-btn ui-icon-delete ui-btn-icon-notext ui-btn-right" >关闭</a>
				<div id="messageConent"></div>
				
				<a data-rel="back" class="ui-btn">返回</a>
				
			</div>
	</div>
	</body>
</html>
