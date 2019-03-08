<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<% String basePath = "http://" + request.getLocalAddr() + ":" + request.getLocalPort() + request.getContextPath(); %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0.1 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<title></title>
<head>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/main.css">
<script type="text/javascript" src="<%=request.getContextPath()%>/ckeditor/ckeditor.js"></script>
<script type="text/javascript">  
$(document).ready(function(){	
	$.formValidator.initConfig({formid:"actionForm",onerror:function(){alert("校验没有通过，具体错误请看错误提示")}}); 
	$("#aTitle").formValidator({onshow:"请输入内容",onfocus:"内容不能为空",oncorrect:"输入正确"}).inputValidator({min:1,onerror:"输入正确"});
	$("#aContent").formValidator({onshow:"请输入内容",onfocus:"内容不能为空",oncorrect:"输入正确"}).inputValidator({min:1,onerror:"输入正确"});
	
});
</script>
<style type="text/css">
.table_6 {	border: 0px solid #ae9b84;}
.table_9 .tatd {	border: 0px solid #ffffff;}
.table_6 td {	padding: 8px;	color: #333333;}
.uploadDiv #enableUp,.uploadDiv #isUploadTip,.onShow,#menuBtn {	color: #777777;}
.table_9 tr td {	border: 0px solid #ffffff;font-size: 16px;font-family: "微软雅黑";}
.SkyButtonBlur { background-image:none;background: #C0964D;height: 35px;width: 60px;;color: white;font-size: 14px;font-family:"微软雅黑";}
.SkyButtonFocus { background-image:none;background: #C0964D;height: 35px;width: 60px;color: white;font-size: 14px;font-family:"微软雅黑";}
.SkyButtonBlur[type=submit]{background: #A83737;}
.SkyButtonBlur[type=buttom]{background: #D1BC98;}
</style>
</head>
<body>
<form name="actionForm" method="post" action="operateAction.action" id="actionForm">
<input type="hidden" name="code" value="${code}"> 
<input type="hidden" id="swID" name="paramMap.aID"  value="${initMap.sw.aID }">
<input type="hidden" id="wu" name="paramMap.userID"  value="${session.s_userID }"> 
<input type="hidden" name="imitateStep" value="myArticle_step_1">
<table width="100%" height="100%" border="0" cellspacing="0" cellpadding="0" >
  <tr>
    <td valign="top">
		<table width="100%" border="0" cellspacing="0" cellpadding="0" >
			<tr>
				<td valign="top">
					<table width="100%" border="0" cellspacing="0" cellpadding="0" class="table_6">
					  <tr>
						<td width="100%" valign="top">
							<div style="border: 1px solid #A98534;">
								<table width="100%" border="0" cellspacing="0" cellpadding="0" class="table_9">
								    <tr bgcolor="#F8F4ED">
										<td width="100%" bgcolor="#E8DDD0" height="30px" style="border-bottom: 1px solid #ae9b84;" align="center" colspan="2" class="tatd">文章修改</td>
										
									  </tr>
									 <tr bgcolor="#F8F4ED">
										<td width="15%" class="tatd" align="right">文章标题：</td>
										<td width="85%" class="tatd" align="left">
											<input name="paramMap.aTitle" type="text" id="aTitle" style="width: 200px;" value="${initMap.sw.aTitle}"/>
											&nbsp;<font color="red">*</font><span id="aTitleTip" style="position:absolute;height:22px;"></span>
										</td>
									  </tr>
									  <tr bgcolor="#F8F4ED">
										<td width="15%" class="tatd" align="right">文章正文：</td>
										<td width="85%" class="tatd" align="left">
											<textarea cols="50" id="aContent" name="paramMap.aContent" rows="10">${initMap.sw.aContent}</textarea>
										    <script type="text/javascript">
										    	CKEDITOR.replace('aContent',{height : 320,filebrowserUploadUrl : 'ckeditor/uploader?Type=File&TypeRoom=userFile&userFileID='+'${paramMap.s_userID}', filebrowserImageUploadUrl : 'ckeditor/uploader?Type=Image&TypeRoom=userFile&userFileID='+'${paramMap.s_userID}', filebrowserFlashUploadUrl : 'ckeditor/uploader?Type=Flash&TypeRoom=userFile&userFileID='+'${paramMap.s_userID}' } );
											</script>									
										</td>
									  </tr>
									<tr bgcolor="#F8F4ED" align="center">
										<td colspan="4"><input type="submit" name="BtnOk" value="修改" id="BtnOk" class="SkyButtonBlur" onMouseOut="this.className='SkyButtonBlur'" onMouseOver="this.className='SkyButtonFocus'" />&nbsp;&nbsp;<input type="button" name="BtnOk" value="返回" id="BtnOk" class="SkyButtonBlur" onMouseOut="this.className='SkyButtonBlur'" onMouseOver="this.className='SkyButtonFocus'" onclick="window.history.back();" /></td>
									</tr>
								</table>
							</div>						
						 </td>
				      </tr>
					</table>
			  	</td>
			</tr>
		</table>
	</td>
  </tr>
</table>
</form>
</body>
</html>