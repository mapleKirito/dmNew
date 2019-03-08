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
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/main.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/ztree.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/jquery.autocomplete.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/js/artDialog/artDialog.css">
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/css/progressBar.css">
<script language="javascript" src="<%=request.getContextPath()%>/js/tree/jquery.ztree.core-3.0.js" type="text/javascript"></script>
<script language="javascript" src="<%=request.getContextPath()%>/js/tree/jquery.ztree.excheck-3.0.js" type="text/javascript"></script>
<script language="javascript" src="<%=request.getContextPath()%>/js/tree/jquery.ztree.exedit-3.0.js" type="text/javascript"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/datePicker/WdatePicker.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.autocomplete.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/artDialog/artDialog.4.1.4.js?skin=default"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/artDialog/iframeTools.4.1.4.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/progressBar.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/rsync_progress_bar.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/dataUtils.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/res/category.js"></script>
<script type="text/javascript">
var setting = {
		async: {
			enable: true,
			url:"ajaxAction.action?code=${pmsIndex.sys_area_select_tree.code}",
			dataType:"json",
			autoParam:["id"],
			dataFilter: filter
		},
		callback: {
			beforeAsync: beforeAsync,
			//beforeClick: beforeClick,
			onClick: onClick
		}
	};
function filter(treeId, parentNode, childNodes) {
	if (!childNodes) return null;
	if (childNodes.data){
		childNodes = childNodes.data;
	}
	return childNodes;
}
function beforeAsync(treeId, treeNode) {
	return treeNode ? treeNode.level < 5 : true;
}

function onClick(e, treeId, treeNode) {
	var id = treeNode.id;
	var name = treeNode.name;
	$("#areaParentID").attr("value", id);
	$("#areaParentName").attr("value", name);
	hideMenu();
}

function showMenu() {
	var cityObj = $("#areaParentName");
	var cityOffset = $("#areaParentName").offset();
	$("#menuContent").css({
		left : cityOffset.left + "px",
		top : cityOffset.top + cityObj.outerHeight() + "px"
	}).slideDown("fast");

	$("body").bind("mousedown", onBodyDown);
}
function hideMenu() {
	$("#menuContent").hide();
	$("body").unbind("mousedown", onBodyDown);
}
function onBodyDown(event) {
	if (!(event.target.id == "menuBtn" || event.target.id == "menuContent" || $(
			event.target).parents("#menuContent").length > 0)) {
		hideMenu();
	}
}
$(document).ready(function(){	
	
	$.formValidator.initConfig({formid:"actionForm",onerror:function(){alert('校验没有通过，具体错误请看错误提示')},onsuccess:function(){}});//表单提交 
	$("#areaName").formValidator({onshow:"请输入地区名称",onfocus:"请输入地区名称",oncorrect:"输入正确"}).inputValidator({min:1,onerror:"地区名称不能为空,请确认"});
	$("#areaSign").formValidator({onshow:"请输入地区标识",onfocus:"请输入地区标识",oncorrect:"输入正确"}).inputValidator({min:1,onerror:"地区标识不能为空,请确认"});
	$("#areaParentName").formValidator({onshow:"请输入上级地区",onfocus:"请输入上级地区",oncorrect:"输入正确"}).inputValidator({min:1,onerror:"地区标识上级地区,请确认"});
	
	
	
	
	
	
	//input验证

	 $('#BtnOk').screenTB({
        	windowDocument:window.parent.document,
    		width:'250',
    		height:'150',
    		content:'测试内容',
    		contentAlign:'center',
    		contentValign:'middle',
			title:'系统提示信息',
			buttonValueYes:'确定',	
			buttonValueNo:'取消',	
			dialogType:'alert',
			iframeSrc:''				
    		},{
    		clickEvent:function(data){
    			if (parseInt($("#orglID").val())==parseInt($("#orgParentID").val())){
    				data = $.extend(data,{content:'不能选择当前地区为上级地区，请重新选择'})
    			}
    			else{
    				$.extend(data,{returnValue:'true'});
    				$("#actionForm").submit();
    			}
    		}
    	});
	
	 $.fn.zTree.init($("#treeDemo"), setting);	
});
</script>
<style type="text/css">
.table_6 {	border: 0px solid #ae9b84;}
.table_9 .tatd {	border: 0px solid #ffffff;}
.table_6 td {	padding: 8px;	font-size: 16px;	color: #333333;}
.uploadDiv #enableUp,.uploadDiv #isUploadTip,.onShow,#menuBtn {color: #777777;}
.table_9 tr td {border: 0px solid #ffffff;}
.SkyButtonBlur { background-image:none;background: #C0964D;height: 35px;width: 60px;;color: white;font-size: 14px;font-family:"微软雅黑";}
.SkyButtonFocus { background-image:none;background: #C0964D;height: 35px;width: 60px;color: white;font-size: 14px;font-family:"微软雅黑";}
.SkyButtonBlur[type=submit]{background: #A83737;}
.SkyButtonBlur[type=buttom]{background: #D1BC98;}
.ztree {
  background-color: #D1BC98;}
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
<form name="actionForm" method="post" action="operateAction.action" id="actionForm">
<input type="hidden" value="name" name="logColumn" /> 
<input type="hidden" value="true" name="islog" /> 
<input type="hidden" name="code" value="${code}"> 
<input name="paramMap.areaID" type="hidden" id="areaID" value="${initMap.areaInfo.areaID}"/>
<input name="paramMap.oldAreaPath" type="hidden" id="oldRelation" value="${initMap.areaInfo.areaPath}"/>
<input name="paramMap.oldAreaParentID" type="hidden" id="oldParentID" value="${initMap.areaInfo.areaParentID}"/>
<input type="hidden" name="imitateStep" value="${pmsIndex.sys_area_mgr.imitationStep}"> 
<div id="menuContent" class="menuContent" style="display: none; position: absolute;">
	<ul id="treeDemo" class="ztree" style="margin-top: 0; width: 160px;"></ul>
</div>
<table width="100%" border="0" cellpadding="0" cellspacing="0" >
  <tr>
    <td valign="top" style="padding:5px;">
		<table width="100%" border="0" cellspacing="0" cellpadding="0" >
			<tr>
				<td valign="top">
					<table width="100%" border="0" cellspacing="0" cellpadding="0" class="table_6">
					  <tr>
						<td width="100%" id="vback" valign="top"  style=" position:relative; background:url(images-ce/crud.png) center bottom no-repeat; background-size:100% 100%;">
							<div>
								<form name="actionForm" method="post" action="operateAction.action" id="actionForm">
									<table class="table_9" cellSpacing="1" cellPadding="0" width="100%" border="0" >
										 <tr  height="30">
											<td width="25%" class="tatd" align="right">&nbsp;</td>
											<td width="75%" class="tatd" align="left">&nbsp;</td>
										</tr>
									<s:if test="#request.initMap.areaInfo.orgParentID!=0">
										<tr  > 
											<td align="right" class="tatd" width="25%">上级地区：</td>
											<td  class="tatd" >
											  
									   	 		<input type="hidden" id="areaLevel" name="paramMap.areaLevel" value="${initMap.areaInfo.areaLevel}">
									   	 		<input name="paramMap.areaParentID" type="hidden" maxlength="180" id="areaParentID" style="width: 200px;" value="${initMap.areaInfo.areaParentID}" /> 
												<input name="paramMap.areaParentName" type="text" maxlength="180" readonly id="areaParentName" style="width: 200px;" value="${initMap.areaInfo.areaParentName}" /> 
									   	 		<a id="menuBtn" href="javascript:void(0)" onclick="showMenu(); return false;">选择</a>
									   	 		&nbsp;<font color="red">*</font><span id="areaParentNameTip"  style="position:absolute;height:22px;width:250px;"></span>
												   	 
											</td>
										</tr>
									</s:if>
									<tr  >
										<td align="right" class="tatd" width="25%">地区名称：</td>
										<td class="tatd">
										<input name="paramMap.areaName" type="text" maxlength="180" id="areaName" style="width: 200px;" value="${initMap.areaInfo.areaName}" />
										&nbsp;<font color="red">*</font><span id="areaNameTip"  style="position:absolute;height:22px;width:250px;"></span></td>
									</tr>
									<tr  >                
										<td align="right" class="tatd" width="25%">地区标识：</td>
										<td class="tatd"><input name="paramMap.areaSign" value="${initMap.areaInfo.areaSign}" type="text" maxlength="180" id="areaSign"  style="width: 200px;" />
										&nbsp;<font color="red">*</font><span id="areaSignTip" style="position:absolute;height:22px;width:250px"></span></td>
									</tr>
									<tr  >
										<td align="right" class="tatd" width="25%">地区排序：</td>
										<td class="tatd"><input name="paramMap.areaSort" value="100" type="text" maxlength="180" id="areaSort" value="${initMap.areaInfo.areaSort}" style="width: 200px;" />
										<%-- &nbsp;<font color="red">*</font><span id="orgPhoneTip" style="position:absolute;height:22px;width:250px"></span> --%>
										</td>
									</tr>
									<tr  align="center">
										<td colSpan="2" class="tatd">
												<input type="submit" name="BtnOk" value="修改" id="BtnOk" class="SkyButtonBlur" onMouseOut="this.className='SkyButtonBlur'" onMouseOver="this.className='SkyButtonFocus'" />&nbsp;&nbsp;
												<input type="button" name="BtnReturn" value="返回" id="BtnReturn" class="SkyButtonBlur" onMouseOut="this.className='SkyButtonBlur'" onMouseOver="this.className='SkyButtonFocus'" onclick="window.history.back();" /></td>
									</tr>
									</table>
                         		</form>
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