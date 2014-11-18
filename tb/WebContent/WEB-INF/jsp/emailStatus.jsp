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
						class="f13 div ml358">您现在位置：首页>互动咨询>局长信箱>回复状态</span>
							<div class="cb"></div>
				</div>
				
				<div class="best-news">
					<div class="bnews-head">
						<span id="cname" class="sbg fb f16 fl">回复状态</span>
						<div class="cb"></div><br>
					</div>
				
					<table border="1" align="center">
						<thead>
							<tr>
								<th>编号</th>
								<th>标题</th>							
								<th>发件人姓名</th>								
								<th>发件时间</th>
								<th>回复状态</th>								
							</tr>
						</thead>
						<tbody>
					<c:forEach var="entry" items="${entries}" varStatus="status">
								<c:set value="30" var="maxLen" />
								<tr>
									<td>${status.index + 1 }</td>
									<td> <c:out
												value="${entry.title.substring(0,maxLen<entry.title.length()?maxLen:entry.title.length())}"
												escapeXml="true" />
									</td>

									<td><c:out
												value="${entry.name.substring(0,maxLen<entry.name.length()?maxLen:entry.name.length())}"
												escapeXml="true" />
									</td>								
				
									<td>${entry.created}</td>									
									<c:choose>
										<c:when test="${entry.status == 0}">
											<td>未回复</td>
										</c:when>
										<c:otherwise>
											<td>回复时间：${entry.replied}</td>
										</c:otherwise>
									</c:choose>
											

									
								</tr>
							</c:forEach>
					</tbody>
					</table>
						
					<div align="center">
						<a href="emailStatus.html?category=${category}&pageNum=1">首页</a>

						<c:if test="${currentPage-1 > 0}">
							<a
								href="emailStatus.html?category=${category}&pageNum=${currentPage-1}">&laquo;</a>

						</c:if>
						<c:forEach var="i" begin="${pageBegin}" end="${pageLast}">
							<c:choose>
								<c:when test="${i == currentPage}">
									<a
										href='emailStatus.html?category=${category}&pageNum=<c:out value="${i}"/>'>
										<c:out value="${i}" />
									</a>
								</c:when>
								<c:otherwise>
									<a
										href='emailStatus.html?category=${category}&pageNum=<c:out value="${i}"/>'>
										<c:out value="${i}" />
									</a>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						<c:if test="${currentPage+1 < pageCount}">
							<a
								href="emailStatus.html?category=${category}&pageNum=${currentPage+1}">&raquo;</a>
						</c:if>
						<a href="emailStatus.html?category=${category}&pageNum=${pageCount}">尾页</a>
					
					
				
				</div>
				
				
		
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