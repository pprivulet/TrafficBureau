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
						var category=["", "news","announcement","policy"];
						var headers=["","新闻","公告","政务公开"];
						$("#" + category[${idx}]).attr("class", "active");
						//$(".page-header").html(headers[${idx}]);
					});
				</script>
				<ul class="nav nav-sidebar">
					<li id="news"><a href="entry.html?category=1&pageNum=1">新闻</a></li>
					<li id="announcement"><a
						href="entry.html?category=2&pageNum=1">公告</a></li>
					<li id="policy"><a href="entry.html?category=3&pageNum=1">政务公开</a></li>
				</ul>
			</div>



			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
				<h1 class="page-header">列表</h1>
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
							<c:forEach var="entry" items="${entries}" varStatus="status">
								<c:set value="30" var="maxLen" />
								<tr>
									<td>${status.index + 1 }</td>
									<td><a href="entryDetail.html?id=${entry.id}">${entry.title.substring(0,maxLen<entry.title.length()?maxLen:entry.title.length())}</a></td>
									<td>${entry.createDate}</td>
									<td>${entry.publishDate}</td>
									<td>${entry.updateDate}</td>
									<td>
										<button type="button" class="btn btn-info btn-xs" onclick="">浏览</button>
										<button type="button" class="btn btn-primary btn-xs"
											onclick="">编辑</button>
										<button type="button" class="btn btn-danger btn-xs" onclick="">删除</button>
									</td>
								</tr>

							</c:forEach>
						</tbody>
					</table>

					<div class="text-left">
						<button type="button" class="btn btn-default"
							onClick="location.href='entryAdd.html?category=${idx}'">
							<span class="glyphicon glyphicon-plus"></span> 添加
						</button>
					</div>
					<div class="text-center">
						<ul class="pagination">
							<li><a href="entry.html?category=${idx}&pageNum=1">首页</a></li>
							<c:if test="${currentPage-1 > 0}">
								<li><a href="entry.html?category=${idx}&pageNum=${currentPage-1}">&laquo;</a></li>
							</c:if>
							<c:forEach var="i" begin="${pageBegin}" end="${pageLast}">
								<c:choose>
									<c:when test="${i == currentPage}">
       									<li class=active><a href='entry.html?category=${idx}&pageNum=<c:out value="${i}"/>'>
       									<c:out value="${i}" /></a></li>
    							    </c:when>									
									<c:otherwise>
        								<li><a href='entry.html?category=${idx}&pageNum=<c:out value="${i}"/>'>
        								<c:out value="${i}" /></a></li>
    								</c:otherwise>
								</c:choose>								
							</c:forEach>
							<c:if test="${currentPage+1 < pageCount}">
								<li><a href="entry.html?category=${idx}&pageNum=${currentPage+1}">&raquo;</a></li>
							</c:if>
							<li><a href="entry.html?category=${idx}&pageNum=${pageCount}">尾页</a></li>
						</ul>
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
