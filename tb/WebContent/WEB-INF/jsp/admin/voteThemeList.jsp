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
			location.href='voteThemeDelete.html?category='+ctg+'&id='+id;
		}	    
	}	
	
	function publish(id,currentPage){		
	    //alert(id);
		//alert(currentPage);
		$.ajax({
			url : "voteThemePublish.html",
			data : {				
				id : id				
			},			
			cache:false,
			type : "POST",			
			success : function(data) {				
				if(data=="pass"){					
					window.location.href="voteThemeList.html?category=48&pageNum="+currentPage;						    				    				
    			}
				else{    				
    				alert("已达到发布数量上限！无法设置！");    				
    			}				
			},
			error : function(data) {				
    			alert("连接错误！");
    			
			},
			beforeSend : function() {
			},
			complete : function() {
				
			}
		});	
	}
	
	function unpublish(id,currentPage){		
		//alert(id);
		//alert(currentPage);
		$.ajax({
			url : "voteThemeUnpublish.html",
			data : {				
				id : id				
			},			
			cache:false,
			type : "POST",			
			success : function(data) {				
				if(data=="pass"){					
					window.location.href="voteThemeList.html?category=48&pageNum="+currentPage;						    				    				
    			}
				else{    				
    				alert("无法设置！请重试");    				
    			}				
			},
			error : function(data) {				
    			alert("连接错误！");
    			
			},
			beforeSend : function() {
			},
			complete : function() {
				
			}
		});	
	}
	
	function closeVote(id,currentPage){		
		//alert(id);
		//alert(currentPage);
		var r=confirm("确认关闭此投票？");
		if(r==false)  {			
			return false;
		}
		$.ajax({
			url : "voteThemeClose.html",
			data : {				
				id : id				
			},			
			cache:false,
			type : "POST",			
			success : function(data) {				
				if(data=="pass"){					
					window.location.href="voteThemeList.html?category=48&pageNum="+currentPage;						    				    				
    			}
				else if(data=="already"){	   				
    				alert("此投票已关闭！");    				
    			}				
			},
			error : function(data) {				
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
								<th>创建时间</th>
								<th>最近更新时间</th>
								<th>发布时间</th>
								<th>关闭时间</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="entry" items="${voteThemes}" varStatus="status">
								<c:set value="30" var="maxLen" />
								<tr>
									<td>${status.index + 1 }</td>								
									
															
									
									<td><a href="voteDetail.html?id=${entry.id}" title='<c:out value="${entry.content}"	escapeXml="true" />'> <c:out
												value="${entry.content.substring(0,maxLen<entry.content.length()?maxLen:entry.content.length())}"
												escapeXml="true" />

									</a></td>


									<td>${entry.created}</td>
									<td>${entry.updated}</td>

									<c:choose>
										<c:when test="${entry.status == 1}">
											<td>${entry.published}</td>
										</c:when>
										<c:otherwise>
											<td>未发布</td>
										</c:otherwise>
									</c:choose>


									<c:choose>
										<c:when test="${entry.status == 2}">
											<td>${entry.closed}</td>
										</c:when>
										<c:otherwise>
											<td>未关闭</td>
										</c:otherwise>
									</c:choose>





									<td>

										<c:choose>
											<c:when test="${entry.status == 1}">
												<button id="entryEdit" type="button"
													class="btn btn-default btn-xs" disabled="disabled">编辑</button>
												
											</c:when>
											<c:otherwise>
												<button id="entryEdit" type="button"
													class="btn btn-primary btn-xs"
													onclick="location.href='voteThemeEdit.html?category=${idx}&id=${entry.id}'">编辑</button>
											</c:otherwise>
										</c:choose>

										<button type="button" class="btn btn-danger btn-xs"
											onclick="confirmDelete(${idx},${entry.id});">删除</button> <c:choose>
											<c:when test="${entry.status != 1}">
												<button id="entryPublish" type="button"
													class="btn btn-warning btn-xs"
													onclick="publish(${entry.id},${currentPage})">发布</button>
											</c:when>
											<c:otherwise>
												<button type="button" class="btn btn-warning btn-xs"
													onclick="unpublish(${entry.id},${currentPage})">取消发布</button>
											</c:otherwise>
										</c:choose> <c:choose>
											<c:when test="${entry.status != 2}">
												<button type="button" class="btn btn-success btn-xs"
													onclick="closeVote(${entry.id},${currentPage})">关闭</button>
											</c:when>
											<c:when test="${entry.status == 2}">
												<button class="btn btn-default btn-xs" disabled="disabled">关闭</button>
											</c:when>
										</c:choose>


									</td>
								</tr>

							</c:forEach>
						</tbody>
					</table>

					<div class="text-left">
						<button type="button" class="btn btn-default"
							onClick="location.href='voteThemeAdd.html?category=${idx}'">
							<span class="glyphicon glyphicon-plus"></span> 添加
						</button>
					</div>
					<div class="text-center">
						<ul class="pagination">
							<li><a href="voteThemeList.html?category=${idx}&pageNum=1">首页</a></li>
							<c:if test="${currentPage-1 > 0}">
								<li><a
									href="voteThemeList.html?category=${idx}&pageNum=${currentPage-1}">&laquo;</a></li>
							</c:if>
							<c:forEach var="i" begin="${pageBegin}" end="${pageLast}">
								<c:choose>
									<c:when test="${i == currentPage}">
										<li class=active><a
											href='voteThemeList.html?category=${idx}&pageNum=<c:out value="${i}"/>'>
												<c:out value="${i}" />
										</a></li>
									</c:when>
									<c:otherwise>
										<li><a
											href='voteThemeList.html?category=${idx}&pageNum=<c:out value="${i}"/>'>
												<c:out value="${i}" />
										</a></li>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							<c:if test="${currentPage+1 < pageCount}">
								<li><a
									href="voteThemeList.html?category=${idx}&pageNum=${currentPage+1}">&raquo;</a></li>
							</c:if>
							<li><a
								href="voteThemeList.html?category=${idx}&pageNum=${pageCount}">尾页</a></li>
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
