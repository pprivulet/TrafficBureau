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
						class="f13 div ml405">您现在的位置：首页>互动咨询>网上投票</span>
				</div>
				<div class="best-news">
					<div class="bnews-head">
						<span class="sbg fb f16 fl">${voteTheme.content}</span>
						<div class="cb"></div>
					</div>
					
										
					<form id="voteForm" method="post" action="voteSave.html">		
					<input type="hidden" name="themeId" value="${voteTheme.id}"/>
					<c:forEach var="entry" items="${voteQuizList}" varStatus="status">
					   ${status.index + 1 }.
						<c:out value="${entry.content}" escapeXml="true" />									
						<div>非常满意 <input type="radio" name="quiz${status.index + 1 }" value="1" checked/>
						&nbsp;满意<input type="radio" name="quiz${status.index + 1 }" value="2" />
						&nbsp;一般<input type="radio" name="quiz${status.index + 1 }" value="3" />
						&nbsp;不满意<input type="radio" name="quiz${status.index + 1 }" value="4" />
						</div>
						<br>					
					</c:forEach>
					<input type="submit" value="提交"/>
					
					</form>	
					<a href="voteResult.html?themeId=${voteTheme.id}"/>查看统计结果</a>

				</div>
			</div>
			<div class="cb"></div>
		</div>
		<%@include file="footer.jsp"%>
	</div>
</body>
</html>