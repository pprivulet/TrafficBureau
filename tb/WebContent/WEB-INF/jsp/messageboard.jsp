<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8" />
<title></title>
<link rel="stylesheet" href="css/common.css" />
<link rel="stylesheet" href="css/base.css" />
<link rel="stylesheet" href="css/messageboard.css" />
<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="js/index.js"></script>

<script>
	function send() {
	
		var error = "";		
		name = $("#messageName").val();		
		title = $("#messageTitle").val();
		type = $("#messageType").val();
		
		content = $("#messageContent").val();
		if (name.length == 0) {
			error = error + "姓名不能为空!\n";
		}
		
		if (title.length == 0) {
			error = error + "主题不能为空!\n";
		}
		if (content.length == 0) {
			error = error + "内容不能为空!\n";
		}		
		if (name.length > 16) {
			error = error + "姓名输入有误!\n";
		}
		
		if (title.length > 128) {
			error = error + "主题请不要超过128个字符!\n";
		}
		if (content.length > 1000) {
			error = error + "内容请不要超过1000个字符!\n";
		}		
		if (error.length > 0) {
			alert(error);
			return;
		}
		$.ajax({
			url : "messageboard.html",
			data : {
				name : name,			
				title : title,
				type : type,
				content : content
			},
			cache : false,
			type : "POST",		
			success : function(data) {
				if (data == "pass") {					
					$(".send").html("留言成功！");
				} else {
					alert("非法输入，请重新填写！");
				}
			},
			error : function(data) {
				
				alert("连接错误！");
			},
			beforeSend : function() {
				$(".sendbtn").html("发送中...");
			},
			complete : function() {
			
			}
		});
	}
</script>


</head>
<body>
	<div id="body">
		<%@include file="top.jsp"%>
		<div class="cb"></div>
		<div id="content">
			<div class="content-left fl">
				<span class="dib cont-left-title">留言板</span>
				<div>
					<span class="bdot dib"></span><a
						href="messageStatus.html?pageNum=1">留言板列表</a>
				</div>
				<div class="mt10">
					<span class="bdot dib"></span><a href="messageboard.html">我要留言</a>
				</div>
			</div>
			<div class="content-right fl">
				<div class="content-right-top">
					<span class="dib ml10 f18">留言板>></span> <span class="f13 div ml315">您现在的位置：首页>互动咨询>留言板>我要留言</span>
				</div>
				<div class="send">
					<p>作为与社会公众进行信息交流的一个渠道，本网站热烈欢迎各位参与者提出与吴江交通有关的建议、意见，我们将在职责范围
						内给予应有的答复，对提出的一些问题和合理建议也将力所能及地加以改进，对目前尚无力从根本上解决的一些问题我们也将积极向上级
						部门争取，力求尽快得到有效解决。</p>
					<p>以防留言板中出现不好的现象，不道德的网友。凡认为通过网络是无法追究责任，对交通系统的工作人员实施人身攻击和人身诬陷的网
						友。我们在这里郑重申明：针对这种问题，除了采取删除的措施外，我们还将对此进行跟踪追溯，并追究其法律责任。</p>
					<form name="myForm">
						<div>另：根据交通目前的职能范围，下列不属于交通部门管理的问题将不再答复：</div>
						<div>1、与交通违章相关的各类问题</div>
						<div>2、车辆能否进入市区的各种问题</div>
						<div>交通信号灯的设定和安装、维修路灯等问题</div>
						<div class="">
							标<span class="dib w28"></span>题：<input type="text" class="ipt"
								id="messageTitle" />
						</div>
						<div class="mt6">
							您的姓名：<input type="text" class="ipt" id="messageName" />
						</div>
						<div class="mt6">
							类<span class="dib w28"></span>型：<select id="messageType" class="ipt" >
								<option value="1">建议</option>
								<option value="2">投诉</option>
							</select>
						</div>
						<div class="mt6">
							具体内容：
							<textarea cols="30" rows="10" class="input_detail1"
								id="messageContent"></textarea>
						</div>
						<a href="" class="sendbtn" style="color: #fff;"
							onclick="send();return false;">发送</a>
					</form>
				</div>

			</div>
			<div class="cb"></div>
		</div>
		<%@include file="footer.jsp"%>
	</div>
</body>
</html>