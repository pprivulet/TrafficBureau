<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
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
<link href="<%=basePath%>admin/signin.css" rel="stylesheet">
<link href="<%=basePath%>admin/dashboard.css" rel="stylesheet">


</head>
<body>
	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="#">苏州市吴江区交通运输局</a>
			</div>
		</div>
	</nav>
	<div class="container">
       
		
		<div class="jumbotron">
			<form class="form-signin" role="form" method=POST action="login.html">
				<h2 class="form-signin-heading">管理员登录</h2>
				<input type="text" id="loginName" name="username"
					class="form-control" placeholder="用户名" required autofocus>
				<input type="password" id="loginPwd" name="password"
					class="form-control" placeholder="密码" required>
				<button class="btn btn-lg btn-primary btn-block"
					type="submit">确认</button>				
			</form>		
		</div>
	</div>
	<!-- /container -->
</body>
</html>
