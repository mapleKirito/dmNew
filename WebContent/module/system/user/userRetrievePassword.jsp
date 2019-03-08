<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	String basePath = "http://" + request.getLocalAddr() + ":"
			+ request.getLocalPort() + request.getContextPath();
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<title></title>
<head>
<link href="<%=request.getContextPath()%>/css/style-ce.css" rel="stylesheet" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/validator.css">
<script language="javascript" src="<%=request.getContextPath()%>/js/jquery-1.7.2.min.js"></script>
<script language="javascript" src="<%=request.getContextPath()%>/js/formValidator.js" type="text/javascript"></script>
<script language="javascript" src="<%=request.getContextPath()%>/js/formValidatorRegex.js" type="text/javascript"></script>
<script>
$(document).ready(function(){
	$(".reg-form").css({
		"margin-top":($(window).height()-500)/2
	});
	
	$.formValidator.initConfig({formid:"actionForm",onerror:function(){alert("校验没有通过，具体错误请看错误提示")}}); 
	$("#newPassword").formValidator({onshow:"请输入新密码",onfocus:"新密码由6-15位的字母或数字组成",oncorrect:"新密码合法"}).inputValidator({min:6,max:15,empty:{leftempty:false,rightempty:false,emptyerror:"新密码两边不能有空符号"},onerror:"新密码的长度不正确"}).regexValidator({regexp:"password",datatype:"enum",onerror:"新密码格式不正确"});
	$("#confirmPassword").formValidator({onshow:"请输入重复密码",onfocus:"两次密码必须一致",oncorrect:"密码一致"}).inputValidator({min:6,max:15,empty:{leftempty:false,rightempty:false,emptyerror:"重复密码两边不能有空符号"},onerror:"重复密码的长度不正确"}).compareValidator({desid:"newPassword",operateor:"=",onerror:"两次密码不一致,请确认"});
});
</script>
<style type="text/css">
body{
background: url(<%=request.getContextPath()%>/images-ce/loginbg.jpg) center no-repeat;
	background-size: cover;
	-ms-behavior: url(<%=request.getContextPath()%>/css/backgroundsize.min.htc);
	behavior: url(<%=request.getContextPath()%>/css/backgroundsize.min.htc);
}
.reg-form{
    background: url(<%=request.getContextPath()%>/images-ce/find.png) center no-repeat;
	background-size: cover;
	-ms-behavior: url(<%=request.getContextPath()%>/css/backgroundsize.min.htc);
	behavior: url(<%=request.getContextPath()%>/css/backgroundsize.min.htc);
}
</style>
</head>
<body class="page-login" style=" position:relative; background:url(<%=request.getContextPath()%>/images-ce/loginbg.jpg) center bottom no-repeat; background-size:100% 100%; ">
<div id="layout_mainbody" >
    <div class="reg-form"  style=" position:relative; background:url(<%=request.getContextPath()%>/images-ce/find.png) center bottom no-repeat; background-size:100% 100%;">
        <div class="reg-form-inner">
            <form name="actionForm" method="post" action="retrievePasswordAction.action" id="actionForm" onsubmit="return Validator.Validate(this,3);" style="float: left;  margin-top: 220px;  margin-left: 150px;">
            	<input type="hidden" name="code" value="-1503"> 
            	<input type="hidden" name="paramMap.userAccount" value="${paramMap.userAccount}">
                <div class="reg-input">
                    <label for="field-name">新&nbsp;&nbsp;密&nbsp;&nbsp;码</label>
                    <input name="paramMap.newPassword" type="password" id="newPassword" placeholder="输入新密码" />
                    <em>*</em><span id="newPasswordTip" style="position:absolute;height:22px;width:250px"></span>
                </div>
                <div class="reg-input">
                    <label for="field-account">确认密码</label>
                    <input name="paramMap.confirmPassword" type="password" id="confirmPassword" value="${initMap.userInfo.userAnswer}" placeholder="确认密码" />
                    <em>*</em><span id="confirmPasswordTip" style="position:absolute;height:22px;width:250px"></span>
                </div>         
                <div class="reg-input">
                    <label for="field-description">&nbsp;</label>
                    <input class="reg-button" type="submit" name="submit" value="保存" />
                </div>
            </form>
        </div>
    </div>
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/scripts.js"></script>
</div>
</body>
</html>