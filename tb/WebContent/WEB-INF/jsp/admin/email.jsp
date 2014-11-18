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
<script src="<%=basePath%>js/jquery-1.8.2.min.js"></script>

<script>
	function confirmDelete(ctg,id){
		var r=confirm("确认删除该文档？");
		if(r==true)  {			
			location.href='entryDelete.html?category='+ctg+'&id='+id;
		}	    
	}
	
	
	
</script>
</head>

<body>

	<%@include file="nav.jsp" %>

	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-3 col-md-2 sidebar">				
				<ul class="nav nav-sidebar">
					<li id="ctg1"><a href="entry.html?category=1&pageNum=1">返回控制台</a></li>
					<li id="ctg2" class="active"><a href="email.html">信箱配置</a></li>
					<li id="ctg3"><a href="maillist.html?category=1&pageNum=1">信件管理</a></li>		
					
				</ul>
			</div>

			<div class="col-sm-9 col-sm-offset-3 col-md-3 col-md-offset-2 main">				
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">信箱配置</h3>
					</div>
					<div class="panel-body">
					
						<script>
							function setMailBox(){
								server = $("#server").val();
								port = $("#port").val();
								account = $("#account").val();
								password = $("#password").val();
								toAddress = $("#toAddress").val();									
								$.ajax({
									url : "email.html",
									data : {
										server : server,
										port : port,
										account : account,
										password : password,
										toAddress : toAddress
									},			
									cache:false,
									type : "POST",			
									success : function(data) {				
										if(data=="pass"){
											//alert("更新成功！");
											$("#mailbox").html("信箱设置成功！");																    				    				
						    			}										
										else if(data=="error"){											
											alert("非法输入！");   						    				
						    			}
										else if(data=="portError"){											
											alert("非法端口号！");   						    				
						    			}
									},
									error : function(data) {
										window.location.href="email.html";
						    			alert("连接错误！");						    			
									},
									beforeSend : function() {
									},
									complete : function() {										
									}
								});
								
							};							
						</script>
					
					
					    <div id="mailbox">
						<form role="form" method="POST" onsubmit="return false;">							
							<div class="form-group"> 
								<label for="server">邮件服务器地址</label>   							
    							<input type="text" class="form-control" id="server" placeholder="请输入发送邮件服务器(SMTP)地址" value="${mailbox.server}" required>
  							</div>
							<div class="form-group"> 
								<label for="port">邮件服务器端口</label>   							
    							<input type="text" class="form-control" id="port" placeholder="请输入发送邮件服务器端口" value="${mailbox.port}" required>
  							</div>
							<div class="form-group"> 
								<label for="account">邮件账号</label>   							
    							<input type="text" class="form-control" id="account" placeholder="请输入用于发送邮件的账号" value="${mailbox.account}" required>
  							</div>
							<div class="form-group">  
								<label for="password">密码</label>  							
    							<input type="password" class="form-control" id="password" placeholder="输入密码" required>
  							</div>
  							<div class="form-group">  
								<label for="toAddress">接收地址</label>  							
    							<input type="text" class="form-control" id="toAddress" placeholder="请输入用于接收邮件的地址" value="${mailbox.toAddress}" required>
  							</div>
							<button class="btn btn-default" onclick="setMailBox();">确定</button>
						</form>
						</div>
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
