<%@page import="java.sql.Timestamp"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE>
<html>
  <head>
  	<title>${activity.title}</title>
  	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
  	<link rel="stylesheet" href="${pageContext.request.contextPath}/js/jquery.mobile-1.4.5/jquery.mobile-1.4.5.min.css">
  	<script src="${pageContext.request.contextPath}/js/jQuery/jquery-1.12.0.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/jquery.mobile-1.4.5/jquery.mobile-1.4.5.min.js"></script>
  	<script>
  		$(document).on('pagecreate',function(){
  			$("#main").load("${pageContext.request.contextPath}/test/activity/activity_show?aid="+<c:out value="${activity.id}"></c:out>);
  			$("#sign").on("click",function(){
  				$.ajax({
  					url : "${pageContext.request.contextPath}/test/user/join",
  					type : "POST",
  					data : {
  						aid : ${activity.id}
  					},
  					dataType : "json",
  					success : function(data){
  						if(data.code!=null){
  							if(data.code==14011){
  								//alert("参与成功");
  								$("#messageConent").text("参与成功");
  								$("#messageBox").popup("open");
  							}
  							else if(data.code==14012){
  								//alert("您已参与或该活动，无需重复参加");
  								$("#messageConent").text("您已参与或该活动，无需重复参加");
  								$("#messageBox").popup("open");
  							}
  							else{
  								//alert("参与失败");
  								$("#messageConent").text("参与失败");
  								$("#messageBox").popup("open");
  							}
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
	  <div data-role="header" data-position="fixed" data-fullscreen="true">
		  <a data-ajax="false"  data-role="button" data-rel="back" data-icon="back">返回</a>
		    <h1>${activity.title}</h1>
	  </div>
	
	  <div data-role="content" id="main" class="ui-content">
	  </div>
		<c:set var="now" value="<%=new Timestamp(System.currentTimeMillis())%>"/> 

		  <div id="foot-sign" data-role="footer" data-position="fixed" data-fullscreen="true">
			  <div data-role="navbar">
			    <ul>
				 	<c:if test="${activity.endsigntime>now}">
				    	<li><a id="sign" href="#messageBox" data-icon="plus">我要报名</a></li>
				    </c:if>
				    <c:if test="${activity.endsigntime <= now}">
				    	<li><a id="endsign" style="text-align: center;">报名结束</a></li>
				    </c:if>
			    </ul>
			  </div>
		  </div>
	  	  <div data-role="popup" id="messageBox" class="ui-content" data-overlay-theme="b" >
	  	  <a data-rel="back" class="ui-btn ui-corner-all ui-shadow ui-btn ui-icon-delete ui-btn-icon-notext ui-btn-right" >关闭</a>
	  		<div id="messageConent"></div>
	  		<a data-rel="back" class="ui-btn">确定</a>
	 	  </div>
	</div> 
	  

  </body>
</html>
