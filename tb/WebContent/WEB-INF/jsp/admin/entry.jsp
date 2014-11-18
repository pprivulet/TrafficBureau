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
	
	
	
	function slide(category,entryId,currentPage){		
		
		$.ajax({
			url : "entrySlide.html",
			data : {
				category: category,
				id : entryId,
				pageNum : currentPage
			},			
			cache:false,
			type : "POST",			
			success : function(data) {				
				if(data=="pass"){					
					window.location.href="entry.html?category="+category+"&pageNum="+currentPage;						    				    				
    			}
				else{    				
    				alert("已达到首页幻灯显示数量上限！无法设置！");    				
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
								<th>标题</th>
								<c:if test="${idx == 1}">
									<th>交通要闻</th>
								</c:if>
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
									<td><a href="entryDetail.html?id=${entry.id}"> <c:out
												value="${entry.title.substring(0,maxLen<entry.title.length()?maxLen:entry.title.length())}"
												escapeXml="true" /> <c:if test="${entry.file == 1}">
												<span class="glyphicon glyphicon-picture"></span>
											</c:if>


									</a></td>

									<c:if test="${idx == 1}">
										<c:choose>
											<c:when test="${entry.importance == 0}">
												<td>否</td>
											</c:when>
											<c:otherwise>
												<td>是</td>
											</c:otherwise>
										</c:choose>
									</c:if>


									<td>${entry.createDate}</td>
									<td>${entry.updateDate}</td>

									<c:choose>
										<c:when test="${entry.status == 0}">
											<td>未发布</td>
										</c:when>
										<c:otherwise>
											<td>${entry.publishDate}</td>
										</c:otherwise>
									</c:choose>
									<td>
										<button type="button" class="btn btn-info btn-xs"
											onclick="location.href='entryDetail.html?id=${entry.id}'">浏览</button>

										<c:choose>
											<c:when test="${entry.status == 0}">
												<button id="entryEdit" type="button"
													class="btn btn-primary btn-xs"
													onclick="location.href='entryEdit.html?category=${idx}&id=${entry.id}'">编辑</button>
											</c:when>
											<c:otherwise>
												<button id="entryEdit" type="button"
													class="btn btn-default btn-xs" disabled="disabled">编辑</button>
											</c:otherwise>
										</c:choose>

										<button type="button" class="btn btn-danger btn-xs"
											onclick="confirmDelete(${idx},${entry.id});">删除</button> <c:choose>
											<c:when test="${entry.status == 0}">
												<button id="entryPublish" type="button"
													class="btn btn-warning btn-xs"
													onclick="location.href='entryPublish.html?category=${idx}&id=${entry.id}&pageNum=${currentPage}'">发布</button>
											</c:when>
											<c:otherwise>
												<button type="button" class="btn btn-warning btn-xs"
													onclick="location.href='entryUnpublish.html?category=${idx}&id=${entry.id}&pageNum=${currentPage}'">取消发布</button>
											</c:otherwise>
										</c:choose> <c:if test="${idx == 1}">
											<c:if test="${entry.file == 1}">
												<c:choose>
													<c:when test="${entry.status == 1}">
														<button type="button" class="btn btn-success btn-xs"
															onclick="slide(${idx},${entry.id},${currentPage});">幻灯显示</button>
													</c:when>
													<c:when test="${entry.status == 2}">
														<button type="button" class="btn btn-success btn-xs"
															onclick="location.href='entryUnslide.html?category=${idx}&id=${entry.id}&pageNum=${currentPage}'">取消幻灯</button>
													</c:when>
												</c:choose>
											</c:if>
										</c:if>
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
								<li><a
									href="entry.html?category=${idx}&pageNum=${currentPage-1}">&laquo;</a></li>
							</c:if>
							<c:forEach var="i" begin="${pageBegin}" end="${pageLast}">
								<c:choose>
									<c:when test="${i == currentPage}">
										<li class=active><a
											href='entry.html?category=${idx}&pageNum=<c:out value="${i}"/>'>
												<c:out value="${i}" />
										</a></li>
									</c:when>
									<c:otherwise>
										<li><a
											href='entry.html?category=${idx}&pageNum=<c:out value="${i}"/>'>
												<c:out value="${i}" />
										</a></li>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							<c:if test="${currentPage+1 < pageCount}">
								<li><a
									href="entry.html?category=${idx}&pageNum=${currentPage+1}">&raquo;</a></li>
							</c:if>
							<li><a
								href="entry.html?category=${idx}&pageNum=${pageCount}">尾页</a></li>
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
