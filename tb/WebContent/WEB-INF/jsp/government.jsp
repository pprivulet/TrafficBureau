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
<link rel="stylesheet" href="css/construction.css" />
<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="js/index.js"></script>
</head>
<body>
	<div id="body">
		<%@include file="top.jsp"%>
		<div class="cb"></div>
		<div id="content">
			<div class="content-left fl"
				style="overflow-y: scroll; overflow-x: hidden;">
				<span class="dib cont-left-title">政务公开</span>
				<div id="appearall">
					<div>
						<span class="bdot dib"></span><a href="government.html?type=0">机构概况</a>
					</div>
					<div class="mt10">
						<span class="bdot dib"></span><a href="government.html?type=1">政策法规</a>
					</div>
					<div class="mt10">
						<span class="bdot dib"></span><a href="government.html?type=3">业务工作</a>
					</div>
					<div class="mt10">
						<span class="bdot dib"></span><a href="government.html?type=11">动态信息</a>
					</div>
					<div class="mt10">
						<span class="bdot dib"></span><a href="government.html?type=13">统计信息</a>
					</div>
					<div class="mt10">
						<span class="bdot dib"></span><a href="government.html?type=12">财政信息</a>
					</div>
					<!-- 
					<div class="mt10">
						<span class="bdot dib"></span><a href="government.html?type=12">收费公示</a>
					</div>
					 -->
					<div class="mt10">
						<span class="bdot dib"></span><a href="government.html?type=14">人事信息</a>
					</div>
					<!-- 
					<div class="mt10" id="switch">
						<span class="spdot dib"></span><a>人事信息</a>
						<div class="ml40 none" id="appear">
							<div class="mt10">
								<span class="dot1 dib fl"></span><a href="government.html?type=0" class="ml15 dib fl">任前公示</a>
							</div>
							<div class="cb"></div>
							<div class="mt10">
								<span class="dot1 dib fl"></span><a href="government.html?type=1" class="ml15 dib fl">任免公示</a>
							</div>
							<div class="cb"></div>
						</div>
					
					</div>
  					-->
					<div class="mt10">
						<span class="bdot dib"></span><a href="government.html?type=1">应急管理</a>
					</div>
				</div>
				<div class="mt10" id="switch1">
					</span><a href="#" class="ml15 dib" style="color: #4785D0">主题分类></a>
					<div id="appear1" class="none">
						<div class="ml40">
							<span class="dot1 dib fl"></span><a href="government.html?type=0"
								class="ml15 dib fl">机构概况</a>
						</div>
						<div class="cb"></div>
						<div class="ml40">
							<span class="dot1 dib fl"></span><a href="government.html?type=1"
								class="ml15 dib fl">政策法规</a>
						</div>
						<div class="cb"></div>
						<div class="ml40">
							<span class="dot1 dib fl"></span><a href="government.html?type=2"
								class="ml15 dib fl">规划计划</a>
						</div>
						<div class="cb"></div>
						<div class="ml40">
							<span class="dot1 dib fl"></span><a href="government.html?type=3"
								class="ml15 dib fl">业务工作</a>
						</div>
						<div class="cb"></div>
						<div class="ml40">
							<span class="dot1 dib fl"></span><a href="government.html?type=4"
								class="ml15 dib fl">其他</a>
						</div>
						<div class="cb"></div>
						<div class="ml40">
							<span class="dot1 dib fl"></span><a href="government.html?type=5"
								class="ml15 dib fl">未分类</a>
						</div>
						<div class="cb"></div>
					</div>
				</div>
				<div class="cb"></div>
				<div class="mt10" id="switch2">
					<a href="#" class="ml15 dib" style="color: #4785D0">组配分类></a>
					<div id="appear2" class="none">
						<div class="ml40">
							<span class="dot1 dib fl"></span><a href="government.html?type=6" class="ml15 dib fl">机构概况</a>
						</div>
						<div class="cb"></div>
						<div class="ml40">
							<span class="dot1 dib fl"></span><a href="government.html?type=7" class="ml15 dib fl">政策法规</a>
						</div>
						<div class="cb"></div>
						<div class="ml40">
							<span class="dot1 dib fl"></span><a href="government.html?type=8" class="ml15 dib fl">规划计划</a>
						</div>
						<div class="cb"></div>
						<div class="ml40">
							<span class="dot1 dib fl"></span><a href="government.html?type=9" class="ml15 dib fl">应急管理</a>
						</div>
						<div class="cb"></div>
						<div class="ml40">
							<span class="dot1 dib fl"></span><a href="government.html?type=10" class="ml15 dib fl">业务工作</a>
						</div>
						<div class="cb"></div>
						<div class="ml40">
							<span class="dot1 dib fl"></span><a href="government.html?type=11" class="ml15 dib fl">动态信息</a>
						</div>
						<div class="cb"></div>
						<div class="ml40">
							<span class="dot1 dib fl"></span><a href="government.html?type=12" class="ml15 dib fl">财政信息</a>
						</div>
						<div class="cb"></div>
						<div class="ml40">
							<span class="dot1 dib fl"></span><a href="government.html?type=13" class="ml15 dib fl">统计信息</a>
						</div>
						<div class="cb"></div>
						<div class="ml40">
							<span class="dot1 dib fl"></span><a href="government.html?type=14" class="ml15 dib fl">人事信息</a>
						</div>
						<div class="cb"></div>
						<div class="ml40">
							<span class="dot1 dib fl"></span><a href="government.html?type=15" class="ml15 dib fl">其他</a>
						</div>
						<div class="cb"></div>
						<div class="ml40">
							<span class="dot1 dib fl"></span><a href="government.html?type=5" class="ml15 dib fl">未分类</a>
						</div>
						<div class="cb"></div>
					</div>
				</div>
				<div class="cb"></div>

			</div>
			<script type="text/javascript">
				//树结构

				$(document).ready(function() {
					$("#switch1").click(function() {
						$("#appear1").toggle();
						$("#appearall").toggle();
					});
				});
				//树结构
				$(document).ready(function() {
					$("#switch").click(function() {
						$("#appear").toggle();
					});
				});
				$(document).ready(function() {
					$("#switch2").click(function() {
						$("#appear2").toggle();
						$("#appearall").toggle();
					});
				});
			</script>
			<div class="content-right fl">
				<div class="content-right-top">
					<span class="dib ml10 f18">政务信息>></span> <span
						class="f13 div ml335">您现在的位置：首页>双务公开>政务公开</span>
				</div>
				<div class="best-news">
					<div id="oo" class="bnews-head" style="font-size: 12px;">${content}</div>
					<div class="cb"></div>
					<script>
						$("span").attr("title", "");
						function __doPostBack(page, pageNum) {
							type = "${type}";
							$.ajax({
								url : "government.html",
								data : {
									type : type,
									pageNum : pageNum
								},
								cache : false,
								type : "POST",
								success : function(data) {
									if (data != "error") {
										$("#oo").html(data);
										return false;
									} else {
										alert("页面获取失败，请稍后再试！");
									}
								},
								error : function(data) {
									alert("连接错误！");
								},
								beforeSend : function() {
									$("。oo").html("loading...");
								},
								complete : function() {
								}
							});

						}
					</script>
					<!-- 
					<div class="newsline">
						<a href="#" class="fl dib pl8">局党委举行局领导班第一次学习</a><span
							class="fr dib">2014-04-07</span>
					</div>
					 -->
					<div class="cb"></div>
				</div>
			</div>
			<div class="cb"></div>
		</div>
		<%@include file="footer.jsp"%>
	</div>
</body>
</html>

