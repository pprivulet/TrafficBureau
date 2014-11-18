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
					<li id="ctg2" class="active"><a href="">管理员档案</a></li>	
				</ul>
			</div>

			<div class="col-sm-9 col-sm-offset-3 col-md-3 col-md-offset-2 main">				
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">修改管理员密码</h3>
					</div>
					<div class="panel-body">
					
						<script>
							function changePassword(){
								loginname = $("#loginname").val();
								passwd1 = $("#newpassword1").val();
								passwd2 = $("#newpassword2").val();
								
								if(passwd1!=passwd2){
									alert("两次输入的密码不一致！");								
									return -1;
								}
								$.ajax({
									url : "profile.html",
									data : {
										loginname: loginname,
										password1 : passwd1,
										password2 : passwd2
									},			
									cache:false,
									type : "POST",			
									success : function(data) {				
										if(data=="pass"){
											alert("更新成功，请重新登录！")
											window.location.href="logout.html";						    				    				
						    			}
										else if(data=="notMatch"){
						    				window.location.href="profile.html";
						    				alert("两次输入的密码不一致！");
						    				
						    			}
										else if(data=="error"){
						    				window.location.href="profile.html";
						    				alert("两次输入的密码不一致！！");						    				
						    			}
										else if(data=="illegal"){
						    				window.location.href="profile.html";
						    				alert("非法输入！");    				
						    			}
									},
									error : function(data) {
										window.location.href="profile.html";
						    			alert("连接错误！");
						    			
									},
									beforeSend : function() {
									},
									complete : function() {
										
									}
								});
								
							};
							
						</script>
					
					
					
						<form role="form" method="POST" onsubmit="return false;">
							
							<div class="form-group"> 
								<label for="loginname">用户名</label>   							
    							<input type="text" class="form-control" id="loginname" placeholder="请输入新密码" value="${user.loginName} ">
  							</div>
						
							<div class="form-group"> 
								<label for="newpassword1">新密码</label>   							
    							<input type="password" class="form-control" id="newpassword1" placeholder="请输入新密码" required>
  							</div>
							<div class="form-group">  
								<label for="newpassword2">密码确认</label>  							
    							<input type="password" class="form-control" id="newpassword2" placeholder="请再输入一遍" required>
  							</div>
							<button class="btn btn-default" onclick="changePassword();">确定</button>
						</form>
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
