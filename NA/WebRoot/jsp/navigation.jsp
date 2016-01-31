<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'navigation.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/public.css">
	<!-- jQuery文件，在bootstrap.min.js之前引入 -->
	<script src="http://cdn.bootcss.com/jquery/1.10.2/jquery.min.js"></script>
	
	<script type="text/javascript" src="<%=request.getContextPath() %>/js/public.js"></script>
  </head>
  
  <body id="bg">
  
  	<div class="container">
  		<div class="leftsidebar_box">
  			<a href="../main.html" target="main">
  				<div class="line">
					<img src="<%=request.getContextPath() %>/images/coin01.png" />&nbsp;&nbsp;首页
				</div>
			</a>
  			
  			<dl class="system_log">
				<dt>
					<a href="<%=request.getContextPath()%>/jsp/PublishActivity.jsp" target="right">
						<img class="icon1" src="<%=request.getContextPath() %>/images/coin03.png" /><img class="icon2"
						src="<%=request.getContextPath() %>/images/coin04.png" /> 新增活动<img class="icon3"
						src="<%=request.getContextPath() %>/images/coin19.png" /><img class="icon4"
						src="<%=request.getContextPath() %>/images/coin20.png" />
					</a>
				</dt>
			</dl>
			
			<dl class="system_log">
				<dt>
					<a href="<%=request.getContextPath()%>/jsp/ManageActivity.jsp" target="right">
					<img class="icon1" src="<%=request.getContextPath() %>/images/coin05.png" /><img class="icon2"
						src="<%=request.getContextPath() %>/images/coin06.png" /> 活动管理<img class="icon3"
						src="<%=request.getContextPath() %>/images/coin19.png" /><img class="icon4"
						src="<%=request.getContextPath() %>/images/coin20.png" />
					</a>
				</dt>
			</dl>

  		</div>
  	</div>
  </body>
</html>
