<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8" />
	<title></title>
	<link rel="stylesheet" href="css/common.css" />
	<link rel="stylesheet" href="css/base.css" />
	<link rel="stylesheet" href="css/index.css" />
	<script type="text/javascript" src="<%=basePath%>js/index.js"></script>
	<script type="text/javascript" src="<%=basePath%>js/jquery-1.8.2.min.js"></script>
	<script src="<%=basePath%>js/jquery-1.32pack.js"></script>
	<script src="<%=basePath%>js/lanrenzhijia.js"></script>
	<!--[if IE 6]>
	<script type="text/javascript" mce_src="DD_belatedPNG.js" src="http://www.tianqi.com/static/js/DD_belatedPNG.js"></script>
	<script type="text/javascript">DD_belatedPNG.fix(".pngtqico");</script> 
	<![endif]--> 
	<script type="text/javascript">
		var color = bgcolor = bdcolor = site = "";
		var num = 2;
		$(document).ready(function(){
			if (typeof(bgcolor) != 'undefined' && bgcolor != '') {
				$("#header_demo").css('background-color', bgcolor);
				$("#header_demo1").css('background-color', bgcolor);
				$("#header_demo2").css('background-color', bgcolor);
			}
			if (typeof(bdcolor) != 'undefined' && bdcolor != '') {
				$("#header_demo").css('border', '1px solid ' + bdcolor);
				$("#header_demo1").css('border', '1px solid ' + bdcolor);
				$("#header_demo2").css('border', '1px solid ' + bdcolor);
			}
			if (typeof(color) != 'undefined' && color != '') {
				$("#header_demo a").css('color', color);
				$("#header_demo1 a").css('color', color);
				$("#header_demo2 a").css('color', color);
			}
		});
	</script>
</head>
<body onload="picChange()">
	<div id="body">
	<div id="top">
		<div class="logo">
			<img src="<%=basePath%>images/logo.png" alt="" />
		</div>	
		<div class="nav">
			<ul >
				<li><a href="index.html">首页</a></li>
				<li><a href="#" id="s1" onmouseover="changeNav(1)">双务公开</a></li>
				<li><a href="#" id="s2" onmouseover="changeNav(2)">便民服务</a></li>
				<li><a href="#" id="s3" onmouseover="changeNav(3)">互动咨询</a></li>
				<li><input type="text" class="search fl"/><input type="button" class="sub fl"/><div class="cb"></div></li>
			</ul>
			<div class="cb"></div>
		</div>
		<div class="nav-child">
			<ul id="d1" class="">
				<li><a href="news.html">交通新闻</a></li>
				<li><a href="government.html">政务公开</a></li>
				<li><a href="management.html">行业管理</a></li>
				<li><a href="construction.html">工程建设</a></li>
				<li><a href="windows.html">党建之窗</a></li>
			</ul>
			<div class="cb"></div>
			<ul id="d2" class="sp">
				<li class="ml380"><a href="administrative.html">网上行政办事</a></li>
				<li><a href="service.html">公共服务</a></li>
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
	<div class="cb"></div>
	<div id="content">
		<div class="left fl">
			<div class="left-top">
				<div class="changePic fl">
					<ul id="pub_slideplay">
						<li><a href="detail.html"><img src="<%=basePath%>images/01.png" alt="" /><p>梁一波书记观察吴江大道</p></a></li>
						<li><a href="detail.html"><img src="<%=basePath%>images/02.jpg" alt="" /><p>云南地震已发生22次余震</p></a></li>
						<li><a href="detail.html"><img src="<%=basePath%>images/03.jpg" alt="" /><p>梁一波书记观察吴江大道</p></a></li>
						<li><a href="detail.html"><img src="<%=basePath%>images/04.jpg" alt="" /><p>云南地震已发生22次余震</p></a></li>
					</ul>
				</div>
				<script>new dk_slideplayer("#pub_slideplay",{width:"326px",height:"215px",fontsize:"12px",time:"5000"});</script>
				<div class="news fl">
					<div class="news-head">
						<span class="sbg fb f16">新闻摘要</span>
						<span class="dib ml180 f14"><a href="#">更多>></a></span>
					</div>
					<div class="newsline f13 mt10 "><a href="detail.html" class="dib">苏震桃公路吴江南段新建工程召开</a><span class="dib ml20">2014-07-14</span></div>
					<div class="newsline f13"><a href="detail.html" class="dib">苏震桃公路吴江南段新建工程召开</a><span class="dib ml20">2014-07-14</span></div>
					<div class="newsline f13"><a href="detail.html" class="dib">苏震桃公路吴江南段新建工程召开</a><span class="dib ml20">2014-07-14</span></div>
					<div class="newsline f13"><a href="detail.html" class="dib">苏震桃公路吴江南段新建工程召开</a><span class="dib ml20">2014-07-14</span></div>
					<div class="newsline f13"><a href="detail.html" class="dib">苏震桃公路吴江南段新建工程召开</a><span class="dib ml20">2014-07-14</span></div>
					<div class="newsline f13 nounline"><a href="detail.html" class="dib">苏震桃公路吴江南段新建工程召开</a><span class="dib ml20">2014-07-14</span></div>
				</div>
			</div>
			<div class="cb"></div>
			<div class="scroll-news f13" >
				<div id="header_demo" class="col_kx">
					<table cellspacing="0" cellpadding="0" border="0">
					<tbody>
					<tr>
					<td id="header_demo1" nowrap="">
					<div class="code1">
					<a title="点击查看吴江未来七天天气预报 " href="http://suzhou.tianqi.com/wujiang/?tq" target="_blank" style="color:#">
					<strong>今天：</strong>
					吴江 阵雨转阴
					<span style="color:#f00">24℃</span>
					～
					<span style="color:#4899be">21℃</span>
					东北风
					<strong>明天：</strong>
					吴江 阵雨转大雨
					<span style="color:#f00">27℃</span>
					～
					<span style="color:#4899be">21℃</span>
					北风3-4级转东北风4-5级
					<strong>后天：</strong>
					吴江 阵雨转阴
					<span style="color:#f00">27℃</span>
					～
					<span style="color:#4899be">22℃</span>
					东北风
					</a>
					</div>
					</td>
					<td id="header_demo2" nowrap="">
					<div class="code1">
					<a title="点击查看吴江未来七天天气预报 " href="http://suzhou.tianqi.com/wujiang/?tq" target="_blank" style="color:#">
					<strong>今天：</strong>
					吴江 阵雨转阴
					<span style="color:#f00">24℃</span>
					～
					<span style="color:#4899be">21℃</span>
					东北风
					<strong>明天：</strong>
					吴江 阵雨转大雨
					<span style="color:#f00">27℃</span>
					～
					<span style="color:#4899be">21℃</span>
					北风3-4级转东北风4-5级
					<strong>后天：</strong>
					吴江 阵雨转阴
					<span style="color:#f00">27℃</span>
					～
					<span style="color:#4899be">22℃</span>
					东北风
					</a>
					</div>
					</td>
					</tr>
					</tbody>
					</table>
				</div>
				<script src="<%=basePath%>js/scroll2.js" type="text/javascript"></script>
				
				<script type="text/javascript" src="http://www.tianqi.com/static/js/scroll2.js">
				//滚动头条
				//滚动效果
				var header_demo = document.getElementById("header_demo");
				var header_demo1 = document.getElementById("header_demo1");
				var header_demo2 = document.getElementById("header_demo2");
				var speed=20; //数值越大滚动速度越慢
				header_demo2.innerHTML = header_demo1.innerHTML;
				//header_demo2.offsetWidth 总宽度
				//alert(header_demo2.offsetWidth +"-"+header_demo.scrollLeft);
				function Marquee(){
				if(header_demo2.offsetWidth-header_demo.scrollLeft<=0)
				header_demo.scrollLeft-=header_demo1.offsetWidth
				else{
				header_demo.scrollLeft++
				}
				}
				var MyMar = setInterval(Marquee,speed);
				header_demo.onmouseover = function(){clearInterval(MyMar)}
				header_demo.onmouseout = function(){MyMar = setInterval(Marquee,speed)}
				</script>
				<script type="text/javascript">num=0;wind=0;temp=0;</script>
				
			</div>
			<div class="scroll-pic">
				<div class="pic fl" id="pic" >
					<div id="pic-1 fl"><img src="<%=basePath%>images/1.jpg" style="border:0px;" alt="" /></div>
					<div id="pic-2 fl"><img src="<%=basePath%>images/2.jpg" style="border:0px;" alt="" /></div>
				</div>
				<div class="fl"><a href="#"><img src="images/dangjian.jpg" alt="" /></a></div>
			</div>
			<div class="demand">
			<h4 class="fb zbg">实用查询>></h4>
				<table>
					<tr>
						<td class="t1"><span class="icon fl"></span><a href="#" class="fr">货运查询</a></td>
						<td class="th1 pl50"><span class="icono fl"></span><a href="#" class="fr">客运查询</a></td>
						<td class="td1 pl50"><span class="icont fl"></span><a href="#" class="fr">公交实时查询</a></td>
					</tr>
					<tr>
						<td class="tr2"><span class="iconth fl"></span><a href="#" class="fr">运输从业人员查询</a></td>
						<td class="th2 pl50"><span class="iconf fl"></span><a href="#" class="fr">行政执法类<br />证件查询</a></td>
						<td class="td2 pl50"><span class="iconfi fl"></span><a href="#" class="fr">失物招领</a></td>
					</tr>
					<tr>
						<td class="tr3"><span class="icons fl"></span><a href="#" class="fr">机动车维修<br />查询</a></td>
						<td class="th3 pl50"><span class="iconse fl"></span><a href="#" class="fr">驾驶员培训<br />查询</a></td>
						<td class="td3 pl50"><span class="icone fl"></span><a href="#" class="fr">违章信息查询</a></td>
					</tr>
				</table>
			</div>
			<div class="cb"></div>
			<div class="public">
				<div class="fb zbg">政务公开>></div>
				<div class="public-left fl">
					<span class="db mt10">机构功能</span>
					<span class="db mt8">政策法规</span>
					<span class="db mt8">规划计划</span>
					<span class="db mt8">业务工作</span>
					<span class="db mt8">人事人才</span>
					<span class="db mt8">其他</span>
				</div>
				<div class="public-right fl f13">
					<div class="public-line mt10"><span class="spot dib fl"></span><a href="detail.html" class="dib fl ml12"> 苏州市吴江区2012年政府信息公开工作年度报告</a> <span class="dib fr mr10">2014-07-14</span></div>
					<div class="cb"></div>
					<div class="public-line"><span class="spot dib fl"></span><a href="detail.html" class="dib fl ml12"> 苏州市吴江区2012年政府信息公开工作年度报告</a> <span class="dib fr mr10">2014-07-14</span></div>
					<div class="cb"></div>
					<div class="public-line"><span class="spot dib fl"></span><a href="detail.html" class="dib fl ml12"> 苏州市吴江区2012年政府信息公开工作年度报告</a> <span class="dib fr mr10">2014-07-14</span></div>
					<div class="cb"></div>
					<div class="public-line"><span class="spot dib fl"></span><a href="detail.html" class="dib fl ml12"> 苏州市吴江区2012年政府信息公开工作年度报告</a> <span class="dib fr mr10">2014-07-14</span></div>
					<div class="cb"></div>
					<div class="public-line"><span class="spot dib fl"></span><a href="detail.html" class="dib fl ml12"> 苏州市吴江区2012年政府信息公开工作年度报告</a> <span class="dib fr mr10">2014-07-14</span></div>
					<div class="cb"></div>
					<div class="public-line"><span class="spot dib fl"></span><a href="detail.html" class="dib fl ml12"> 苏州市吴江区2012年政府信息公开工作年度报告</a> <span class="dib fr mr10">2014-07-14</span></div>
					<div class="cb"></div>
					<div class="public-line"><span class="spot dib fl"></span><a href="detail.html" class="dib fl ml12"> 苏州市吴江区2012年政府信息公开工作年度报告</a> <span class="dib fr mr10">2014-07-14</span></div>
					<div class="cb"></div>
					<div class="public-line nounline"><span class="spot dib fl"></span><a href="detail.html" class="dib fl ml12"> 苏州市吴江区2012年政府信息公开工作年度报告</a> <span class="dib fr mr10">2014-07-14</span></div>
					<div class="cb"></div>
				</div>
				<div class="cb"></div>
			</div>
		</div>
		<div class="right fl">
			<div class="notice">
				<div class="notice-head">
					<span class="sbg fb f16">公告信息</span>
					<span class="f14 dib ml165"><a href="#">更多>></a></span>
				</div>
				<div class="f12"><span class="dot dib fl"></span><a href="detail.html" class="noticeline fl ml12">苏震桃公路吴江南段新建工程召开“百日劳动竞赛</a></div>
				<div class="cb"></div>
				<div class="f12"><span class="dot dib fl"></span><a href="detail.html" class="noticeline fl ml12">苏震桃公路吴江南段新建工程召开“百日劳动竞赛</a></div>
				<div class="cb"></div>
				<div class="f12"><span class="dot dib fl"></span><a href="detail.html" class="noticeline fl ml12">苏震桃公路吴江南段新建工程召开“百日劳动竞赛</a></div>
				<div class="cb"></div>
			</div>
			<div class="road">
				<table>
					<tr>
						<td class="vbar fb h78 ">实时路况</td>
						<td class="shell" >
							<div id="div1" style="height:80px;overflow:hidden;" >
							<span class="db f12 lh28"><span class="tdot dib fl"></span><a href="detail.html" class=" noticeline fl ml10">苏震桃公路吴江南段新建工程召开“百日</a></span>
							<div class="cb"></div>
							<span class="db f12 lh28"><span class="tdot dib fl"></span><a href="detail.html" class=" noticeline fl ml10">苏震桃公路吴江南段新建工程召开“百日</a></span>
							<div class="cb"></div>
							<span class="db f12 lh28"><span class="tdot dib fl"></span><a href="detail.html" class=" noticeline fl ml10">苏震桃公路吴江南段新建工程召开“百日</a></span>
							<div class="cb"></div>
							</div>
						</td>
					</tr>
				</table>
				<script>
					var c,_=Function;
					with(o=document.getElementById("div1")){ innerHTML+=innerHTML; onmouseover=_("c=1"); onmouseout=_("c=0");}
					(F=_("if(#%28||!c)#++,#%=o.scrollHeight>>1;setTimeout(F,#%28?10:1500);".replace(/#/g,"o.scrollTop")))();
				</script>
			</div>
			<div class="management">
				<div class="management-head">
					<span class="fb pl8">行业管理</span>
					<span class="f14 dib ml165"><a href="#">更多>></a></span>
				</div>
				<table class="mt10">
					<tr>
						<td><a href="#" class="so"><span class="db pt12">路政<br />管理</span></a></td>
						<td><a href="#" class="ds"><span class="db pt12">路网<br />调度</span></a></td>
						<td><a href="#" class="so"><span class="db pt12">运政<br />信息</span></a></td>
						<td><a href="#" class="ds"><span class="db pt12">运政<br />公告</span></a></td>
					</tr>
					<tr>
						<td><a href="#" class="ds"><span class="db pt12">港政<br />管理</span></a></td>
						<td><a href="#" class="so"><span class="db pt12">杭政<br />管理</span></a></td>
						<td><a href="#" class="ds"><span class="db pt12">航道<br />通告</span></a></td>
						<td><a href="#" class="so"><span class="db pt12">海事<br />管理</span></a></td>
					</tr>
					<tr>
						<td><a href="#" class="so"><span class="db pt12">客管<br />信息</span></a></td>
						<td><a href="#" class="ds"><span class="db pt12">公交<br />动态</span></a></td>
						<td><a href="#" class="so"><span class="db pt12">建设<br />管理</span></a></td>
						<td><a href="#" class="ds"><span class="db pt12">养护<br />管理</span></a></td>
					</tr>
				</table>
			</div>
			<div class="weibo f13">
				<table>
					<tr>
						<td class=""><img  src="<%=basePath%>images/weibologo.png" alt="" /></td>
						<td class="pl8">
							<div class="bracket-one"><span class="dib bracket"></span><img src="<%=basePath%>images/logo2.png" class="ml10" alt="" /></div>
							<span class="db lh30">苏州市吴江区交通运输局V</span>
							<span class="db ">江苏 吴江</span>
							<a href="#" class="aweibo">+加关注</a>
						</td>
					</tr>
				</table>
				<table class="mt35">
					<tr>
						<td><img src="<%=basePath%>images/weixin.png" alt="" /></td>
						<td class="pl8">
							<div class="bracket-one"><span class="dib bracket"><img src="<%=basePath%>images/logo3.png" alt="" /></span></div>
							<span class="db lh30">苏州市吴江区交通运输局V</span>
							<span class="db">江苏 吴江</span>
							<span class="db red-big">微信扫一扫</span>
						</td>
					</tr>
				</table>
				<div class="tel mt18 f16">
					<span class="tellogo dib"></span>
					<span class="">服务热线：</span>
					<span class="ocolor">63022222</span>
				</div>
				<div class="email f16">
					<span class="emaillogo dib"></span>
					<a href="email.html">局长信箱</a>
				</div>
				<div class="board f16">
					<span class="boardlogo dib"></span>
					<a href="messageboard.html">留言板</a>
				</div>
			</div>
		</div>
		<div class="cb"></div>
		<div class="content-foot">
			<div class="fb link">友情链接</div>
			<select name="link" id="">
				<option value=""><a href="#">政府网站</a></option>
				<option value=""><a href="#">政府网站</a></option>
			</select>
			<select name="link" id="" class="ml50">
				<option value=""><a href="#">交通网站</a></option>
				<option value=""><a href="#">交通网站</a></option>
			</select>
			<select name="link" id="" class="ml50">
				<option value=""><a href="#">其他信息网站</a></option>
				<option value=""><a href="#">其他信息网站</a></option>
			</select>
		</div>
	</div>
	<div id="footer">
		<div class="mt15">版权所有：苏州市吴江区交通运输局</div>
		<div>地址：苏州市吴江去交通路3265号  电话：0512-63022222</div>
		<div>目前网站浏览量【101203】人次  苏ICP备05004014号</div>
	</div>
	</div>
</body>
</html>