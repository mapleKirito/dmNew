<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="FCK" uri="/WEB-INF/taglib/FCKeditor.tld" %>
<%
	String basePath = "http://" + request.getLocalAddr() + ":"
			+ request.getLocalPort() + request.getContextPath();
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<title></title>
<head>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/ztree.css">
<script language="javascript" src="<%=request.getContextPath()%>/js/tree/jquery.ztree.core-3.0.js" type="text/javascript"></script>
<script language="javascript" src="<%=request.getContextPath()%>/js/tree/jquery.ztree.excheck-3.0.js" type="text/javascript"></script>
<script language="javascript" src="<%=request.getContextPath()%>/js/tree/jquery.ztree.exedit-3.0.js" type="text/javascript"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/datePicker/WdatePicker.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/artDialog/artDialog.4.1.4.js?skin=default"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/artDialog/iframeTools.4.1.4.js"></script>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/js/artDialog/artDialog.css">
<script type="text/javascript">
var gridTreeTB,treeTB;
$(document).ready(function(){	
 //input验证
	$.formValidator.initConfig({formid:"actionForm",onerror:function(){alert('校验没有通过，具体错误请看错误提示')},onsuccess:function(){}});//表单提交 
	/* $("#grGrade").formValidator({onshow:"请选择初中分类",onfocus:"请选择初中分类",oncorrect:"输入正确"}).inputValidator({min:1,onerror:"初中分类不能为空,请确认"}); */
	$("#grName").formValidator({onshow:"请选择资源名称",onfocus:"请选择资源名称",oncorrect:"输入正确"}).inputValidator({min:1,onerror:"资源名称不能为空,请确认"});
	
	$("#searchRes").click(function () {
		var resType = "" ;
		var openCode = "${pmsIndex.res_exhibition_room_grade_search.code}" ;
		if($("#grResourceType").val() == "exhibition") {
			resType = "文物博览室查询" ;
			openCode = "${pmsIndex.res_exhibition_room_grade_search.code}" ;
		}else if($("#grResourceType").val() == "observation") {
			resType = "专题研读室查询" ;
			openCode = "${pmsIndex.res_observation_room_grade_search.code}" ;
		}else if($("#grResourceType").val() == "laboratory") {
			resType = "教学研究室查询" ;
			openCode = "${pmsIndex.res_laboratory_room_grade_search.code}" ;
		}else if($("#grResourceType").val() == "projection") {
			resType = "影像资料室查询" ;
			openCode = "${pmsIndex.res_projection_room_grade_search.code}" ;
		}else if($("#grResourceType").val() == "expand") {
			resType = "自主探究室查询" ;
			openCode = "${pmsIndex.res_expand_room_grade_search.code}" ;
		}
		art.dialog.data('aValue', $("#grName").val());// 存储数据
		art.dialog.open('decorateForwardAction.action?code=' + openCode, {
			id: 'gradeSearchRes',
			title: resType,
			width: 600,
			height: 300,
			close: function () {
				var grName = art.dialog.data('resName');// 读取弹出页面的数据
				var grResourceID = art.dialog.data('resID');
				var grThumbnail = art.dialog.data('resThumbnail');
				var grUpload = art.dialog.data('resUpload');
				var grType = art.dialog.data('resType');
				if (grName !== undefined) {
					$("#grName").val(grName);
				}
				if(grResourceID != undefined) {
					$("#grResourceID").val(grResourceID);
				}
				if(grThumbnail != undefined) {
					$("#grThumbnail").val(grThumbnail);
				}
				if(grUpload != undefined) {
					$("#grUpload").val(grUpload);
				}
				if(grThumbnail != undefined) {
					$("#grType").val(grType);
				}
			}
		}, false);
	});
});
</script>
</head>
<body>
<form name="actionForm" method="post" id="actionForm" action="operateAction.action">
<div id="menuContent" class="menuContent" style="display: none; position: absolute;">
	<ul id="treeDemo" class="ztree" style="margin-top: 0; width: 160px;"></ul>
</div>
<input type="hidden" name="code" value="${code}"> 
<input type="hidden" name="imitateStep" value="${pmsIndex.res_grade_relationship_mgr.imitationStep}">
<input type="hidden" name="paramMap.grResourceID" id="grResourceID">
<input type="hidden" name="paramMap.grThumbnail" id="grThumbnail">
<input type="hidden" name="paramMap.grUpload" id="grUpload">
<input type="hidden" name="paramMap.grType" id="grType">
<table width="100%" border="0" cellpadding="0" cellspacing="0" class="tableC">
	<tr>
		<td class="tableCcenter">
		<table width="100%" border="0" cellpadding="0" cellspacing="1" class="SkyTDLine">
			<tr>
				<td class="SkyTDLine">
				<table class="SkyTDLine" cellSpacing="1" cellPadding="0" width="100%" border="0">
					<tr class="MeNewTDLine" align="center">
						<td align="center">
						<table class="Ntable" cellSpacing="1" cellPadding="0" width="100%" border="0">
							<tr class="MeNewTDLine">
								<td align="right" class="SkyTDLine" width="15%">初中分类：</td>
								<td class="SkyTDLine">
								<select name="paramMap.grGrade" id="grGrade">
									<option value="0">--请选择年级--</option>
									<!-- <option value="11">小学一年级</option>
									<option value="12">小学二年级</option>
									<option value="13">小学三年级</option>
									<option value="14">小学四年级</option>
									<option value="15">小学五年级</option>
									<option value="16">小学六年级</option> -->
									<option value="21">七年级</option>
									<option value="22">八年级</option>
									<option value="31">必修一</option>
									<option value="32">必修二</option>
									<option value="33">必修三</option>
								</select>
								&nbsp;
								<font color="red">*</font><span id="grGradeTip" style="position:absolute;height:22px;width:297px"></span></td>
							</tr>
							<tr class="MeNewTDLine">
								<td align="right" class="SkyTDLine" width="15%">资源类别：</td>
								<td class="SkyTDLine">
									<select name="paramMap.grResourceType" id="grResourceType">
										<option value="exhibition">文物博览室</option>
										<option value="observation">专题研读室</option>
										<option value="laboratory">教学研究室</option>
										<option value="projection">影像资料室</option>
										<option value="expand">自主探究室</option>
									</select>
								&nbsp;
								<span id="grResourceTypeTip" style="position:absolute;height:22px;width:297px"></span></td>
							</tr>
							<tr class="MeNewTDLine">
								<td align="right" class="SkyTDLine" width="15%">资源名称：</td>
								<td class="SkyTDLine">
								<input name="paramMap.grName" type="text" maxlength="16" id="grName" style="width: 200px;" readonly="readonly" />
								<input type="button" id="searchRes" value="查询">
								&nbsp;
								<span id="grNameTip" style="position:absolute;height:22px;width:297px"></span>
								</td>
							</tr>
							<tr class="MeNewTDLine" align="center">
								<td colSpan="2" class="SkyTDLine"><input type="submit" name="BtnOk" value="创建" id="BtnOk" class="SkyButtonBlur" onMouseOut="this.className='SkyButtonBlur'" onMouseOver="this.className='SkyButtonFocus'" />&nbsp;&nbsp;<input type="button" name="BtnOk" value="返回" id="BtnOk" class="SkyButtonBlur" onMouseOut="this.className='SkyButtonBlur'" onMouseOver="this.className='SkyButtonFocus'" onclick="window.history.back();" /></td>
							</tr>
						</table>
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
