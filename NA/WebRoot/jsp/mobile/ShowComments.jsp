<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
  	<link rel="stylesheet" href="${pageContext.request.contextPath}/js/jquery.mobile-1.4.5/jquery.mobile-1.4.5.min.css">
  	<script src="${pageContext.request.contextPath}/js/jQuery/jquery-1.12.0.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/jquery.mobile-1.4.5/jquery.mobile-1.4.5.min.js"></script>
  	<script>
  	</script>
  	<c:set var="now" value="<%=System.currentTimeMillis()%>"></c:set>
  	<ul data-role="listview" data-inset="true">
  	  	 <li data-role="list-divider">评论</li>
  	<c:if test="${code%10==1}">
  		<c:forEach var="comment" items="${comments}">
  			<li data-icon="false" >
	  			<p style="color: blue;">${comment.uname}</p>
	  			<div style="margin-right: 2em; margin-left: 0.5em"><p  style="white-space:pre-wrap;">${comment.content}</p></div>

				<div class="ui-li-count">
					<c:if test="${(now-comment.createtime.getTime())/1000<3}">
							刚刚
					</c:if>
					<c:if test="${(now-comment.createtime.getTime())/1000>3&&(now-comment.createtime.getTime())/1000<60}">
						${Math.round((now-comment.createtime.getTime())/1000)}秒前
					</c:if>
					<c:if test="${(now-comment.createtime.getTime())/(1000*60)>1&&(now-comment.createtime.getTime())/(1000*60)<60}">
						${Math.round((now-comment.createtime.getTime())/(1000*60))}分前
					</c:if>
					<c:if test="${(now-comment.createtime.getTime())/(1000*60*60)>1&&(now-comment.createtime.getTime())/(1000*60*60)<24}">
						${Math.round((now-comment.createtime.getTime())/(1000*60*24))}小时前
					</c:if>
					<c:if test="${(now-comment.createtime.getTime())/(1000*60*60*24)>1&&(now-comment.createtime.getTime())/(1000*60*60*24)<30}">
						${Math.round((now-comment.createtime.getTime())/(1000*60*60*24))}天前
					</c:if>
					<c:if test="${(now-comment.createtime.getTime())/(1000*60*60*24*30)>1&&(now-comment.createtime.getTime())/(1000*60*60*24*30)<12}">
						${Math.round((now-comment.createtime.getTime())/(1000*60*60*24*30))}月前
					</c:if>
					<c:if test="${(now-comment.createtime.getTime())/(1000*60*60*24*365)>1}">
						${Math.round((now-comment.createtime.getTime())/(1000*60*60*24*365))}年前
					</c:if>
				</div>
  			</li>
  		</c:forEach>
  		
  	</c:if>

  	<c:if test="${code%10!=1}">
  		<li data-icon="false" ><p style="text-align: center; font-size: 1em;">暂无评论</p></li>
  	</c:if>
  	</ul>
