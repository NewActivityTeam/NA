<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- <!DOCTYPE>
<html>
  <head>
  	<title>轻活动</title>
  	<meta charset="UTF-8">

	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	
  </head>
  <body> -->
  	<meta name="viewport" content="width=device-width, initial-scale=1">
  	<link rel="stylesheet" href="${pageContext.request.contextPath}/js/jquery.mobile-1.4.5/jquery.mobile-1.4.5.min.css">
  	<script src="${pageContext.request.contextPath}/js/jQuery/jquery-1.12.0.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/jquery.mobile-1.4.5/jquery.mobile-1.4.5.min.js"></script>
  	<script>
  	</script>
  	<!-- <div>
  		<form action="echo.cfm" method="post">  
			<table>
				<tr>
					<td>
						<input type="search" name="name" id="name" value="" placeholder="Search Activity"/>  
					</td>
					<td>
						<input type="submit" name="submit" value="搜索" style="height:30px;"/>
					</td>
				</tr>
			</table>          
		</form> 
  	</div> -->
  	
  	<ul data-role="listview">
  	<c:if test="${code==90161}">
	  	<c:if test="${list!=null}">
		  	<c:forEach var="activity" items="${list}">
		  		<li data-role="list-divider">${activity.title}</li>
		  		<li data-icon="false" ><a data-ajax="false"  href="${pageContext.request.contextPath}/activity/activity_show?display=mobile&aid=${activity.id}" target="_parent">
		  			<p>开始时间：<b>${activity.starttime.toString().substring(0,16)}</b></p>
		  			<p>结束时间：<b>${activity.endtime.toString().substring(0,16)}</b></p>
		  			<p>活动地点：<b>${activity.address}</b></p>
		  			<p>报名截止：<b>${activity.endsigntime.toString().substring(0,16)}</b></p>
		  		</a></li>
		  	</c:forEach>
	  	</c:if>
	  	<c:if test="${list==null}">
	  		<h2 style="text-align: center; color: blue;">此类活动暂时为空</h2>
	  	</c:if>
  	</c:if>
  	<c:if test="${code!=90161}">
  		<h1>查询异常</h1>
  	</c:if>
  	</ul>
 <!-- </body> 
</html> -->
