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
	<script>
		$(document).on('pagecreate',function(){

			$(".useritem").on('click',function(){
				var gid = $(this).find(".gid").html();
				var state = $(this).find(".state").html();
				if(state==0){
					$("#chooseBox").popup("open");
				
					$("#accept").on('click',function(){
						$.ajax({
							url: "${pageContext.request.contextPath}/test/groupapply/accept",
							type : "POST",
		  					data : {
		  						gid : gid
		  					},
		  					dataType : "json",
		  					success : function(data){
		  						$("#chooseBox").hide();
		  						if(data.code!=null){
		  							if(data.code%10==1){
		  								$("#messageConent").html("接受成功");
		  								$("#messageBox").popup("open");
		  								
		  									  								
		  							}
		  							else{
		  								$("#messageConent").html("失败");
		  								$("#messageBox").popup("open");
		  							}
		  						}
		  					},
		  					error : function(){
		  						$("#messageConent").html("AJAX失败");
		  						$("#messageBox").popup("open");
		  					}
						});
					});
					$("#refuse").on('click',function(){
						$.ajax({
							url: "${pageContext.request.contextPath}/test/groupapply/refuse",
							type : "POST",
		  					data : {
		  						gid :gid
		  					},
		  					dataType : "json",
		  					success : function(data){
		  						$("#chooseBox").hide();
		  						if(data.code!=null){
		  							if(data.code%10==1){
		  								$("#messageConent").html("拒绝成功");
		  								$("#messageBox").popup("open");
		  							}
		  							else{
		  								$("#messageConent").html("失败");
		  								$("#messageBox").popup("open");
		  							}
		  						}
		  					},
		  					error : function(){
		  						$("#messageConent").html("AJAX失败");
		  						$("#messageBox").popup("open");
		  					}
						});
						
					});
					$("#return").on('click',function(){
						window.location.reload();
					});
				}
			});
		});
	</script>
	<script>
	$(function() {
		var winWidth, winHeight;
		Resize = function() {
			winWidth = $(window).width(), winHeight = $(window).height();
		}
	});
</script>
  </head>
  <body>
  	<div data-role="page">
  	<div data-role="header" data-theme="b">
			<a data-role="button" data-rel="back" data-icon="arrow-l"
				data-iconpos="notext">返回</a>
			<h1>活动管理</h1>	  
	</div>
	<div data-role="content" id="main" class="ui-content" style="background-color:#f5f5f5;">
	<c:if test="${code%10==1 }">
	  	<ul data-role="listview">
		  	<c:if test="${list!=null}">
			  	<c:forEach var="groupApplyinfo" items="${list}">
			  		<li data-icon="false" style="margin-bottom:2%">
			  		
			  		<a class="useritem"  href="" style="background:#ffffff;font-size:1.0em;font-family:楷体;">
			  			<p style="display: none;" class="gid">${groupApplyinfo.groupApply.id}</p>
			  			<p style="display: none;" class="state">${groupApplyinfo.groupApply.state}</p>
			  			<p>姓名：<b>${groupApplyinfo.userinfo.name}</b></p>
			  			<p>性别：<b>
			  			<c:choose>
			  				<c:when test="${groupApplyinfo.userinfo.sex==0}">男</c:when>
			  				<c:otherwise>女</c:otherwise>
			  			</c:choose>
			  			</b>&nbsp;&nbsp;申请时间：<b>${groupApplyinfo.groupApply.createtime.toString().substring(0,16)}</b></p>
			  			<p>手机：<b>${groupApplyinfo.userinfo.phonenumber}</b>&nbsp;&nbsp;Email：<b>${groupApplyinfo.userinfo.email}</b></p>
			  		
			  		</a>
			  		<c:choose>
				  		<c:when test="${groupApplyinfo.groupApply.state == 0}">
				  			<div class="ui-li-count" style="color: green;">未处理</div></li>
				  		</c:when >
				  		<c:when test="${groupApplyinfo.groupApply.state == 1}">
				  			<div class="ui-li-count" style="color: gray;">已接受</div></li>
				  		</c:when >
				  		<c:when test="${groupApplyinfo.groupApply.state == 2}">
				  			<div class="ui-li-count" style="color: red;">已拒绝</div></li>
				  		</c:when >
				  		<c:otherwise>
					        <div class="ui-li-count">有问题</div></li>
					    </c:otherwise>
			  		</c:choose>

			  	</c:forEach>
		  	</c:if>
		  	
	  	</ul>
  	</c:if>
  	<c:if test="${code%10==2}">
  		<h2>尚未有用户申请您的小组</h2>
  	</c:if>
  	</div>
  	<div data-role="popup" id="chooseBox" class="ui-content" data-overlay-theme="b" style="text-align: center;" >
	  	  <a data-rel="back" class="ui-btn ui-corner-all ui-shadow ui-btn ui-icon-delete ui-btn-icon-notext ui-btn-right" >关闭</a>
	  		<h3>请选择您所要执行的操作</h3>
	  		<a id="accept" href="#messageBox" class="ui-btn" style="display: inline-block;;">接受</a>
	  		<a id="refuse" href="#messageBox" class="ui-btn" style="display: inline-block;">拒绝</a>
	</div>
	<div data-role="popup" id="messageBox" class="ui-content" data-overlay-theme="b" style="text-align: center;" >
	  	<a data-rel="back" class="ui-btn ui-corner-all ui-shadow ui-btn ui-icon-delete ui-btn-icon-notext ui-btn-right" >关闭</a>
	  		<div id="messageConent"></div>
		<a data-rel="back" class="ui-btn" id="return" >返回</a>
	</div>
  	</div>
 </body> 
</html>
