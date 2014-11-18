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
	<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
	<script type="text/javascript" src="js/index.js"></script>
</head>
<body>
	<div id="body">
	<%@include file="top.jsp" %>
	<div class="cb"></div>
	<div id="content">
		<div class="bg"></div>
		<div class="fb tc lh30">${entry.title}</div>
		<div class="f12 tc lh30">时间：${entry.publishDate}</div>
		${entry.content}
	</div>
	<%@include file="footer.jsp" %>
	</div>
</body>
</html>