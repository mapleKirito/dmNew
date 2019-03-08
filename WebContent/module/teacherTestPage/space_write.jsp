<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<% String basePath = "http://" + request.getLocalAddr() + ":" + request.getLocalPort() + request.getContextPath(); %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0.1 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/main.css">
<script type="text/javascript" src="<%=request.getContextPath()%>/ckeditor/ckeditor.js"></script>
<script type="text/javascript">
$(document).ready(function(){	
	$.formValidator.initConfig({formid:"actionForm",onerror:function(){alert("校验没有通过，具体错误请看错误提示")}}); 
	$("#aTitle").formValidator({onshow:"请输入标题",onfocus:"标题不能为空（最多255个字符）",oncorrect:"输入正确"}).inputValidator({min:1,max:255,onerror:"标题的长度不正确"});
	$("#BtnOk").click(function(){
		var text=CKEDITOR.instances.aContent.document.getBody().getText();
		//alert(text);
		$("#aText").val(text);
		//return false;
	})
});
function checkAticle(this_){
	var text=CKEDITOR.instances.aContent.document.getBody().getText();
	//alert(text);
	//alert($("#aText").val(text));
	var aticleLong=getStrLength(text);
	//alert(aticleLong);
	if(aticleLong<54288 && checkAllTextValid(this_)){
		
		return true;
	}else{
		alert("文章字数过多！");
		return false;
	}
}

function getStrLength(str) {  
    var cArr = str.match(/[^\x00-\xff]/ig);  
    return str.length + (cArr == null ? 0 : cArr.length);  
} 
/** 
* 校验所有输入域是否含有特殊符号 
* 所要过滤的符号写入正则表达式中，注意，一些符号要用'\'转义. 
* 试例： 
* if(checkAllTextValid(document.forms[0])) 
* alert("表单中所有文本框通过校验！"); 
*/ 
function checkAllTextValid(form) 
{ 
//记录不含引号的文本框数量 
var resultTag = 0; 
//记录所有text文本框数量 
var flag = 0; 
for(var i = 0; i < form.elements.length; i ++) 
{ 
if(form.elements[i].type=="text") 
{ 
flag = flag + 1; 
//此处填写所要过滤的特殊符号 
//注意：修改####处的字符，其它部分不许修改. 
//if(/^[^####]*$/.test(form.elements[i].value)) 

if(/^[^\|"'<>#]*$/.test(form.elements[i].value)) 
resultTag = resultTag+1; 
else 
form.elements[i].select(); 
} 
} 

/** 
* 如果含引号的文本框等于全部文本框的值，则校验通过 
*/ 
if(resultTag == flag) 
return true; 
else 
{ 
alert("文本框中不能含有\n\n 1 单引号: ' \n 2 双引号: \" \n 3 竖 杠: | \n 4 尖角号: < > \n 5 井号: #   \n\n请检查输入！"); 
return false; 
} 
} 
</script>
<style type="text/css">
.table_6 {	border: 0px solid #ae9b84;}
.table_9 .tatd {	border: 0px solid #ffffff;}
.table_6 td {	padding: 8px;	color: #333333;}
.uploadDiv #enableUp,.uploadDiv #isUploadTip,.onShow,#menuBtn {	color: #777777;}
.table_9 tr td {	border: 0px solid #ffffff;}
.SkyButtonBlur { background-image:none;background: #C0964D;height: 35px;width: 60px;;color: white;font-size: 14px;font-family:"微软雅黑";}
.SkyButtonFocus { background-image:none;background: #C0964D;height: 35px;width: 60px;color: white;font-size: 14px;font-family:"微软雅黑";}
.SkyButtonBlur[type=submit]{background: #A83737;}
.SkyButtonBlur[type=buttom]{background: #D1BC98;}
</style>
</head>
<body>
<form name="actionForm" method="post" id="actionForm" enctype="multipart/form-data"  action="uploadDataAction.action" onsubmit="return checkAticle(this);">
<input type="hidden" name="code" value="${code}"> 
<input type="hidden" name="imitateStep" value="${pmsIndex.myArticle.imitationStep}"> 
<input type="hidden" id="wu" name="paramMap.aUserID"  value="${session.s_userID }"> 
<table width="100%" height="100%" border="0" cellspacing="0" cellpadding="0" >
  <tr>
    <td valign="top" style="padding:5px;">
		<table width="100%" border="0" cellspacing="0" cellpadding="0" >
			<tr>
				<td valign="top">
					<table width="100%" border="0" cellspacing="0" cellpadding="0" class="table_6">
					  <tr>
					  
						<td width="100%" valign="top">
						<div style="border: 1px solid #A98534;">
							<table width="100%" border="0" cellspacing="0" cellpadding="0" class="table_9">
							   <tr >
										<td width="100%" bgcolor="#E8DDD0" height="30px" style="border-bottom: 1px solid #ae9b84;" align="center" colspan="2" class="tatd">文章创建</td>
										
									  </tr>
							  <tr bgcolor="#F8F4ED">
								<td width="15%" class="tatd" align="center">文章标题</td>
									<td width="85%" class="tatd" align="left">
									<input name="paramMap.aTitle" type="text" id="aTitle" style="width: 350px;" />
									<font color="red">*</font><span id="aTitleTip" style="position:absolute;height:22px;width:250px;"></span>									
								</td>
							  </tr>
							  <tr bgcolor="#F8F4ED">
								<td width="15%" class="tatd" align="center">文章正文</td>
								<td width="85%" class="tatd" align="left">
									<input type="hidden" id="aText" name="paramMap.aText" > 
									<textarea cols="80" name="paramMap.aContent" id="aContent"  rows="10"></textarea>
								    <script type="text/javascript">
										  CKEDITOR.replace('aContent',{height : 320, filebrowserUploadUrl : 'ckeditor/uploader?Type=File&TypeRoom=userFile&userFileID='+'${paramMap.s_userID}', filebrowserImageUploadUrl : 'ckeditor/uploader?Type=Image&TypeRoom=userFile&userFileID='+'${paramMap.s_userID}', filebrowserFlashUploadUrl : 'ckeditor/uploader?Type=Flash&TypeRoom=userFile&userFileID='+'${paramMap.s_userID}' } );
									</script>							
								</td>
							  </tr>
							  <tr bgcolor="#F8F4ED">
								<td colspan="2" style="text-align: center;">
									<input type="submit" name="BtnOk" value="确认" id="BtnOk" class="SkyButtonBlur" onMouseOut="this.className='SkyButtonBlur'" onMouseOver="this.className='SkyButtonFocus'" />&nbsp;&nbsp;
									<input type="button" name="BtnReturn" value="返回" id="BtnReturn" class="SkyButtonBlur" onMouseOut="this.className='SkyButtonBlur'" onMouseOver="this.className='SkyButtonFocus'" onclick="window.history.back();" />
								</td>
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