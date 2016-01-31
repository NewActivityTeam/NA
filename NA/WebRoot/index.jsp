<%@page import="com.na.tools.AddressTools"%>
<%@page import="cn.yiban.open.FrameUtil"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
  <head>
    <title>My JSP 'index.jsp' starting page</title>
	<!--<SCRIPT type=text/javascript src="ueditor/ueditor.config.js"></SCRIPT>  
	<SCRIPT type=text/javascript src="ueditor/ueditor.all.js"></SCRIPT>-->
	<%
		
		
		try
		{
			FrameUtil util = new FrameUtil(request, response, AddressTools.AppID, AddressTools.AppSecret, AddressTools.CallBackUrl);
			String account = (String) session.getAttribute("account");
			if (account == null)
			{
				if (util.perform() == false)
				{
					return;
				}
				else{
					session.setAttribute("uid", Long.parseLong(util.getUserId()));
					session.setAttribute("account", util.getAccessToken());
					response.sendRedirect(request.getContextPath()+"/home");
				}
			}
	}
	catch (Exception ex)
	{
		ex.printStackTrace();
	}
	
	%>
  </head>
  
  <body>
  	<!--<form action="save.jsp" method="post">
	    <TEXTAREA id=myEditor name="mycontent"></TEXTAREA>  
		<SCRIPT type=text/javascript>  
		    var editor = new UE.ui.Editor();  
		    editor.render("myEditor");  
		    //1.2.4以后可以使用一下代码实例化编辑器 
		    //UE.getEditor('myEditor') 
		</SCRIPT>
		<input name="submit" value="提交" type="submit">
	</form>-->
	uid : ${uid}
	account : ${account}
	
  </body>
</html>
