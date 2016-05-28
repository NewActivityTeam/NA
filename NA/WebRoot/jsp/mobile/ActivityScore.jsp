<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE>
<html>
<head>

<title>My JSP 'ActivityScore.jsp' starting page</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/jsp/mobile/control/css/zyUpload.css"
	type="text/css">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/js/jquery.mobile-1.4.5/jquery.mobile-1.4.5.min.css">

<script
	src="${pageContext.request.contextPath}/js/jQuery/jquery-1.12.0.min.js"></script>
<script
	src="${pageContext.request.contextPath}/js/jquery.mobile-1.4.5/jquery.mobile-1.4.5.min.js"></script>

<script type="text/javascript"
	src="${pageContext.request.contextPath}/jsp/mobile/core/zyFile.js"></script>
<!-- 引用控制层插件 -->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/jsp/mobile/control/js/zyUpload.js"></script>
<!-- 引用初始化JS -->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/jsp/mobile/core/demo.js"></script>
<style type="text/css">
* {
	margin: 0;
	padding: 0;
	list-style-type: none;
}

body {
	color: #666;
	font: 12px/1.5 Arial;
}
/* star */
#star {
	position: relative;
	width: 600px;
	margin: 20px auto;
	height: 24px;
}

#star ul, #star span {
	float: left;
	display: inline;
	height: 19px;
	line-height: 19px;
}

#star ul {
	margin: 0 10px;
}

#star li {
	float: left;
	width: 24px;
	cursor: pointer;
	text-indent: -9999px;
	background: url(<%=request.getContextPath()%>/images/star.png)
		no-repeat;
}

#star strong {
	color: #f60;
	padding-left: 10px;
}

#star li.on {
	background-position: 0 -28px;
}

#star p {
	position: absolute;
	top: 20px;
	width: 159px;
	height: 60px;
	display: none;
	background: url(<%=request.getContextPath()%>/images/icon.gif)
		no-repeat;
	padding: 7px 10px 0;
}

#star p em {
	color: #f60;
	display: block;
	font-style: normal;
}
</style>

<script type="text/javascript">
	$(document).ready(
			function() {
				var oStar = document.getElementById("star");
				var aLi = oStar.getElementsByTagName("li");
				var oUl = oStar.getElementsByTagName("ul")[0];
				var oSpan = oStar.getElementsByTagName("span")[1];
				var oP = oStar.getElementsByTagName("p")[0];
				var i = iScore = iStar = 0;
				var aMsg = [ "很不满意|活动太离谱", "不满意|活动差强人意", "一般|哈哈蛮去", "满意|活动很不错",
						"非常满意|活动非常好" ]

				for (i = 1; i <= aLi.length; i++) {
					aLi[i - 1].index = i;

					//鼠标移过显示分数
					aLi[i - 1].onmouseover = function() {
						fnPoint(this.index);
						//浮动层显示
						oP.style.display = "block";
						//计算浮动层位置
						oP.style.left = oUl.offsetLeft + this.index
								* this.offsetWidth - 104 + "px";
						//匹配浮动层文字内容
						oP.innerHTML = "<em><b>" + this.index + "</b> 分 "
								+ aMsg[this.index - 1].match(/(.+)\|/)[1]
								+ "</em>"
								+ aMsg[this.index - 1].match(/\|(.+)/)[1]
					};

					//鼠标离开后恢复上次评分
					aLi[i - 1].onmouseout = function() {
						fnPoint();
						//关闭浮动层
						oP.style.display = "none"
					};

					//点击后进行评分处理
					aLi[i - 1].onclick = function() {
						iStar = this.index;
						$("#score").val(iStar);
						oP.style.display = "none";
						oSpan.innerHTML = "<strong>" + (this.index)
								+ " 分</strong> ("
								+ aMsg[this.index - 1].match(/\|(.+)/)[1] + ")"
					}
				}

				//评分处理
				function fnPoint(iArg) {
					//分数赋值
					iScore = iArg || iStar;
					for (i = 0; i < aLi.length; i++)
						aLi[i].className = i < iScore ? "on" : "";
				}

			});
</script>
<script>
	$(document).ready(function() {
		$('#sub').click(function() {
			$("#fileSubmit").click();
			var score = $("#score").val();
			var comment = $("#comment").val();
			var aid = $("#aid").val();
			alert(aid);
			$.ajax({
				url : "${pageContext.request.contextPath}/assess/score",
				type : "POST",
				data : {
					score : score,
					comment : comment,
					aid : aid
				},
				dataType : "json",
				success : function(data){
					alert("发表成功");
				},
				error : function(){
					alert("发表失败");
				}
			})
		})
	});
</script>
<body>

	<div data-role="page">
		<div data-role="header" data-theme="b">
			<a href="" data-rel="back">返回</a>
			<h1><%=request.getParameter("title")%></h1>
			<a data-ajax="false" href="" data-role="button" id="sub">发表</a>
		</div>
		<div data-role="content">
			<form data-ajax="false" action="/NA/score" method="post"
				enctype="multipart/form-data" id="form">
				<div id="star">
					<span>星级打分</span>
					<ul id="ul">
						<li><a href="javascript:;">1</a></li>
						<li><a href="javascript:;">2</a></li>
						<li><a href="javascript:;">3</a></li>
						<li><a href="javascript:;">4</a></li>
						<li><a href="javascript:;">5</a></li>
					</ul>
					<span></span>
					<p></p>
					<input type="hidden" id="score" name="score">
				</div>
				<HR style="border:3 double #987cb9" width="100%" color=#987cb9
					SIZE=3>
				<div>
					<textarea rows="8" id="comment" name="comment"
						style="margin-bottom: 0.5em;height:100px;" maxlength="200"
						placeholder="请在此输入评论内容，自动调整行数，评论不超过200字符"></textarea>
				</div>
				<HR style="border:3 double #987cb9" width="100%" color=#987cb9
					SIZE=3>
				<input type="hidden" value=<%=request.getParameter("aid") %> name="aid" id="aid">
			</form>
			<div id="demo" class="demo"></div>
		</div>
	</div>
</body>
</html>
