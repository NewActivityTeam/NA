<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
  	<link rel="stylesheet" href="${pageContext.request.contextPath}/js/jquery.mobile-1.4.5/jquery.mobile-1.4.5.min.css">
  	<script src="${pageContext.request.contextPath}/js/jQuery/jquery-1.8.3.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/jquery.mobile-1.4.5/jquery.mobile-1.4.5.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/jquery.qqFace.js"></script>
	<script>
 		function replace_em(str){
			str = str.replace(/\</g,'&lt;');
			str = str.replace(/\>/g,'&gt;');
			str = str.replace(/\n/g,'<br/>');
			str = str.replace(/\[em_([0-9]*)\]/g,'<img src="${pageContext.request.contextPath}/img/inputFace/face/$1.gif" border="0" />');
			return str;
		}
		$(document).on("pageinit",function(){
			$("p.faceContent").each(function() {
				var content = $(this).text();
				$(this).html(replace_em(content));
			})

  		});
	 </script>
	
	<ui data-role="listview" data-inset="true">
  	  	 <li data-role="list-divider">评论</li>
  	  	 <c:set var="now" value="<%=System.currentTimeMillis()%>"></c:set>
  	<c:if test="${code%10==1}">
  		<c:forEach var="comment" items="${comments}">
  			<li data-icon="false" >
	  			<p style="color: blue;">${comment.uname}</p>
	  			<div style="margin-right: 2em; margin-left: 0.5em"><p class="faceContent" style="white-space:pre-wrap;">${comment.content}</p></div>

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
						${Math.round((now-comment.createtime.getTime())/(1000*60*60))}小时前
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
  		<li data-icon="false" >
  			<a data-ajax="false" href="${pageContext.request.contextPath}/comment/showAll?display=mobile&aid=${aid}" style="text-align: center;">查看全部评论</a>
  		</li>
  	</c:if>

  	<c:if test="${code%10!=1}">
  		<li data-icon="false" ><p style="text-align: center; font-size: 1em;">暂无评论</p></li>
  	</c:if>
  	</ul>
