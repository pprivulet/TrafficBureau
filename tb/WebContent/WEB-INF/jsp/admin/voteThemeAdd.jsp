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
<script type="text/javascript"
	src="<%=basePath%>js/jquery.ajaxfileupload.js"></script>


<script type="text/javascript"
	src="<%=basePath%>admin/ueditor/ueditor.config.js"></script>
<script type="text/javascript"
	src="<%=basePath%>admin/ueditor/ueditor.all.js"></script>


<script type="text/javascript">
	window.onbeforeunload = function() {
		event.returnValue = "文章没有保存！";
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
				<h1 class="page-header">添加</h1>
				<div class="text-left">
					<div class="well">
						<form name="themeForm" role="form" method="POST">
							<div class="form-group">
								<label for="theme">主题</label> <input type="text"
									class="form-control" name="theme" id="theme" placeholder="请输主题">
							</div>
							<div class="form-group">
								<input type="hidden" class="form-control" name="entryCategory"
									value="48">
							</div>							
						</form>
					</div>

					<script>
						//var ue = UE.getEditor('container');					
						function themeSave() {
							var themeLength = $('#theme').val().length;							
							if (themeLength > 128) {
								alert("主题太长！");
								return;
							}
							if(themeLength > 0  ){				    		
					    		window.onbeforeunload = null;
					    		document.themeForm.action="voteThemeAdd.html"; 
					    		document.themeForm.submit();
					    	} else {
					    		alert("主题不能为空！")
					    	}
						}
					</script>
					<div>
						<button type="submit" class="btn btn-default"
							onClick="themeSave()">
							<span class="glyphicon glyphicon-floppy-disk"></span> 保存
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