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
<link rel="stylesheet" href="css/email.css" />
<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="js/index.js"></script>

<script>
	function checkMail() {		
		var error = "";
		name = $("#name").val();
		phone = $("#phone").val();
		email = $("#email").val();
		city = $("#city").val();
		place = $("#place").val();
		road = $("#road").val();
		area = $("#area").val();
		job = $("#job").val();
		title = $("#title").val();
		type = $("#type").val();
		content = $("#cnt").val();
		if (name.length == 0) {
			error = error + "姓名不能为空!\n";
		}
		if (phone.length == 0) {
			error = error + "电话号码不能为空!\n";
		}
		if (email.length == 0) {
			error = error + "邮箱不能为空!\n";
		}
		if (area.length == 0) {
			error = error + "地区不能为空!\n";
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
		if (phone.length > 16) {
			error = error + "电话号码输入有误!\n";
		}
		if (email.length > 64) {
			error = error + "邮箱地址太长!\n";
		}
		if (area.length > 128) {
			error = error + "地区输入有误!\n";
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

		//$("#send").html("<p>邮件发送成功！</p>");

		$.ajax({
			url : "email.html",
			data : {
				name : name,
				phone : phone,
				email : email,
				city : city,
				place : place,
				road : road,
				area : area,
				job : job,
				title : title,
				type : type,
				content : content
			},
			cache : false,
			type : "POST",
			//async: false,
			//success : function(data) {
			//	if (data == "pass") {
			//		alert("邮件发送成功！");					
			//	} else {
			//		alert("非法输入，请重新填写！");
			//	}
			//},
			//error : function(data) {
				//window.location.href = "email.html";
			//	alert("连接错误！");
			//},
			beforeSend : function() {
				$("#sendmail").html("发送中...");
			},
			complete : function() {
				alert("邮件发送完毕！");		
				$("#sendmail").html("发送");
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
				<span class="dib cont-left-title">局长信箱</span>
				<div>
					<span class="bdot dib"></span><a href="email.html">写信</a>
				</div>
				<div class="mt10">
					<span class="bdot dib"></span><a href="emailStatus.html?category=1&pageNum=1">回复状态</a>
				</div>
			</div>
			<div class="content-right fl">
				<div class="content-right-top">
					<span class="dib ml10 f18">局长信箱>></span> <span
						class="f13 div ml358">您现在的位置：首页>互动咨询>局长信箱>写信</span>
				</div>
				<div class="send" id="asend">
					<form id="send" action="">
						<div class="send-left fl">
							<div class="">
								您的姓名：<input type="text" class="ipt" id="name" /><span
									class="red dib">*</span>
							</div>
							<div class="mt6">
								联系电话：<input type="text" class="ipt" id="phone" /><span
									class="red dib">*</span>
							</div>
						</div>
						<div class="send-right fr"></div>
						<div class="cb"></div>
						<div class="mt6">
							电子邮件：<input type="text" class="ipt" id="email" /><span
								class="red dib">*</span><span class="red f12">请填写正确的邮件地址，我们将通过邮件及时告知您的留言答复信息</span>
						</div>
						<div class="mt6">
							联系地址：<select name="city" id="city" class="spt">
								<option value="苏州市">苏州市</option>
								<option value="南京市">南京市</option>
							</select> <select name="place" class="spt ml10" id="place">
								<option value="吴江区">吴江区</option>
								<option value="苏州园区">苏州园区</option>
							</select> <select name="road" id="road" class="spt ml10">
								<option value="松陵">松陵</option>
								<option value="盛泽">盛泽</option>
							</select> <input type="text" class="ipt ml10" id="area" /> <span
								class="red dib">*</span>
						</div>
						<div class="mt6">
							从事职业：<select name="job" id="job" class="ipt">
								<option value="机关干部">机关干部</option>
								<option value="企业职员">企业职员</option>
							</select> <span class="red dib">*</span>
						</div>
						<div class="mt6">
							来信主题：<input type="text" id="title" class="ipt" /><span
								class="red dib">*</span>
						</div>
						<div class="mt6">
							信件类型：<select name="mail" id="type" class="ipt">
								<option value="1">咨询</option>
								<option value="2">建议</option>
								<option value="3">投诉</option>
							</select> <span class="red dib">*</span>
						</div>
						<div class="mt6">
							具体内容：
							<textarea name="content" id="cnt" class="input_detail" cols="20"
								rows="10"></textarea>
						</div>
						
						<!-- 上传文件对外暴露风险高，实现需谨慎
						<div class="mt6" type="hidden">
							上传照片：<input type="file" class="ml10" value="选择文件" />
						</div>
						 -->
						
						<div class="f12 mt10 lh15">
							注：1.表格中带*的必须填，请认真填写。<br /> <span class="t2 dib">2.请您根据情况选择相应的信件类型，并留下您的真实姓名、联系电话、电子邮件以便更好地与您联系！</span><br />
							<span class="t2 dib">3.寄出的信件会自动生成编号，请牢记编号查询回复状态。</span>
						</div>
						<a href="" class="sendbtn" style="color: #fff;" id="sendmail"
							onclick="checkMail();">发送</a>
					</form>
				</div>

			</div>
			<div class="cb"></div>
		</div>
		<div id="footer">
			<div class="mt15">版权所有：苏州市吴江区交通运输局</div>
			<div>地址：苏州市吴江去交通路3265号 电话：0512-63022222</div>
			<div>目前网站浏览量【101203】人次 苏ICP备05004014号</div>
		</div>
	</div>
</body>
</html>