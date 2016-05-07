<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/js/jquery.mobile-1.4.5/jquery.mobile-1.4.5.min.css">
		<script src="${pageContext.request.contextPath}/js/jQuery/jquery-1.12.0.min.js"></script>
		<script src="${pageContext.request.contextPath}/js/jquery.mobile-1.4.5/jquery.mobile-1.4.5.min.js"></script>
		<title>创建小组</title>
		<script>
			$(document).on('pagecreate',function(){
				$('#submit').on('click',function(){
					AJAXTest();
				});
			});
			function AJAXTest(){
	  			var groupname = $("#groupname").prop("value");
	  			var maxcount = $("#maxcount").prop("value");
	  			var description =$("#description").prop("value");
	  			//alert("haha");
	  			$.ajax({
	  				url : "${pageContext.request.contextPath}/test/group/create",
	  				type : "POST",
	  				data : {
	  					aid : ${activity.id},
						groupname : groupname,
						maxcount : maxcount,
						description : description
	  				},
	  				dataType : "json",
	  				success :function(data){
	  					if(data.code%10==1){
	  						alert("成功");
	  					}
	  					else{
	  						alert("失败");
	  					}
	  				},
	  				error : function(){
						alert("ajax失败");
	  				}
	  				
	  			});
	  		}
		</script>
	</head>

	<body>
		<div data-role="page">
			<div data-role="header">
		  		<a data-role="button" data-rel="back" data-icon="back">返回</a>
			   	<h1>创建小组</h1>
			</div>
			
			<div data-role="content" id="main" class="ui-content">
				<div class="ui-field-contain">
					<label for="groupname">小组名称:</label>
					<input type="text" id="groupname">
					
					<label for="maxcount">成员个数:</label>
					 <select id="maxcount">
					 <c:forEach var="i" begin="2" end="${activity.number}">
				         <option value="${i}">${i}</option>
				     </c:forEach>
				     </select>
					<label for="description">小组描述:</label>
					<textarea id="description" placeholder="在此输入小组描述，文本框大小自动调整"></textarea>
					<button data-ajax="false" id="submit">提交</button>
				</div>
			
			</div>
		</div>
	</body>
</html>
