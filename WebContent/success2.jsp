<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"  "http://www.w3.org/TR/html4/loose.dtd">
<%
	String basePath = "http://" + request.getLocalAddr() + ":" + request.getLocalPort() + request.getContextPath();	
%>
<html>
<head>
<title>成功提示</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/skin.css">
<script language="javascript" src="<%=request.getContextPath()%>/js/jquery-1.7.2.min.js"></script>
<script>
$(document).ready(function(){
	$("body,form").css({
		"height":$(window).height(),
		"width":$(window).width()
	});
	
});
</script>
<style type="text/css">
body{
    background: url(<%=request.getContextPath()%>/images-ce/loginbg.jpg) center no-repeat;
	background-size: cover;
	-ms-behavior: url(<%=request.getContextPath()%>/css/backgroundsize.min.htc);
	behavior: url(<%=request.getContextPath()%>/css/backgroundsize.min.htc);
}
</style>
</head>
<body style=" position:relative; background:url(<%=request.getContextPath()%>/images-ce/loginbg.jpg) center bottom no-repeat; background-size:100% 100%; ">
<form name="actionForm" method="post" action="decorateForwardAction.action" id="actionForm">
<input type="hidden" name="imitateStep" id="imitateStep" value="${imitateStep}">
<input type="hidden" name="imitateBack" id="imitateBack" value="1">
<input type="hidden" name="stepReloadType" id="stepReloadType" value="${stepReloadType}">
<table width="300" align="center"  height="150" border="0" cellpadding="0"
	cellspacing="0" class="tablemain">
	<tr>
		<td>
		<table width="300" align="center" border="0" cellpadding="0" cellspacing="0"
			class="tableT">
			<tr>
				<td class="tableTleft">&nbsp;</td>
				<td class="tableTcenter">
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td width="46%" valign="middle">
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td width="5%">
								<div align="center"><%-- <img
									src="<%=request.getContextPath()%>/images/window/message.png"> --%></div>
								</td>
								<td width="95%" class="tableTBig">信息提示</td>
							</tr>
						</table>
						</td>
						<td width="54%">&nbsp;</td>
					</tr>
				</table>
				</td>
				<td class="tableTright">&nbsp;</td>
			</tr>
		</table>
		<table width="300" align="center" height="100" border="0" cellpadding="0" cellspacing="0"
			class="tableC">
			<tr>
				<td class="tableCleft">&nbsp;</td>
				<td class="tableCcenter">
				<table width="100%" height="130" border="0" cellpadding="0" cellspacing="0"
					class="tableC">
					<tr>
						<td class="tableCcenter">
						<table width="100%" border="0" cellpadding="0" cellspacing="1"
							class="" style="line-height: 20px;">
							<tr>
								<td align="center" valign="middle" style="font-size: 18px;color: black;">
								
									 
									&nbsp;${promptInfo.resultDescInfo}
                                </td>
							</tr>
						</table>
						</td>
					</tr>
		            <tr > 
		                <td align="center" valign="middle">
		                	<a href="javascript:void(0);"  style="color: #A65E10;font-size: 14px;" onclick="window.location.href='<%=request.getContextPath()%>/index.jsp'">返回首页</a>
		                </td>
		            </tr>
				</table>
				</td>
				<td class="tableCright">&nbsp;</td>
			</tr>
		</table>
		<table width="300" align="center" border="0" cellpadding="0" cellspacing="0"
			class="tableF">
			<tr>
				<td class="tableFleft">&nbsp;</td>
				<td class="tableFcenter">&nbsp;</td>
				<td class="tableFright">&nbsp;</td>
			</tr>
		</table>
		</td>
	</tr>
</table>
</form>
</body>
</html>
