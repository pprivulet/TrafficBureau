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
<link rel="stylesheet" href="css/index.css" />
<script type="text/javascript" src="js/jquery-1.8.2.min.js"></script>
<script type="text/javascript" src="js/index.js"></script>
<script src="js/jquery-1.32pack.js"></script>
<script src="js/lanrenzhijia.js"></script>
<!--[if IE 6]>
	<script type="text/javascript" mce_src="DD_belatedPNG.js" src="http://www.tianqi.com/static/js/DD_belatedPNG.js"></script>
	<script type="text/javascript">DD_belatedPNG.fix(".pngtqico");</script> 
	<![endif]-->
<script type="text/javascript">
	var color = bgcolor = bdcolor = site = "";
	var num = 2;
	$(document).ready(function() {
		if (typeof (bgcolor) != 'undefined' && bgcolor != '') {
			$("#header_demo").css('background-color', bgcolor);
			$("#header_demo1").css('background-color', bgcolor);
			$("#header_demo2").css('background-color', bgcolor);
		}
		if (typeof (bdcolor) != 'undefined' && bdcolor != '') {
			$("#header_demo").css('border', '1px solid ' + bdcolor);
			$("#header_demo1").css('border', '1px solid ' + bdcolor);
			$("#header_demo2").css('border', '1px solid ' + bdcolor);
		}
		if (typeof (color) != 'undefined' && color != '') {
			$("#header_demo a").css('color', color);
			$("#header_demo1 a").css('color', color);
			$("#header_demo2 a").css('color', color);
		}
	});
			


</script>
</head>
<body onload="picChange()">
	<div id="body">
		
		

		<%@include file="top.jsp"%>

		<div class="cb"></div>
		<div id="content">
			<div class="left fl">
				<div class="left-top">
					<div class="changePic fl">
						<ul id="pub_slideplay">
							<c:set value="0" var="i" />
							<c:forEach var="file" items="${phileList}" varStatus="status">
								<c:set value="15" var="maxLen" />

								<li><a href="detail.html?id=${file.entryId}" class="dib"><img
										src="${file.path.split(',')[0]}" alt="" />
										<p>
											<c:out
												value="${entryTitleList[i].substring(0,maxLen<entryTitleList[i].length()?maxLen:entryTitleList[i].length())}"
												escapeXml="true" />

										</p></a></li>
								<c:set value="${i+1}" var="i" />
							</c:forEach>
						</ul>
					</div>
					<script>
						new dk_slideplayer("#pub_slideplay", {
							width : "326px",
							height : "215px",
							fontsize : "12px",
							time : "5000"
						});
					</script>
					<div class="news fl">
						<div class="news-head">
							<span class="sbg fb f16">新闻摘要</span> <span class="dib ml180 f14"><a
								href="news.html">更多>></a></span>
						</div>

						<c:forEach var="entry" items="${newsList}" varStatus="status">
							<c:set value="15" var="maxLen" />
							<div class="newsline f13">
								<a href="detail.html?id=${entry.id}" class="dib"> <c:out
										value="${entry.title.substring(0,maxLen<entry.title.length()?maxLen:entry.title.length())}"
										escapeXml="true" />
								</a><span class="dib ml20">${entry.publishDate.substring(0,10)}</span>
							</div>

						</c:forEach>

					</div>
				</div>
				<div class="cb"></div>
				<div class="scroll-news f13">
					<div id="header_demo" class="col_kx">
						<table cellspacing="0" cellpadding="0" border="0">
							<tbody>
								<tr>
									<td id="header_demo1" nowrap="">
										<div class="code1">
											<c:forEach var="entry" items="${newsList}" varStatus="status">
												<c:set value="15" var="maxLen" />

												<a href="detail.html?id=${entry.id}">| <c:out
														value="${entry.title.substring(0,maxLen<entry.title.length()?maxLen:entry.title.length())}"
														escapeXml="true" />
												</a>${entry.publishDate.substring(0,10)}|
												
											</c:forEach>
										</div>
									</td>
									<td id="header_demo2" nowrap=""></td>
								</tr>
							</tbody>
						</table>
					</div>
					<script src="js/scroll2.js" type="text/javascript"></script>

					<script type="text/javascript"
						src="http://www.tianqi.com/static/js/scroll2.js">
						//滚动头条
						//滚动效果
						var header_demo = document
								.getElementById("header_demo");
						var header_demo1 = document
								.getElementById("header_demo1");
						var header_demo2 = document
								.getElementById("header_demo2");
						var speed = 20; //数值越大滚动速度越慢
						header_demo2.innerHTML = header_demo1.innerHTML;
						//header_demo2.offsetWidth 总宽度
						//alert(header_demo2.offsetWidth +"-"+header_demo.scrollLeft);
						function Marquee() {
							if (header_demo2.offsetWidth
									- header_demo.scrollLeft <= 0)
								header_demo.scrollLeft -= header_demo1.offsetWidth
							else {
								header_demo.scrollLeft++
							}
						}
						var MyMar = setInterval(Marquee, speed);
						header_demo.onmouseover = function() {
							clearInterval(MyMar)
						}
						header_demo.onmouseout = function() {
							MyMar = setInterval(Marquee, speed)
						}
					</script>
					<script type="text/javascript">
						num = 0;
						wind = 0;
						temp = 0;
					</script>

				</div>
				<div class="scroll-pic">
					<div class="pic fl" id="img1">
						<img id="pic1" alt="" height="111" width="164" src="images/1.jpg" />
					</div>
					<div class="pic fl" id="img2">
						<img id="pic2" alt="" height="111" width="164" src="images/2.jpg" />
					</div>
					<div class="pic fl" id="img3">
						<img id="pic3" alt="" height="111" width="164" src="images/3.jpg" />
					</div>
					<script type="text/javascript">
						function changeOrder(picid) {
							$.ajax({
								url : "imageSwitch.html",
								cache : true,
								type : "GET",
								success : function(data) {
									if (data != "error") {
										$("#pic" + picid).attr("src", data);

									} else if (data == "error") {
										$("#pic" + picid).attr("src",
												"images/" + picid + ".jpg");
									}

								},
								error : function(data) {
									$("#pic" + picid).attr("src",
											"images/" + picid + ".jpg");
								},
								beforeSend : function() {
								},
								complete : function() {

								}
							});
						}
						//setInterval('changeOrder("1")', 10 * 1000);
						//setInterval('changeOrder("2")', 11 * 1000);
						//setInterval('changeOrder("3")', 12 * 1000);
					</script>


					<div class="fl">
						<a href="windows.html?category=21&pageNum=1"><img
							src="images/dangjian.jpg" alt="" /></a>
					</div>
					<div class="cb"></div>
				</div>
				<div class="demand">
					<h4 class="fb zbg">实用查询>></h4>
					<table>
						<tr>
							<td class="t1"><span class="icon fl"></span><a
								href="http://www.szyz.gov.cn/ui/FreightVehicleSearch.html?_s=17b2a2a0-530c-4e83-befe-02f858d92882"
								class="fr">货运查询</a></td>
							<td class="th1 pl50"><span class="icono fl"></span><a
								href="http://www.szyz.gov.cn/ui/PassengerVehicleSearch.html?_s=aef63618-ce44-4dc8-826e-b30ba2d2e8f2"
								class="fr">客运查询</a></td>
							<td class="td1 pl50"><span class="icont fl"></span><a
								href="/tb/searchBus.html" class="fr">公交实时查询</a></td>
						</tr>
						<tr>
							<td class="tr2"><span class="iconth fl"></span><a
								href="http://www.szyz.gov.cn/ui/StaffSuggestionSearch.html?_s=e0ce2462-fcc6-4bfc-a8ec-36c295a9fb84"
								class="fr">运输从业人员查询</a></td>
							<td class="th2 pl50"><span class="iconf fl"></span><a
								href="http://www.szjt.gov.cn/bjjt/xzzfcx.htm" class="fr">行政执法类<br />证件查询
							</a></td>
							<td class="td2 pl50"><span class="iconfi fl"></span><a
								href="service.html?category=27&pageNum=1" class="fr">失物招领</a></td>
						</tr>
						<tr>
							<td class="tr3"><span class="icons fl"></span><a
								href="http://www.szyz.gov.cn/ui/ServiceCompanySearch.html?_s=c4fadf9d-6b12-4691-8525-57b0d0cc3d9a"
								class="fr">机动车维修<br />查询
							</a></td>
							<td class="th3 pl50"><span class="iconse fl"></span><a
								href="http://www.szyz.gov.cn/ui/SchoolSearch.html?_s=d171911b-03ea-42a7-b07f-fdcdec8e9b02"
								class="fr">驾驶员培训<br />查询
							</a></td>
							<td class="td3 pl50"><span class="icone fl"></span><a
								href="http://www.szyz.gov.cn/ui/OperationVehicleSearch.html?_s=96925e01-9815-4e62-9f26-0bde17eaa53b"
								class="fr">违章信息查询</a></td>
						</tr>
					</table>
				</div>
				<div class="cb"></div>
				<div class="public">
					<div class="fb zbg">政务公开>></div>
					<div class="public-left fl">
						<span class="db mt10"><a href="government.html?type=6">机构功能</a></span>
						<span class="db mt8"><a href="government.html?type=7">政策法规</a></span>
						<span class="db mt8"><a href="government.html?type=8">规划计划</a></span>
						<span class="db mt8"><a href="government.html?type=10">业务工作</a></span>
						<span class="db mt8"><a href="government.html?type=14">人事人才</a></span>
						<span class="db mt8"><a href="government.html?type=15">其他</a></span>
					</div>

					<script type="text/javascript">
						$(document).ready(function() {
							$.ajax({
								url : "gov.html",
								cache : true,
								type : "GET",
								success : function(data) {
									if (data != "error") {
										$('#gov').text("");
										$('#gov').append(data);
									} else {
										$('#gov').text("服务器忙。。。");
									}
								},
								error : function(data) {
									$('#gov').text("数据加载失败！");
								},
								beforeSend : function() {
									$('#gov').text("数据加载中...");
								},
								complete : function() {

								}
							});
						})
					</script>

					<div id="gov" class="public-right fl f13"></div>
					<div class="cb"></div>
				</div>
			</div>
			<div class="right fl">
				<div class="notice">
					<div class="notice-head">
						<span class="sbg fb f16">公告信息</span> <span class="f14 dib ml165"><a
							href="anounce.html?category=2&pageNum=1">更多>></a></span>
					</div>
					<c:forEach var="entry" items="${anounceList}" varStatus="status">
						<c:set value="23" var="maxLen" />
						<div class="f12">
							<span class="dot dib fl"></span><a
								href="detail.html?id=${entry.id}" class="noticeline fl ml12">
								<c:out
									value="${entry.title.substring(0,maxLen<entry.title.length()?maxLen:entry.title.length())}"
									escapeXml="true" />
							</a>
						</div>
						<div class="cb"></div>
					</c:forEach>
				</div>
				<div class="road">
					<table>
						<tr>
							<td class="vbar fb h78 ">实时路况</td>
							<td class="shell">
								<div id="div1" style="height: 80px; overflow: hidden;">
									<c:forEach var="entry" items="${instantList}"
										varStatus="status">
										<c:set value="23" var="maxLen" />
										<span class="db f12 lh28"><span class="tdot dib fl"></span><a
											href="detail.html?id=${entry.id}" class="noticeline fl ml10">
												<c:out
													value="${entry.title.substring(0,maxLen<entry.title.length()?maxLen:entry.title.length())}"
													escapeXml="true" />
										</a> </span>
										<div class="cb"></div>
									</c:forEach>
								</div>
							</td>
						</tr>
					</table>
					<script>
						var c, _ = Function;
						with (o = document.getElementById("div1")) {
							innerHTML += innerHTML;
							onmouseover = _("c=1");
							onmouseout = _("c=0");
						}
						(F = _("if(#%28||!c)#++,#%=o.scrollHeight>>1;setTimeout(F,#%28?10:1500);"
								.replace(/#/g, "o.scrollTop")))();
					</script>
				</div>
				<div class="management">
					<div class="management-head">
						<span class="fb pl8">行业管理</span> <span class="f14 dib ml165"><a
							href="management.html?category=44&pageNum=1">更多>></a></span>
					</div>
					<table class="mt10">
						<tr>
							<td><a href="management.html?category=44&pageNum=1"
								class="so"><span class="db pt12">路政<br />管理
								</span></a></td>
							<td><a href="management.html?category=3&pageNum=1"
								class="ds"><span class="db pt12">路网<br />调度
								</span></a></td>
							<td><a href="management.html?category=4&pageNum=1"
								class="so"><span class="db pt12">运政<br />信息
								</span></a></td>
							<td><a href="management.html?category=5&pageNum=1"
								class="ds"><span class="db pt12">运政<br />公告
								</span></a></td>
						</tr>
						<tr>
							<td><a href="management.html?category=6&pageNum=1"
								class="ds"><span class="db pt12">港政<br />管理
								</span></a></td>
							<td><a href="management.html?category=7&pageNum=1"
								class="so"><span class="db pt12">航政<br />管理
								</span></a></td>
							<td><a href="management.html?category=8&pageNum=1"
								class="ds"><span class="db pt12">航道<br />通告
								</span></a></td>
							<td><a href="management.html?category=9&pageNum=1"
								class="so"><span class="db pt12">海事<br />管理
								</span></a></td>
						</tr>
						<tr>
							<td><a href="management.html?category=10&pageNum=1"
								class="so"><span class="db pt12">客管<br />信息
								</span></a></td>
							<td><a href="management.html?category=11&pageNum=1"
								class="ds"><span class="db pt12">公交<br />动态
								</span></a></td>
							<td><a href="management.html?category=12&pageNum=1"
								class="so"><span class="db pt12">建设<br />管理
								</span></a></td>
							<td><a href="management.html?category=13&pageNum=1"
								class="ds"><span class="db pt12">养护<br />管理
								</span></a></td>
						</tr>
					</table>
				</div>
				<div class="weibo f13">
					<table>
						<tr>
							<td class=""><img src="images/weibologo.png" alt="" /></td>
							<td class="pl8">
								<div class="bracket-one">
									<span class="dib bracket"></span><img src="images/logo2.png"
										class="ml10" alt="" />
								</div> <span class="db lh30">苏州市吴江区交通运输局V</span> <span class="db ">江苏
									吴江</span> <a
								href="http://widget.weibo.com/dialog/follow.php?fuid=3106179435&refer=open.weibo.com&language=zh_cn&type=widget_page&vsrc=app_followbutton&backurl=http%3A%2F%2Fopen.weibo.com%2Fwidget%2Ffollowbutton.php&rnd=1415350240620"
								class="aweibo">+加关注</a>
							</td>
						</tr>
					</table>
					<table class="mt35">
						<tr>
							<td><img src="images/weixin.png" alt="" /></td>
							<td class="pl8">
								<div class="bracket-one">
									<span class="dib bracket"><img src="images/logo3.png"
										alt="" /></span>
								</div> <span class="db lh30">苏州市吴江区交通运输局V</span> <span class="db">江苏
									吴江</span> <span class="db red-big">微信扫一扫</span>
							</td>
						</tr>
					</table>
					<div class="tel mt18 f16">
						<span class="tellogo dib"></span> <span class="">服务热线：</span> <span
							class="ocolor">63022222</span>
					</div>
					<div class="email f16">
						<span class="emaillogo dib"></span> <a href="email.html">局长信箱</a>
					</div>
					<div class="board f16">
						<span class="boardlogo dib"></span> <a href="messageboard.html">留言板</a>
					</div>
				</div>
			</div>
			<div class="cb"></div>
			<div class="content-foot">


				<script>
					function MM_jumpMenu1(theValue) {
						if (theValue != "#") {
							window.open(theValue, 'NewWin');
						}
					}
				</script>

				<div class="fb link">友情链接</div>
				<select style="width: 150px"
					onchange="Javascript:MM_jumpMenu1(this.value)" name=select2>
					<option>政府网站</option>
					<option value="http://www.jiangsu.gov.cn">中国江苏</option>
					<option value="http://www.suzhou.gov.cn">中国苏州</option>
					<option value="http://www.changshu.gov.cn">中国常熟</option>
					<option value="http://www.ks.gov.cn">中国昆山</option>
					<option value="http://www.zgwj.gov.cn">中国吴江</option>
					<option value="http://www.szwz.gov.cn">苏州吴中</option>
				</select> <select style="width: 150px"
					onchange="Javascript:MM_jumpMenu1(this.value)" name=select2>
					<option>交通网</option>

					<option value="http://www.wjyz.gov.cn/">吴江运政网</option>

					<option value="http://www.iicc.ac.cn">中国交通网</option>

					<option value="http://www.jscd.gov.cn">江苏交通网</option>

					<option value="http://www.szjt.gov.cn/">苏州交通纵横</option>

					<option value="http://www.szwzjt.gov.cn/">苏州吴中交通局</option>

					<option value="http://www.ksjt.gov.cn">昆山交通局</option>

					<option value="http://www.zjgjt.gov.cn">张家港交通局</option>

					<option value="http://www.csjt.gov.cn">常熟交通局</option>

					<option value="http://www.tcjt.gov.cn">太仓交通局</option>

					<option value="http://www.wjky.net">吴江客运公司</option>

				</select> <select style="width: 150px"
					onchange="Javascript:MM_jumpMenu1(this.value)" name=select2>
					<option>其他信息网</option>

					<option value="http://www.163.com">网易</option>

					<option value="http://www.sina.com.cn">新浪网</option>

					<option value="http://www.sohu.com">搜狐网</option>

				</select>

			</div>
		</div>

		<%@include file="footer.jsp"%>



	</div>
</body>
</html>