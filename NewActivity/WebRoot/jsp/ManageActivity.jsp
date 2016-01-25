<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.na.entity.Activity" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'ManageActivity.jsp' starting page</title>
    
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
			width:95%;
			height:25%;
			border:1px solid black;
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
    	<form action="GetActivities" method="post" class="form-horizontal" id="form" style="margin-top:30px;">
	  		<div class="form-group">
	    		<label for="inputEmail3" class="col-sm-2 control-label">活动名称</label>
	    		<div class="col-sm-3" style="float:left">
	      			<input type="text" name="title" id="title" class="form-control" placeholder="请输入活动名称">
	    		</div>
	    		<label class="col-sm-2 control-label">活动状态</label> 
	  			<div class="col-sm-3" style="float:left">
	  				<select class="form-control">
  						<option>正在进行</option>
  						<option>活动结束</option>
					</select>
	  			</div>
	  		</div>
	  		<div class="form-group">
	    		<label for="inputEmail3" class="col-sm-2 control-label">活动开始时间</label>
	            <div class="input-group date form_date" data-date="" data-date-format="" data-link-field="dtp_input2" data-link-format="yyyy-mm-dd" style="float:left;margin-left:15px">
	                <input class="form-control" id="startDate" name="startDate" size="16" type="text" placeholder="开始时间" style="width:170px;">
	                <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
					<span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
				</div>
				<label for="inputEmail3" class="col-sm-2 control-label">截止时间</label>
				 <div class="input-group date form_date" data-date="" data-date-format="" data-link-field="dtp_input2" data-link-format="yyyy-mm-dd" style="float:left">
	                <input class="form-control" id="endDate" name="endDate" size="16" type="text" placeholder="结束时间" style="width:170px;">
	                <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
					<span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
	            </div>
	  		</div>
	  		<center><input type="submit" id="sub" class="btn btn-info" value="查询"></center>
  		</form>
    </div>
    
    <div class="content">
    	<center><h4>活动列表</h4></center>
    	<table width="100%" border="1px" style="text-align:center">
    		<tr>
    			<th>编号</th>
    			<th>活动名称</th>
    			<th>开始时间</th>
    			<th>结束时间</th>
    			<th>地点</th>
    			<th>编辑</th>
    			<th>删除</th>
    			<th>管理</th>
    		</tr>
    		
    		<% int i = 1; %>
    		<%
    			List<Activity> list = (List<Activity>)request.getAttribute("activities");
    			
    			if(list == null){
    			}else{
    				for(Activity activity : list ) {
    				System.out.println("title=" + activity.getTitle());%>
    				
    		<tr>
    			<td><%= i++%></td>
    			<td><%=activity.getTitle() %></td>
    			
    			<td><%=activity.getStarttime() %></td>
    			<td><%=activity.getEndsigntime() %></td>
    			<td><%=activity.getAddress() %></td>
    			<td><span class="glyphicon glyphicon-pencil"></span></td>
    			<td><img src="" /><span class="glyphicon glyphicon-remove"></span></td>
    			<td><img src="" /><span class="glyphicon glyphicon-user"></span></td>
    		</tr>
    		
    		<%}} %>
    		<tr>
    		<td colspan="8">
				<ul class="pagination">
				    <li>
				      <a href="#" aria-label="Previous">
				        <span aria-hidden="true">&laquo;</span>
				      </a>
				    </li>
				    <li><a href="#">1</a></li>
				    <li><a href="#">2</a></li>
				    <li><a href="#">3</a></li>
				    <li><a href="#">4</a></li>
				    <li><a href="#">5</a></li>
				    <li>
				      <a href="#" aria-label="Next">
				        <span aria-hidden="true">&raquo;</span>
				      </a>
				    </li>
 				 </ul>
    		</td>
    		</tr>
    	</table>
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
