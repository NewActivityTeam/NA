<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE>
<html>
  <head>
  	<title>个人信息</title>
  	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
  	<link rel="stylesheet" href="${pageContext.request.contextPath}/js/jquery.mobile-1.4.5/jquery.mobile-1.4.5.min.css">
  	<script src="${pageContext.request.contextPath}/js/jQuery/jquery-1.12.0.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/jquery.mobile-1.4.5/jquery.mobile-1.4.5.min.js"></script>
  	<script>
  		$(document).on('pagecreate',function(){
  			$("#ageSub").on("click",function(){
  				var content = $("#newAge").val();
  				sub = 3;
  				if(TestContent(sub,content)){
  					AJAXTest(sub,content);
  					$("#ageErr").hide();
  				}
  				else{
  				  	$("#ageErr").show();
  				}
  				$("#newAge").val("");
  			});
  			$("#heightSub").on("click",function(){
  				var content = $("#newHeight").val();
  				sub = 1;
  				if(TestContent(sub,content)){
  					AJAXTest(sub,content);
  					$("#heightErr").hide();
  				}
  				else{
  					$("#heightErr").show();
  				}
  				$("#newHeight").val("");
  			});
  			$("#weightSub").on("click",function(){
  				var content = $("#newWeight").val();
  				sub = 2;
  				if(TestContent(sub,content)){
  					AJAXTest(sub,content);
  					$("#weightErr").hide();
  				}
  				else{
  					$("#weightErr").show();
  				}
  				$("#newWeight").val("");
  			});
  			$("#phoneSub").on("click",function(){
  				var content = $("#newPhone").val();
  				sub = 5;
  				if(TestContent(sub,content)){
  					AJAXTest(sub,content);
  					$("#phoneErr").hide();
  				}
  				else{
  					$("#phoneErr").show();
  				}
  				$("#newPhone").val("");
  			});
  			$("#emailSub").on("click",function(){
  				var content = $("#newEmail").val();
  				sub = 6;
  				if(TestContent(sub,content)){
  					AJAXTest(sub,content);
  					$("#emailErr").hide();
  				}
  				else{
  					$("#emailErr").show();
  				}
  				$("#newEmail").val("");
  			});
  		});
  		function ShowMessageBox(){
  			$("#messageBox").popup("open");
  		}
  		function AJAXTest(subject,content){
  			$.ajax({
  				url : "changeinfo",
  				type : "POST",
  				data : {
  					subject : subject,
  					content : content,
  				},
  				dataType : "json",
  				success :function(data){
  					if(data.code==11021){	

		  					switch (subject){
		  						case 1:
		  							$('#heightInfo').text(content+" cm");
		  							break;
		  						case 2:
		  							$('#weightInfo').text(content+" kg");
		  							break; 
		  						case 3:
		  							$('#ageInfo').text(content);
		  							break; 
		  						case 5:
			  						$('#phoneInfo').text(content);
			  						break; 
		  						case 6:
			  						$('#emailInfo').text(content);
			  						break; 
		  					}

		  					$("#messageConent").text("修改成功");
  							$("#messageBox").popup("open");
	  				}
	  				else{
	  					$("#messageConent").text("修改失败");
  						$("#messageBox").popup("open");
	  				}
  				},
  				error : function(){
  					$("#messageConent").text("AJAX失败");
  					$("#messageBox").popup("open");
  				}
  				
  			});
  		}

  		function TestContent(sub,content){
  			switch(sub){
  				case 3:
  					var pattern = /^[1-9]\d*|0$/;
  					if(!pattern.test(content)||content<0||content>130){
  						return false;
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
  			}
  			return true;
  		}
  	</script>
  </head>
  <body>
	  <div data-role="page">
		  <div data-role="header">
			  <a data-role="button" data-rel="back" data-icon="back">返回</a>
			    <h1>个人信息</h1>	  
		  </div>
		  <div data-role="content" id="main" class="ui-content">
			  <c:if test="${userinfo.name!=null}">
			  	 <ul data-role="listview" data-inset="true">
				 	<li data-role="list-divider">基本信息</li>
				  	 	<li>易班ID：<div style="float: right;" ><b>${userinfo.uid}</b></div></li>
					    <li>姓名：<div style="float: right;" ><b>${userinfo.name}</b></div></li>
					  	<li>性别：<div style="float: right;" ><b>
					  	<c:if test="${userinfo.sex==0}">男</c:if>
					  	<c:if test="${userinfo.sex==1}">女</c:if>
					  	</b></div></li>
					<li data-role="list-divider">可修改信息</li>
						<li data-icon="edit"><a href="#changeAge"  data-rel="popup" class="ui-btn" data-transition="pop" data-position-to="window">年龄：<div style="float: right;" id = "ageInfo">${userinfo.age}</div> </a> </li>
					    <li data-icon="edit"><a href="#changeHeight" data-rel="popup" class="ui-btn" data-transition="pop" data-position-to="window">身高：<div style="float: right;" id="heightInfo" >${userinfo.height} cm</div></a></li>
					  	<li data-icon="edit"><a href="#changeWeight" data-rel="popup" class="ui-btn" data-transition="pop" data-position-to="window">体重：<div style="float: right;" id="weightInfo">${userinfo.weight} kg</div></a></li>
					  	<li data-icon="edit"><a href="#changePhone" data-rel="popup" class="ui-btn" data-transition="pop" data-position-to="window">手机号：<div style="float: right;" id="phoneInfo">${userinfo.phonenumber}</div></a></li>
					    <li data-icon="edit"><a href="#changeEmail" data-rel="popup" class="ui-btn" data-transition="pop" data-position-to="window">Email：<div style="float: right;" id="emailInfo">${userinfo.email}</div></a></li> 
				  </ul>
			  </c:if>
			  <c:if test="${userinfo.name==null}">
			  		<h2 style="text-align: center;">您尚未设置用户信息</h2>
			  		<a data-ajax="false" href="${pageContext.request.contextPath}/test/user/setuserinfo?display=mobile" class="ui-btn ui-icon-edit ui-btn-icon-top">点击设置</a>
			  </c:if> 
				<div data-role="popup" id="changeAge" class="ui-content popup" data-overlay-theme="b">
			  		<a href="#" data-rel="back" class="ui-btn ui-corner-all ui-shadow ui-btn ui-icon-delete ui-btn-icon-notext ui-btn-right">关闭</a>
			  		<div data-role="header"><h1>年龄修改</h1></div>
		      		<input type="text" name="content" id="newAge" placeholder="请输入新年龄">
		      		<p id="ageErr" style="display: none; color: red;">请输入合法的年龄数字（0-130）</p>
		      		<a href="#messageBox" class="ui-btn" id="ageSub">提交</a>
	   			</div>
	   			<div data-role="popup" id="changeHeight" class="ui-content popup" data-overlay-theme="b">
			  		<a href="#" data-rel="back" class="ui-btn ui-corner-all ui-shadow ui-btn ui-icon-delete ui-btn-icon-notext ui-btn-right">关闭</a>
			  		<div data-role="header"><h1>身高修改</h1></div>
		      		<input type="text" name="content" id="newHeight" placeholder="请输入新身高(cm)">
		      		<p id="heightErr" style="display: none; color: red;">请输入合法的身高（30-300）</p>
		      		<a href="#messageBox" class="ui-btn" id="heightSub">提交</a>
	   			</div>
	   			<div data-role="popup" id="changeWeight" class="ui-content popup" data-overlay-theme="b">
			  		<a href="#" data-rel="back" class="ui-btn ui-corner-all ui-shadow ui-btn ui-icon-delete ui-btn-icon-notext ui-btn-right">关闭</a>
			  		<div data-role="header"><h1>体重修改</h1></div>
		      		<input type="text" name="content" id="newWeight" placeholder="请输入新体重(kg)">
		      		<p id="weightErr" style="display: none; color: red;">请输入合法的体重（3-300）</p>
		      		<a href="#messageBox" class="ui-btn" id="weightSub">提交</a>
	   			</div>
	   			<div data-role="popup" id="changePhone" class="ui-content popup" data-overlay-theme="b">
			  		<a href="#" data-rel="back" class="ui-btn ui-corner-all ui-shadow ui-btn ui-icon-delete ui-btn-icon-notext ui-btn-right">关闭</a>
			  		<div data-role="header"><h1>手机号修改</h1></div>
		      		<input type="text" name="content" id="newPhone" placeholder="请输入新手机号">
		      		<p id="phoneErr" style="display: none; color: red;">请输入合法的手机号</p>
		      		<a href="#messageBox" class="ui-btn" id="phoneSub">提交</a>
	   			</div>
	   			<div data-role="popup" id="changeEmail" class="ui-content popup" data-overlay-theme="b">
			  		<a href="#" data-rel="back" class="ui-btn ui-corner-all ui-shadow ui-btn ui-icon-delete ui-btn-icon-notext ui-btn-right">关闭</a>
			  		<div data-role="header"><h1>电子邮箱修改</h1></div>
		      		<input type="text" name="content" id="newEmail" placeholder="请输入电子邮箱">
		      		<p id="emailErr" style="display: none; color: red;">请输入合法的Email地址</p>
		      		<a href="#messageBox" class="ui-btn" id="emailSub">提交</a>
	   			</div>
				<div data-role="popup" id="messageBox" class="ui-content" data-overlay-theme="b">
			  	  	<a href="#" data-rel="back" class="ui-btn ui-corner-all ui-shadow ui-btn ui-icon-delete ui-btn-icon-notext ui-btn-right" >关闭</a>
			  			<div id="messageConent"></div>
			  		<a href="#" data-rel="back" class="ui-btn">确定</a>
	 	  		</div>
	  	</div>
	  	
	</div>
	</body>
</html>
