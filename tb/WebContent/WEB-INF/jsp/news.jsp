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
<link rel="stylesheet" href="css/news.css" />
<script type="text/javascript" src="js/jquery-1.8.2.min.js"></script>
<script type="text/javascript" src="js/index.js"></script>
</head>
<body>
	<div id="body">
		<%@include file="top.jsp" %>
		<div class="cb"></div>
		<div id="content">
			<%@include file="news/leftbar.jsp" %>
			<div class="content-right fl">
				<div class="content-right-top">
					<span class="dib ml10 f18">新闻中心>></span> <span
						class="f13 div ml405">您现在的位置：首页>双务公开>交通新闻</span>
				</div>
				<div class="best-news">
					<div class="bnews-head">
						<span class="sbg fb f16 fl">最新消息</span> <a href="allnews.html?category=1&pageNum=1"
							class="dib f14 fr mr10">更多>></a>
						<div class="cb"></div>
					</div>


					<c:forEach var="entry" items="${newsList}" varStatus="status">
						<c:set value="15" var="maxLen" />
						<div class="newsline">
							<a href="detail.html?id=${entry.id}" class="fl dib pl8"> <c:out
									value="${entry.title.substring(0,maxLen<entry.title.length()?maxLen:entry.title.length())}"
									escapeXml="true" />
							</a><span class="fr dib">${entry.publishDate.substring(0,10)}</span>
						</div>

					</c:forEach>
				</div>
				<div class="best-news mt18">
					<div class="bnews-head">
						<span class="sbg fb f16 fl">交通要闻</span> <a href="keynews.html?category=1&pageNum=1"
							class="dib f14 fr mr10">更多>></a>
							<div class="cb"></div>
					</div>


					

					<c:forEach var="entry" items="${importantNewsList}" varStatus="status">
						<c:set value="15" var="maxLen" />
						<div class="newsline">
							<a href="detail.html?id=${entry.id}" class="fl dib pl8"> <c:out
									value="${entry.title.substring(0,maxLen<entry.title.length()?maxLen:entry.title.length())}"
									escapeXml="true" />
							</a><span class="fr dib">${entry.publishDate.substring(0,10)}</span>
						</div>
					</c:forEach>







				</div>
			</div>
			<div class="cb"></div>
		</div>
		<%@include file="footer.jsp" %>
	</div>
</body>
</html>