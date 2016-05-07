<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE>
<html>
  <head>
  	<title>用户信息</title>
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
			    <h1>个人信息</h1>	  
		  </div>
		  <div data-role="content" id="main" class="ui-content">
			  <c:if test="${userinfo.name!=null}">
			  	 <ul data-role="listview" data-inset="true">
				 	<li data-role="list-divider">基本信息</li>
					    <li>姓名：<div style="float: right;" ><b>${userinfo.name}</b></div></li>
					  	<li>性别：<div style="float: right;" ><b>
					  	<c:if test="${userinfo.sex==0}">男</c:if>
					  	<c:if test="${userinfo.sex==1}">女</c:if>
					  	</b></div></li>
						<li>年龄：<div style="float: right;" ><b>${userinfo.age}</b></div></li>
					    <li>手机号：<div style="float: right;" ><b>${userinfo.phonenumber}</b></div></li>
					    <li>邮箱：<div style="float: right;" ><b>${userinfo.email}</b></div></li>
				  </ul>
			  </c:if>
			 
	  	</div>
	  	
	</div>
	</body>
</html>
