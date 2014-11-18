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
	function confirmDelete(id){
		var r=confirm("确认删除该文档？");
		if(r==true)  {			
			location.href='voteQuizDelete.html?id='+id;
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
				<h1 class="page-header">问题</h1>				
				主题：<c:out value="${voteTheme.content}"	escapeXml="true" />
				<div class="table-responsive">
					<table class="table table-striped">
						<thead>
							<tr>
								<th>编号</th>
								<th>内容</th>
								<th>创建时间</th>
								<th>最近更新时间</th>							
								<th>操作</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="entry" items="${voteQuizList}" varStatus="status">
								<c:set value="30" var="maxLen" />
								<tr>
									<td>${status.index + 1 }</td>
									<td><a title='题目：<c:out value="${entry.content}" escapeXml="true" />&#10;选项：&#10;1.非常满意&#10;2.满意&#10;3.一般&#10;4.不满意'>  <c:out
												value="${entry.content.substring(0,maxLen<entry.content.length()?maxLen:entry.content.length())}"
												escapeXml="true" />

									</a></td>


									<td>${entry.created}</td>
									<td>${entry.updated}</td>




									<td>

										<c:choose>
											<c:when test="${voteTheme.status == 1}">
												<button id="entryEdit" type="button"
													class="btn btn-default btn-xs" disabled="disabled">编辑</button>
												
											</c:when>
											<c:otherwise>
												<button id="entryEdit" type="button"
													class="btn btn-primary btn-xs"
													onclick="location.href='voteQuizEdit.html?category=${idx}&id=${entry.id}'">编辑</button>
											</c:otherwise>
										</c:choose>

										<button type="button" class="btn btn-danger btn-xs"
											onclick="confirmDelete(${entry.id});">删除</button> 


									</td>
								</tr>

							</c:forEach>
						</tbody>
					</table>

					<div class="text-left">
						<button type="button" class="btn btn-default"
							onClick="location.href='voteQuizAdd.html?themeId=${voteTheme.id}'">
							<span class="glyphicon glyphicon-plus"></span> 添加
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
