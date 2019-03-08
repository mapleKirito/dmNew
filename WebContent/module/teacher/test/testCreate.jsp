<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<% String basePath = "http://" + request.getLocalAddr() + ":" + request.getLocalPort() + request.getContextPath(); %>
<html>
<title>${promptInfo.totalDescInfo}</title>
<head>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/main.css">
<style type="text/css">
body, ul, li{ margin:0; padding:0; font-size:12px;}
ul, li{list-style-type:none;}
#climate_app span{margin-right: 5px;}

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
<script type="text/javascript">
$(document).ready(function(){	
	
	//input验证
	$.formValidator.initConfig({formid:"actionForm",onerror:function(){alert('校验没有通过，具体错误请看错误提示');},onsuccess:function(){}});//表单提交 
	
	$("#testName").formValidator({onshow:"请输入考题题目",onfocus:"请输入考题题目",oncorrect:"输入正确"}).inputValidator({min:1,onerror:"考题题目不能为空,请确认"});
	//$("#testClass").formValidator({onshow:"请输入考题分类",onfocus:"请输入考题分类",oncorrect:"输入正确"}).inputValidator({min:1,onerror:"考题分类不能为空,请确认"});
	$("#teIndivOptionA").formValidator({onshow:"请输入考题选项",onfocus:"请输入考题选项",oncorrect:"输入正确"}).inputValidator({min:1,onerror:"考题选项不能为空,请确认"});
	$("#teIndivOptionB").formValidator({onshow:"请输入考题选项",onfocus:"请输入考题选项",oncorrect:"输入正确"}).inputValidator({min:1,onerror:"考题选项不能为空,请确认"});
	$("#teIndivOptionC").formValidator({onshow:"请输入考题选项",onfocus:"请输入考题选项",oncorrect:"输入正确"}).inputValidator({min:1,onerror:"考题选项不能为空,请确认"});
	$("#teIndivOptionD").formValidator({onshow:"请输入考题选项",onfocus:"请输入考题选项",oncorrect:"输入正确"}).inputValidator({min:1,onerror:"考题选项不能为空,请确认"});
	
	$("#testRemarks").formValidator({onshow:"请输入答案解析",onfocus:"请输入答案解析",oncorrect:"输入正确"}).inputValidator({min:1,onerror:"答案解析不能为空,请确认"});
	$("#radioindivform").formValidator({onshow:"请输入考题答案(单项选择题)",onfocus:"请输入考题答案(单项选择题)",oncorrect:"输入正确"}).inputValidator({min:1,onerror:"考题答案(单项选择题)不能为空,请确认"});
	
	$("input.testGrades:checkbox").click(function(){
		if($(this).is(':checked')){
			$(this).siblings().attr('disabled', true);		
		}else{
			$(this).siblings().attr('disabled', false);
		}
	});
	
	$("input.teIndivOption:radio").click(function(){
		$("#radioindivform").val("1");
	});
	
	$("input.judgeanswer:radio").click(function(){
		$("#radiojudgeAnswerform").val("1");
	});
	
	$("input.manyAnswer:checkbox").click(function(){
		$("#checkboxform").val($(".Manya input[type=checkbox][name=paramMap.testIndivAnswer]:checked").length);
	});
	
	$('[name="paramMap.testType"]:radio').each(function(){
		$(this).click(function(){
			var resType = $(this).val() ;
			if(resType == 1){
				$(".Indivoption").show();
				$(".Indiv").show();
				$(".Manya").hide();
				$(".Judge").hide();
				$("#radioindivform").formValidator({onshow:"请输入考题答案(单项选择题)",onfocus:"请输入考题答案(单项选择题)",oncorrect:"输入正确"}).inputValidator({min:1,onerror:"考题答案(单项选择题)不能为空,请确认"});
				
				$("#checkboxform").formValidator({});
				$("#radiojudgeAnswerform").formValidator({});
				
			}else if(resType == 2){
				$(".Indivoption").show();
				$(".Indiv").hide();
				$(".Manya").show();
				$(".Judge").hide();
				//$("#checkboxform").formValidator({tipid:"checkboxformTip",onshow:"请选择考题答案(多项选择题)（至少选两个）",onfocus:"你至少选择2个",oncorrect:"选择正确"}).inputValidator({min:2,onerror:"你选的个数不对"});
				
				$("#radioindivform").formValidator({});
				$("#radiojudgeAnswerform").formValidator({});
				
			}else{
				$(".Indivoption").hide();
				$(".Indiv").hide();
				$(".Manya").hide();
				$(".Judge").show();
				$("#radiojudgeAnswerform").formValidator({onshow:"请输入考题答案(判断题)",onfocus:"请输入考题答案(判断题)",oncorrect:"输入正确"}).inputValidator({min:1,onerror:"考题答案(判断题)不能为空,请确认"});
				
				$("#radioindivform").formValidator({});
				$("#checkboxform").formValidator({});
				
				$("#teIndivOptionA").formValidator({});
				$("#teIndivOptionB").formValidator({});
				$("#teIndivOptionC").formValidator({});
				$("#teIndivOptionD").formValidator({});
				
			}
		});
	});
});
function confirm(this_)
{   
	var typesub = $('input.testType:radio:checked').val(); 
	//alert("系统自动为当前用户增加1财富值");
	if(typesub == 2&&$(".Manya input[type=checkbox][name=paramMap.testIndivAnswer]:checked").length<2){
		alert("多选题最少要有两个选项答案");
		return false;
	}else if(checkAllTextValid(this_)){
		return true;
	}else{
		return false;
	}
	
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
</head>
<body>
<form name="actionForm" method="post" id="actionForm" enctype="multipart/form-data"  action="uploadDataAction.action" onsubmit="return confirm(this);">
<input type="hidden" name="code" value="${code}"> 
<input type="hidden" name="imitateStep" value="${pmsIndex.tea_test_param.imitationStep}">
<input type="hidden" id="radioindivform">
<input type="hidden" id="checkboxform">
<input type="hidden" id="radiojudgeAnswerform">
<input type="hidden" value="197" name="paramMap.testClass">
<input type="hidden" value="1" name="paramMap.newWealth">
<input type="hidden" value="${s_userID }" name="paramMap.userID">
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
									  <tr bgcolor="#F8F4ED">
										<td width="100%" bgcolor="#E8DDD0" height="30px" style="border-bottom: 1px solid #ae9b84;" align="center" colspan="2" class="tatd">创建探究问题</td>
										
									  </tr>
									<tr bgcolor="#F8F4ED" >
										<td width="15%" class="tatd" align="right">考题类型：</td>
										<td width="85%" class="tatd" align="left">
											<input type="radio" name="paramMap.testType" class="testType" value="1" checked="checked"><span>单项选择题</span>
											<input type="radio" name="paramMap.testType" class="testType" value="2"><span>多项选择题</span>
											<input type="radio" name="paramMap.testType" class="testType" value="3"><span>判断题</span>
										</td>
									</tr>		
									<tr bgcolor="#F8F4ED">
										<td width="15%" class="tatd" align="right">考题题目：</td>
										<td width="85%" class="tatd" align="left">
											<input name="paramMap.testName" type="text" maxlength="180" id="testName" />
											&nbsp;<font color="red">*</font><span id="testNameTip" style="position:absolute;height:22px;width:203px"></span>
										</td>
									</tr>
									<%-- <tr bgcolor="#F8F4ED" >
										<td width="15%" class="tatd" align="right">考题分类：</td>
										<td width="85%" class="tatd" align="left">
											<select name="paramMap.testClass" id="testClass">
												<option>----请选择----</option>
												<option value="998">自然地理</option>
												<option value="999">人文地理</option>
												<option value="1000">区域地理</option>
												<option value="1001">灾害地理</option>
												<option value="1002">综合试卷</option>
											</select>
											&nbsp;<font color="red">*</font><span id="testClassTip" style="position:absolute;height:22px;width:203px"></span>
										</td>
									</tr> --%>		
									<!-- <tr bgcolor="#F8F4ED">
										<td width="15%" class="tatd" align="right">考题分值：</td>
										<td width="85%" class="tatd" align="left">
											<input name="paramMap.testVal" type="text" maxlength="180" id="testVal" />
										</td>
									</tr> -->
									<tr bgcolor="#F8F4ED" class="Indivoption">
										<td width="15%" class="tatd" align="right">考题选项(选择题)：</td>
										<td width="85%" class="tatd" align="left">
											<table width="80%" height="100%" border="0" cellspacing="0" cellpadding="0" >
												<tr>
													<td style="border: none;">
														<label><span>A：</span><input name="paramMap.testIndivOptionA" type="text" id="teIndivOptionA" /></label>
														&nbsp;<font color="red">*</font><span id="teIndivOptionATip" style="position:absolute;height:22px;width:203px"></span>
													</td>
												</tr>
												<tr>
													<td style="border: none;">
														<label><span>B：</span><input name="paramMap.testIndivOptionB" type="text" id="teIndivOptionB" /></label>
														&nbsp;<font color="red">*</font><span id="teIndivOptionBTip" style="position:absolute;height:22px;width:203px"></span>
													</td>
												</tr>
												<tr>
													<td style="border: none;"><label><span>C：</span><input name="paramMap.testIndivOptionC" type="text" id="teIndivOptionC" />
													&nbsp;<font color="red">*</font><span id="teIndivOptionCTip" style="position:absolute;height:22px;width:203px"></span>
													</label></td>
												</tr>
												<tr>
													<td style="border: none;"><label><span>D：</span><input name="paramMap.testIndivOptionD" type="text" id="teIndivOptionD" />
													&nbsp;<font color="red">*</font><span id="teIndivOptionDTip" style="position:absolute;height:22px;width:203px"></span></label></td>
													
												</tr>
											</table>
										</td>
									</tr>	
									<%-- <tr bgcolor="#F8F4ED">
										<td width="15%" class="tatd" align="right">考题选项(判断题)：</td>
										<td width="85%" class="tatd" align="left">
											<span>对</span><input type="radio" name="paramMap.teJudgeOption" value="y">
											<span>错</span><input type="radio" name="paramMap.teJudgeOption" value="n">
										</td>
									</tr> --%>
									<tr bgcolor="#F8F4ED" class="Indiv">
										<td width="15%" class="tatd" align="right">考题答案(单项选择题)：</td>
										<td width="85%" class="tatd" align="left">
											<span>A</span><input type="radio" name="paramMap.testIndivAnswer" value="A" class="teIndivOption">
											<span>B</span><input type="radio" name="paramMap.testIndivAnswer" value="B" class="teIndivOption">
											<span>C</span><input type="radio" name="paramMap.testIndivAnswer" value="C" class="teIndivOption">
											<span>D</span><input type="radio" name="paramMap.testIndivAnswer" value="D" class="teIndivOption">
											&nbsp;<font color="red">*</font><span id="radioindivformTip" style="position:absolute;height:22px;width:223px"></span>
										</td>
									</tr>	
									<tr bgcolor="#F8F4ED" class="Manya" style="display: none;">
										<td width="15%" class="tatd" align="right">考题答案(多项选择题)：</td>
										<td width="85%" class="tatd" align="left">
											<span>A</span><input type="checkbox" name="paramMap.testIndivAnswer" class="manyAnswer" id="testIndivAnswerm1" value="A">
											<span>B</span><input type="checkbox" name="paramMap.testIndivAnswer" class="manyAnswer" id="testIndivAnswerm2" value="B">
											<span>C</span><input type="checkbox" name="paramMap.testIndivAnswer" class="manyAnswer" id="testIndivAnswerm3" value="C">
											<span>D</span><input type="checkbox" name="paramMap.testIndivAnswer" class="manyAnswer" id="testIndivAnswerm4" value="D">
											&nbsp;<font color="red">*</font><span id="checkboxformTip" style="position:absolute;height:22px;width:253px"></span>
										</td>
									</tr>	
									<tr bgcolor="#F8F4ED" class="Judge" style="display: none;">
										<td width="15%" class="tatd" align="right">考题答案(判断题)：</td>
										<td width="85%" class="tatd" align="left">
											<span>对</span><input type="radio" name="paramMap.testJudgeAnswer" value="y" class="judgeanswer">
											<span>错</span><input type="radio" name="paramMap.testJudgeAnswer" value="n" class="judgeanswer">
											&nbsp;<font color="red">*</font><span id="radiojudgeAnswerformTip" style="position:absolute;height:22px;width:223px"></span>
										</td>
									</tr>	
									<tr bgcolor="#F8F4ED">
										<td width="15%" class="tatd" align="right">答案解析：</td>
										<td width="85%" class="tatd" align="left">
											<textarea cols="60" id="testRemarks" name="paramMap.testRemarks"></textarea>
											&nbsp;<font color="red">*</font><span id="testRemarksTip" style="position:absolute;height:22px;width:203px"></span>
										</td>
									</tr>
									<tr bgcolor="#F8F4ED">
										<td width="15%" class="tatd" align="right">考题年级：</td>
										<td width="85%" class="tatd" align="left" id="testGradesTR">
											<%-- <input type="checkbox" name="paramMap.testGrades" class="testGrades" value="311"><span>七年级</span>&nbsp;
											<input type="checkbox" name="paramMap.testGrades" class="testGrades" value="312"><span>八年级</span>&nbsp;
											<input type="checkbox" name="paramMap.testGrades" class="testGrades" value="313"><span>九年级</span>
											<input type="checkbox" name="paramMap.testGrades" class="testGrades" value="321"><span>必修一</span>&nbsp;
											<input type="checkbox" name="paramMap.testGrades" class="testGrades" value="322"><span>必修二</span>&nbsp;
											<input type="checkbox" name="paramMap.testGrades" class="testGrades" value="323"><span>必修三</span>&nbsp;
											<input type="checkbox" name="paramMap.testGrades" class="testGrades" value="400"><span>其他</span>&nbsp; --%>
											
											<input type="checkbox" name="paramMap.testGrades"  value="311"><span>七年级</span>&nbsp;
											<input type="checkbox" name="paramMap.testGrades"  value="312"><span>八年级</span>&nbsp;
											<input type="checkbox" name="paramMap.testGrades"  value="313"><span>九年级</span>
											<input type="checkbox" name="paramMap.testGrades"  value="321"><span>必修一</span>&nbsp;
											<input type="checkbox" name="paramMap.testGrades"  value="322"><span>必修二</span>&nbsp;
											<input type="checkbox" name="paramMap.testGrades"  value="323"><span>必修三</span>&nbsp;
											<input type="checkbox" name="paramMap.testGrades"  value="400"><span>其他</span>&nbsp;
										</td>							
									</tr>					
									<!-- 	<tr bgcolor="#F8F4ED">
										<td width="15%" class="tatd" align="right">考题发布日期：</td>
										<td width="85%" class="tatd" align="left">
											<input name="paramMap.teCreateDate" type="text" class="teCreateDate" maxlength="10" id="teCreateDate"/>&nbsp;
										</td>
									</tr> -->
									<tr bgcolor="#F8F4ED" align="center">
										<td colspan="4"><input type="submit" name="BtnOk" value="创建" id="BtnOk" class="SkyButtonBlur" onMouseOut="this.className='SkyButtonBlur'" onMouseOver="this.className='SkyButtonFocus'" />&nbsp;&nbsp;<input type="button" name="BtnOk" value="返回" id="BtnOk" class="SkyButtonBlur" onMouseOut="this.className='SkyButtonBlur'" onMouseOver="this.className='SkyButtonFocus'" onclick="window.history.back();" /></td>
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