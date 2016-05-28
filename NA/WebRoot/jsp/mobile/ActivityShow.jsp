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
  	<script src="${pageContext.request.contextPath}/js/jquery.qqFace.js"></script>
  	<style>
.activity:after {
	background-image:
		url("<%=request.getContextPath() %>/images/activity.png");
	background-size: 18px 18px;
}

.my:after {
	background-image: url("<%=request.getContextPath() %>/images/my.png");
	background-size: 18px 18px;
}

.team:after {
	background-image: url("<%=request.getContextPath() %>/images/team.png");
	background-size: 18px 18px;
}

.info:after {
	background-image: url("<%=request.getContextPath() %>/images/info.png");
	background-size: 18px 18px;
}

</style>
  	<!-- 页面相关js -->
  	<script>
  		
  		function setFace(){
			$(".emotion").qqFace({
			id : "facebox", //表情盒子的ID
			assign : "commentContent", //给那个控件赋值
			path : "${pageContext.request.contextPath}/img/inputFace/face/"	//表情存放的路径
			});
		}
		$(document).on("pageinit",function(){
  			setFace();
  		});
  		$(document).on("pagecreate",function(){
  			$("#content").load("${pageContext.request.contextPath}/activity/activity_show?aid=${activity.id}");
  			$("#comment").load("${pageContext.request.contextPath}/comment/showDemo?display=mobile&aid=${activity.id}");
  			$("#subComment").on("click",function(){
  				var content = $("#commentContent").val();
  				if(content!=""){
	  				$.ajax({
	  					url : "${pageContext.request.contextPath}/comment/new",
	  					type: "POST",
	  					data: {
	  						aid : ${activity.id},
	  						content : content
	  					},
	  					dataType: "json",
	  					success : function(data){
	  						if(data.code%10==1){
	  							//alert("成功了");
	  							$("#comment").load("${pageContext.request.contextPath}/comment/showDemo?display=mobile&aid=${activity.id}");
	  						}
	  						else{
	  							alert("失败了");
	  						}
	  					},
	  					error : function(){
	  						alert("AJAX失败");
	  					}
	  				});
	  				$("#commentContent").val("");
  				}
  				else{
  					alert("内容不能为空");
  				}
  			});
  			$("#sign").on("click",function(){
  				$.ajax({
  					url : "${pageContext.request.contextPath}/user/join",
  					type : "POST",
  					data : {
  						aid : ${activity.id}
  					},
  					dataType : "json",
  					success : function(data){
  						if(data.code!=null){
  							if(data.code%10==1){
  								$("#toset").hide();
  								$("#messageConent").text("参与成功");
  								$("#messageBox").popup("open");
  							}
  							else if(data.code%10==2){
  								$("#toset").hide();
  								$("#messageConent").text("您已参与或该活动，无需重复参加");
  								$("#messageBox").popup("open");
  							}
  							else if(data.code%10==6){
  								$("#messageConent").text("您尚未填写个人信息，请完善个人信息后参与活动");
  								$("#toset").show();
  								$("#messageBox").popup("open");
  							}
  							else if(data.code%10==9){
  								$("#toset").hide();
  								$("#messageConent").text("您暂时被管理员禁止参与活动，参与失败");
  								$("#messageBox").popup("open");
  							}
  							else{
  								$("#toset").hide();
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
  	<!-- 表情相关js -->
  	<script>
	</script>
	<style>
		span.emotion{width:42px; height:20px; background:url(${pageContext.request.contextPath}/img/inputFace/icon.gif) no-repeat 2px 2px; padding-left:20px; cursor:pointer}
		span.emotion:hover{background-position:2px -28px}
		.qqFace{margin-top:4px;background:#fff;padding:2px;border:1px #dfe6f6 solid;}
		.qqFace table td{padding:0px;}
		.qqFace table td img{cursor:pointer;border:1px #fff solid;}
		.qqFace table td img:hover{border:1px #0066cc solid;}
	</style>
  </head>
  <body>
	  <div data-role="page">
	  <div data-role="header" data-position="fixed" data-fullscreen="true" data-theme="b">
		  <a data-ajax="false"  data-role="button" data-rel="back" data-icon="arrow-l" data-iconpos="notext" data-theme="a">返回</a>
		    <h1>${activity.title}</h1>
	  </div>
	  <div data-role="content" id="content" class="ui-content"></div>
	  <div id="comment"></div>
	  <div  id="input" >
	  	  <textarea id="commentContent" class="input" rows="5" style="margin-bottom: 0.5em;" maxlength="200" placeholder="请在此输入评论内容，自动调整行数，评论不超过200字符"></textarea>
	  	  <span class="emotion">表情</span>
	  	  <a id="subComment" data-role="button" style="width: 3em;float: right; margin-top: 0em">提交</a>
	  </div>
		<c:set var="now" value="<%=new Timestamp(System.currentTimeMillis())%>"/> 
		<div id="foot-sign" data-role="footer" data-position="fixed" data-fullscreen="true" style="text-align: center;">
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
		   <div data-role="popup" id="messageBox" class="ui-content" data-overlay-theme="b" style="text-align: center;" >
	  	  <a data-rel="back" class="ui-btn ui-corner-all ui-shadow ui-btn ui-icon-delete ui-btn-icon-notext ui-btn-right" >关闭</a>
	  		<div id="messageConent"></div>
	  		<a id="toset" data-ajax="false" href="${pageContext.request.contextPath}/test/user/setuserinfo?display=mobile" class="ui-btn" style="display: none;">去设置</a>
	  		<a data-rel="back" class="ui-btn">返回</a>
	 	  </div>
	</div> 
  </body>
</html>
