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
				<script>
					$(document).ready(function() {
						var category=["news","announcement","policy"];
						//var headers=["新闻","公告","政务公开"];
						$("#" + category[${idx}]).attr("class", "active");
						//$(".page-header").html(headers[${idx}]);
					});
				</script>
				<ul class="nav nav-sidebar">
					<li id="news"><a href="entry.html?category=1&pageNum=1">新闻</a></li>
					<li id="announcement"><a href="entry.html?category=2&pageNum=1">公告</a></li>
					<li id="policy"><a href="entry.html?category=3&pageNum=1">政务公开</a></li>
				</ul>
			</div>
			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
				<h1 class="page-header">详细</h1>
                <hr>                
                
                <div class="blog-main">    
                       
                    <div class="blog-post">
                       <h2 class="blog-post-title">${entry.title}</h2>
                       <p class="blog-post-meta">发布时间：${entry.publishDate}</p>
                    </div>  
                    
                     <div class="well">                
                    <p>${entry.content}</p>
                    </div>
                    <div>
                       <button type="button" class="btn btn-default btn-lg">
                          <span class="glyphicon glyphicon-pencil"></span> 编辑
                       </button>
					   <button type="button" class="btn btn-default btn-lg">
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