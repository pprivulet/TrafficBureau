<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="../../favicon.ico">

<title>管理控制台</title>

<!-- Bootstrap core CSS -->
<link href="<%=basePath%>admin/bootstrap320/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link href="<%=basePath%>admin/dashboard.css" rel="stylesheet">
<link href="<%=basePath%>admin/blog.css" rel="stylesheet">
<script src="<%=basePath%>js/jquery-1.8.2.min.js"></script>
<script>
	function confirmDelete(ctg,id){
		var r=confirm("确认删除该文档？");
		if(r==true)  {			
			location.href='messageDelete.html?category='+ctg+'&id='+id;
		}	    
	}	
	
	function reply(){
		
		var reply = $("#reply").val();	
		if(reply.length==0){
			alert("回复内容不能为空！");
		}
		if(reply.length>512){
			alert("回复内容请不要超过512个字符！");
		}
		
		$.ajax({
			url : "messageReply.html",
			data : {
				id : "${message.id}",
				reply : reply				
			},			
			cache:false,
			type : "POST",			
			success : function(data) {				
				if(data=="pass"){
					
					window.location.href="messageDetail.html?id="+"${message.id}";																    				    				
    			}										
				else {											
					alert("非法输入！");   						    				
    			}				
			},
			error : function(data) {				
    			alert("连接错误！");						    			
			},
			beforeSend : function() {
			},
			complete : function() {										
			}
		});		
	}
	
	
	
</script>
</head>

<body>

	<%@include file="nav.jsp"%>

	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-3 col-md-2 sidebar">
				<%@include file="leftbar.jsp"%>
			</div>
			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
				<h1 class="page-header">详细</h1>

				<div class="blog-main">
					<div class="blog-post">
						<div class="well">
							<h3 align="center" class="blog-post-title">
								<c:out value="${message.title}" escapeXml="true" />
							</h3>
							<h6 align="right">
								回复时间：

								<c:choose>
									<c:when test="${message.status == 0}">
							未回复
						</c:when>
									<c:otherwise>
							${message.replied}
						</c:otherwise>
								</c:choose>



							</h6>
							<p>
								<c:out value="${message.content}" escapeXml="true" />
							</p>
                              
                            <hr>
                            回复内容：
							<p>
								<c:out value="${message.reply}" escapeXml="true" />
							</p>
						</div>
						
						

						<div class="reply">请输入回复内容：<br>
							<textarea id="reply" rows="2" cols="100"><c:out value="${message.reply}" escapeXml="true" /></textarea>
						</div>
					</div>


					<div>





					
								<button type="button" class="btn btn-default btn-lg"
									onclick="reply();return false;">
									<span class="glyphicon glyphicon-pencil"></span> 回复
								</button>
						





						<button type="button" class="btn btn-default btn-lg"
							onclick="confirmDelete(1,${message.id});">
							<span class="glyphicon glyphicon-trash"></span> 删除
						</button>


					</div>
				</div>
			</div>
		</div>
	</div>


	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script> -->

	<script src="<%=basePath%>admin/bootstrap320/js/bootstrap.min.js"></script>

</body>
</html>