<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE>
<html>
  <head>
  	<title>轻活动</title>
  	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="http://apps.bdimg.com/libs/jquerymobile/1.4.5/jquery.mobile-1.4.5.min.css">
	<script src="http://apps.bdimg.com/libs/jquery/1.10.2/jquery.min.js"></script>
	<script src="http://apps.bdimg.com/libs/jquerymobile/1.4.5/jquery.mobile-1.4.5.min.js"></script>
  	<script>
  		$(document).on('pagecreate',function(){
  			//$('#main').load("");
  		});
  	</script>
  </head>
  <body>
	  <div data-role="page">
	  <div data-role="header" data-position="fixed"  data-fullscreen="true">
		  <a href="#" data-role="button" data-rel="back" data-icon="delete">关闭</a>
		    <h1>轻活动</h1>
		  <a href="./test/user/getuserinfo?display=mobile" data-role="button" data-icon="user">个人信息</a>
		  
	  </div>
	
	  <div data-role="content" id="main" class="ui-content">
	  
	  </div>
	  
	  <div data-role="footer" data-position="fixed" data-fullscreen="true">
	    <div data-role="navbar">
			    <ul>
			      <li><a href="#anylink">进行中</a></li>
			      <li><a href="#anylink">已结束</a></li>
			    </ul>
			  </div>
		  </div>
	  </div>
	  

  </body>
</html>
