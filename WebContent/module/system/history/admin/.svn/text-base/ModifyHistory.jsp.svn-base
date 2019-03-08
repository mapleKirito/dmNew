<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<% String basePath = "http://" + request.getLocalAddr() + ":" + request.getLocalPort() + request.getContextPath(); %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0.1 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<title></title>
<head>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/main.css">
<script type="text/javascript" src="<%=request.getContextPath()%>/ckeditor/ckeditor.js"></script>
<script language="javascript" type="text/javascript" src="<%=request.getContextPath()%>/js/datePicker/WdatePicker.js"></script>
<script type="text/javascript">  
$(document).ready(function(){	
	//input验证
	$.formValidator.initConfig({formid:"actionForm",onerror:function(){alert('校验没有通过，具体错误请看错误提示')},onsuccess:function(){}});//表单提交 
	$("#historyTitle").formValidator({onshow:"请输入资料标题",onfocus:"请输入资料标题",oncorrect:"输入正确"}).inputValidator({min:1,onerror:"资料标题不能为空,请确认"});
	$("#historyInfo").formValidator({onshow:"请输入资料摘要",onfocus:"请输入资料摘要",oncorrect:"输入正确"}).inputValidator({min:1,onerror:"资料摘要不能为空,请确认"});
	$("#historyNum").formValidator({onshow:"请选择日期",onfocus:"请选择日期",oncorrect:"输入正确"}).inputValidator({min:1,onerror:"日期选择不能为空"});

});
function confirm()
{
	var rcontent = CKEDITOR.instances.historyContent.getData() == '' ? false : true;
	if (!rcontent){
		alert("资料内容不能为空！");
		return false;
	}
	return true;
}
</script>
<style type="text/css">

.table_6 {
	border: 0px solid #ae9b84;
}

.table_9 .tatd {
	border: 0px solid #ffffff;
}

.table_6 td {
	padding: 8px;
	font-size: 16px;
	color: #333333;
}

.uploadDiv #enableUp,.uploadDiv #isUploadTip,.onShow,#menuBtn {
	color: #777777;
}

.table_9 tr td {
	border: 0px solid #ffffff;
}
.SkyButtonBlur { background-image:none;background: #C0964D;height: 35px;width: 60px;;color: white;font-size: 14px;font-family:"微软雅黑";}
.SkyButtonFocus { background-image:none;background: #C0964D;height: 35px;width: 60px;color: white;font-size: 14px;font-family:"微软雅黑";}
.SkyButtonBlur[type=submit]{background: #A83737;}
.SkyButtonBlur[type=buttom]{background: #D1BC98;}

#vback{
	margin: 0;
	background: url(<%=request.getContextPath()%>/images-ce/crud.png) center no-repeat;
	background-size: cover;
	-ms-behavior: url(<%=request.getContextPath()%>/css/backgroundsize.min.htc);
	behavior: url(<%=request.getContextPath()%>/css/backgroundsize.min.htc);
}
</style>
</head>
<body>
<form name="actionForm" method="post" action="operateAction.action" id="actionForm" onsubmit="return confirm();">
<input name="paramMap.historyID" type="hidden" id="historyID" value="${initMap.history.historyID}"/>
<input type="hidden" name="code" value="${code}"> 
<input type="hidden" name="imitateStep" value="${pmsIndex.sys_resource_history.imitationStep}">
<table width="100%" height="100%" border="0" cellspacing="0" cellpadding="0" >
  <tr>
    <td valign="top">
		<table width="100%" border="0" cellspacing="0" cellpadding="0" >
			<tr>
				<td valign="top">
					<table width="100%" border="0" cellspacing="0" cellpadding="0" class="table_6">
					  <tr>
						<td width="100%" id="vback" valign="top"  style=" position:relative; background:url(images-ce/crud.png) center bottom no-repeat; background-size:100% 100%;">
							<div>
								<table width="100%" border="0" cellspacing="0" cellpadding="0" class="table_9">
									
									 <tr  height="30">
										<td width="25%" class="tatd" align="right">&nbsp;</td>
										<td width="75%" class="tatd" align="left">&nbsp;</td>
									</tr>	
									<tr >
										<td width="25%" class="tatd" align="right">资料标题：</td>
										<td width="75%" class="tatd" align="left">
											<input name="paramMap.historyTitle" type="text" id="historyTitle" style="width: 200px;" value="${initMap.history.historyTitle}"/>
											&nbsp;<font color="red">*</font><span id="historyTitleTip" style="position:absolute;height:22px;"></span>
										</td>
									</tr>
									<tr >
										<td width="25%" class="tatd" align="right">资料摘要：</td>
										<td width="75%" class="tatd" align="left">
											<textarea name="paramMap.historyInfo" cols="95" rows="2" id="historyInfo">${initMap.history.historyInfo}</textarea> 
											<br/>&nbsp;<font color="red">*</font><span id="historyInfoTip" style="position:absolute;height:22px;"></span>
										</td>
									</tr>
									<tr >
										<td width="25%" class="tatd" align="right">历史日期：</td>
										<td width="75%" class="tatd" align="left">
										    <input name="paramMap.historyNum" class="Wdate" type="text" value="${initMap.history.historyNum}" onClick="WdatePicker()" id="historyNum"> 
											<br/>&nbsp;<font color="red">*</font><span id="historyNumTip" style="position:absolute;height:22px;"></span>
										</td>
									</tr>
									<tr >
										<td width="25%" class="tatd" align="right">资料内容：</td>
										<td width="75%" class="tatd" align="left">
											<textarea name="paramMap.historyContent" id="historyContent" style="display:none">${initMap.history.historyContent}</textarea>
									   		<script type="text/javascript">
									   		CKEDITOR.replace('historyContent',{width : 700, filebrowserUploadUrl : 'ckeditor/uploader?Type=File&TypeRoom=modifyhistory&historyno='+'${initMap.history.historyNum}', filebrowserImageUploadUrl : 'ckeditor/uploader?Type=Image&TypeRoom=modifyhistory&historyno='+'${initMap.history.historyNum}', filebrowserFlashUploadUrl : 'ckeditor/uploader?Type=Flash&TypeRoom=modifyhistory&historyno='+'${initMap.history.historyNum}'});
											</script>
										</td>
									</tr>
									<tr  align="center">
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