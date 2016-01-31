<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'ManageActivityOfSearch.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<!-- 新 Bootstrap 核心 CSS 文件 -->
	<link rel="stylesheet" href="http://cdn.bootcss.com/twitter-bootstrap/3.0.3/css/bootstrap.min.css">
	<link href="http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.min.css" rel="stylesheet">
	
	<!-- include summernote css/js-->
	<link rel="stylesheet" href="<%=request.getContextPath() %>/css/summernote.css" />
	
	
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/dist/bootstrap-clockpicker.min.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/assets/css/github.min.css">
	<link href="<%=request.getContextPath() %>/css/bootstrap-datetimepicker.min.css" rel="stylesheet">
	
	
	<style>
		.input-group{
			width: 110px;
			margin-bottom: 10px;
		}
	</style>


	<style>
		.top{
			margin-right:auto;
			margin-left:auto;
			width:100%;
			height:100%;
		}
		.content{
			margin-right:auto;
			margin-left:auto;
			width:95%;
			height:75%;
			border:1px solid black;
		}
		th{
			align:center;
			text-align:center;
		}
	</style>
  </head>
  
  <body>
     <div class="top">
    	<center><h4>活动查询条件</h4></center>
    	<form action="GetActivities?current=1" target="show" method="post" class="form-horizontal" id="form" style="margin-top:30px;">
	  		<div class="form-group">
	  			<div class="col-sm-3" style="float:left">
	      			<input type="text" name="title" id="title" class="form-control" placeholder="请输入活动名称">
	    		</div>
	            <div class="input-group date form_date" data-date="" data-date-format="" data-link-field="dtp_input2" data-link-format="yyyy-mm-dd" style="float:left;margin-left:15px">
	                <input class="form-control" onfocus="this.blur()" id="startDate" name="startDate" size="16" type="text" placeholder="开始时间" style="width:170px;">
	                <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
					<span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
				</div>
				 <div class="input-group date form_date" data-date="" data-date-format="" data-link-field="dtp_input2" data-link-format="yyyy-mm-dd" style="float:left;margin-left:20px">
	                <input class="form-control" id="endDate" onfocus="this.blur()" name="endDate" size="16" type="text" placeholder="结束时间" style="width:170px;">
	                <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
					<span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
	            </div>
	  		</div>
	  		<center><input type="submit" id="sub" class="btn btn-info" value="查询"></center>
  		</form>
    </div>
    
    <!-- jQuery文件，在bootstrap.min.js之前引入 -->
	<script src="http://cdn.bootcss.com/jquery/1.10.2/jquery.min.js"></script>
	<!-- Bootstrap核心JavaScript文件 -->
	<script src="http://cdn.bootcss.com/twitter-bootstrap/3.0.3/js/bootstrap.min.js"></script>
	
	<script type="text/javascript" src="<%=request.getContextPath() %>/js/summernote.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath() %>/js/summernote-zh-CN.js"></script>
	
	<script type="text/javascript" src="<%=request.getContextPath() %>/dist/bootstrap-clockpicker.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath() %>/js/bootstrap-datetimepicker.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath() %>/js/bootstrap-datetimepicker.zh-CN.js"></script>
	
	
	<script type="text/javascript">
		$('.clockpicker').clockpicker()
		.find('input').change(function(){
			console.log(this.value);
		});
	</script>

	<script type="text/javascript">
    $('.form_date').datetimepicker({
        language: 'zh-CN',
        weekStart: 1,
        todayBtn: 1,
  		autoclose: 1,
  		todayHighlight: 1,
  		startView: 2,
 		 minView: 2,
 		 forceParse: 0
    });
	</script>
  </body>
</html>
