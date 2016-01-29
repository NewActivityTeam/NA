<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'image.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	
	<!-- include libries(jQuery, bootstrap, fontawesome) -->
	<script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
	<link href="http://netdna.bootstrapcdn.com/bootstrap/3.0.1/css/bootstrap.min.css" rel="stylesheet">
	<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.1/js/bootstrap.min.js"></script>
	<link href="http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.min.css" rel="stylesheet">
	
	<!-- include summernote css/js-->
	<link href="<%=request.getContextPath() %>/css/summernote.css" rel="stylesheet">
	<script src="<%=request.getContextPath() %>/js/summernote.min.js"></script>
	
	<!--国际化 -->
	<script src="<%=request.getContextPath() %>/js/summernote-zh-CN.js"></script>

  </head>
  
  <body>
    
<div id="summernote">请输入活动详情</div>

<script>
    $(document).ready(function() {
        $('#summernote').summernote({
            height: 200,
            onImageUpload: function(files, editor, welEditable) {
            	alert("go");
                sendFile(files[0], editor, welEditable);
            }
        });
        function sendFile(file, editor, welEditable) {
        	alert("heool");
            data = new FormData();
            data.append("file", file);
            $.ajax({
                data: data,
                type: "POST",
                url: "/DoWithImage",
                cache: false,
                contentType: false,
                processData: false,
                success: function(url) {
                    editor.insertImage(welEditable, url);
                }
            });
        }
    });


</script>
  </body>
</html>
