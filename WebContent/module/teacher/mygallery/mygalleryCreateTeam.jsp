<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<% String basePath = "http://" + request.getLocalAddr() + ":" + request.getLocalPort() + request.getContextPath(); %>
<html>
<title></title>
<head>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/main.css">
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/css/progressBar.css">
<script type="text/javascript" src="<%=request.getContextPath()%>/qc/js/progressBar.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/ckeditor/ckeditor.js"></script>
<link href="qc/css/style.css" rel="stylesheet">


<style type="text/css">
body, ul, li{ margin:0; padding:0; font-size:12px;} 
ul, li{list-style-type:none;}
.table_6 {	border: 0px solid #F8F4ED;}
.table_9 .tatd {	border: 0px solid #ffffff;font-family: "微软雅黑";font-size: 16px;}
.table_6 td {	padding: 8px;	color: #333333;}
.uploadDiv #enableUp,.uploadDiv #isUploadTip,.onShow,#menuBtn {	color: #777777;}
.table_9 tr td {	border: 0px solid #ffffff;}
.SkyButtonBlur { background-image:none;background: #C0964D;height: 35px;width: 60px;;color: white;font-size: 14px;font-family:"微软雅黑";}
.SkyButtonFocus { background-image:none;background: #C0964D;height: 35px;width: 60px;color: white;font-size: 14px;font-family:"微软雅黑";}
.SkyButtonBlur[type=submit]{background: #A83737;}
.SkyButtonBlur[type=buttom]{background: #D1BC98;}
</style>
<script type="text/javascript"> 
$(document).ready(function(){	 
	 
	//input验证
	$.formValidator.initConfig({formid:"actionForm",onerror:function(){alert('校验没有通过，具体错误请看错误提示');},onsuccess:function(){}});//表单提交 

	var userType = "${s_userType}" ;//用户类型 管理员录入数据： 0 ，老师录入数据： 1
	var expentNum = "0000" ;	//未来扩展值
	var resBeginType = "ga" ;
	var userID = "${session.s_userID}" ;
	
	//上传资源文件
	$("#uploadBigFile").change(function(){
		$("#uploadBigFile").select();
		var realFile = $("#uploadBigFile").val() ;
		var date = new Date() ;
		var path = "upload/Gallery/" + userID + "/" + expentNum + "/" ;
		var fileType = realFile.substring(realFile.lastIndexOf(".") + 1 ,realFile.length) ;
		
		if(fileType.toLowerCase().indexOf("jpg".toLowerCase()) > -1 || fileType.toLowerCase().indexOf("png".toLowerCase()) > -1 || fileType.toLowerCase().indexOf("gif".toLowerCase()) > -1){
			$(".subButton").show();	
		}else{
			alert("您上传的资源格式不正确,请确认");
			$(".subButton").hide();		
		}
		var fileName = date.getTime() + "." + fileType ; 
		$("#uploadFileName").val(fileName) ;
		$("#uploadFilePath").val(path) ;		
		$("#gaSrc").val(path + fileName);
	}) ;
 	
	$(".uploadDiv").css("left",$("#uploadShowDiv").offset().left + 8);
    $(".uploadDiv").css("top",$("#uploadShowDiv").offset().top + 7);  
	
});

$("#actionForm").onSubmit(function(){
	
})
</script>
</head>
<body>
<div class="page-container ssjh">
<form name="actionForm" method="post" id="actionForm" enctype="multipart/form-data"  action="uploadDataAction.action">
<input type="hidden" name="code" value="${code}"> 
<input type="hidden" name="imitateStep" value="${pmsIndex.team_images_mgr.imitationStep}">
<input type="hidden" name="paramMap.gaUserID" value="${session.s_userID }"> 
<input type="hidden" name="paramMap.teamID" value="${paramMap.tID }"> 
<table width="100%" height="100%" border="0" cellspacing="0" cellpadding="0" >
  <tr>
    <td valign="top" >
		<table width="100%" border="0" cellspacing="0" cellpadding="0" >
			<tr>
				<td valign="top">
					<table width="100%" border="0" cellspacing="0" cellpadding="0" class="table_6">
					  <tr>
						<td width="100%"  valign="top">
							<div style="border: 1px solid #A98534;">
								<table width="100%" border="0" cellspacing="0" cellpadding="0" class="table_9">
										<tr bgcolor="#F8F4ED" >
											<td width="100%" bgcolor="#E8DDD0" height="30px" style="border-bottom: 1px solid #F8F4ED;" align="center" colspan="2" class="tatd">创建相册</td>
										</tr>
										<tr bgcolor="#F8F4ED" >
										<td width="15%" class="tatd" align="right">资源文件：</td>
										<td width="85%" class="tatd" align="left" id="uploadShowDiv">
										<input type="hidden" name="paramMap.gaSrc" id="gaSrc" value="" >
										<input type="hidden" name="paramMap.isUpload" id="isUpload">
										</td>
									</tr>
									<tr bgcolor="#F8F4ED">
										<td width="15%" class="tatd" align="right" id="exhibition_17">是否共享：</td>
										<td width="85%" class="tatd" align="left">
										<input type="checkbox" name="paramMap.gaShare" value="1" checked="checked" class="gaShare">
										</td>
									</tr>
								   <tr bgcolor="#F8F4ED">
										<td width="15%" class="tatd" align="right" id="exhibition_17">详细说明：</td>
										<td width="85%" class="tatd" align="left">
											<textarea cols="80" id="gaDescription" name="paramMap.gaDescription" rows="10"></textarea>&nbsp;
										<span id="gaDescriptionTip" style="position:absolute;height:22px;width:297px"></span></td>
									</tr>
									<tr bgcolor="#F8F4ED" align="center">
										<td colspan="4"><input type="button" name="BtnOk" value="创建" id="BtnOk" class="SkyButtonBlur" onMouseOut="this.className='SkyButtonBlur'" onMouseOver="this.className='SkyButtonFocus'" />&nbsp;&nbsp;<input type="button" name="BtnOk" value="返回" id="BtnOk" class="SkyButtonBlur" onMouseOut="this.className='SkyButtonBlur'" onMouseOver="this.className='SkyButtonFocus'" onclick="window.history.back();" /></td>
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
<div class="uploadDiv" style="position:absolute;">
	<iframe id='target_upload' name='target_upload' src='' style='display: none'></iframe>
	<form action="/dm/uploadFile/upload" id="uploadForm" enctype="multipart/form-data" method="post" target="target_upload">
		<input type="hidden" name="uploadFileName" id="uploadFileName">
		<input type="hidden" name="uploadFilePath" id="uploadFilePath">
		
		<span id="fileup">
			<input type="file" name="upload" id="uploadBigFile" > 
		</span>
	</form>
</div>
<div id="progress">
	<div id="title">
		<%-- <span id="text" class="fontStyle">上传进度</span> --%>
		<div id="close">关闭</div>
	</div>
	<div id="progressBar">
		<div id="uploaded"></div>
	</div>
	<div id="info"></div>
</div>
</div>
</body>
</html>