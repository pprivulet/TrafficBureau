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
<link class="include" rel="stylesheet" type="text/css"
	href="js/jqplot/jquery.jqplot.min.css" />
<script language="javascript" type="text/javascript"
	src="js/jqplot/excanvas.js"></script>
<script class="include" type="text/javascript"
	src="js/jqplot/jquery.min.js"></script>
<script type="text/javascript" src="js/index.js"></script>
<script class="code" type="text/javascript">
	$(document).ready(function() {		
		var data = [ [ '非常满意', ${nice} ], [ '满意', ${good} ], [ '一般', ${ok} ], [ '不满意', ${bad} ] ];
		var plot1 = jQuery.jqplot('chart', [ data ], {
			seriesDefaults : {
				renderer : jQuery.jqplot.PieRenderer,
				rendererOptions : {
					showDataLabels : true
				}
			},
			title : {
				text : '总体满意度统计',
				show : true,
			},
			legend : {
				show : true,
				location : 'e'
			}
		});
	});
</script>
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
						class="f13 div ml405">您现在的位置：首页>互动咨询>投票结果</span>
				</div>
				<div class="best-news">
					<div class="bnews-head">
						<span class="sbg fb f16 fl">${voteTheme.content}</span>
						<div class="cb"></div>
					</div>

					<c:forEach var="entry" items="${voteQuizList}" varStatus="status">
					 ${status.index + 1 }.
						<c:out value="${entry.content}" escapeXml="true" />				
					
						<br>					
					</c:forEach>

					<div id="chart" style="width: 400px; height: 300px;"></div>
					统计结果：十分满意：${nice} 满意：${good} 一般：${ok} 不满意：${bad}
				</div>
			</div>
			<div class="cb"></div>
		</div>
		<%@include file="footer.jsp"%>
	</div>
	  <script class="include" type="text/javascript" src="js/jqplot/jquery.jqplot.min.js"></script>
   




    <script class="include" language="javascript" type="text/javascript" src="js/jqplot/jqplot.barRenderer.min.js"></script>
    <script class="include" language="javascript" type="text/javascript" src="js/jqplot/jqplot.categoryAxisRenderer.min.js"></script>
    <script class="include" language="javascript" type="text/javascript" src="js/jqplot/jqplot.pointLabels.min.js"></script>
    <script type="text/javascript" src="js/jqplot/jqplot.pieRenderer.min.js"></script>
</body>
</html>