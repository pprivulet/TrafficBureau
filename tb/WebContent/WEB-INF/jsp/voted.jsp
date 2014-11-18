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
<script type="text/javascript" src="js/index.js"></script>
</head>
<body>
	<div id="body">
		<%@include file="top.jsp"%>
		<div class="cb"></div>
		<div id="content">


			<div class="content-left fl">
				<span class="dib cont-left-title">网上投票</span>
				<div>
					<span class="bdot dib"></span><a href="voting.html">进行中</a>
				</div>
				<div class="mt10">
					<span class="bdot dib"></span><a href="voted.html?pageNum=1">历史投票</a>
				</div>
			</div>

			<div class="content-right fl">
				<div class="content-right-top">
					<span class="dib ml10 f18">网上投票>></span> <span
						class="f13 div ml405">您现在的位置：首页>互动咨询>历史投票</span>
				</div>
				<div class="best-news">
					<div class="bnews-head">
						<span id="cname" class="sbg fb f16 fl">列表</span>
						<div class="cb"></div>
					</div>

					<c:forEach var="entry" items="${voteThemes}" varStatus="status">
					
						<c:set value="15" var="maxLen" />
						<div class="newsline">
							<a href="votedResult.html?themeId=${entry.id}" class="fl dib pl8">
								<c:out
									value="${entry.content.substring(0,maxLen<entry.content.length()?maxLen:entry.content.length())}"
									escapeXml="true" />
							</a><span class="fr dib">${entry.closed.substring(0,10)}</span>
							<div class="cb"></div>
						</div>
					</c:forEach>

					<div align="center">
						<a href="voted.html?category=${category}&pageNum=1">首页</a>

						<c:if test="${currentPage-1 > 0}">
							<a
								href="voted.html?category=${category}&pageNum=${currentPage-1}">&laquo;</a>

						</c:if>
						<c:forEach var="i" begin="${pageBegin}" end="${pageLast}">
							<c:choose>
								<c:when test="${i == currentPage}">
									<a
										href='voted.html?category=${category}&pageNum=<c:out value="${i}"/>'>
										<c:out value="${i}" />
									</a>
								</c:when>
								<c:otherwise>
									<a
										href='voted.html?category=${category}&pageNum=<c:out value="${i}"/>'>
										<c:out value="${i}" />
									</a>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						<c:if test="${currentPage+1 < pageCount}">
							<a
								href="voted.html?category=${category}&pageNum=${currentPage+1}">&raquo;</a>
						</c:if>
						<a href="voted.html?category=${category}&pageNum=${pageCount}">尾页</a>



					</div>



				</div>
			</div>
			<div class="cb"></div>
		</div>
		<%@include file="footer.jsp"%>
	</div>
</body>
</html>