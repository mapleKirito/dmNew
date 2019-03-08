<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"  "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<META http-equiv=Content-Type content="text/x-component; charset=UTF-8">

<!-- 通知360浏览器强制使用极速模式 -->
<meta name="renderer" content="webkit">

<title><s:text name="systemName" />
</title> 
<script language="javascript" src="<%=request.getContextPath()%>/js/jquery-1.6.2.js" type="text/javascript"></script>
<link href="<%=request.getContextPath()%>/css/style-ce.css" rel="stylesheet" />
<script language="JavaScript">

document.onkeydown=function(event){
    var e = event || window.event || arguments.callee.caller.arguments[0];
     if(e && e.keyCode==13){ // enter 键
    	 loginniu();
    }
}; 

jQuery(document).ready(function(){
	
	$(".usercenter").css({
		"margin-top":($(window).height()-431)/2
	});
	
	var browser = navigator.userAgent.toLowerCase();  
    if(browser.match(/MSIE/i)=="MSIE" || browser.match(/msie/i)=="msie") {
    	if(IEversion()<= 8){
			
    		$(".userinfo").css({
    				"padding-left":"20px",
    				"width":"250px",
    				"line-height":"35px",
    				"text-indent":"0px"
    			});
    	}
    }
    
    var imgLength = $(".infoimg").length;
	var index_ = 1;
    var swipeFunc = function () {
    	
    	if(index_ >=3){
    		index_ = 0;
    	}
    	$(".infoimg").hide().eq(index_).fadeIn(1000);
    	index_++;	  
    	 setTimeout(swipeFunc, 3000);
    }
    
    setTimeout(swipeFunc, 2000);
    
  
});

function IEversion(){
	var browser=navigator.appName; 
	var b_version=navigator.appVersion;
	
	var version=b_version.split(";"); 
	var trim_Version=version[1].replace(/[ ]/g,""); 
	if(browser=="Microsoft Internet Explorer" && trim_Version=="MSIE6.0") 
	{ 
		return "6.0";
	} 
	else if(browser=="Microsoft Internet Explorer" && trim_Version=="MSIE7.0") 
	{ 
		return "7.0";
	} 
	else if(browser=="Microsoft Internet Explorer" && trim_Version=="MSIE8.0") 
	{ 
		return "8.0";
	} 
	else if(browser=="Microsoft Internet Explorer" && trim_Version=="MSIE9.0") 
	{ 
		return "9.0";
	} 
}
function loginniu(){
	//alert(123);
	if(document.getElementById("account").value==""||document.getElementById("password").value==""){
		$("#msg").html("用户名或密码不能为空");
		return false;
	}
	var heiht_img = $(window).height()-198;
	var currentTime= new Date().getTime();
	$.ajax({
		url:		'ajaxAction.action?code=-100&paramMap.account='+ document.getElementById("account").value +'&paramMap.password='+ document.getElementById("password").value +'&paramMap.heiht_img='+heiht_img+'&paramMap.logColumn=s_userLoginAccount,currentDate&suiji='+currentTime,
		type:	    'post',
		timeout:	'60000',
		data:	Array(),
		dataType:	'json',
		beforeSend:function(request){},
		complete:function(request,textStatus){},
		success:function(jsonData,textStatus){
			if (textStatus == "success"){
				if(!jsonData.is2){
					if(!jsonData.is3){
						if(jsonData.is4){
							$("#msg").html("用户名不存在");
						}else{
							if(!jsonData.is1){

								 var url=window.location.href;
							 	 var startoint = url.indexOf("//");
							 	 var endPoint = url.indexOf("8086");
							 	 var ip= url.substring(startoint, endPoint+4);
							 	
							 	if(jsonData.is5 == 1){
									window.location.href = '<%=request.getContextPath()%>/flash/flash.swf?&suiji='+currentTime;
								}else{
									window.location.href = '<%=request.getContextPath()%>/forwardAction.action?code=-1700&paramMap.flash=0&id=0&suiji='+currentTime;
								} 
								
									
								
								//于齐紫   修改   不需提交

							}else{
								$("#msg").html("用户名或密码错误");
							}
						}
					}else{
						window.location.href = '/dm/overclick.jsp';
					}
				}else{
					window.location.href = '/dm/overtime.jsp';
			}
			}
		},
		error:function(request,textStatus,error){}
	});
}
</script>
<style type="text/css">
body{
height:100%;
	margin: 0;
	background: url(<%=request.getContextPath()%>/images-ce/loginbg.jpg) center no-repeat;
	background-size: cover;
	-ms-behavior: url(<%=request.getContextPath()%>/css/backgroundsize.min.htc);
	behavior: url(<%=request.getContextPath()%>/css/backgroundsize.min.htc);
}
</style>
</head>
<body class="page-login rounded" >
<div class="usercenter" style="height: 431px;width: 1000px;margin: auto;">

	<img class="infoimg"  style="height: 431px;width: 605px;float: left;background: url(images-ce/left.jpg) center no-repeat;border: none;"></img>
	<img class="infoimg"  style="height: 431px;width: 605px;float: left;background: url(images-ce/left2.png) center no-repeat;border: none;display: none;"></img>
	<img class="infoimg" style="height: 431px;width: 605px;float: left;background: url(images-ce/left3.png) center no-repeat;border: none;display: none;"></img>
	<div >
	
		<img src="images-ce/right.jpg" usemap="#planetmap" style="height: 431px;width: 345px;float: right ;background: url(images-ce/right.jpg) center  no-repeat;border: none;"></img>
		
		<map  name="planetmap" id="planetmap">
			<area  shape="rect"
			coords="37,352,311,398" 
			alt="login"
		    href ="javascript:loginniu();" />
			
			<area  shape="rect"
			coords="36,300,93,317" 
			alt="wang"
			href="commonForwardAction.action?code=-1501" />
			
			<area shape="rect"
			coords="270,300,312,317" 
			alt="zhu"
			href="commonForwardAction.action?code=-1401" />
			
		</map>
		<input type="text" name="paramMap.account" id="account" style="  text-indent:20px; position: relative;  right: 36px;  top: -240px;  height: 35px; width: 270px;  float: right;background: url(images-ce/user.jpg) repeat;  border: none;" class="userinfo" placeholder="用户名"   />
		<input type="password" name="paramMap.password" id="password" style="text-indent:20px;position: relative;  right: -233px;  top: -182px;  height: 35px; width: 270px;  float: right;background: url(images-ce/user.jpg) repeat;  border: none;" class="userinfo"  placeholder="密码"   />
		<p id="msg" style="  color: red;  position: relative;  left: 430px;height: 35px;width:140px; float: right;top: -112px;"></p>
	</div>
</div>
<input type="hidden" name="code" value="-100" >
</body>
</html>