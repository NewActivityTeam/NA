<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.sql.Timestamp"%>
<!DOCTYPE>
<html>
  <head>
    <title>My JSP 'JoinedActivityList.jsp' starting page</title>
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/js/jquery.mobile-1.4.5/jquery.mobile-1.4.5.min.css">
  	<script src="${pageContext.request.contextPath}/js/jQuery/jquery-1.12.0.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/jquery.mobile-1.4.5/jquery.mobile-1.4.5.min.js"></script>
  </head>
  
  <body>
  	<c:set var="nowDate" value="<%=new Date()%>"></c:set> 
    <div data-role="page">
    	<div data-role="header">
    		<a href="" data-rel="back">返回</a>
    		<h1>已参与过的活动</h1>
    	</div>
    	<div data-role="content">
    		<c:if test="${list != null}">
    			<c:forEach var="activity" items="${list }">
    			<div data-role="collapsible">
    				<h4>${activity.title }</h4>
    				<ul data-role="listview">
    					<li>
    						<a data-ajax="false" href="${pageContext.request.contextPath}/activity/activity_show?display=mobile&aid=${activity.id}" target="_parent">活动详情</a>
    					</li>
    					<li>
    						<a data-ajax="false" href="${pageContext.request.contextPath}/group/mygroup?display=mobile&aid=${activity.id}" target="_parent">组队信息</a>
    					</li>
    					<c:set var="now" value="<%=new Timestamp(System.currentTimeMillis())%>"/>
    					<c:if test="${activity.endtime <= now}">
    						<li>
    							<a data-ajax="false" href="${pageContext.request.contextPath}/jsp/mobile/ActivityScore.jsp?title=${activity.title}&aid=${activity.id}">评论活动</a>
    						</li>
    					</c:if>
    				</ul>
    				</div>
    			</c:forEach>
    			</c:if>
    			
    			<c:if test="${list == null }">
    				<p>您还未参加任何活动!</p>
    			</c:if>
    		
    	</div>
    </div>
  </body>
</html>
