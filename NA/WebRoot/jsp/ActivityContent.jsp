<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>
<html>
  <head>
	<meta charset="UTF-8"> 
	<style type="text/css">
		img, object { max-width: 100%;}
	</style>
  </head>
  
  <body>
	  <c:if test="${code == 90211 }">
	  <div id="content">
	  	${activity.description}
	  	<br/>
		<br/>
			<div style="text-align: center; font: normal 120% Helvetica, 楷体, sans-serif; ">
				活动时间：<b>${activity.starttime.toString().substring(0,16)}</b> 至<br/><b> ${activity.endtime.toString().substring(0,16)}</b>
				<br/>
				<br/>
				活动地点： <b style="color: blue;">${activity.address}</b>
				<br/>
				<br/>
				报名截止： <b>${activity.endsigntime.toString().substring(0,16)}</b>
				<br/>
				<br/>
				报名方式：
				<c:if test="${activity.number==1}">
					<b>单人报名</b>
				</c:if>
				<c:if test="${activity.number!=1}">
					<b>组队报名</b><br/>
				每组人数：<b>${activity.number}人</b>
				</c:if>
				<br/><br/>
				投票地址：<a href="${activity.voteaddress}">${activity.voteaddress}</a> 
				<br/><br/>
			</div>
		</div>
	  </c:if>
	  <c:if test="${code != 90211 }">
	  	<c:out value="出错了"></c:out>
	  </c:if>
	
  </body>
</html>
