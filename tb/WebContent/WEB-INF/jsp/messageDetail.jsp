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
	<link rel="stylesheet" href="css/detail.css" />
	<script type="text/javascript" src="js/index.js"></script>
</head>
<body>
	<div id="body">
	<%@include file="top.jsp" %>
	<div class="cb"></div>
	<div id="content">
		<div class="bg"></div>
		<div class="fb tc lh30">
		
		<c:set value="30" var="maxLen" />
		<c:out
											value="${message.title.substring(0,maxLen<message.title.length()?maxLen:message.title.length())}"
											escapeXml="true" /></div>
		<div class="f12 tc lh30">姓名：<c:out
											value="${message.name.substring(0,maxLen<message.name.length()?maxLen:message.name.length())}"
		escapeXml="true" /></div>
		<div class="f12 tc lh30">留言时间：${message.created}</div>										
	
		
		<c:out
											value="${message.content}"
											escapeXml="true" />
		
		<p>__________</p>
		<p>回复内容：
		<c:out
											value="${message.reply}"
											escapeXml="true" /></p>
		
		<p>回复时间：${message.replied}</p>
		</div>
	</div>
	<%@include file="footer.jsp" %>
	</div>
</body>
</html>