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


<script type="text/javascript">
window.onbeforeunload = function(){	
	event.returnValue="文章没有保存！"; 	
}


$(document).ready(function() {	
	if('${entry.importance}'=='1'){
		$("#entryImportance").attr("checked",true);		
	} else {
		$("#entryImportance").attr("checked",false);
	}
});



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
	<%@include file="nav.jsp" %>

	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-3 col-md-2 sidebar">
				<%@include file="leftbar.jsp"%>
			</div>
			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
				<h1 class="page-header">详细</h1>

				<div class="text-left">
					<div class="well">
						<form name="entryForm" role="form" method="POST">
							<c:if test="${idx==1}">

								<div class="checkbox">
									<label>		
									<input id="entryImportance" type="checkbox" name="entryImportance">是否属于交通要闻
									</label>
								</div>
							</c:if>

							<div class="form-group">
								<label for="entryTitle">文章标题</label> <input type="text"
									class="form-control" name="entryInputTitle"
									id="entryInputTitle" value="${entry.title}">
							</div>

							<div class="form-group">
								<input type="hidden" class="form-control" name="entryCategory"
									value="${idx}"> <input type="hidden"
									class="form-control" name="entryId" value="${entry.id}">
								<input type="hidden" class="form-control" name="entryStatus"
									value="${entry.status}">									
								<input type="hidden" class="form-control" name="entryImages" id="entryImages" value="">
								
							</div>

							<div class="form-group">
								<label for="entryContent">文章内容</label>

								<script id="container" name="entryInputContent"
									type="text/plain" style="height: 400px;">
									
								</script>


								<script type="text/javascript">
       								
								 var ue = UE.getEditor('container', {
									toolbars: [
												['fullscreen', 'source', '|', 'undo', 'redo', '|',
	 										 'bold', 'italic', 'underline', 'fontborder', 'strikethrough', 'superscript', 'subscript', 'removeformat', 'formatmatch', 'autotypeset', 'blockquote', 'pasteplain', '|', 'forecolor', 'backcolor', 'insertorderedlist', 'insertunorderedlist', 'selectall', 'cleardoc', '|',
												 'rowspacingtop', 'rowspacingbottom', 'lineheight', '|',
											     'customstyle', 'paragraph', 'fontfamily', 'fontsize', '|',
	                                          'directionalityltr', 'directionalityrtl', 'indent','simpleupload', 'attachment','|',
	                                          'justifyleft', 'justifycenter', 'justifyright', 'justifyjustify', '|', 'touppercase', 'tolowercase', '|',
	                                          'link', 'unlink', 'anchor', '|',   
	                                          'print','help']
										       ],
		                            autoHeightEnabled: true,
		                            autoFloatEnabled: true,	
		                            initialContent: '${entry.content}'
	                             });
                                </script>
							</div>
						</form>
					</div>

					<script>			  
										
				    function entryUpdate()  
				    {  
				    	var titleLength = $('#entryInputTitle').val().length;			    					    	
				    	var ue = UE.getEditor('container');				    	
				    	var content = UE.htmlparser(ue.getContent(), true);
				    	var imgs = new Array();
				    	var imgs = content.getNodesByTagName('img');
				    	if(imgs.length > 0){
				    		var path = new Array();				    		
				    		for(i=0;i<imgs.length;i++){
				    			if(imgs[i].getAttr('src').indexOf('fileTypeImages')>0)continue;	
				    			path[i]=imgs[0].getAttr('src');
				    		} 					    		
				    		imgPath = path.join(',');				    		
				    		$('#entryImages').val(imgPath);	
				    	}
				    	if(titleLength>500){
				    		alert("文章标题太长！");
				    		return;
				    	}
				    	
				    	if(ue.hasContents()==true && titleLength > 0  ){				    		
				    		window.onbeforeunload = null;
				    		document.entryForm.action="entryEdit.html"; 
				    		document.entryForm.submit();
				    	} else {
				    		alert("文章标题或内容不能为空！")
				    	}
				    } 
				    </script>
					<div>

						<button type="submit" class="btn btn-default"
							onClick="entryUpdate()">
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