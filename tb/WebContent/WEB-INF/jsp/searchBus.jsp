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
<link rel="stylesheet" href="css/searchBus.css" />
<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="js/index.js"></script>
<script type="text/javascript">
	function setTab(name, cursel) {
		cursel_0 = cursel;			
		for (var i = 1; i <= 3; i++) {
			var menu = document.getElementById(name + i);			
			var menudiv = document.getElementById("con_" + name + "_" + i);
			if (i == cursel) {
				$('#'+name+i).addClass("checked");
				menudiv.style.display = "block";
			} else {
				$('#'+name+i).removeClass("checked");
				menudiv.style.display = "none";
			}
		}
	}
	
	/*
	function Next() {
		cursel_0++;
		if (cursel_0 > links_len)
			cursel_0 = 1
		setTab(name_0, cursel_0);
	}
	var name_0 = 'one';
	var cursel_0 = 1;
	var links_len, iIntervalId;
	onload = function() {
		var links = document.getElementById("tab1").getElementsByTagName('div')
		links_len = links.length;
		for (var i = 0; i < links_len; i++) {
			links[i].onmouseover = function() {
				clearInterval(iIntervalId);
				this.onmouseout = function() {
					iIntervalId = setInterval(Next, ScrollTime);
					;
				}
			}
		}

	}
   */

function stopSearch(){
	var stop = $('#stop').val();
	$.ajax({
		url : "stopSearch.html",
		data : {
			name : stop,			
		},
		cache : false,
		type : "POST",
		//aync: false,
		success : function(data) {
			if (data != "error") {
				$("#result").html(data);					
			} else {
				alert("非法输入，请重新填写！");
			}
		},
		error : function(data) {			
			alert("链接失败！");
		},
		beforeSend : function() {
			$('.searchframelink').html("查询中...");
		},
		complete : function() {	
			$('.searchframelink').html("查询");
		}
	});	
}

function lineSearch(){
	var line = $('#line').val();
	
	$.ajax({
		url : "lineSearch.html",
		data : {
			name : line,			
		},
		cache : false,
		type : "POST",
		//aync: false,
		success : function(data) {
			if (data != "error") {
				$("#result").html(data);					
			} else {
				alert("非法输入，请重新填写！");
			}
		},
		error : function(data) {			
			alert("链接失败！");
		},
		beforeSend : function() {
			$('.searchframelink').html("查询中...");
		},
		complete : function() {	
			$('.searchframelink').html("查询");
		}
	});		
}

$(document).ready(function() { 	
	if("${type}".length<1){
		setTab("one", "1");
	}else{
	setTab("one", "${type}");
	}
});


function lineSwitch(){	
	$('#result').html("");	
	setTab('one',3);
}


</script>
</head>
<body>
	<div id="body">
		<%@include file="top.jsp"%>
		<div class="cb"></div>
		<div id="content">
			<%@include file="service/leftbar.jsp"%>
			<div class="content-right fl">
				<div style="width: 390px; margin: 0 auto;">
					<div class="content-right-toplogo">
						<img src="images/bus.png" alt="" style="float: left" /> <span
							style="float: left; color: #448aca; font-size: 32px; letter-spacing: 10px; display: inline-block; margin-left: 15px; line-height: 41px; padding-top: 6px;">实时公交</span>
						<div class="cb"></div>
					</div>
					
					
					
					<div class="content-buschange">
						<div
							style="margin-top: 18px; margin-bottom: 30px; font-size: 20px;"
							id="tab1">
							<div id="one1" class="checka  fl" onclick="setTab('one',1)">站点查询</div>
							<div id="one2" class="checkb  fl" onclick="setTab('one',2)">线路查询</div>
							<div id="one3" class="checkc  fl" onclick="lineSwitch();">公交换乘</div>
							<div class="cb"></div>
						</div>
						<div class="searcha" id="con_one_1">
							<div class="searchframe">
								<input id="stop" type="text" placeholder="站点名"/>
							</div>
							<a href="" class="searchframelink"
								style="color: #fff; font-size: 16px;" onclick="stopSearch();return false;">查询</a>
						</div>
						<div class="searchb" id="con_one_2">
							<div class="searchframe">
								<input id="line" type="text" placeholder="线路名"/>
							</div>
							<a href="" class="searchframelink"
								style="color: #fff; font-size: 16px;" onclick="lineSearch();return false;">查询</a>
						</div>
						<div class="searchc" id="con_one_3">						
							<iframe height="400" width="400" src="http://mo.amap.com/navigation/index/#!/index/index/"></iframe>
							<!-- 
							<div class="searchframe">
								<input id="switch" type="text" placeholder="换成路线" />
							</div>
							<a href="switchSearch.html" class="searchframelink"
								style="color: #fff; font-size: 16px;" onclick="stopSearch();return false;">查询</a>
							 -->
						</div>
					</div>
					<div id="result" style="margin-top: 18px; margin-bottom: 30px;font-size:12px;">				
						<h1>${name}</h1>						
						${result}
					</div>
				</div>
			</div>
			<div class="cb"></div>
		</div>
		<%@include file="footer.jsp"%>
	</div>
</body>
</html>