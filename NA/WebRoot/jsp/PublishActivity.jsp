<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'PublishActivity.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<!-- 新 Bootstrap 核心 CSS 文件 -->
	<link rel="stylesheet" href="http://cdn.bootcss.com/twitter-bootstrap/3.0.3/css/bootstrap.min.css">
	<link href="http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.min.css" rel="stylesheet">
	
	
	
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/dist/bootstrap-clockpicker.min.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/assets/css/github.min.css">
	<link href="<%=request.getContextPath() %>/css/bootstrap-datetimepicker.min.css" rel="stylesheet">
	
	
	<SCRIPT type=text/javascript src="<%=request.getContextPath() %>/ueditor/ueditor.config.js"></SCRIPT>  
	<SCRIPT type=text/javascript src="<%=request.getContextPath() %>/ueditor/ueditor.all.js"></SCRIPT>
	
	<style>
		.input-group{
			width: 110px;
			margin-bottom: 10px;
		}
	</style>
	
  </head>
  
  <body>
  	
    <form class="form-horizontal" action="PublishActivity" method="post" id="form" style="margin-top:30px;" OnSubmit="return check()">
  		<div class="form-group">
    		<label for="inputEmail3" class="col-sm-2 control-label">活动名称</label>
    		<div class="col-sm-7">
      			<input type="text" name="title" id="title" class="form-control" placeholder="请输入活动名称">
    		</div>
  		</div>
  		
  		<div class="form-group">
    		<label for="inputEmail3" class="col-sm-2 control-label">活动时间</label>
            <div class="input-group date form_date" data-date="" data-date-format="" data-link-field="dtp_input2" data-link-format="yyyy-mm-dd" style="float:left;margin-left:15px">
                <input class="form-control" id="startDate" name="startDate" size="16" type="text" placeholder="开始时间" style="width:170px;">
                <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
				<span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
            </div>
    		<div class="input-group clockpicker" style="float:left;margin-left:10px;">
				<input type="text" id="startTime" name="startTime" class="form-control" value="09:30">
				<span class="input-group-addon">
					<span class="glyphicon glyphicon-time"></span>
				</span>
			</div>
			<hr style="margin-left:5px;margin-right:5px;float:left;height:1px;width:20px;border:none;border-top:1px solid #555555;" />
			 <div class="input-group date form_date" data-date="" data-date-format="" data-link-field="dtp_input2" data-link-format="yyyy-mm-dd" style="float:left">
                <input class="form-control" id="endDate" name="endDate" size="16" type="text" placeholder="结束时间" style="width:170px;">
                <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
				<span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
            </div>
    		<div class="input-group clockpicker" style="float:left;margin-left:10px;">
				<input type="text" id="endTime" name="endTime" class="form-control" value="09:30">
				<span class="input-group-addon">
					<span class="glyphicon glyphicon-time"></span>
				</span>
			</div>
  		</div>
  		
  		<div class="form-group">
    		<label for="inputEmail3" class="col-sm-2 control-label">报名截止时间</label>
    		<div class="input-group date form_date" data-date="" data-date-format="" data-link-field="dtp_input2" data-link-format="yyyy-mm-dd" style="float:left;margin-left:15px;">
                <input class="form-control" id="endSignDate" name="endSignDate" size="16" type="text" placeholder="报名截止时间" style="width:170px;">
                <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
				<span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
            </div>
    		<div class="input-group clockpicker" style="float:left;margin-left:10px;">
				<input type="text" id="endSignTime" name="endSignTime" class="form-control" value="09:30" >
				<span class="input-group-addon">
					<span class="glyphicon glyphicon-time"></span>
				</span>
			</div>
  		</div>
  		
  		<div class="form-group">
    		<label for="inputEmail3" class="col-sm-2 control-label">活动地点</label>
    		<div class="col-sm-7">
    			<input class="form-control" style="width:150px;float:left" placeholder="上海对外经贸大学" readonly/>
    			<input class="form-control" name="address" id="address" style="width:400px;float:left;margin-left:20px;" placeholder="请输入活动地址" />
    		</div>
  		</div>
  		
  		<div class="form-group">
    		<label for="inputEmail3" class="col-sm-2 control-label">投票地址</label>
    		<div class="col-sm-7">
    			<input class="form-control" name="voteaddress" id="voteaddress" placeholder="请输入投票地址" />
    		</div>
  		</div>
  		
  		<div class="form-group">
    		<label for="inputEmail3" class="col-sm-2 control-label">报名方式</label>
    		<div class="col-sm-7">
    			<div style="float:left">
    				<input type="radio" name="join" id="oneperson" checked="checked">单人报名&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    				<input type="radio" name="join" id="mulperson">组队报名
    			</div>
    			<div style="float:left;margin-left:30px;">
    				<input class="form-control" style="width:200px;display:none;" id="inputperson" style="" placeholder="请输入每组人数"/>
    			</div>

    		</div>
  		</div>
  		<div style="margin-left:auto;margin-right:auto;text-align:center;">
  			<label for="inputEmail3" class="control-label"><font size="4">活动详情</font></label>
  		</div>
  		
  		<div class="form-group" style="margin-left:80px;">
    		<div class="col-sm-11">
    			<TEXTAREA id="myEditor" name="mycontent"></TEXTAREA>  	
  			</div>
  		</div>
  		
  		
  		<center>
  		<div id="error">
  		</div>
  		</center>
  		<hr style="width:80%;height:5px;border:none;border-top:5px ridge green;" />
  		<input type="text" name="createDate" id="createDate" style="display:none;"/>
  		<input type="text" name="createTime" id="createTime" style="display:none;"/>
  		<input type="hidden" name="manager" id="manager" value="1" > 
  		<center><input type="button" id="sub" class="btn btn-info" value="发布活动"></center>
	</form>
	
	
	<!-- jQuery文件，在bootstrap.min.js之前引入 -->
	<script src="http://cdn.bootcss.com/jquery/1.10.2/jquery.min.js"></script>
	<!-- Bootstrap核心JavaScript文件 -->
	<script src="http://cdn.bootcss.com/twitter-bootstrap/3.0.3/js/bootstrap.min.js"></script>
	
	
	
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
	<script>
		var editor = new UE.ui.Editor({initialFrameHeight:300});  
		editor.render("myEditor");  
		
		//1.2.4以后可以使用一下代码实例化编辑器 
		//UE.getEditor('myEditor') 
		
		
		function isAllSign(){
			var title = $('#title').val();
			var startdate = $('#startDate').val();
			var starttime = $('#startTime').val();
			var enddate = $('#endDate').val();
			var endtime = $('#endTime').val();
			var endsigndate = $('#endSignDate').val();
			var endsigntime = $('#endSignTime').val();
			var date = new Date();
			var month = date.getMonth() + 1;
			var createdate = date.getFullYear() + "-" + month + "-" + date.getDate();
			var createtime = date.getHours() + ":" + date.getMinutes();
			var address = $('#address').val();
			var voteaddress = $('#voteaddress').val();
			var markup = UE.getEditor("myEditor").getContent();
			$('#content').attr("value",markup);
			$('#createDate').attr("value",createdate);
			$('#createTime').attr("value",createtime);
			if(title == "" || startdate == "" || starttime == "" || enddate == "" || endtime == "" || endsigndate == ""
			|| endsigntime == "" || createdate == "" || createtime == "" || address == "" || voteaddress == ""){
				return false;
			}else{
				return true;
			}
		}
		function check(){
			if(!isAllSign()){
				$('#error').html("<span><font color='red'><strong>请把表单填写完整!</strong></font></span>");
				return false;
			}
			return true;
		}
		$(document).ready(function(){
			$('#mulperson').click(function(){
				$('#inputperson').show();
			});
			$('#oneperson').click(function(){
				$('#inputperson').hide();
			});
			//AJAX访问
			$('#sub').click(function(){
				var title = $('#title').val();
				var startdate = $('#startDate').val();
				var starttime = $('#startTime').val();
				var enddate = $('#endDate').val();
				var endtime = $('#endTime').val();
				var endsigndate = $('#endSignDate').val();
				var endsigntime = $('#endSignTime').val();
				var date = new Date();
				var month = date.getMonth() + 1;
				var createdate = date.getFullYear() + "-" + month + "-" + date.getDate();
				var createtime = date.getHours() + ":" + date.getMinutes();
				var address = $('#address').val();
				var voteaddress = $('#voteaddress').val();
				var content = UE.getEditor("myEditor").getContent();
				var manager = $('#manager').val();
				var number = $('#inputperson').val();
				if(check()==true){
					$.ajax({ 
					url: "PublishActivity", 
					type:"POST",
					data:{
						title : title,
						startDate : startdate,
						startTime : starttime,
						endDate : enddate,
						endTime : endtime,
						endSignDate : endsigndate,
						endSignTime : endsigntime,
						createDate : createdate,
						createTime : createtime,
						address : address,
						voteaddress : voteaddress,
						content : content,
						manager : manager,
						number : number
					},
					dataType : "json",
					success: function(data,status){
						if(status=="success"){
	        				if(data.code==12011){
	        					alert("成功了");
	        				}
	        				else{
	        					alert("失败");
	        				}
	        			}
	      			},
	      			error: function(){
	      				alert("出错了");
	      			}
	      		}
	      		);
      			}
			});
		});
		
     </script>
  </body>
</html>