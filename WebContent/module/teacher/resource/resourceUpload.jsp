<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<% String basePath = "http://" + request.getLocalAddr() + ":" + request.getLocalPort() + request.getContextPath(); %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<title></title>
<head>
    <link href="qc/css/style.css" rel="stylesheet" />
    <link href="qc/css/gallery.css" rel="stylesheet" />
<script type="text/javascript">
$(function(){
	
	$(".tabcontrol .tabtitle a").click(function(){


		$(this).addClass("on").siblings().removeClass("on");
		$("#resourceUploadFrameWelcome").attr("src","decorateForwardAction.action?code=" + $(this).attr("id")+"&paramMap.userID=${session.s_userID}");
	});
	
});
</script>
<style type="text/css">
.tabcontentT{padding: 20px;background: #F8F4ED;}
.tabcontrol {
width: 705px;}
.tabcontrol div.tabtitle-bg {width: 705px;}
.tabcontrol p.tabtitle a.tab.on  { margin-top:0px; border-top:2px solid #D7B593;  background: #F8F4ED url(<%=request.getContextPath()%>/images-ce/xiaozutop.png) no-repeat;}
.tabler1td tr td,.tabler2td tr td,.tabler3td tr td,.tabler3td tr td,.tabler4td tr td,.tabler5td tr td{color: #333333;font-family: "微软雅黑";font-size: 16px;}
select{width: 150px;
height: 35px;
background: white;
font-size: 14px;
font-family: 微软雅黑;
padding-left: 5px;
border: 1px solid #957D70;
color: grey;}
#search_favorite {width: 30px;
height: 30px;
line-height: 27px;
background: #957F75;
margin-left: -8px;}
#rfName{width: 120px;
height: 26px;
border: 1px solid #957D70;
padding-left: 5px; }

.tabtile{
	background: url(<%=request.getContextPath()%>/images-ce/topmenu.png) center no-repeat;
	background-size: cover;
	-ms-behavior: url(<%=request.getContextPath()%>/css/backgroundsize.min.htc);
	behavior: url(<%=request.getContextPath()%>/css/backgroundsize.min.htc);
}

</style>
</head>
<body>
<input type="hidden" id="s_userType" value="${session.s_userType}">
<div class="ssjh-index-row3 tabcontrol">
     <div class="tabtitle-bg"></div>
          <p class="tabtitle" style=" position:relative; background:url(images-ce/topmenu.png) center bottom no-repeat; background-size:100% 100%;">
	         <a href="javascript:void(0);" id="${pmsIndex.my_favorite_mgr.code}" class="ltselect tab on">${pmsIndex.my_favorite_mgr.name}</a>
	         <s:if test="session.s_userType == 1 ">
	         <a href="javascript:void(0);" id="${pmsIndex.my_resource_mgr.code}" class="ltselect tab">${pmsIndex.my_resource_mgr.name}</a>
	         </s:if>
	         <a href="javascript:void(0);" id="${pmsIndex.res_movement.code}" class="ltselect tab">${pmsIndex.res_movement.name}</a>
	     </p>
	  <div class="tabcontents">
	      <div class="tabcontentT">
	   	 	 <iframe id="resourceUploadFrameWelcome" name="resourceUploadFrameWelcome" scrolling="no" marginheight="0" marginwidth="0" frameborder="0" src="decorateForwardAction.action?code=${pmsIndex.my_favorite_mgr.code}" width="100%" height="552px"></iframe>
	  	 </div>
     </div>
 </div> 
 <script src="qc/js/jquery-1.7.2.min.js"></script>
    <script src="qc/js/tweenmax.min.js"></script>
    <script src="qc/js/jquery.bxslider.min.js"></script>
    <script src="qc/js/scripts.js"></script>

</body>
</html>