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
<script type="text/javascript">
$(document).ready(function(){
	$(".reg-form").css({
		"margin-top":($(window).height()-500)/2
	});
	
	$.formValidator.initConfig({formid:"actionForm",onerror:function(){alert("校验没有通过，具体错误请看错误提示")}}); 
	$("#userAccount").formValidator({onshow:"请输入您的账号",onfocus:"用户名至少4个字符,最多15个字符",oncorrect:"输入正确"}).inputValidator({min:4,max:15,onerror:"用户账号的长度不正确"}).regexValidator({regexp:"username",datatype:"enum",onerror:"用户账号格式不正确"});
	$("#userDicType").formValidator({onshow:"请选择密码提示问题",onfocus:"密码提示问题为空",oncorrect:"选择正确"}).inputValidator({min:1,onerror:"密码提示问题不能为空"});
	$("#userAnswer").formValidator({onshow:"请输入密码提示答案",onfocus:"密码提示答案不能为空",oncorrect:"输入正确"}).inputValidator({min:1,onerror:"密码提示答案不能为空"});
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
<body class="page-login" style=" position:relative; background:url(<%=request.getContextPath()%>/images-ce/loginbg.jpg) center bottom no-repeat; background-size:100% 100%;">
  
    <div class="reg-form"  style=" position:relative; background:url(<%=request.getContextPath()%>/images-ce/find.png) center bottom no-repeat; background-size:100% 100%;">
        <div class="reg-form-inner">
            <form name="actionForm" method="post" action="retrieveQuestionAction.action" id="actionForm" style="float: left;  margin-top: 220px;  margin-left: 150px;">
            	<input type="hidden" name="code" value="-1502"> 
                <div class="reg-input">
                    <label for="field-name">登录账号</label>
                    <input name="paramMap.userAccount" type="text" id="userAccount" placeholder="登录账号" />
                    <em>*</em><span id="userAccountTip" style="position:absolute;height:22px;width:250px"></span>
                </div>
                <div class="reg-input">
                    <label for="field-class">密码提示问题</label>
                    <select style="width:200;" name="paramMap.userDicType" id="userDicType">
                       <option value="">请选择密码提示问题</option>	
					   <option value="1" >我爸爸的姓名</option>
					   <option value="2" >我妈妈的姓名</option>
					   <option value="3" >我最喜爱的一本书</option>
					   <option value="4" >我最喜欢的运动</option>
					   <option value="5" >我最喜欢的歌曲</option>
					   <option value="6" >我最喜欢的电影</option>
					   <option value="7" >我最喜欢的颜色</option>
					   <option value="8" >我的好朋友是谁</option>
                    </select>
                    <em>*</em><span id="userDicTypeTip" style="position:absolute;height:22px;width:250px"></span>
                </div>
                <div class="reg-input">
                    <label for="field-account">密码提示答案</label>
                    <input name="paramMap.userAnswer" type="text" id="userAnswer" value="${initMap.userInfo.userAnswer}" placeholder="答案" />
                    <em>*</em><span id="userAnswerTip" style="position:absolute;height:22px;width:250px"></span>
                </div>         
                <div class="reg-input">
                    <label for="field-description">&nbsp;</label>
                    <input class="reg-button" type="submit" name="submit" value="下一步" />
                </div>
            </form>
        </div>
    </div>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/scripts.js"></script>  
</body>
</html>