<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%> 
<%@ taglib uri="http://java.sun.com/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<html>
<title></title>
<head>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/style-ce.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/js/artDialog/artDialog.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/date/todayDate.css">
<script src="js/jquery-1.7.2.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	$("body",parent.document).find('.menuTabTextNavigation').html('历史上的今天>'+$("#findYear").val()+$("#findMonth").val()+$("#findDay").val());
	$('#table2page').pageTB();
	/*  $(".history-today .btnHistory").click(function () {
	        if ($(".history-today").attr("data-count") == undefined) {
	            $(".history-today").attr("data-count", $(".history-today .historys li").length);
	        }
	        if ($(".history-today").attr("data-index") == undefined) {
	            $(".history-today").attr("data-index", 1);
	        }
	        var type = $(this).attr("data-type");
	        var historys = $(".history-today .historys ul");
	        if (type == "pre") {
	            if ($(".history-today").attr("data-index") >= $(".history-today").attr("data-count")) {
	            	art.dialog.alert("后面没有了~~");
	                return;
	            }
	            historys.animate({ left: "-=145px" });
	            $(".history-today").attr("data-index", parseInt($(".history-today").attr("data-index")) + 1);
	        } else if (type == "next") {
	            if ($(".history-today").attr("data-index") <=1) {
	                art.dialog.alert('前面没有了!!!');
	                return;
	            }
	            historys.animate({ left: "+=145px" });
	            $(".history-today").attr("data-index", parseInt($(".history-today").attr("data-index")) - 1);
	        }
	    }); */
});

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
<style type="text/css">
ul li{ list-style-type:none; white-space:nowrap; text-overflow:ellipsis; overflow: hidden; }
.tabcontent, ul li{width:660px; }
.pageb{margin: 0 auto; float: right;}
.my-answer-list li{ background-color: #F8F4ED;

border-bottom: 1px solid #F1EADE;}
.tabcontent{float: left;border: 1px solid #CFBDA7;background: #F8F4ED}

#CalendarMain { border: 0px solid #ccc; 
width: 380px; height: 380px; position: relative;
 z-index: 9999; right: 0px; }
#title { width: 300px;  line-height: 75px; font-size: 18px; font-weight: bold; position: relative;  color: white; }
.gridright { float: right; width: 380px; display: inline; margin-top: 15px; }
a.currentitem:visited { color: #88361f; text-decoration: none; }
a.currentitem:link { color: #88361f; text-decoration: none; }
a:visited {  text-decoration: none; }
a:link { text-decoration: none; }
.title a{vertical-align: middle;}
.my-answer-list li a{margin-left: 20px;color: #333333;}
.my-answer-list li em{margin-right: 20px;color: #333333;}
#calendar_center {
width: 370px;
height: 315px;
background: url(<%=request.getContextPath()%>/images-ce/date.jpg) no-repeat;
}
#calendar {
float: left;}

</style>
</head>
<body>
<input type="hidden" id="findYear" value="<%= new java.text.SimpleDateFormat("yyyy").format(new java.util.Date()) %>">
<input type="hidden" id="findMonth" value="${paramMap.findMonth }">
<input type="hidden" id="findDay" value="${paramMap.findDay }">
<div id="layout_mainbody">
	<div class="page-container">	<br><br>
		<div class="tabcontent">
		
            <ul class="my-answer-list">
                 <li style="background: #E8DDD0;color: #482D0D;font-size: 16px;font-weight: bold;">
                 	<a   style="color: #482D0D;font-size: 16px;font-weight: bold;" href="javascript:void(0);">事件</a>
                	 <em  style="color: #482D0D;font-size: 16px;font-weight: bold;">时间</em>
                 </li>
            
            	<s:iterator value="initMap.history" id="history"  status="historyIndex">
               		<li onclick="showHistory(${history.historyID })">
               		<a href="javascript:void(0);">${history.historyTitle}</a>
               		<em>${history.historyNum}</em>
               		</li>
                </s:iterator>
            </ul>
            <div class="pageb" id="table2page">
				${initMap.paginated.pageContent}
			</div>
        </div>
        <!-- 日历选择 -->
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
								<A class="selectBtn month" onclick="CalendarHandler.CalculateLastMonthDays();" 
							href="javascript:void(0)"></A>
								<A class="selectBtn selectYear"
							href="javascript:void(0);" style="color: white;"></A>
								<A class="selectBtn selectMonth" onclick="CalendarHandler.CreateSelectMonth()"></A> 
							<A class="selectBtn nextMonth" onclick="CalendarHandler.CalculateNextMonthDays();" 
							href="javascript:void(0)"></A>
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

<script src="js/date/scripts.js"></script>	
<script type="text/javascript" src="<%=request.getContextPath()%>/js/artDialog/artDialog.4.1.4.js?skin=default"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/artDialog/iframeTools.4.1.4.js"></script> 
<script type="text/javascript" src="<%=request.getContextPath()%>/js/date/todayDate.js"></script>
</body>
</html>