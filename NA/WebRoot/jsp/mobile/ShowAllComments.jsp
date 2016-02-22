<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="now" value="<%=System.currentTimeMillis()%>"></c:set>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
  	<link rel="stylesheet" href="${pageContext.request.contextPath}/js/jquery.mobile-1.4.5/jquery.mobile-1.4.5.min.css">
  	<script src="${pageContext.request.contextPath}/js/iscroll.js"></script>
  	<script src="${pageContext.request.contextPath}/js/jQuery/jquery-1.12.0.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/jquery.mobile-1.4.5/jquery.mobile-1.4.5.min.js"></script>
	<script>
		var page=1;  
		var finished=0;  
		var sover=0;  
		var myScroll,
			pullDownEl, pullDownOffset,
			pullUpEl, pullUpOffset,
			generatedCount = 0;
		function reloadContent(){
			$.ajax({
						url : "${pageContext.request.contextPath}/test/comment/showMore",
						type: "POST",
	  					data: {
	  						aid : ${aid},
	  						page: 1
	  					},
	  					dataType: "json",
	  					success : function(data){
	  						content="";
	  						if(data.code%10==1){
	  							for(var i=0;i<data.comments.length;i++){
	  								var now = Date.parse(new Date()); 
	  								var time = "";
	  								if ((now-data.comments[i].createtime)/1000<=3){
	  									time = "刚刚";
	  								}
	  								else if((now-data.comments[i].createtime)/1000<=60){
	  									time = parseInt((now-data.comments[i].createtime)/1000)+"秒前";
	  								}
	  								else if((now-data.comments[i].createtime)/(1000*60)<=60){
	  									time =parseInt((now-data.comments[i].createtime)/(1000*60))+"分前";
	  								}
	  								else if((now-data.comments[i].createtime)/(1000*60*60)<=24){
	  									time =parseInt((now-data.comments[i].createtime)/(1000*60*60))+"小时前";
	  								}
	  								else if((now-data.comments[i].createtime)/(1000*60*60*24)<=30){
	  									time =parseInt((now-data.comments[i].createtime)/(1000*60*60*24))+"天前";
	  								}
	  								else if((now-data.comments[i].createtime)/(1000*60*60*24)<=365){
	  									time =parseInt((now-data.comments[i].createtime)/(1000*60*60*24*30))+"月前";
	  								}
	  								else if((now-data.comments[i].createtime)/(1000*60*60*24*365)>1){
	  									time =parseInt((now-data.comments[i].createtime)/(1000*60*60*24*30*365))+"年前";
	  								}
	  								content+=
	  								'<li data-icon="false" >'+
		               				'<p style="color: blue;">'+data.comments[i].uname+'</p>'+
		                			'<div style="margin-right: 2em; margin-left: 0.5em"><p  style="white-space:pre-wrap;">'+replace_em(data.comments[i].content)+'</p></div>'+
		                			'<div class="ui-li-count">'+time+'</div>'+
		                			'</li>';
	  							}
	  							$("#commentlist").html(content);
	  							var title='<li data-role="list-divider">评论</li>';
				                $("#commentlist").prepend(title);
				                $("ul").listview("refresh");
				                myScroll.refresh();	
	  						}
	  						else{
	  							alert("失败了");
	  						}
	  					},
	  					error : function(){
	  						alert("AJAX失败");
	  					}
				});
				 
				myScroll.refresh();
		}
		//加载完毕
		function loadover(){  
		    if(sover==1)  
		    {     
		        var overtext="已加载全部评论";  
		        $("#pullUp").remove();  
		        if($(".loadover").length>0)  
		        {  
		            $(".loadover span").eq(0).html(overtext);  
		        }  
		        else  
		        {  
		            var txt='<div class="loadover"><span>'+overtext+'</span></div>'  
		            $("#shishi").append(txt);  
		        }  
		    }  
		}  
		//小于10个
		function lessTen(){
			$("#pullUp").hide();
			var overtext="已加载全部评论";  
	        if($(".loadover").length>0)  
	        {  
	            $(".loadover span").eq(0).html(overtext);  
	        }  
	        else  
	        {  
	            var txt='<div class="loadover"><span>'+overtext+'</span></div>'  
	            $("#shishi").append(txt);  
	        } 
		}
		/**
			* 下拉刷新 （自定义实现此方法）
			* myScroll.refresh();		// 数据加载完成后，调用界面更新方法
			*/
			var content="";
		function pullDownAction () {
			setTimeout(function () {  
		         /*	*/	//数据加载完成后，调用界面更新方法   Remember to refresh when contents are loaded (ie: on ajax completion)
				window.location.reload();
			}, 1000);
		}
		/**
			* 滚动翻页 （自定义实现此方法）
			* myScroll.refresh();		// 数据加载完成后，调用界面更新方法
			*/
		var vid=0; 
		function pullUpAction () {
			setTimeout(function () {	// <-- Simulate network congestion, remove setTimeout from production!
				$.ajax({
						url : "${pageContext.request.contextPath}/test/comment/showMore",
						type: "POST",
	  					data: {
	  						aid : ${aid},
	  						page: (page+1)
	  					},
	  					dataType: "json",
	  					success : function(data){
	  						page++;
	  						content="";
	  						if(data.code%10==1){
		  						if(data.comments.length<10){
			                			sover=1; 
		  								loadover();
		                		}
	  							for(var i=0;i<data.comments.length;i++){
	  								var now = Date.parse(new Date()); 
	  								var time = "";
	  								if ((now-data.comments[i].createtime)/1000<=3){
	  									time = "刚刚";
	  								}
	  								else if((now-data.comments[i].createtime)/1000<=60){
	  									time = parseInt((now-data.comments[i].createtime)/1000)+"秒前";
	  								}
	  								else if((now-data.comments[i].createtime)/(1000*60)<=60){
	  									time =parseInt((now-data.comments[i].createtime)/(1000*60))+"分前";
	  								}
	  								else if((now-data.comments[i].createtime)/(1000*60*60)<=24){
	  									time =parseInt((now-data.comments[i].createtime)/(1000*60*60))+"小时前";
	  								}
	  								else if((now-data.comments[i].createtime)/(1000*60*60*24)<=30){
	  									time =parseInt((now-data.comments[i].createtime)/(1000*60*60*24))+"天前";
	  								}
	  								else if((now-data.comments[i].createtime)/(1000*60*60*24)<=365){
	  									time =parseInt((now-data.comments[i].createtime)/(1000*60*60*24*30))+"月前";
	  								}
	  								else if((now-data.comments[i].createtime)/(1000*60*60*24*365)>1){
	  									time =parseInt((now-data.comments[i].createtime)/(1000*60*60*24*30*365))+"年前";
	  								}
	  								content+=
	  								'<li data-icon="false" >'+
		               				'<p style="color: blue;">'+data.comments[i].uname+'</p>'+
		                			'<div style="margin-right: 2em; margin-left: 0.5em"><p  style="white-space:pre-wrap;">'+replace_em(data.comments[i].content)+'</p></div>'+
		                			'<div class="ui-li-count">'+time+'</div>'+
		                			'</li>';
	  							}
		                		$('#commentlist').append(content).find("li:last").hide();
		                		$('ul').listview('refresh');
                				$("#main").find("li:last").slideDown(0); 
		                		myScroll.refresh();	
		                		
	  						}
	  						else if(data.code%10==2){
	  							sover=1; 
	  							loadover();
	  						}
	  						else{
	  							alert("失败了");
	  						}
	  					},
	  					error : function(){
	  						alert("AJAX失败");
	  					}
				});
				myScroll.refresh();// 数据加载完成后，调用界面更新方法 Remember to refresh when contents are loaded (ie: on ajax completion)
			}, 1000);// <-- Simulate network congestion, remove setTimeout from production!
		}
		function setScroll(){
			pullDownEl = document.getElementById('pullDown');
			pullUpEl = document.getElementById('pullUp');
			pullDownOffset = pullDownEl.offsetHeight;
			pullUpOffset = pullUpEl.offsetHeight;
			var id='main';
			var yLen=80;
			
			var hei=document.getElementById(id).maxScrollY;
			
			myScroll = new iScroll(id, {
				useTransition: false,
				topOffset: pullDownOffset,
				onRefresh: function () {
					if (pullDownEl.className.match('loading')) {
						pullDownEl.className = '';
						pullDownEl.querySelector('.pullDownLabel').innerHTML = '下拉刷新...';
					} else if (pullUpEl.className.match('loading')) {
						pullUpEl.className = '';
						pullUpEl.querySelector('.pullUpLabel').innerHTML = '上拉加载更多...';
					}
				},
				onScrollMove: function () {
					if (this.y >= yLen && !pullDownEl.className.match('flip')) {
						pullDownEl.className = 'flip';
						pullDownEl.querySelector('.pullDownLabel').innerHTML = '松手开始更新...';
						this.minScrollY = 0;
					} else if (this.y < yLen && pullDownEl.className.match('flip')) {
						pullDownEl.className = '';
						pullDownEl.querySelector('.pullDownLabel').innerHTML = '下拉刷新...';
						this.minScrollY = -pullDownOffset;
					}
					else if (this.y < (this.maxScrollY - yLen) && !pullUpEl.className.match('flip')) {
						pullUpEl.className = 'flip';
						pullUpEl.querySelector('.pullUpLabel').innerHTML = '松手开始更新...';
						this.maxScrollY = this.maxScrollY;
					} else if (this.y > (this.maxScrollY + yLen) && pullUpEl.className.match('flip')) {
						pullUpEl.className = '';
						pullUpEl.querySelector('.pullUpLabel').innerHTML = '上拉加载更多...';
						this.maxScrollY = pullUpOffset;
					}
					
				},
				onScrollEnd: function () {
					if (pullDownEl.className.match('flip')) {
						pullDownEl.className = 'loading';
						pullDownEl.querySelector('.pullDownLabel').innerHTML = '加载中...';				
						pullDownAction();	// Execute custom function (ajax call?)
					}
					if (pullUpEl.className.match('flip')) {
						pullUpEl.className = 'loading';
						pullUpEl.querySelector('.pullUpLabel').innerHTML = '加载中...';				
						pullUpAction();	// Execute custom function (ajax call?)
					}
					
				}
			});
			
			setTimeout(function () { document.getElementById(id).style.left = '0'; }, 800);
		}
	/**
		* 初始化iScroll控件
		*/
		$(document).ready(function(){
			setScroll();
		});
		function replace_em(str){
			str = str.replace(/\</g,'&lt;');
			str = str.replace(/\>/g,'&gt;');
			str = str.replace(/\n/g,'<br/>');
			str = str.replace(/\[em_([0-9]*)\]/g,'<img src="${pageContext.request.contextPath}/img/inputFace/face/$1.gif" border="0" />');
			return str;
		}
	</script>
	<style type="text/css" media="all">
		/*需要修改的jquery mobile样式  */
		body{
			padding:0px;
			margin:0px;
		}
		#main{
			position:absolute;
			top:0px;
			bottom:0px;
			width:100%;
		}
		/**
			*
			* 下拉样式 Pull down styles
			*
			*/
		#pullDown, #pullUp {
			margin-top:0px;
			background:#fff;
			height:40px;
			line-height:40px;
			padding:5px;
			border-bottom:1px solid #ccc;
			font-weight:bold;
			font-size:14px;
			color:#888;
		}
		#pullDown .pullDownIcon, #pullUp .pullUpIcon  {
			display:block; float:left;
			width:40px; height:40px;
			background:url(${pageContext.request.contextPath}/css/pull-icon@2x.png) 0 0 no-repeat;
			-webkit-background-size:40px 80px; background-size:40px 80px;
			-webkit-transition-property:-webkit-transform;
			-webkit-transition-duration:250ms;	
		}
		#pullDown .pullDownIcon {
			-webkit-transform:rotate(0deg) translateZ(0);
		}
		#pullUp .pullUpIcon  {
			-webkit-transform:rotate(-180deg) translateZ(0);
		}
		#pullDown.flip .pullDownIcon {
			-webkit-transform:rotate(-180deg) translateZ(0);
		}
		#pullUp.flip .pullUpIcon {
			-webkit-transform:rotate(0deg) translateZ(0);
		}
		#pullDown.loading .pullDownIcon, #pullUp.loading .pullUpIcon {
			background-position:0 100%;
			-webkit-transform:rotate(0deg) translateZ(0);
			-webkit-transition-duration:0ms;
			-webkit-animation-name:loading;
			-webkit-animation-duration:2s;
			-webkit-animation-iteration-count:infinite;
			-webkit-animation-timing-function:linear;
		}
		.loadover{position:relative;margin:0 12px;padding:24px 0;height:20px;line-height:20px;color:#909090;text-align: center;}  
        .loadover span{position:relative;display:inline-block;padding:0 6px;height:20px;background:#F2F2F2;z-index:2}  
        .loadover:after {content:''position: absolute;left: 0;top: 50%;width: 100%;height: 1px;background: #DCDCDC;z-index: 1;}  
		@-webkit-keyframes loading {
			from { -webkit-transform:rotate(0deg) translateZ(0); }
			to { -webkit-transform:rotate(360deg) translateZ(0); }
		}
	</style>
</head>

<body>
	<div data-role="page">
		<div data-role="header" data-position="fixed" data-fullscreen="true">
			<a data-ajax="false" data-role="button" data-rel="back" data-icon="back">返回</a>
		    <h1>显示评论</h1>
	  	</div>
		<div data-role="content" id="main" class="ui-content">
			<div id="shishi" name="shishi"  class="listDiv">
				<div id="pullDown">
						<span class="pullDownIcon"></span>
						<span class="pullDownLabel">下拉刷新...</span>
				</div>
			  	
			  	<ul data-role="listview" data-inset="true" id="commentlist" style="margin-bottom: 0em">
			  	  	 <li data-role="list-divider">评论</li>
			  	<c:if test="${code%10==1}">
			  		<!--<c:forEach var="comment" items="${comments}">
			  			<li data-icon="false" >
				  			<p style="color: blue;">${comment.uname}</p>
				  			<div style="margin-right: 2em; margin-left: 0.5em"><p  style="white-space:pre-wrap;">${comment.content}</p></div>
			
							<div class="ui-li-count">
								<c:if test="${(now-comment.createtime.getTime())/1000<3}">
										刚刚
								</c:if>
								<c:if test="${(now-comment.createtime.getTime())/1000>3&&(now-comment.createtime.getTime())/1000<60}">
									${Math.round((now-comment.createtime.getTime())/1000)}秒前
								</c:if>
								<c:if test="${(now-comment.createtime.getTime())/(1000*60)>1&&(now-comment.createtime.getTime())/(1000*60)<60}">
									${Math.round((now-comment.createtime.getTime())/(1000*60))}分前
								</c:if>
								<c:if test="${(now-comment.createtime.getTime())/(1000*60*60)>1&&(now-comment.createtime.getTime())/(1000*60*60)<24}">
									${Math.round((now-comment.createtime.getTime())/(1000*60*60))}小时前
								</c:if>
								<c:if test="${(now-comment.createtime.getTime())/(1000*60*60*24)>1&&(now-comment.createtime.getTime())/(1000*60*60*24)<30}">
									${Math.round((now-comment.createtime.getTime())/(1000*60*60*24))}天前
								</c:if>
								<c:if test="${(now-comment.createtime.getTime())/(1000*60*60*24*30)>1&&(now-comment.createtime.getTime())/(1000*60*60*24*30)<12}">
									${Math.round((now-comment.createtime.getTime())/(1000*60*60*24*30))}月前
								</c:if>
								<c:if test="${(now-comment.createtime.getTime())/(1000*60*60*24*365)>1}">
									${Math.round((now-comment.createtime.getTime())/(1000*60*60*24*365))}年前
								</c:if>
							</div>
			  			</li>
			  		</c:forEach>-->
			  		<script type="text/javascript">
			  			reloadContent();
			  		</script>
			  	</c:if>
				
			  	<c:if test="${code%10!=1}">
			  		<li data-icon="false" ><p style="text-align: center; font-size: 1em;">暂无评论</p></li>
			  	</c:if>
			  	</ul>
				<div id="pullUp" style="margin-top: 1em">
						<span class="pullUpIcon"></span>
						<span class="pullUpLabel">上拉加载更多...</span>
				</div>
				  		<c:if test="${comments.size()<10}">
			  				<script>
			  					lessTen();
							</script>
			  			</c:if>
			</div>
  		</div>
  		
	</div>
</body>
</html>
