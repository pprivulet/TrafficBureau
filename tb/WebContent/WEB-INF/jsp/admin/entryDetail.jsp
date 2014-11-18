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
				<%@include file="leftbar.jsp"%>
			</div>
			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
				<h1 class="page-header">详细</h1>

				<div class="blog-main">
					<div class="blog-post">
						<div class="well">
							<h3 align="center" class="blog-post-title">
								<c:out value="${entry.title}" escapeXml="true" />
							</h3>
							<h6 align="right">
								发布时间：

								<c:choose>
									<c:when test="${entry.status == 0}">
							未发布
						</c:when>
									<c:otherwise>
							${entry.publishDate}
						</c:otherwise>
								</c:choose>



							</h6>
							<p>${entry.content}</p>
						</div>
					</div>
					<div>

						<c:choose>
							<c:when test="${entry.status == 0}">
								<button type="button" class="btn btn-default btn-lg"
									onclick="location.href='entryEdit.html?category=${idx}&id=${entry.id}'">
									<span class="glyphicon glyphicon-pencil"></span> 编辑
								</button>
							</c:when>
							<c:when test="${entry.status == 1}">
								<button type="button" class="btn btn-default btn-lg" disabled="disabled">
									<span class="glyphicon glyphicon-pencil"></span> 编辑
								</button>
							</c:when>
						</c:choose>





						<button type="button" class="btn btn-default btn-lg"
							onclick="confirmDelete(${idx},${entry.id});">
							<span class="glyphicon glyphicon-trash"></span> 删除
						</button>

						<!-- 
					   <c:choose>
							<c:when test="${entry.status == 0}">
								<button type="button" class="btn btn-default btn-lg"  
									onclick="location.href='entryPublish.html?category=${idx}&id=${entry.id}&pageNum=${currentPage}'">
								 <span class="glyphicon glyphicon-arrow-up"></span> 发布</button>
							</c:when>
							<c:when test="${entry.status == 1}">
								<button type="button" class="btn btn-default btn-lg"  
								onclick="location.href='entryUnpublish.html?category=${idx}&id=${entry.id}&pageNum=${currentPage}'">
								 <span class="glyphicon glyphicon-arrow-down"></span> 取消发布</button>
							</c:when>
						</c:choose>
						-->
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