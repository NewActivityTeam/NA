<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE>
<html>
  <head>
  	<title>${activity.title}</title>
  	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="http://apps.bdimg.com/libs/jquerymobile/1.4.5/jquery.mobile-1.4.5.min.css">
	<script src="http://apps.bdimg.com/libs/jquery/1.10.2/jquery.min.js"></script>
	<script src="http://apps.bdimg.com/libs/jquerymobile/1.4.5/jquery.mobile-1.4.5.min.js"></script>
  	<script>
  		$(document).on('pagecreate',function(){
  			$('#main').load("./activity_show?aid="+<c:out value="${activity.id}"></c:out>);
  		});
  	</script>
  </head>
  <body>
	  <div data-role="page">
	  <div data-role="header" data-position="fixed">
	  <a href="#" data-role="button" data-rel="back" data-icon="back">返回</a>
	    <h1>${activity.title}</h1>
	  <button class="ui-btn" data-icon="plus">我要报名</button>
	  </div>
	
	  <div data-role="content" id="main" class="ui-content">
	  </div>

	  <div data-role="footer" data-position="fixed">
		  <div data-role="navbar">
		    <ul>
		      <li><a href="#anylink">首页</a></li>
		      <li><a href="#anylink">页面二</a></li>
		      <li><a href="#anylink">搜索</a></li>
		    </ul>
		  </div>
	  </div>
	</div> 
	  

  </body>
</html>
