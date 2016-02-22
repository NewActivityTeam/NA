<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
  	<link rel="stylesheet" href="${pageContext.request.contextPath}/js/jquery.mobile-1.4.5/jquery.mobile-1.4.5.min.css">
  	<script src="${pageContext.request.contextPath}/js/jQuery/jquery-1.8.3.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/jquery.mobile-1.4.5/jquery.mobile-1.4.5.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/jquery.qqFace.js"></script>
	<script>
	$(function(){
		$('.emotion').qqFace({
			id : 'facebox', //表情盒子的ID
			assign:'aaa', //给那个控件赋值
			path:'${pageContext.request.contextPath}/img/inputFace/face/'	//表情存放的路径
		});

	});
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
	<div data-role="header" data-position="fixed">
	   <h1>标题</h1>
	</div>
       	<textarea class="input" id="aaa" class="input" rows="5" style="margin-bottom: 0.5em;" maxlength="200" placeholder="请在此输入评论内容，自动调整行数，评论不超过200字符"></textarea>
       	<span class="emotion">表情</span>
	<div data-role="footer" data-position="fixed">
	   <h1>结尾</h1>
	</div>
	
</div>
</body>
</html>
