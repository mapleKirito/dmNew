<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html>
<head>     
<title><s:text name="systemName"/></title>
<META HTTP-EQUIV="pragma" CONTENT="no-cache"> 
<META HTTP-EQUIV="Cache-Control" CONTENT="no-cache, must-revalidate"> 
<META HTTP-EQUIV="expires" CONTENT="Wed, 26 Feb 1997 08:21:57 GMT"> 
<link href="css/style-ce.css" rel="stylesheet" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/date/date.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/js/artDialog/artDialog.css">
<script type="text/javascript" src="<%=request.getContextPath()%>/js/artDialog/artDialog.4.1.4.js?skin=default"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/artDialog/iframeTools.4.1.4.js"></script>
<script type="text/javascript">
function closeOpen(){
	$(". aui_state_focus aui_state_lock").remove();
}
function showHistory(id){
	//window.parent.tabClick("menu_name","历史上的今天详细",'9010',"paramMap.historyID="+id);
	window.parent.art.dialog.data('contextPath', '<%=request.getContextPath()%>');
	window.parent.art.dialog.open('decorateForwardAction.action?code=9010&paramMap.historyID='+id,{width:1299,tu_big:0,height:299,title:'历史上的今天详细',lock:'true',background:'#000000',opacity: '0.75'}) ;
}
function gotoday(){
	
        if ($(".history-today").attr("data-count") == undefined) {
            $(".history-today").attr("data-count", $(".history-today .historys li").length);
        }
        if ($(".history-today").attr("data-index") == undefined) {
            $(".history-today").attr("data-index", 1);
        }
	       
	        var historys = $(".history-today .historys ul");
	  
	            if ($(".history-today").attr("data-index") >= $(".history-today").attr("data-count")) {
	            	art.dialog.alert("后面没有了~~");
	                return;
	            }
	            historys.animate({ left: "-=246px" });
	            $(".history-today").attr("data-index", parseInt($(".history-today").attr("data-index")) + 1);
	       
	    
}
function backtoday(){
	   if ($(".history-today").attr("data-count") == undefined) {
           $(".history-today").attr("data-count", $(".history-today .historys li").length);
       }
       if ($(".history-today").attr("data-index") == undefined) {
           $(".history-today").attr("data-index", 1);
       }
	    var historys = $(".history-today .historys ul");
	  
	    if ($(".history-today").attr("data-index") <=1) {
	        art.dialog.alert('前面没有了!!!');
	        return;
	    }
	    historys.animate({ left: "+=246px" });
	    $(".history-today").attr("data-index", parseInt($(".history-today").attr("data-index")) - 1);
}
function today(){
	var day = new Date(); 
	var Year = 0; 
	var Month = 0; 
	var Day = 0; 
	//初始化时间 
	//Year= day.getYear();//有火狐下2008年显示108的bug 
	Year= day.getFullYear().toString();//ie火狐下都可以
	Month= day.getMonth()+1; 
	Day = day.getDate(); 
	if(Month.toString().length){
		if(Month.toString().length==1){
			Month = "-0"+Month;
		}else{
			Month = "-"+Month;
		}
		
	}
	if(Day.toString().length){
		if(Day.toString().length==1){
			Day = "-0"+Day;
		}else{
			Day = "-"+Day;
		}
		
	}
	window.parent.tabClick('9011','历史上的今天','9011','paramMap.historyNum='+Month+Day+'&paramMap.findMonth='+Month+'&paramMap.findDay='+Day);
}
</script>

</head>
<body >
<div id="layout_mainbody" >
     <!-- 历史卷轴 -->
    <div id="page_taday" class="page-container" >
			<div class="auto-tab"  >
				<a href="javascript:void(0)" class="auto-tab-prev"></a> <a href="javascript:void(0)"
					class="auto-tab-next"></a>
				<div class="auto-tab-title">
					<ul style="width: 250%">
					<s:iterator value="initMap.newsnews" id="fv" status="fvindx">
					<li><span style="  position: relative;  top: -5px;font-size:16px;">
				 ${fv.newsTitle}
					 
					</span></li>
					</s:iterator>
					</ul>
				</div>
				<div class="auto-tab-content">
				<s:iterator value="initMap.newsnews" id="fv" status="fvindx">
			        <div class="tabContent"  onclick="showInfo(${fv.newsID})" style="<s:property value="%{#fvindx.count==1?'':'display: none'}"/>;cursor:pointer" >
						<b class="t">${fv.newsTitle}</b>
						<%-- ${fv.newsInfo} --%>
						<s:if test="#fv.newsInfo.length() >100">
							<s:property value="#fv.newsInfo.substring(0,100)" /> ...
						</s:if>
						<s:else>
								 <s:property value="#fv.newsInfo" />
						</s:else>
					</div>
					</s:iterator>
				</div>
			</div>
			<div id="metrogrid" class="metro-grid" >
				<img src="images-ce/fenlei.png" usemap="#fenlei"  height="500px;" style="margin-top: 20px;  display: block;"/>
				<map  name="fenlei" id="fenlei">
					<area  shape="rect"
					coords="10,0,142,240" 
					alt="艺术史"
				    href ="javascript:res_funtion('observation_1');" />
				    <area  shape="rect"
					coords="152,0,428,117" 
					alt="历史人物"
				    href ="javascript:res_funtion('observation_2');" />
				    <area  shape="rect"
					coords="440,0,527,117" 
					alt="政治制度史"
				    href ="javascript:res_funtion('observation_3');" />
				    <area  shape="rect"
					coords="585,0,726,117" 
					alt="思想史"
				    href ="javascript:res_funtion('observation_4');" />
				    <area  shape="rect"
					coords="158,128,293,240" 
					alt="经济制度史"
				    href ="javascript:res_funtion('observation_5');" />
				    <area  shape="rect"
					coords="303,134,591,243" 
					alt="近代影像资料"
				    href ="javascript:res_funtion('projection_1');" />
				    <area  shape="rect"
					coords="592,128,724,366" 
					alt="纪录片"
				    href ="javascript:res_funtion('projection_2');" />
				    <area  shape="rect"
					coords="6,253,145,362" 
					alt="科学还原"
				    href ="javascript:res_funtion('projection_3');" />
				     <area  shape="rect"
					coords="155,253,290,362" 
					alt="历史剧"
				    href ="javascript:res_funtion('projection_4');" />
				     <area  shape="rect"
					coords="301,250,433,363" 
					alt="探究热身"
				    href ="javascript:res_funtion('expand_1');" /> 
				    <area  shape="rect"
					coords="458,253,593,374" 
					alt="探究广场"
				    href ="javascript:res_funtion('expand_2');" />
				     <area  shape="rect"
					coords="9,373,141,485" 
					alt="探究成果"
				    href ="javascript:res_funtion('expand_3');" />
				     <area  shape="rect"
					coords="158,373,291,485" 
					alt="教学参考"
				    href ="javascript:res_funtion('laboratory_1');" />
				     <area  shape="rect"
					coords="300,373,435,485" 
					alt="公开课"
				    href ="javascript:res_funtion('laboratory_2');" />
				     <area  shape="rect"
					coords="448,373,722,485" 
					alt="校园追风"
				    href ="javascript:res_funtion('lovecountry_2');" />
				</map>
			
			</div>

			<div class="gridright">
				<div   class="history-today" style="height: 240px;">
					<img src="images-ce/today.png" usemap="#today" >
					<map  name="today" id="today">
						<area  shape="rect"
						coords="45,115,60,140" 
						alt="前进"
					    href ="javascript:backtoday();" />
					    <area  shape="rect"
						coords="312,105,337,147" 
						alt="后退"
					    href ="javascript:gotoday();" />
					     <area  shape="rect"
						coords="258,17,292,38" 
						alt="更多"
					    href ="javascript:today();" />
					</map>
					<div class="historys">
						 <ul>	
							 <!-- 放到initMap中取值 -->
							 <s:iterator value="initMap.historyList" id="h" status="fv">
							 	<li onclick="showHistory(${h.historyID })">
								<a class="history" href="#">
									<span>
									<s:if 
									 	test="#h.historyTitle.length() > 9">
										<s:property value="#h.historyTitle.substring(0,9)" />
										...
									</s:if> <s:else><s:property value="#h.historyTitle" /></s:else></span>
									
									  <br>
						
									<p> <s:if 
									 	test="#h.historyInfo.length() > 30">
										<s:property value="#h.historyInfo.substring(0,30)" />
										...
										</s:if> <s:else><s:property value="#h.historyInfo" />
										</s:else>
								  </p>
								</a>
							</li>
							 </s:iterator>
							 </ul>
					</div>
				</div>
				
				<div id="calendar">
					<div id="calendar_center">
					 <div id="CalendarMain">
							
							<DIV id="title">
								<A class="selectBtn month" onclick="CalendarHandler.CalculateLastMonthDays();" 	href="javascript:void(0)"></A>
								<A class="selectBtn selectYear"	href="javascript:void(0);" style="color: white;"></A>
								<A class="selectBtn selectMonth" onclick="CalendarHandler.CreateSelectMonth()"></A> 
								<A class="selectBtn nextMonth" onclick="CalendarHandler.CalculateNextMonthDays();"	href="javascript:void(0)"></A>
								<A class="selectBtn currentDay"  href="javascript:void(0)">今天</A>
							</DIV>
							<DIV id="context">
								<DIV class="week">
									<H3 style="float: left;	font-family: 'Microsoft Yahei Font';	text-align: center;	margin: 0;	padding: 0;	margin-top: 5px;font-size: 20px;"> 一 </H3>
									<H3 style="float: left;	font-family: 'Microsoft Yahei Font';	text-align: center;	margin: 0;	padding: 0;	margin-top: 5px;font-size: 20px;"> 二 </H3>
									<H3 style="float: left;	font-family: 'Microsoft Yahei Font';	text-align: center;	margin: 0;	padding: 0;	margin-top: 5px;font-size: 20px;"> 三 </H3>
									<H3 style="float: left;	font-family: 'Microsoft Yahei Font';	text-align: center;	margin: 0;	padding: 0;	margin-top: 5px;font-size: 20px;"> 四 </H3>
									<H3 style="float: left;	font-family: 'Microsoft Yahei Font';   text-align: center;	margin: 0;	padding: 0;	margin-top: 5px;font-size: 20px;"> 五 </H3>
									<H3 style="float: left;	font-family: 'Microsoft Yahei Font';	text-align: center;	margin: 0;	padding: 0;	margin-top: 5px;font-size: 20px;"> 六 </H3>
									<H3 style="float: left;	font-family: 'Microsoft Yahei Font';	text-align: center;	margin: 0;	padding: 0;	margin-top: 5px;font-size: 20px;"> 日 </H3>
								</DIV>
								<DIV id="center" style="width: 300px;overflow: hidden;">
									<DIV id="centerMain" style="width: 900px; margin-left: -300px;">
										<DIV id="selectYearDiv" style="float: left;"></DIV>
											<DIV id="centerCalendarMain" style="float: left;">
										<DIV id="Container" style="overflow: hidden;float: left;"></DIV></DIV>
									<DIV id="selectMonthDiv" style="float: left;"></DIV></DIV>
								</DIV>	
						
							</div>
						</div>
					 </div>
				</div> 
		</div>
	</div>
</div>
<script src="js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/date/date.js"></script>
<script src="js/tweenmax.min.js"></script>
<script src="<%=request.getContextPath()%>/js/scripts.js"></script>
<script src="js/jQuery.welcome.js"></script>
</body>
</html>