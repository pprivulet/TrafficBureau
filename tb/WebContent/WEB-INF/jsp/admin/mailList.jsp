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
function confirmDelete(id) {
	var r = confirm("确认删除该文档？");
	if (r == true) {
		location.href = 'mailDelete.html?id=' + id;
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
					<li id="ctg2"><a href="email.html">信箱配置</a></li>	
					<li id="ctg3" class="active"><a href="maillist.html?category=1&pageNum=1">信件管理</a></li>	
					
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
								<th>发件人姓名</th>
								<th>发件人地址</th>
								<th>发件时间</th>
								<th>回复时间</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="entry" items="${mails}" varStatus="status">
								<c:set value="30" var="maxLen" />
								<tr>
									<td>${status.index + 1 }</td>
									<td><a href="mailDetail.html?id=${entry.id}"> <c:out
												value="${entry.title.substring(0,maxLen<entry.title.length()?maxLen:entry.title.length())}"
												escapeXml="true" />
									</a></td>

									<td><c:out
												value="${entry.name.substring(0,maxLen<entry.name.length()?maxLen:entry.name.length())}"
												escapeXml="true" />
									</td>
									
									<td><c:out
												value="${entry.mailAddr.substring(0,maxLen<entry.mailAddr.length()?maxLen:entry.mailAddr.length())}"
												escapeXml="true" />
									</td>
				
									<td>${entry.created}</td>									
									<c:choose>
										<c:when test="${entry.status == 0}">
											<td>未答复</td>
										</c:when>
										<c:otherwise>
											<td>${entry.replied}</td>
										</c:otherwise>
									</c:choose>
									<td>
										<button type="button" class="btn btn-info btn-xs"
											onclick="location.href='mailDetail.html?id=${entry.id}'">浏览</button>										

										<button type="button" class="btn btn-danger btn-xs"
											onclick="confirmDelete(${entry.id});">删除</button> <c:choose>
											<c:when test="${entry.status == 0}">
												<button id="entryPublish" type="button"
													class="btn btn-warning btn-xs"
													onclick="location.href='mailReply.html?id=${entry.id}&pageNum=${currentPage}'">已答复</button>
											</c:when>
											<c:otherwise>
												<button type="button" class="btn btn-default btn-xs" disabled="disabled">已答复</button>
											</c:otherwise>
										</c:choose> 
								</tr>
							</c:forEach>
						</tbody>
					</table>

					<div class="text-center">
						<ul class="pagination">
							<li><a href="maillist.html?category=1&pageNum=1">首页</a></li>
							<c:if test="${currentPage-1 > 0}">
								<li><a
									href="maillist.html?category=1&pageNum=${currentPage-1}">&laquo;</a></li>
							</c:if>
							<c:forEach var="i" begin="${pageBegin}" end="${pageLast}">
								<c:choose>
									<c:when test="${i == currentPage}">
										<li class=active><a
											href='maillist.html?category=1&pageNum=<c:out value="${i}"/>'>
												<c:out value="${i}" />
										</a></li>
									</c:when>
									<c:otherwise>
										<li><a
											href='maillist.html?category=1&pageNum=<c:out value="${i}"/>'>
												<c:out value="${i}" />
										</a></li>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							<c:if test="${currentPage+1 < pageCount}">
								<li><a
									href="maillist.html?category=1&pageNum=${currentPage+1}">&raquo;</a></li>
							</c:if>
							<li><a
								href="maillist.html?category=1&pageNum=${pageCount}">尾页</a></li>
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
