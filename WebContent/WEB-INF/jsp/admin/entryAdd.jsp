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



<script type="text/javascript">
window.onbeforeunload = function(){
    return "您的文章尚未保存！";
}
</script>




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
						//var headers=["", "新闻","公告","政务公开"];
						$("#" + category[${idx}]).attr("class", "active");
						//$(".page-header").html("添加"+headers[${idx}]);
					});
				</script>
				<ul class="nav nav-sidebar">
					<li id="news"><a href="entry.html?category=1">新闻</a></li>
					<li id="announcement"><a href="entry.html?category=2">公告</a></li>
					<li id="policy"><a href="entry.html?category=3">政务公开</a></li>
				</ul>
			</div>
			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
				<h1 class="page-header">详细</h1>
				

				<div class="text-left">
				<div class="well">
				<form name="entryForm" role="form" method="POST">
					<c:if test="${idx==1}">
					
				    <div class="checkbox">
                    	<label>
      						<input type="checkbox">是否属于交通要闻
    					</label>
  					</div>
  					</c:if>
  								  	
                    <div class="form-group">
    					<label for="entryTitle">文章标题</label>
    					<input type="text" class="form-control" name="entryInputTitle" placeholder="请输入文章标题">
  					</div>
  					
  					<div class="form-group">
    					<input type="hidden" class="form-control" name="entryCategory" value="${idx}">
    				</div>  					  					
  					
  					<div class="form-group">
    					<label for="entryContent">文章内容</label>
    					<textarea class="form-control" rows="10" name="entryInputContent" placeholder="请输入文章内容"></textarea>
  					</div>
  					<div class="form-group">
    					<label for="entryInputFile">上传图片</label>
    					<input type="file" id="entryInputFile">
    					<p class="help-block">图片大小请不要超过2M</p>
  					</div> 	  										
  					
					</form>
				    </div>	
				    
				    <script>
				    
				    function entryPreview()  
				    {  
				    document.entryForm.action="entryPreview.html";  
				    document.entryForm.submit();  
				    }  

				    function entrySave()  
				    {  
				    document.entryForm.action="entryAdd.html";  
				    document.entryForm.submit();  
				    }  
				    
				    
				    function entryPublish()  
				    {  
				    document.entryForm.action="entryPublish.html";  
				    document.entryForm.submit();  
				    } 
				    
				    
				    </script>
				    				    
				    <div>
				    	<button type="submit" class="btn btn-default" onClick="entryPreview()">
				      	   <span class="glyphicon glyphicon-eye-open"></span> 预览
				    	</button>
  						<button type="submit" class="btn btn-default" onClick="entrySave()">
  					  	   <span class="glyphicon glyphicon-floppy-disk"></span> 保存
  						</button> 
  						<button type="submit" class="btn btn-default" onClick="entryPublish()">
  					  	   <span class="glyphicon glyphicon-arrow-up"></span> 发布
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