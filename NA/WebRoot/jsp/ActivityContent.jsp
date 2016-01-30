<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>
<html>
  <head>
	<meta charset="UTF-8"> 
  </head>
  <body>
	  <c:if test="${code == 90211 }">
	  	${activity.description}
	  	<br/>
		<br/>
		<div style="text-align: center; font-family: '楷体'; font-size: 20px;">
			活动时间： <b>${activity.starttime} —— ${activity.endtime}</b>
			<br/>
			<br/>
			活动地点： <b style="color: blue;">${activity.address}</b>
			<br/>
			<br/>
			报名截止时间： <b>${activity.endsigntime}</b>
			<br/>
			<br/>
			报名方式：
			<c:if test="${activity.number==1}">
				<b>单人报名</b>
			</c:if>
			<c:if test="${activity.number!=1}">
				<b>组队报名</b>&nbsp;&nbsp;&nbsp;&nbsp;每组人数：<b>${activity.number}人</b>
			</c:if>
			<br/><br/>
			投票地址：<a href="${activity.voteaddress}">${activity.voteaddress}</a> 
			<br/><br/>
		</div>
	  </c:if>
	  <c:if test="${code != 90211 }">
	  	<c:out value="出错了"></c:out>
	  </c:if>
	
  </body>
</html>
