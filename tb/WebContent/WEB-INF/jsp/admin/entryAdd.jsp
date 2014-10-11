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


<!-- 
<link rel="stylesheet" type="text/css" href="<%=basePath%>admin/richeditor/jquery.cleditor.css" />
<script type="text/javascript" src="<%=basePath%>admin/richeditor/jquery.cleditor.min.js"></script>
<script type="text/javascript">
 $(document).ready(function () { $("#input").cleditor(); });
</script>
 -->


<script type="text/javascript"
	src="<%=basePath%>admin/ueditor/ueditor.config.js"></script>
<script type="text/javascript"
	src="<%=basePath%>admin/ueditor/ueditor.all.js"></script>


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
						var category=["ctg0", "ctg1","ctg2","ctg3","ctg4","ctg5","ctg6","ctg7","ctg8","ctg9","ctg10","ctg11"
						              ,"ctg12","ctg13","ctg14","ctg15","ctg16","ctg17","ctg18","ctg19","ctg20","ctg21",
						              "ctg22","ctg23","ctg24","ctg25","ctg26","ctg27","ctg28","ctg29","ctg30","ctg31",
						              "ctg32","ctg33","ctg34","ctg35","ctg36"];
						//var headers=["","新闻","公告","政务公开"];
						$("#" + category[${idx}]).attr("class", "active");
						//$(".page-header").html(headers[${idx}]);
					});
				</script>
				<ul class="nav nav-sidebar">
					<li id="ctg1"><a href="entry.html?category=1&pageNum=1">新闻</a></li>
					<li id="ctg2"><a href="entry.html?category=2&pageNum=1">公告</a></li>		
					<li id="ctg27"><a href="entry.html?category=27&pageNum=1">首页图片</a></li>			
					<li id=""><hr>行业管理<span class="glyphicon glyphicon-chevron-down"></span><hr></li>
					<li id="ctg3"><a href="entry.html?category=3&pageNum=1">路网调度</a></li>
					<li id="ctg4"><a href="entry.html?category=4&pageNum=1">运政信息</a></li>
					<li id="ctg5"><a href="entry.html?category=5&pageNum=1">运政公告</a></li>
					<li id="ctg6"><a href="entry.html?category=6&pageNum=1">港政管理</a></li>
					<li id="ctg7"><a href="entry.html?category=7&pageNum=1">航政管理</a></li>
					<li id="ctg8"><a href="entry.html?category=8&pageNum=1">航道通告</a></li>
					<li id="ctg9"><a href="entry.html?category=9&pageNum=1">海事管理</a></li>
					<li id="ctg10"><a href="entry.html?category=10&pageNum=1">客管信息</a></li>
					<li id="ctg11"><a href="entry.html?category=11&pageNum=1">公交动态</a></li>
					<li id="ctg12"><a href="entry.html?category=12&pageNum=1">建设管理</a></li>
					<li id="ctg13"><a href="entry.html?category=13&pageNum=1">养护管理</a></li>
					<li id=""><hr>工程建设<span class="glyphicon glyphicon-chevron-down"></span><hr></li>
					<li id="ctg14"><a href="entry.html?category=14&pageNum=1">项目信息公开</a></li>
					<li id="ctg15"><a href="entry.html?category=15&pageNum=1">工程项目管理</a></li>
					<li id="ctg16"><a href="entry.html?category=16&pageNum=1">政策文件</a></li>
					<li id="ctg17"><a href="entry.html?category=17&pageNum=1">工作动态</a></li>
					<li id="ctg18"><a href="entry.html?category=18&pageNum=1">招标公示</a></li>
					<li id="ctg19"><a href="entry.html?category=19&pageNum=1">从业单位信用信息</a></li>
					<li id="ctg20"><a href="entry.html?category=20&pageNum=1">从业人员信用信息</a></li>
					<li id=""><hr> 党建之窗<span class="glyphicon glyphicon-chevron-down"></span><hr></li>
					<li id="ctg21"><a href="entry.html?category=21&pageNum=1">党建工作</a></li>
					<li id="ctg22"><a href="entry.html?category=22&pageNum=1">精神文明</a></li>
					<li id="ctg23"><a href="entry.html?category=23&pageNum=1">党风廉政</a></li>
					<li id="ctg24"><a href="entry.html?category=24&pageNum=1">交通团委</a></li>
					<li id="ctg25"><a href="entry.html?category=25&pageNum=1">招标公示</a></li>
					<li id="ctg26"><a href="entry.html?category=26&pageNum=1">荣誉榜</a></li>					
				</ul>
			</div>
			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
				<h1 class="page-header">详细</h1>

				<div class="text-left">
					<div class="well">		
						<form name="entryForm" role="form" method="POST">
							<c:if test="${idx==1}">

								<div class="checkbox">
									<label> <input type="checkbox" name="entryImportance">是否属于交通要闻
									</label>
								</div>
							</c:if>

							<div class="form-group">
								<label for="entryTitle">文章标题</label> <input type="text"
									class="form-control" name="entryInputTitle" id="entryInputTitle"
									placeholder="请输入文章标题">
							</div>

							<div class="form-group">
								<input type="hidden" class="form-control" name="entryCategory"
									value="${idx}">
							</div>

							<div class="form-group">
								<label for="entryContent">文章内容</label>									
								
								<script id="container" name="entryInputContent" type="text/plain" style="height:400px;"></script>								
								
								
								<script type="text/javascript">
       								 var ue = UE.getEditor('container', {
										toolbars: [
													['fullscreen', 'source', '|', 'undo', 'redo', '|',
            										 'bold', 'italic', 'underline', 'fontborder', 'strikethrough', 'superscript', 'subscript', 'removeformat', 'formatmatch', 'autotypeset', 'blockquote', 'pasteplain', '|', 'forecolor', 'backcolor', 'insertorderedlist', 'insertunorderedlist', 'selectall', 'cleardoc', '|',
          											 'rowspacingtop', 'rowspacingbottom', 'lineheight', '|',
       											     'customstyle', 'paragraph', 'fontfamily', 'fontsize', '|',
                                                     'directionalityltr', 'directionalityrtl', 'indent', '|',
                                                     'justifyleft', 'justifycenter', 'justifyright', 'justifyjustify', '|', 'touppercase', 'tolowercase', '|',
                                                     'link', 'unlink', 'anchor', '|',            
                                                     'horizontal', 'date', 'time','|',           
                                                     'print','help', 'drafts']
											       ],
			                            autoHeightEnabled: true,
			                            autoFloatEnabled: true,			                            
		                            });
                                </script>                
                                
							</div>
						<div class="form-group">
					    <input type="text" id="imgPath" class="hidden" value="xxx">
						</div>	
					</form>
					
					
					<script>  				  
				    function upload()  
				    {  
				    	var imguri =  $('#entryInputFile').val(); 
				    	var fd = new FormData($('#entryInputFile')[0]);				    	
				    	if(imguri.length<1){
				    		alert("请选择要上传的图片！");
				    		return;
				    	}	
				    					    	
						$.ajax({
							url : "uploadimage.html",
							data : fd,							
							type : "POST",	
							enctype: 'multipart/form-data',
							success : function(data) {				
								alert("上传成功！"+data);
								$('#imgPath').val(data);
							},
							error : function(data) {								
				    			alert("上传失败！请重新上传.");
				    			
							},
							beforeSend : function() {
							},
							complete : function() {								
							}
						});
				  
				    
				    } 
				    </script>	
					<div>  
					<form method="POST" encType="multipart/form-data">	
						<label for="entryInputFile">上传图片</label>
						<input type="file" name="entryInputFile" id="entryInputFile" required> 
						<input type="button" id="imgUpload" onclick="upload();" value="上传">	
						<p class="help-block">图片大小请不要超过2M</p>
					</form>		
					</div>

						
					</div>

					<script>				    
				  
				    function entrySave()  
				    {  
				    	var titleLength = $('#entryInputTitle').val().length;			    					    	
				    	var ue = UE.getEditor('container');			    	
				    	
				    	if(titleLength>500){
				    		alert("文章标题太长！");
				    		return;
				    	}
				    	
				    	if(ue.hasContents()==true && titleLength > 0  ){				    		
				    		document.entryForm.action="entryAdd.html"; 
				    		document.entryForm.submit();
				    	} else {
				    		alert("文章标题或内容不能为空！")
				    	} 
				    
				    } 
				    </script>

					<div>
					  					
						<button type="submit" class="btn btn-default"
							onClick="entrySave()">
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