<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<script>
function searchResult(){		
	var key = $("#search").val();		
	if(key==0){
		alert("请输入搜索关键词！");
		return false;
	}
	location.href='search.html?key='+key;				
}
</script>

<div id="top">
	<div class="logo">
		<img src="images/logo.png" alt="" />
	</div>
	<div class="nav">
		<ul>
			<li><a href="index.html">首页</a></li>
			<li><a href="#" id="s1" onmouseover="changeNav(1)">双务公开</a></li>
			<li><a href="#" id="s2" onmouseover="changeNav(2)">便民服务</a></li>
			<li><a href="#" id="s3" onmouseover="changeNav(3)">互动咨询</a></li>
						
			<li><input type="text" class="search fl" id="search"/><a  
				class="sub fl" onclick="searchResult();"
				style="width: 24px; height: 25px; float: left; margin-left: -24px; margin-top: 5px;" ></a>
				<div class="cb"></div></li>
		</ul>
		<div class="cb"></div>
	</div>
	<div class="nav-child">
		<ul id="d1" class="">
			<li><a href="news.html">交通新闻</a></li>
			<li><a href="government.html?type=0">政务公开</a></li>
			<li><a href="management.html?category=44&pageNum=1">行业管理</a></li>
			<li><a href="construction.html?category=14&pageNum=1">工程建设</a></li>
			<li><a href="windows.html?category=21&pageNum=1">党建之窗</a></li>
		</ul>
		<div class="cb"></div>
		<ul id="d2" class="sp">
			<li class="ml380"><a href="administrative.html?category=25&pageNum=1">网上行政办事</a></li>
			<li><a href="searchBus.html">公共服务</a></li>
		</ul>
		<div class="cb"></div>

		<ul id="d3" class="">
			<li class="ml590"><a href="email.html">局长信箱</a></li>
			<li><a href="voting.html">网上投票</a></li>
			<li><a href="messageboard.html">留言板</a></li>
		</ul>
		<div class="cb"></div>
	</div>
	<div class="cb"></div>
</div>