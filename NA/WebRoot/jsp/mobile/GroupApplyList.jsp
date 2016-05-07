<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE>
<html>
  <head>
  	<title>小组列表</title>
  	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
  	<link rel="stylesheet" href="${pageContext.request.contextPath}/js/jquery.mobile-1.4.5/jquery.mobile-1.4.5.min.css">
  	<script src="${pageContext.request.contextPath}/js/jQuery/jquery-1.12.0.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/jquery.mobile-1.4.5/jquery.mobile-1.4.5.min.js"></script>

  </head>
  <body>
  	<div data-role="page">
  	<div data-role="header">
			<a data-role="button" data-rel="back" data-icon="back">返回</a>
			<h1>信息设置</h1>	  
	</div>
	<div data-role="content" id="main" class="ui-content">
  	<ul data-role="listview">
	  	<c:if test="${list!=null}">
		  	<c:forEach var="group" items="${list}">
		  		<li data-role="list-divider">${group.groupname}</li>
		  		<li data-icon="false" ><a data-ajax="false"  href="${pageContext.request.contextPath}/test/group/showinfo?display=mobile&gid=${group.id}">
		  			<p>描述：<b>${group.description}</b></p>
		  			<p>人数上限：<b>${group.maxcount}</b></p>
		  		</a></li>
		  	</c:forEach>
	  	</c:if>
	  	<c:if test="${list==null}">
	  		<h2 style="text-align: center; color: blue;">此活动暂无可加入小组，请等待管理员分组或点击下面按钮创新小组</h2>
	  		<a href="${pageContext.request.contextPath}/test/group/tocreate?display=mobile&aid=${aid}" data-role="button">创建一个小组</a>
	  	</c:if>
  	</ul>
  	</div>
  	</div>
 </body> 
</html>
