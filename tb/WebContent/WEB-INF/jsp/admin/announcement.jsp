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


</head>

<body>

	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#navbar" aria-expanded="false"
					aria-controls="navbar">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#">苏州市吴江区交通运输局</a>
			</div>
			<div id="navbar" class="navbar-collapse collapse">
				<ul class="nav navbar-nav navbar-right">
					<li><a href="#">账号管理</a></li>
					<li><a href="logout.html">退出</a></li>					
				</ul>
			</div>
		</div>
	</nav>

	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-3 col-md-2 sidebar">
				<ul class="nav nav-sidebar">
					<li><a href="news.html">新闻</a></li>
					<li class="active"><a href="announcement.html">公告</a></li>
					<li><a href="#">政务公开</a></li>
				</ul>
			</div>
			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
				<h1 class="page-header">公告</h1>
				<div class="table-responsive">
					<table class="table table-striped">
						<thead>
							<tr>
								<th>编号</th>
								<th>标题</th>
								<th>创建时间</th>
								<th>最近更新时间</th>
								<th>发布时间</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>1</td>
								<td><a href="login.html">LoremLoremLoremLoremLorem</a></td>
								<td>2014/9/14</td>
								<td>2014/9/14</td>
								<td>2014/9/14</td>
								<td>
									<button type="button" class="btn btn-info btn-xs">浏览</button>
									<button type="button" class="btn btn-primary btn-xs">编辑</button>
									<button type="button" class="btn btn-danger btn-xs">删除</button>
								</td>
							</tr>


						</tbody>
					</table>
					<div class="text-center">
						<ul class="pagination">
							<li><a href="#">&laquo;</a></li>
							<li><a href="#">1</a></li>
							<li><a href="#">2</a></li>
							<li><a href="#">3</a></li>
							<li><a href="#">4</a></li>
							<li><a href="#">5</a></li>
							<li><a href="#">&raquo;</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
    <script src="<%=basePath%>js/jquery-1.8.2.min.js"></script> 
   
	<script src="<%=basePath%>admin/bootstrap320/js/bootstrap.min.js"></script>

</body>
</html>
