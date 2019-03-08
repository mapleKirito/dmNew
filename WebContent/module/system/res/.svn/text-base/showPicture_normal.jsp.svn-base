<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title></title>
<link rel="stylesheet" type="text/css"	href="<%=request.getContextPath()%>/css/album.css?v=1409654123"	media="all" />
<!--[if IE]>
<style type="text/css">﻿
.valin{ display:block;}
.valin i {
    display:inline-block;
    height:100%;
    vertical-align:middle
}
.valin img {
    vertical-align:middle
}
</style>
<![endif]-->
<style type="text/css">
 #txtDes{
 	position: absolute;
 	width: 98%;
 	min-height: 75px;
 	max-height: none;
 	text-align: left;
 }
 
 #txtDes span{
 	line-height: 40px;
 }


</style>
</head>
<body>
	<div class="album-box" id="album">
		<a href="javascript:;" style="position: absolute;top: 0px;height: 55px;z-index: 120;right: 60px;background-image:url('images/show_big.png') ;width: 80px;" target="_blank" id="view" title="查看原图" ></a>
		<a href="javascript:;"title="退出查看图片" class="slide-close"></a>
		</div>
		<div class="pre-btn" id="preBtn" title="上一张 ">
			<i  style="visibility:visible;"></i>
		</div>
		<div class="next-btn" id="nextBtn" title="下一张 ">
			<i style="visibility:visible;"></i>
		</div>
		<!-- <div id="tool">
			<a href="javascript:;" id="fd" title="放大"></a>
			<a href="javascript:;" id="sx" title="缩小"></a> 
			<a href="images/loading.gif" target="_blank" id="view" title="查看原图"></a>
		</div> -->
		<div class="album-con" style="z-index: 200">
			<div class="valin" style="padding-left: auto;padding-right: auto;">
				<img src="images/loading.gif" id="realImg" />
				<p class="pic-alt" id="txtDes" style="color: white;"></p>
			</div>
			<div id="imgLoading"></div>
			 
		</div>
		<div class="thum-box" id="thumBox" style="z-index: 200">
		  
			<div class="thum-wrap" id="thumWrap">
				<ul class="imglist fix" id="photoList">
				</ul>
			</div>
			<i class="thum-pre-btn" id="thumPreBtn" title="上一页"></i><i
				class="thum-next-btn" id="thumNextBtn" title="下一页"></i>
		</div>
	<textarea class="dn" id="albumDataList">
				<li>
		            <img src="${paramMap.src}"
					data-title="${paramMap.name}" data-remarks="${paramMap.Remarks}" width="99" height="75" />
		            <i class="dn" upload="${paramMap.upload}">${paramMap.src}</i>
		            <i class="dn imgAlt"></i>
		        </li>
   		<s:iterator value="initMap.resView" id="fv" status="fvindx">
			<s:if test="#fv.thumbnail!=null">										
    			<li>
		            <img src="${fv.thumbnail}"
					data-title="${fv.name}" data-remarks="${fv.Remarks}" width="99" height="75" />
		            <i class="dn" upload="${fv.upload}">${fv.inThum}</i>
		            <i class="dn imgAlt"></i>
		        </li>
     		</s:if>
		</s:iterator>
        
       
    </textarea>
    <input type="hidden" id="heightVal" />
	<script src="<%=request.getContextPath()%>/js/jquery-1.7.2.min.js"></script>
	<script type="text/javascript"	src="<%=request.getContextPath()%>/js/jquery.album.js?v=1409654123"></script>
	<script type="text/javascript">

	$(document).ready(function(){	
		var fullHeight = $(window).height();
	    var crumH = $('.crumbs').outerHeight(true);
	    var bottH = $('#thumBox').outerHeight(true);
		var txtDesTop=(fullHeight - crumH - bottH-10-75);
		$("#txtDes").css("top",txtDesTop);
		$("#thumWrap").css("top",($("#thumBox").height()-$("#thumWrap").height())/2);
		$("#thumPreBtn").css("top",($("#thumBox").height()-$("#thumPreBtn").height())/2);
		$("#thumNextBtn").css("top",($("#thumBox").height()-$("#thumNextBtn").height())/2);
		
		
		
		$('#txtDes').hover(function(){
	        $("#txtDes").stop().animate({
	            top:(txtDesTop-$("#heightVal").val()+75)
	        });
	    },function(){
	        $("#txtDes").stop().animate({
	            top:txtDesTop
	        });
	    });
		
		
		$(".slide-close").click(function() {
			window.close();
		});
	});
	
	
	</script>
</body>
</html>