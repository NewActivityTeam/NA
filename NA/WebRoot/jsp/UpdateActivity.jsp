<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.na.entity.Activity" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE>
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
	
	<!-- jQuery文件，在bootstrap.min.js之前引入 -->
	<script src="http://cdn.bootcss.com/jquery/1.10.2/jquery.min.js"></script>
	<!-- Bootstrap核心JavaScript文件 -->
	<script src="http://cdn.bootcss.com/twitter-bootstrap/3.0.3/js/bootstrap.min.js"></script>
	
	
	<script type="text/javascript" src="<%=request.getContextPath() %>/dist/bootstrap-clockpicker.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath() %>/js/bootstrap-datetimepicker.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath() %>/js/bootstrap-datetimepicker.zh-CN.js"></script>
	
	<style>
		.input-group{
			width: 110px;
			margin-bottom: 10px;
		}
	</style>
	
  </head>
  
  <body>
  	<%
  		Activity activity = (Activity)request.getAttribute("activity");
  	 %>
    <form class="form-horizontal" action="ChangeActivity" method="post" id="form" style="margin-top:30px;" OnSubmit="return check()">
  		<div class="form-group">
    		<label for="inputEmail3" class="col-sm-2 control-label">活动名称</label>
    		<div class="col-sm-7">
      			<input type="text" name="title" id="title" value=<%=activity.getTitle()%> class="form-control" placeholder="请输入活动名称">
    		</div>
  		</div>
  		
  		<div class="form-group">
    		<label for="inputEmail3" class="col-sm-2 control-label">活动时间</label>
            <div class="input-group date form_date" data-date="" data-date-format="" data-link-field="dtp_input2" data-link-format="yyyy-mm-dd" style="float:left;margin-left:15px">
                <input class="form-control" onfocus="this.blur()" id="startDate" value=<%=activity.getStarttime().toString().split(" ")[0]%> name="startDate" size="16" type="text" placeholder="开始时间" style="width:170px;">
                <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
				<span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
            </div>
    		<div class="input-group clockpicker" style="float:left;margin-left:10px;">
				<input type="text" id="startTime" onfocus="this.blur()" value=<%=activity.getStarttime().toString().split(" ")[1].substring(0,5)%> name="startTime" class="form-control" value="09:30">
				<span class="input-group-addon">
					<span class="glyphicon glyphicon-time"></span>
				</span>
			</div>
			<hr style="margin-left:5px;margin-right:5px;float:left;height:1px;width:20px;border:none;border-top:1px solid #555555;" />
			 <div class="input-group date form_date" data-date="" data-date-format="" data-link-field="dtp_input2" data-link-format="yyyy-mm-dd" style="float:left">
                <input class="form-control" onfocus="this.blur()" id="endDate" value=<%=activity.getEndtime().toString().split(" ")[0] %> name="endDate" size="16" type="text" placeholder="结束时间" style="width:170px;">
                <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
				<span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
            </div>
    		<div class="input-group clockpicker" style="float:left;margin-left:10px;">
				<input type="text" id="endTime" onfocus="this.blur()" value=<%=activity.getEndtime().toString().split(" ")[1].substring(0,5) %> name="endTime" class="form-control" value="09:30">
				<span class="input-group-addon">
					<span class="glyphicon glyphicon-time"></span>
				</span>
			</div>
  		</div>
  		
  		<div class="form-group">
    		<label for="inputEmail3" class="col-sm-2 control-label">报名截止时间</label>
    		<div class="input-group date form_date" data-date="" data-date-format="" data-link-field="dtp_input2" data-link-format="yyyy-mm-dd" style="float:left;margin-left:15px;">
                <input class="form-control" id="endSignDate" onfocus="this.blur()" value=<%=activity.getEndsigntime().toString().split(" ")[0] %> name="endSignDate" size="16" type="text" placeholder="报名截止时间" style="width:170px;">
                <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
				<span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
            </div>
    		<div class="input-group clockpicker" style="float:left;margin-left:10px;">
				<input type="text" id="endSignTime" onfocus="this.blur()" value=<%=activity.getEndsigntime().toString().split(" ")[1].substring(0,5) %> name="endSignTime" class="form-control" value="09:30" >
				<span class="input-group-addon">
					<span class="glyphicon glyphicon-time"></span>
				</span>
			</div>
  		</div>
  		
  		<div class="form-group">
    		<label for="inputEmail3" class="col-sm-2 control-label">活动地点</label>
    		<div class="col-sm-7">
    			<input class="form-control" style="width:150px;float:left" placeholder="上海对外经贸大学" readonly/>
    			<input class="form-control" name="address" value=<%=activity.getAddress() %> id="address" style="width:400px;float:left;margin-left:20px;" placeholder="请输入活动地址" />
    		</div>
  		</div>
  		
  		<div class="form-group">
    		<label for="inputEmail3" class="col-sm-2 control-label">投票地址</label>
    		<div class="col-sm-7">
    			<input class="form-control" name="voteaddress" value=<%=activity.getVoteaddress() %> id="voteaddress" placeholder="请输入投票地址" />
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
    				<select id="inputperson" style="display:none">
					    <option value="0">请选择活动人数</option>
					    <option value="1">1人</option>
					    <option value="2">2人</option>
					    <option value="3">3人</option>
					    <option value="1">4人</option>
					    <option value="2">5人</option>
					    <option value="3">6人</option>
					</select>
    			</div>

    		</div>
  		</div>
  		
  		<script>
  			var editor = new UE.ui.Editor({initialFrameHeight:300});  
			editor.render("myEditor");
			UE.getEditor("myEditor").ready(function(){
				
				UE.getEditor("myEditor").setContent('<%=activity.getDescription()%>');
			});
		
			//1.2.4以后可以使用一下代码实例化编辑器 
			//UE.getEditor('myEditor') 
  		</script>
  		<div style="margin-left:auto;margin-right:auto;text-align:center">
  			<label for="inputEmail3" class="control-label"><font size="3">活动详情</font></label>
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
  		<input type="hidden" name="manager" value="1" > 
  		<center><input type="submit" id="sub" class="btn btn-info" value="更新活动"></center>
	</form>
	
	
		
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
		
		function getTime(){
			start = new Date(($('#startDate').val() + " " + $('#startTime').val() + ":00").replace("-", "/"));
			end = new Date(($('#endDate').val() + " " + $('#endTime').val() + ":00").replace("-", "/"));
			sign = new Date(($('#endSignDate').val() + " " + $('#endSignTime').val() + ":00").replace("-", "/"));
		}
		function isLegalTime(){
			getTime();
			if(sign > start){
				alert("报名截止日期需要比活动开始日期早，请填写合理日期，谢谢！")
				return false;
			}
			if(start > end){
				alert("开始日期要比结束日期早，请填写合理日期，谢谢！");
				return false;
			}
			return true;
		}
		
		$(document).ready(function(){
			if(parseInt('<%=activity.getNumber() %>') > 1){
				$('#mulperson').attr("checked","checked");
				$('#inputperson').css('display','block');
				$('#inputperson').find('option').eq('<%=activity.getNumber() %>').attr("selected",true);
			}
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
				if(check()==true && isLegalTime() == true){
					$.ajax({ 
					url: "ChangeActivity", 
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
