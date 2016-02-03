<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE>
<html>
	 <head>
	  	<title>信息设置</title>
	  	<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
	  	<link rel="stylesheet" href="${pageContext.request.contextPath}/js/jquery.mobile-1.4.5/jquery.mobile-1.4.5.min.css">
	  	<script src="${pageContext.request.contextPath}/js/jQuery/jquery-1.12.0.min.js"></script>
		<script src="${pageContext.request.contextPath}/js/jquery.mobile-1.4.5/jquery.mobile-1.4.5.min.js"></script>
		<script>
  		$(document).on('pagecreate',function(){
  			$("#saveSub").on("click",function(){
  				AJAXTest();
  			});
  			$("#save").on("click",function(){
  				TestAll();
  			});
  			$("#nameSub").on("click",function(){
  				var content = $("#myName").val();
  				$("#nameInfo").html(content);
  				history.back();
  				$("#myName").val("");
  			});
  			$("#sexSub").on("click",function(){
  				var content = $("#mySex").val();
  				if(content=="0"){
  				  	$("#sexInfo").html("男");
  				}
  				else{
  					$("#sexInfo").html("女");
  				}
  				history.back();
  				$("#mySex").val("");
  			});
  			$("#ageSub").on("click",function(){
  				var content = $("#myAge").val();
  				sub = 3;
  				if(TestContent(sub,content)){
  					$("#ageInfo").html(content);
  					history.back();
  				}
  				else{
					$("#ageErr").show();
  				}
  			});
  			$("#heightSub").on("click",function(){
  				var content = $("#myHeight").val();
  				sub = 1;
  				if(TestContent(sub,content)){
  					$("#heightInfo").html(content);
  					history.back();
  				}
  				else{
					$("#heightErr").show();
  				}
  				$("#myHeight").val("");
  			});
  			$("#weightSub").on("click",function(){
  				var content = $("#myWeight").val();
  				sub = 2;
  				if(TestContent(sub,content)){
  					$("#weightInfo").html(content);
  					history.back();
  				}
  				else{
					$("#weightErr").show();
  				}
  				$("#myWeight").val("");
  			});
  			$("#phoneSub").on("click",function(){
  				var content = $("#myPhone").val();
  				sub = 5;
  				if(TestContent(sub,content)){
  					$("#phoneInfo").html(content);
  					history.back();
  				}
  				else{
					$("#phoneErr").show();
  				}
  				$("#myPhone").val("");
  			});
  			$("#emailSub").on("click",function(){
  				var content = $("#myEmail").val();
  				sub = 6;
  				if(TestContent(sub,content)){
  					$("#emailInfo").html(content);
  					history.back();
  				}
  				else{
					$("#emailErr").show();
  				}
  				$("#myEmail").val("");

  			});
  		});
  		function AJAXTest(){
  			var name = $("#nameInfo").html(); 
  			var sex;
  			if($("#sexInfo").html()=="男"){
  				sex=0;
  			} 
  			else if($("#sexInfo").html()=="女"){
  				sex=1;
  			}
  			var age = $("#ageInfo").html(); 
  			var height = $("#heightInfo").html(); 
  			var weight = $("#weightInfo").html(); 
  			var phone = $("#phoneInfo").html(); 
  			var email = $("#emailInfo").html(); 
  			$.ajax({
  				url : "${pageContext.request.contextPath}/test/user/saveinfo",
  				type : "POST",
  				data : {
					name : name,
					sex : sex,
					age : age,
					height : height,
					weight : weight,
					phone : phone,
					email : email
  				},
  				dataType : "json",
  				success :function(data){
  					if(data.code==11011){	
  						//$("#messageBox").popup("close");
  						$("#message").html("设置成功");
  						$("#subdiv").hide();
  						$("#back").hide();
  						$("#tohome").show();
  						$("#messageBox").popup("open");
	  				}
	  				else if(data.code==11012){
						$("#message").html("您已设置过用户信息，无需重复设置");
						$("#subdiv").hide();
  						$("#back").hide();
  						$("#tohome").show();
	  				}
	  				else{
	  					$("#message").html("设置失败");
	  					$("#subdiv").hide();
  						$("#back").show();
  						$("#tohome").hide();						
	  				}
  				},
  				error : function(){
					$("#message").html("AJAX失败");
					$("#subdiv").hide();
					$("#back").show();
					$("#tohome").hide();				
  				}
  				
  			});
  		}

  		function TestContent(sub,content){
  			switch(sub){
  				case 3:
  					var pattern =/^[1-9]\d*|0$/;
  					if(!pattern.test(content)||content<0||content>130){
  						return false;
  					}
  					else{
  						return true;
  					}
  					break;
  				case 1:
  					if(isNaN(content)||content>300||content<30){
  						return false;
  					}

  					break;
  				case 2:
  					if(isNaN(content)||content>300||content<3){
  						return false;
  					}

  					break;
  				case 5:
  					var reg = /^0?1[3|4|5|8][0-9]\d{8}$/;
					if (!reg.test(content)) {
						return false;
  					}

  					
  					break;
  				case 6:
  					if( content=="" || ( content!="" && !/.+@.+\.[a-zA-Z]{2,4}$/.test(content) ) ){
                		return false;
  					}

  					break;
  				default:
  					return false;
  					break;
  			}
  			return true;
  		}
  		function TestAll(){
  			var name = $("#nameInfo").html(); 
  			var sex = $("#sexInfo").html(); 
  			var age = $("#ageInfo").html(); 
  			var height = $("#heightInfo").html(); 
  			var weight = $("#weightInfo").html(); 
  			var phone = $("#phoneInfo").html(); 
  			var email = $("#emailInfo").html(); 
  			if(email==""){
  				$("#message").html("Email尚未设置");
  				$("#messageBox").popup("open");
  			}
  			else if(phone==""){
  				$("#message").html("手机号尚未设置");
  				$("#messageBox").popup("open");
  			}
  			else if(weight==""){
  				$("#message").html("体重尚未设置");
  				$("#messageBox").popup("open");
  			}
  			else if(height==""){
  				$("#message").html("身高尚未设置");
  				$("#messageBox").popup("open");
  			}
  			else if(age==""){
  				$("#message").html("年龄尚未设置");
  				$("#messageBox").popup("open");
  			}
  			else if(sex==""){
  				$("#message").html("性别尚未设置");
  				$("#messageBox").popup("open");
  			}
  			else if(name==""){
  				$("#message").html("姓名尚未设置");
  				$("#messageBox").popup("open");
  			}
  			else{
  				$("#message").html("基本信息（姓名，性别）提交后将不可修改，是否提交设置");
  				$("#messageBox").popup("open");
  				$("#subdiv").show();
  			}
  		}
  	</script>
	</head>
	<body>
		<div data-role="header">
			<a data-role="button" data-rel="back" data-icon="back">返回</a>
			<h1>信息设置</h1>	  
		</div>
		<div data-role="content" id="main" class="ui-content">
			<ul data-role="listview" data-inset="true">
			 	<li data-role="list-divider">基本信息</li>
				    <li data-icon="edit"><a href="#setName"  data-rel="popup" class="ui-btn" data-transition="pop" data-position-to="window">姓名：<div style="float: right;" id = "nameInfo"></div> </a> </li>
				    <li data-icon="edit"><a href="#setSex" data-rel="popup" class="ui-btn" data-transition="pop" data-position-to="window">性别：<div style="float: right;" id="sexInfo" ></div></a></li>
				<li data-role="list-divider">可设置信息</li>
					<li data-icon="edit"><a href="#setAge"  data-rel="popup" class="ui-btn" data-transition="pop" data-position-to="window">年龄：<div style="float: right;" id = "ageInfo"></div> </a> </li>
				    <li data-icon="edit"><a href="#setHeight" data-rel="popup" class="ui-btn" data-transition="pop" data-position-to="window">身高：<div style="float: right;" id="heightInfo" ></div></a></li>
				  	<li data-icon="edit"><a href="#setWeight" data-rel="popup" class="ui-btn" data-transition="pop" data-position-to="window">体重：<div style="float: right;" id="weightInfo"></div></a></li>
				  	<li data-icon="edit"><a href="#setPhone" data-rel="popup" class="ui-btn" data-transition="pop" data-position-to="window">手机号：<div style="float: right;" id="phoneInfo"></div></a></li>
				    <li data-icon="edit"><a href="#setEmail" data-rel="popup" class="ui-btn" data-transition="pop" data-position-to="window">Email：<div style="float: right;" id="emailInfo"></div></a></li> 
			</ul>
		</div>
		<div data-role="popup" id="setName" class="ui-content popup" data-overlay-theme="b">
	  		<a data-rel="back" class="ui-btn ui-corner-all ui-shadow ui-btn ui-icon-delete ui-btn-icon-notext ui-btn-right">关闭</a>
	  		<div data-role="header"><h1>姓名设置</h1></div>
     		<input type="text" id="myName" placeholder="请输入您的姓名" size="25">
     		<a class="ui-btn" id="nameSub">确定</a>
 		</div>
 		<div data-role="popup" id="setSex" class="ui-content popup" data-overlay-theme="b">
	  		<a data-rel="back" class="ui-btn ui-corner-all ui-shadow ui-btn ui-icon-delete ui-btn-icon-notext ui-btn-right">关闭</a>
	  		<div data-role="header"><h1>性别设置</h1></div>
     		<h3>&nbsp;&nbsp;&nbsp;&nbsp;请选择您的性别&nbsp;&nbsp;&nbsp;&nbsp;</h3>
			<select name="sex" id="mySex">
				<option value="0" style="text-align: center;">男</option>
				<option value="1" style="text-align: center;">女</option>
			</select>
     		<a class="ui-btn" id="sexSub">确定</a>
 		</div>
		<div data-role="popup" id="setAge" class="ui-content popup" data-overlay-theme="b">
	  		<a  data-rel="back" class="ui-btn ui-corner-all ui-shadow ui-btn ui-icon-delete ui-btn-icon-notext ui-btn-right">关闭</a>
	  		<div data-role="header"><h1>年龄设置</h1></div>
     		<input type="text" name="content" id="myAge" placeholder="请输入您的年龄" size="25">
     		<p id="ageErr" style="display: none; color: red;">请输入合法的年龄数字（0-130）</p>
     		<a class="ui-btn" id="ageSub">确定</a>
 		</div>
 		<div data-role="popup" id="setHeight" class="ui-content popup" data-overlay-theme="b">
	  		<a data-rel="back" class="ui-btn ui-corner-all ui-shadow ui-btn ui-icon-delete ui-btn-icon-notext ui-btn-right">关闭</a>
	  		<div data-role="header"><h1>身高设置</h1></div>
     		<input type="text" name="content" id="myHeight" placeholder="请输入您的身高(cm)" size="25">
     		<p id="heightErr" style="display: none; color: red;">请输入合法的身高（30-300）</p>
     		<a class="ui-btn" id="heightSub">确定</a>
 		</div>
 		<div data-role="popup" id="setWeight" class="ui-content popup" data-overlay-theme="b">
  			<a data-rel="back" class="ui-btn ui-corner-all ui-shadow ui-btn ui-icon-delete ui-btn-icon-notext ui-btn-right">关闭</a>
  			<div data-role="header"><h1>体重设置(kg)</h1></div>
     		<input type="text" name="content" id="myWeight" placeholder="请输入您的体重(kg)" size="25">
     		<p id="weightErr" style="display: none; color: red;">请输入合法的体重（3-300）</p>
     		<a class="ui-btn" id="weightSub">确定</a>
 		</div>
 		<div data-role="popup" id="setPhone" class="ui-content popup" data-overlay-theme="b">
  			<a data-rel="back" class="ui-btn ui-corner-all ui-shadow ui-btn ui-icon-delete ui-btn-icon-notext ui-btn-right">关闭</a>
  			<div data-role="header"><h1>手机号设置</h1></div>
     		<input type="text" name="content" id="myPhone" placeholder="请输入您的手机号" size="25">
     		<p id="phoneErr" style="display: none; color: red;">请输入合法的手机号</p>
     		<a  class="ui-btn" id="phoneSub">确定</a>
 		</div>
 		<div data-role="popup" id="setEmail" class="ui-content popup" data-overlay-theme="b">
  			<a data-rel="back" class="ui-btn ui-corner-all ui-shadow ui-btn ui-icon-delete ui-btn-icon-notext ui-btn-right">关闭</a>
  			<div data-role="header"><h1>电子邮箱设置</h1></div>
     		<input type="text" name="content" id="myEmail" placeholder="请输入您的电子邮箱" size="30">
     		<p id="emailErr" style="display: none; color: red;">请输入合法的Email地址</p>
     		<a class="ui-btn" id="emailSub">确定</a>
 		</div>
 		<div data-role="popup" id="messageBox" class="ui-content" data-overlay-theme="b" style="text-align: center;">
 			<div id="message" style="text-align: center;"></div>
 			<div id="subdiv" style="display: none;">
	 			<a id="saveSub"class="ui-btn" style="display:inline-table; text-align: center;">提交</a>
	 			<a data-rel="back" class="ui-btn" style="display: inline-table; text-align: center;">返回</a>
 			</div>
 			<a id="back" data-rel="back" class="ui-btn ui-shadow ui-btn" style="display: none; text-align: center;">返回</a>
	 		<a data-ajax="false" id="tohome" href="${pageContext.request.contextPath}/mobilehome" class="ui-btn" style="display: none; text-align: center;">返回首页</a>
 		</div>
		<div id="foot-sign" data-role="footer" data-position="fixed">
			<div data-role="navbar">
				<ul>
		    		<li><a id="save" data-rel="popup" class="ui-btn" data-transition="pop" data-position-to="window" data-icon="plus">保存设置</a></li>
				</ul>
			</div>
		</div>
		
	</body>
</html>