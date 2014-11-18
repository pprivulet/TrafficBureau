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
			location.href='messageDelete.html?category='+ctg+'&id='+id;
		}	    
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
				<h1 class="page-header">列表</h1>
				<div class="table-responsive">
					<table class="table table-striped">
						<thead>
							<tr>
								<th>编号</th>
								<th>姓名</th>
								<th>标题</th>
								<th>类型</th>							
								<th>创建时间</th>
								<th>回复时间</th>							
								<th>操作</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="entry" items="${messages}" varStatus="status">
								<c:set value="30" var="maxLen" />
								<tr>
									<td>${status.index + 1 }</td>
									<td><c:out
												value="${entry.name.substring(0,maxLen<entry.name.length()?maxLen:entry.name.length())}"
												escapeXml="true" /> </td>
									<td><a href="messageDetail.html?id=${entry.id}"> <c:out
												value="${entry.title.substring(0,maxLen<entry.title.length()?maxLen:entry.title.length())}"
												escapeXml="true" /> 

									</a></td>

									
									<c:choose>
										<c:when test="${entry.type==1}">
											<td>建议</td>
										</c:when>
										<c:otherwise>
											<td>投诉</td>
										</c:otherwise>
									</c:choose>
															
								

									<td>${entry.created}</td>									

									<c:choose>
										<c:when test="${entry.status == 0}">
											<td>未回复</td>
										</c:when>
										<c:otherwise>
											<td>${entry.replied}</td>
										</c:otherwise>
									</c:choose>
									<td>
										<button type="button" class="btn btn-info btn-xs"
											onclick="location.href='messageDetail.html?id=${entry.id}'">浏览</button>


										<button type="button" class="btn btn-danger btn-xs"
											onclick="confirmDelete(${idx},${entry.id});">删除</button> 
										
									
												<button id="messageReply" type="button"
													class="btn btn-warning btn-xs"
													onclick="location.href='messageDetail.html?id=${entry.id}'">回复</button>
																		
									</td>
								</tr>

							</c:forEach>
						</tbody>
					</table>

					<div class="text-center">
						<ul class="pagination">
							<li><a href="message.html?category=${idx}&pageNum=1">首页</a></li>
							<c:if test="${currentPage-1 > 0}">
								<li><a
									href="message.html?category=${idx}&pageNum=${currentPage-1}">&laquo;</a></li>
							</c:if>
							<c:forEach var="i" begin="${pageBegin}" end="${pageLast}">
								<c:choose>
									<c:when test="${i == currentPage}">
										<li class=active><a
											href='message.html?category=${idx}&pageNum=<c:out value="${i}"/>'>
												<c:out value="${i}" />
										</a></li>
									</c:when>
									<c:otherwise>
										<li><a
											href='message.html?category=${idx}&pageNum=<c:out value="${i}"/>'>
												<c:out value="${i}" />
										</a></li>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							<c:if test="${currentPage+1 < pageCount}">
								<li><a
									href="message.html?category=${idx}&pageNum=${currentPage+1}">&raquo;</a></li>
							</c:if>
							<li><a
								href="message.html?category=${idx}&pageNum=${pageCount}">尾页</a></li>
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
