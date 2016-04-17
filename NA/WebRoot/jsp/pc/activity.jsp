<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.sql.Timestamp"%>
<c:set var="now" value="<%=new Timestamp(System.currentTimeMillis())%>"/> 
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML5>
<html>
<head>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/jsp/pc/css/css.css">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/jsp/pc/css/activity.css">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/jsp/pc/css/page.css">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/jsp/pc/css/coral_v9.6.7.1_1.css">
<!-- 新 Bootstrap 核心 CSS 文件 -->
<link rel="stylesheet"
	href="http://cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css">

<!-- 可选的Bootstrap主题文件（一般不用引入） -->
<link rel="stylesheet"
	href="http://cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap-theme.min.css">

<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="http://cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>

<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="http://cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</head>

<body>
	<div>
		<div class="header">
			<div class="logo"></div>
			<div class="navigator">
				<ul>
					<li><a href="${pageContext.request.contextPath}/pc/home" style="text-decoration:none;">首页</a></li>
					<li><a href="${pageContext.request.contextPath}/user/getJoinedActivitiesInPC" style="text-decoration:none;">我的活动</a></li>
					<li>我的团队</li>
					<li>个人中心</li>
				</ul>
			</div>
			<div class="search">
				<div class="row">
					<div class="col-lg-6">
						<div class="input-group">
							<input type="text" class="form-control"
								placeholder="Search for..."> <span
								class="input-group-btn">
								<button class="btn btn-default" type="button">搜索</button>
							</span>
						</div>
						<!-- /input-group -->
					</div>
					<!-- /.col-lg-6 -->
				</div>
				<!-- /.row -->
			</div>
		</div>
		<div class="location">
			<span>我的活动 <i>&gt;</i> ${activity.title }
			</span>
		</div>
		<div class="wb activity">
			<div class="activity-detail" id="activity-content-div">
				<h3 class="activity-title" id="subtitle">${activity.title }</h3>
				<div class="activity-info">
					<div class="activity-basic">
						<span class="author" id="authorname">官方</span> <span class="date"
							id="activitytime">${activity.createtime }</span> <span
							class="font">字体：【 <a href="javascript:doZoom(16);">大</a> <a
							href="javascript:doZoom(14);">中</a> <a
							href="javascript:doZoom(12);">小</a> 】
						</span>
					</div>
				</div>
			</div>

			<!-- 活动id -->
			<input type="hidden" id="input" value="${activity.id }"/>
			<!-- 活动详情 -->
			<div>${activity.description }</div>
			<!-- 活动基本信息 -->
			<div>
				<p>
				<span>活动开始时间:${activity.starttime }</span>
				<span>活动结束时间:${activity.endtime }</span>
				</p>
				<p>
				<span>报名截止时间:${activity.endsigntime }</span>
				<span>投票地址:${activity.voteaddress }</span>
				</p>
				<p>
				<span>活动地址:${activity.address }</span>
				<span>参与人数:${activity.number }</span>
				</p>
			</div>
			<c:if test="${activity.endsigntime<=now }">
				<div><button type="button" class="btn btn-success col-sm-12">报名结束</button></div>
			</c:if>
			<c:if test="${activity.endsigntime > now }">
				<div><button type="button" class="btn btn-success col-sm-12" id="register" onclick="register()">我要报名</button></div>
			</c:if>
			<!-- 活动评论框  -->
			<div class="np-frame" style="padding-bottom: 0px; width: 100%;margin-top:50px;">
				<div id="top_reply">
					<h1 class="np-title">
						<a href="http://coral.qq.com/1359943489" id="commentTotleNum"
							target="_blank" hidefocus="true"><span>17条评论</span></a> <strong>网友评论</strong>
					</h1>
					<div id="commentArea" class="out">
						<div class="np-reply-box blueLight np-reply-box-active"
							id="np-reply-box" style="">
							<div class="np-reply-box-content textarea">
								<textarea tabindex="1" autocomplete="off" name="content"
									accesskey="u" id="top_textarea"
									style="height: 100px; padding: 10px;"></textarea>
							</div>
							<div class="submitBtn">
								<a href="#" class="np-btn np-btn-submit"
									id="top_post_btn" hidefocus="true" onclick="commitcomment()">发表</a> 
							</div>
						</div>
					</div>
				</div>
			</div>

			<!-- 所有网友评论  -->
			<div style="margin-top:40px;">
				<ul class="post-list np-comment-list" id="lists">
					
				</ul>
			</div>
			<div id="loadMore" class="np-load-more" style="display: block;">

				<span style="" id="more">加载更多</span> <em style="display: none;"
					id="nomore">没有更多了</em>

			</div>
		</div>
	</div>
	<script type="text/javascript">
            i = 1; //设置当前页数 
            var aid = $("#input").val();
            $(function() {
            	//加载第一页
				 getJson(1);
                $("#more").click(function() {
                    getJson(i);
                });
            });
            function register(){
            	$.ajax({
            		url : "<%=request.getContextPath() %>/user/join",
            		type : "POST",
            		data : {
            			aid : aid
            		},
            		dataType : "json",
            		success : function(data){
            			if(data.code % 10 == 1){
            				alert("报名成功!");
            			}else if(data.code % 10 == 6){
            				alert("您还没填写个人信息，请前往填写!");
            			}else if(data.code % 10 == 9){
            				alert("您已经被禁止参与该活动了，对不起，不能报名!");
            			}else if(data.code % 10 == 2){
            				alert("您已经报名了，无需重复报名!");
            			}
            		},
            		error : function(){
            			alert("error");
            		}
            	});
            }
            function commitcomment(){
            var content = $("#top_textarea").val();
            	$.ajax({
            		url : "<%=request.getContextPath() %>/test/comment/new",
            		type : "POST",
            		data : {
            			aid : aid,
            			content : content
            		},
            		dataType : "json",
            		success : function(data,status){
                           var str = "<li class='np-post topno'><div class='np-tip-newpost'></div> <img class='np-avatar popClick'" +
                           "src='<%=request.getContextPath() %>/images/person.jpg'><div class='np-post-body'><div class='np-post-header'>"
														+ data.uname
														+ "</a></span></div><div class='np-post-content' data-height='5'><p>"
														+ content
														+ "</p></div><div class='np-post-footer'>"
														+ "发表时间:刚刚" +
												"</div></div></li>";
												$("#lists").prepend(str);
							
            		},
            		error : function(){
            			alert("error");
            		}
            	});
            }
            function getJson(page) {
                $.ajax({
                	url : "<%=request.getContextPath() %>/test/comment/showMore",
                	type:"POST",
                	data : {
                		aid : aid,
                		page : i
                	},
                	dataType : "json",
                	success : function(data,status){
                		
                		 $.each(data.comments, function(index, array) {
                		 	var now = Date.parse(new Date()); 
	  								var time = "";
	  								if ((now-array['createtime'])/1000<=3){
	  									time = "刚刚";
	  								}
	  								else if((now-array['createtime'])/1000<=60){
	  									time = parseInt((now-array['createtime'])/1000)+"秒前";
	  								}
	  								else if((now-array['createtime'])/(1000*60)<=60){
	  									time =parseInt((now-array['createtime'])/(1000*60))+"分前";
	  								}
	  								else if((now-array['createtime'])/(1000*60*60)<=24){
	  									time =parseInt((now-array['createtime'])/(1000*60*60))+"小时前";
	  								}
	  								else if((now-array['createtime'])/(1000*60*60*24)<=30){
	  									time =parseInt((now-array['createtime'])/(1000*60*60*24))+"天前";
	  								}
	  								else if((now-data.comments[i].createtime)/(1000*60*60*24)<=365){
	  									time =parseInt((now-array['createtime'])/(1000*60*60*24*30))+"月前";
	  								}
	  								else if((now-array['createtime'])/(1000*60*60*24*365)>1){
	  									time =parseInt((now-array['createtime'])/(1000*60*60*24*30*365))+"年前";
	  								}
                           // var str = "<div class='per'>";
                           //var str = str + "<div class='title'>" + array['uname'] + "、" + array['content'] + "</div></div>";
                           var str = "<li class='np-post topno'><div class='np-tip-newpost'></div> <img class='np-avatar popClick'" +
                           "src='<%=request.getContextPath() %>/images/person.jpg'><div class='np-post-body'><div class='np-post-header'>"
														+ array['uname']
														+ "</a></span></div><div class='np-post-content' data-height='5'><p>"
														+ array['content']
														+ "</p></div><div class='np-post-footer'>"
														+ "发表时间:" +
												time + "</div></div></li>";
												$("#lists").append(str);
											});
							if (data.size <= 9) {
								$("#more").css("display", "none");
								$("#nomore").css("display", "block");
							}
						},
						error : function() {
							alert("出错了");
						}
					});
			i++;
		}
	</script>
</body>
</html>
