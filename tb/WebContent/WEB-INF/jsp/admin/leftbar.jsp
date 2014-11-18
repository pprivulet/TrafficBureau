<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<script>

$(document).ready(function() {
	var category=["ctg0", "ctg1","ctg2","ctg3","ctg4","ctg5","ctg6","ctg7","ctg8","ctg9","ctg10","ctg11"
	              ,"ctg12","ctg13","ctg14","ctg15","ctg16","ctg17","ctg18","ctg19","ctg20","ctg21",
	              "ctg22","ctg23","ctg24","ctg25","ctg26","ctg27","ctg28","ctg29","ctg30","ctg31",
	              "ctg32","ctg33","ctg34","ctg35","ctg36","ctg37","ctg38","ctg39","ctg40","ctg41",
	              "ctg42","ctg43","ctg44","ctg45","ctg46", "ctg47", "ctg48"];						
	
	var group = $("#" + category[${idx}]).attr("class");
	
	$("#" + category[${idx}]).attr("class", "active");	
	
	$(".industry").hide();
	$(".project").hide();
	$(".party").hide();
	$(".network").hide();
	$(".service").hide();
	$("."+group).show();
	$("#industry").click(function(){
		  $(".industry").toggle();
	});
	$("#project").click(function(){
		  $(".project").toggle();
	});
	$("#party").click(function(){
		  $(".party").toggle();
	});
	$("#network").click(function(){
		  $(".network").toggle();
	});
	$("#service").click(function(){
		  $(".service").toggle();
	});
	
});

</script>

<ul class="nav nav-sidebar">
	<li id="ctg1"><a href="entry.html?category=1&pageNum=1">新闻</a></li>
	<li id="ctg2"><a href="entry.html?category=2&pageNum=1">公告</a></li>
	<li id="ctg27"><a href="entry.html?category=27&pageNum=1">失物招领</a></li>
	<li><a href="email.html">局长信箱</a></li>
	<li id="ctg47"><a href="message.html?category=47&pageNum=1">留言板</a></li>
	<li id="ctg48"><a href="voteThemeList.html?category=48&pageNum=1">网上投票</a></li>
	<li id="industry"><hr>行业管理<span
		class="glyphicon glyphicon-chevron-down"></span></li>
	<li id="ctg44" class="industry"><a
		href="entry.html?category=44&pageNum=1">路政管理</a></li>
	<li id="ctg3" class="industry"><a
		href="entry.html?category=3&pageNum=1">路网调度</a></li>
	<li id="ctg4" class="industry"><a
		href="entry.html?category=4&pageNum=1">运政信息</a></li>
	<li id="ctg5" class="industry"><a
		href="entry.html?category=5&pageNum=1">运政公告</a></li>
	<li id="ctg6" class="industry"><a
		href="entry.html?category=6&pageNum=1">港政管理</a></li>
	<li id="ctg7" class="industry"><a
		href="entry.html?category=7&pageNum=1">航政管理</a></li>
	<li id="ctg8" class="industry"><a
		href="entry.html?category=8&pageNum=1">航道通告</a></li>
	<li id="ctg9" class="industry"><a
		href="entry.html?category=9&pageNum=1">海事管理</a></li>
	<li id="ctg10" class="industry"><a
		href="entry.html?category=10&pageNum=1">客管信息</a></li>
	<li id="ctg11" class="industry"><a
		href="entry.html?category=11&pageNum=1">公交动态</a></li>
	<li id="ctg12" class="industry"><a
		href="entry.html?category=12&pageNum=1">建设管理</a></li>
	<li id="ctg13" class="industry"><a
		href="entry.html?category=13&pageNum=1">养护管理</a></li>
	<li id="project"><hr>工程建设<span
		class="glyphicon glyphicon-chevron-down"></span></li>
	<li id="ctg14" class="project"><a
		href="entry.html?category=14&pageNum=1">项目信息公开</a></li>
	<!-- 
	<li id="ctg15" class="project"><a
		href="entry.html?category=15&pageNum=1">工程项目管理</a></li>
	 -->
	<li id="ctg16" class="project"><a
		href="entry.html?category=16&pageNum=1">政策文件</a></li>
	<li id="ctg17" class="project"><a
		href="entry.html?category=17&pageNum=1">工作动态</a></li>
	<li id="ctg18" class="project"><a
		href="entry.html?category=18&pageNum=1">招标公示</a></li>
	<li id="ctg45" class="project"><a
		href="entry.html?category=45&pageNum=1">中标公示</a></li>
	<li id="ctg19" class="project"><a
		href="entry.html?category=19&pageNum=1">从业单位信用信息</a></li>
	<li id="ctg20" class="project"><a
		href="entry.html?category=20&pageNum=1">从业人员信用信息</a></li>
	<li id="party"><hr> 党建之窗<span
		class="glyphicon glyphicon-chevron-down"></span></li>
	<li id="ctg21" class="party"><a
		href="entry.html?category=21&pageNum=1">党建工作</a></li>
	<li id="ctg22" class="party"><a
		href="entry.html?category=22&pageNum=1">精神文明</a></li>
	<li id="ctg23" class="party"><a
		href="entry.html?category=23&pageNum=1">党风廉政</a></li>
	<li id="ctg24" class="party"><a
		href="entry.html?category=24&pageNum=1">交通团委</a></li>	
	<li id="ctg26" class="party"><a
		href="entry.html?category=26&pageNum=1">荣誉榜</a></li>
	
	<li id="network"><hr> 网上行政办事<span
		class="glyphicon glyphicon-chevron-down"></span></li>
	<li id="ctg25" class="network"><a
		href="entry.html?category=25&pageNum=1">办事指南</a></li>
	<li id="ctg46" class="network"><a
		href="entry.html?category=46&pageNum=1">表格下载</a></li>	
			
	<li id="service"><hr> 公共服务<span
		class="glyphicon glyphicon-chevron-down"></span></li>	
	<li id="ctg29" class="service"><a
		href="entry.html?category=29&pageNum=1">交通实况</a></li>
	<li id="ctg30" class="service"><a
		href="entry.html?category=30&pageNum=1">出行参考</a></li>
	<li id="ctg31" class="service"><a
		href="entry.html?category=31&pageNum=1">出行向导</a></li>
	<li id="ctg32" class="service"><a
		href="entry.html?category=32&pageNum=1">图形交通</a></li>
	<li id="ctg33" class="service"><a
		href="entry.html?category=33&pageNum=1">客运路线</a></li>
	<li id="ctg34" class="service"><a
		href="entry.html?category=34&pageNum=1">客运站点</a></li>
	<li id="ctg35" class="service"><a
		href="entry.html?category=35&pageNum=1">售票网点</a></li>
	<li id="ctg36" class="service"><a
		href="entry.html?category=36&pageNum=1">票务信息</a></li>	
	<li id="ctg37" class="service"><a
		href="entry.html?category=37&pageNum=1">机场公交</a></li>			
</ul>