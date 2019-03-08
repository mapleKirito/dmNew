<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%> 
<%@ taglib uri="http://java.sun.com/jstl/fmt" prefix="fmt"%>

<html>
<%
	String basePath = "http://" + request.getLocalAddr() + ":" + request.getLocalPort() + request.getContextPath();
%>
<title></title>
<head>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/main.css">
<script type="text/javascript" src="<%=request.getContextPath()%>/js/pageToolbar2.js"></script>
<!--[if IE]> 
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/main_help.css">
<![endif]-->

<script type="text/javascript">
$(document).ready(function(){	
	var change_type = '${paramMap.change_type}';
	if (change_type != '') {
		$(".table_yj").eq(change_type).show().siblings().hide();
		$(".ziyuantab a.ltselect").eq(change_type).addClass("lt-private").siblings().removeClass("lt-private");
	}
	
	var $zy_li =$("#rfSortName");
	$zy_li.change(function(){
		var index =  parseInt($(this).prop('selectedIndex')); 
		//alert(index);
		$("#change_type").val(index);
		$(".table_yj").eq(index).show().siblings().hide(); 
	});
	$('#table1page').pageTB();
	$('#table2page').pageTB();
	$('#table3page').pageTB();
	$('#table4page').pageTB();
	$('#table5page').pageTB();
	
	
	//查询
	$("#search_favorite").click(function(){
		
		var rfName=$("#rfName").val();
		var rfSortName=$("#rfSortName").val();
		var index=$("#rfSortName option:selected").index();
		rfName=encodeURI(encodeURI(rfName));
		var href="decorateForwardAction.action?code="+$(this).attr("code")+"&paramMap.userID=${session.s_userID}"+"&paramMap.searchKeyWords="+rfName+"&paramMap.rfSortName="+rfSortName+"&paramMap.rfSort="+rfSortName+"&paramMap.change_type="+index;
		location.href=href;
		//$(".table_yj").eq(index).show().siblings().hide();
     });
	
});
</script>
<style type="text/css">
.tabler1td tr td,.tabler2td tr td,.tabler3td tr td,.tabler3td tr td,.tabler4td tr td,.tabler5td tr td{color: #333333;font-family: "微软雅黑";font-size: 16px;}
select{width: 150px;
height: 35px;
background: white;
font-size: 14px;
font-family: 微软雅黑;
padding-left: 5px;
border: 1px solid #957D70;
color: grey;}
#search_favorite {width: 30px;
height: 30px;
line-height: 27px;
background: #957F75;
margin-left: -8px;}
#rfName{width: 120px;
height: 26px;
border: 1px solid #957D70;
padding-left: 5px; }
</style>

</head>
<body >
<form name="actionForm" method="post" action="decorateForwardAction.action" id="actionForm">
<input type="hidden" id="uid" value="${paramMap.userID }" >
<input type="hidden" id="change_type" value="${(paramMap.change_type==null||paramMap.change_type=='')?0:paramMap.change_type}">
<table width="100%" height="100%" border="0" cellspacing="0" cellpadding="0" >
  <tr>
    <td valign="top">
		<table width="100%" border="0" cellspacing="0" cellpadding="0" >
			<tr>
				<td>
					<table width="100%" border="0" cellspacing="0" cellpadding="0" class="table_1" >
					  <tr>
						<td valign="top" >
                        	<table width="100%" border="0" cellspacing="0" cellpadding="0" class="table_12 list-table" >
							  <tr>
								<td style="height:32px;">
									<div class="ziyuantab lt-command">
										<div style="float: right;margin-right: 15px;">
										<input  placeholder="输入查询内容"   type="text" name="searchMap.rfName" value="${paramMap.rfName}" id="rfName"/>
										<s:if test="pmsIndex.my_favorite_search">
											<a href="javascript:void(0)" id="search_favorite" code="${pmsIndex.res_movement.code}"><span>${pmsIndex.my_favorite_search.name}</span></a>
										</s:if>	
									</div>
								 	<div style="float: right;margin-right: 15px;">
							 			
							 			<select name="searchMap.rfSortName" id="rfSortName" style="width: 150px;">
											<!-- <option value="">请选择科室名称</option> -->
											<option value="exhibition" ${paramMap.rfSort eq 'exhibition' ? 'selected':'' }>文物博览室</option>
											<option value="observation" ${paramMap.rfSort eq 'observation' ? 'selected':'' }>专题研读室</option>
											<option value="laboratory" ${paramMap.rfSort eq 'laboratory' ? 'selected':'' }>教学研究室</option>
											<option value="projection" ${paramMap.rfSort eq 'projection' ? 'selected':'' }>影像资料室</option>
											<option value="lovely" ${paramMap.rfSort eq 'lovely' ? 'selected':'' }>情系家园</option>
											
										</select>	
									</div>
									</div>
								</td>
							  </tr>
							</table>
                            <div>
                                <table width="100%" border="0" cellpadding="0" cellspacing="0" class="table_yj">
                                  <tr>
                                    <td class="tabler1td">
                                        <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table_4_1" >
                                        <thead style="background: #E8DDD0;">
                                        <tr>
                                        	<th align="center" width="7%" >
                                        		
                                        	</th>
                                        	<th width="15%" align="center" class="gridHeadTh">资源名称</th>
                                        	<th width="20%" align="center" class="gridHeadTh">资源类型</th>
                                        	<th width="15%" align="center" class="gridHeadTh">科室名称</th>
                                        	<th align="center" width="25%" class="gridHeadTh">所属分类</th>
                                        </tr>
                                        </thead>
	                                         <s:iterator value="initMap.exhibit" id="exhibit" status="exindx">	
		                                          <tr>
			                                            <td width="7%" height="35" align="center" valign="bottom">
				                                            <s:if test="#exhibit.erThumbnail == null">
				                                            	<img src="images/file/xwj_1.gif" width="30" height="25">
				                                            </s:if>
				                                            <s:if test="#exhibit.erThumbnail != null">
				                                            	<img src="${exhibit.erThumbnail}" width="30" height="25">
				                                            </s:if>
				                                        </td>
			                                   			<s:set name="pcode" value="'003023001007'" />
			                                   			<s:set name="pname" value="'erID'" />
			                                   			<s:if test="#fv.fileType == '1011'">
													<s:set name="pcode" value="'-701001'" />
												</s:if>
												<s:if
													test="#exhibit.erType == '1073' || #exhibit.erType == '1084'">
													<s:set name="pcode" value="'-701002'" />
												</s:if>
												<s:if
													test="#exhibit.erType == '2041' || #exhibit.erType == '2033' || #exhibit.erType == '2055'">
													<s:set name="pcode" value="'-701018'" />
												</s:if>
			                                   			
			                                            <td align="center" width="25%"><span>
			                                            <a onclick="window.parent.parent.parent.showView_redirect(this)"
			                                            	code="${pcode}" 
			                                            	href="javascript:void(0)"
			                                            	param="&path=${exhibit.erPath}&paramMap.roomtype=exhibition&paramMap.${pname}=${exhibit.erID}&paramMap.st=1&paramMap.name=${exhibit.erName}"
			                                            	>${exhibit.erName}</a></span></td>
			                                            <td align="center" width="20%"><span>
			                                            
			                                            ${exhibit.erType eq "1011" ? '高清图片':'' }
														${exhibit.erType eq "1022" ? '3D图片':'' }
														${exhibit.erType eq "1073" ? '音频':'' }
														${exhibit.erType eq "1084" ? '高清视频':'' }
														${exhibit.erType eq "1005" ? '动画类素材':'' }
														${exhibit.erType eq "1006" ? '其他素材':'' }
														${exhibit.erType eq "2041" ? 'PPT课件':'' }
														${exhibit.erType eq "2002" ? '动画类课件':'' }
														${exhibit.erType eq "2033" ? 'WORD课件':'' }
														${exhibit.erType eq "2055" ? 'PDF课件':'' }
														${exhibit.erType eq "2004" ? '其他课件':'' }
														${exhibit.erType eq "3031" ? '环球百科':'' }
														${exhibit.erType eq "3032" ? '文学报告':'' }
														${exhibit.erType eq "3033" ? '论文资料':'' }
														${exhibit.erType eq "3034" ? '资料图书':'' }
														${exhibit.erType eq "3035" ? '适用学段、年级与大纲':'' }
														${exhibit.erType eq "3036" ? '其他资料':'' }
			                                            
			                                          
			                                            </span></td>
			                                            <td align="center" width="15%"><span>文物博览室</span></td>
			                                            <td align="center" width="35%"><span>${exhibit.erJie}</span></td>
			                                           
		                                          </tr>
		                                           
	                                          </s:iterator>
	                                          <s:if test="initMap.exhibit.isEmpty()">
	                                             <tr>
			                                            <td width="7%" height="35" id="dataone" align="center" valign="bottom" colspan="5">
				                                          <script type="text/javascript">
															$("#dataone").html("分类下数据暂时为空!!!");
															$("#table1page").hide();
														  </script>    
			                                            </td>
		                                          </tr>
	                                          </s:if>
	                                           <tr style="height: 45px;">
												<td colspan="5">
													<div class="pageb" id="table1page">
														${initMap.exhibitPaginated.pageContent}
													</div>
												</td>
											  </tr>
                                        </table>
                                    </td>
                                  </tr>
                                </table>
                                <table width="100%" border="0" cellpadding="0" cellspacing="0" class="table_yj hide">
                                  <tr>
                                    <td class="tabler2td">
                                        <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table_4_1" >
                                        <thead style="background: #E8DDD0;">
                                        <tr>
                                        	<th align="center" width="7%" >
                                        		
                                        	</th>
                                        	<th width="15%" align="center" class="gridHeadTh">资源名称</th>
                                        	<th width="20%" align="center" class="gridHeadTh">资源类型</th>
                                        	<th width="15%" align="center" class="gridHeadTh">科室名称</th>
                                        	<th align="center" width="25%" class="gridHeadTh">所属分类</th>
                                        </tr>
                                        </thead>
	                                         <s:iterator value="initMap.observation" id="observation" status="obindx">	
		                                          <tr>
			                                            <td width="7%" height="35" align="center" valign="bottom">
				                                            <s:if test="#observation.orThumbnail == null">
				                                            	<img src="images/file/xwj_1.gif" width="30" height="25">
				                                            </s:if>
				                                            <s:if test="#observation.orThumbnail != null">
				                                            	<img src="${observation.orThumbnail}" width="30" height="25">
				                                            </s:if>                                            
			                                            </td>
				                                   		<s:set name="pcode" value="'003023002007'" />
			                                   			<s:set name="pname" value="'orID'" />
			                                   			<s:if
													test="#observation.orType == '1011' || #observation.orType == '1022'||#observation.orType == '1073' ">
													<s:set name="pcode" value="'-701004'" />
												</s:if>
												<s:if test="#observation.orType == '4033' ">
													<s:set name="pcode" value="'-701023'" />
												</s:if>
												<s:if
													test="#observation.orType == '1084'">
													<s:set name="pcode" value="'-701005'" />
												</s:if>
												<s:if
													test="#observation.orType == '2041' || #observation.orType == '2033' || #observation.orType == '2055'">
													<s:set name="pcode" value="'-701019'" />
												</s:if>                                    
			                                            <td align="center" width="25%"><span>
			                                            <a onclick="window.parent.parent.parent.showView_redirect(this)"
			                                            	code="${pcode}" 
			                                            	href="javascript:void(0)"
			                                            param="&path=${observation.path}&paramMap.roomtype=observation&paramMap.${pname}=${observation.orID}&paramMap.st=1&paramMap.name=${observation.orName}">${observation.orName}</a></span></td>
			                                            <td align="center" width="20%"><span>
			                                            
			                                            ${observation.orType eq "1011" ? '高清图片':'' }
														${observation.orType eq "1022" ? '3D图片':'' }
														${observation.orType eq "1073" ? '音频':'' }
														${observation.orType eq "1084" ? '高清视频':'' }
														${observation.orType eq "1005" ? '动画类素材':'' }
														${observation.orType eq "1006" ? '其他素材':'' }
														${observation.orType eq "2041" ? 'PPT课件':'' }
														${observation.orType eq "2002" ? '动画类课件':'' }
														${observation.orType eq "2033" ? 'WORD课件':'' }
														${observation.orType eq "2055" ? 'PDF课件':'' }
														${observation.orType eq "2004" ? '其他课件':'' }
														${observation.orType eq "3031" ? '环球百科':'' }
														${observation.orType eq "3032" ? '文学报告':'' }
														${observation.orType eq "3033" ? '论文资料':'' }
														${observation.orType eq "3034" ? '资料图书':'' }
														${observation.orType eq "3035" ? '适用学段、年级与大纲':'' }
														${observation.orType eq "3036" ? '其他资料':'' }
			                                            
			                                            </span></td>
			                                            <td align="center" width="15%"><span>专题研读室</span></td>
			                                            <td align="center" width="35%"><span>${observation.orCategoryName}</span></td>
			                                         
		                                          </tr>
	                                          </s:iterator>
	                                          <s:if test="initMap.observation.isEmpty()">
	                                             <tr>
			                                            <td width="7%" height="35" id="datatwo" align="center" valign="bottom" colspan="5">
				                                          <script type="text/javascript">
															$("#datatwo").html("分类下数据暂时为空!!!");
															$("#table2page").hide();
														  </script>    
			                                            </td>
		                                          </tr>
	                                          </s:if>
	                                          <tr style="height: 45px;">
												<td colspan="5">
													<div class="pageb" id="table2page">
														${initMap.observationPaginated.pageContent}
													</div>
												</td>
											  </tr>
                                        </table>
                                    </td>
                                  </tr>
                                </table>
                                <table width="100%" border="0" cellpadding="0" cellspacing="0" class="table_yj hide">
                                  <tr>
                                    <td class="tabler3td">
                                        <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table_4_1" >
                                        <thead style="background: #E8DDD0;">
                                        <tr>
                                        	<th align="center" width="7%" >
                                        		
                                        	</th>
                                        	<th width="15%" align="center" class="gridHeadTh">资源名称</th>
                                        	<th width="20%" align="center" class="gridHeadTh">资源类型</th>
                                        	<th width="15%" align="center" class="gridHeadTh">科室名称</th>
                                        	<th align="center" width="25%" class="gridHeadTh">所属分类</th>
                                        </tr>
                                        </thead>
	                                          <s:iterator value="initMap.laboratory" id="laboratory" status="iabindx">	
		                                          <tr>
		                                            <td width="7%" height="35" align="center" valign="bottom">
			                                            <s:if test="#laboratory.lrThumbnail == null">
			                                            	<img src="images/file/xwj_1.gif" width="30" height="25">
			                                            </s:if>
			                                            <s:if test="#laboratory.lrThumbnail != null">
			                                            	<img src="${laboratory.lrThumbnail}" width="30" height="25">
			                                            </s:if>  
		                                            </td>
		                                   			<s:set name="pcode" value="'003023003007'" />
		                                   			<s:set name="pname" value="'lrID'" />
		                                   			<s:if
													test="#laboratory.lrType == '1011' || #laboratory.lrType == '1022'||#laboratory.lrType == '1073'">
													<s:set name="pcode" value="'-701007'" />
												</s:if>
												<s:if
													test="#laboratory.lrType == '1084'">
													<s:set name="pcode" value="'-701008'" />
												</s:if>
												<s:if
													test="#laboratory.lrType == '2041' || #laboratory.lrType == '2033' || #laboratory.lrType == '2055'">
													<s:set name="pcode" value="'-701020'" />
												</s:if>                                      
		                                            <td align="center" width="25%"><span>
		                                            <a onclick="window.parent.parent.parent.showView_redirect(this)"
			                                            code="${pcode}" 
			                                            href="javascript:void(0)"
		                                            param="&path=${laboratory.path}&paramMap.roomtype=laboratory&paramMap.${pname}=${laboratory.lrID}&paramMap.st=1&paramMap.name=${laboratory.lrName}">${laboratory.lrName}</a></span></td>
		                                            <td align="center" width="20%"><span>
		                                            
		                                                ${laboratory.lrType eq "1011" ? '高清图片':'' }
														${laboratory.lrType eq "1022" ? '3D图片':'' }
														${laboratory.lrType eq "1073" ? '音频':'' }
														${laboratory.lrType eq "1084" ? '高清视频':'' }
														${laboratory.lrType eq "1005" ? '动画类素材':'' }
														${laboratory.lrType eq "1006" ? '其他素材':'' }
														${laboratory.lrType eq "2041" ? 'PPT课件':'' }
														${laboratory.lrType eq "2002" ? '动画类课件':'' }
														${laboratory.lrType eq "2033" ? 'WORD课件':'' }
														${laboratory.lrType eq "2055" ? 'PDF课件':'' }
														${laboratory.lrType eq "2004" ? '其他课件':'' }
														${laboratory.lrType eq "3031" ? '环球百科':'' }
														${laboratory.lrType eq "3032" ? '文学报告':'' }
														${laboratory.lrType eq "3033" ? '论文资料':'' }
														${laboratory.lrType eq "3034" ? '资料图书':'' }
														${laboratory.lrType eq "3035" ? '适用学段、年级与大纲':'' }
														${laboratory.lrType eq "3036" ? '其他资料':'' }
		                                            
		                                             </span></td>
		                                            <td align="center" width="15%"><span>教学研究室</span></td>
		                                            <td align="center" width="35%"><span>${laboratory.lrCategoryName}</span></td>
		                                           
		                                          </tr>
	                                          </s:iterator>
	                                           <s:if test="initMap.laboratory.isEmpty()">
	                                             <tr>
			                                            <td width="7%" height="35" id="datathree" align="center" valign="bottom" colspan="5">
				                                          <script type="text/javascript">
															$("#datathree").html("分类下数据暂时为空!!!");
															$("#table3page").hide();
														  </script>    
			                                            </td>
		                                          </tr>
	                                          </s:if>
	                                          <tr style="height: 45px;">
												<td colspan="5">
													<div class="pageb" id="table3page">
														${initMap.laboratoryPaginated.pageContent}
													</div>
												</td>
											  </tr>
                                        </table>
                                    </td>
                                  </tr>
                                </table>
                                <table width="100%" border="0" cellpadding="0" cellspacing="0" class="table_yj hide">
                                  <tr>
                                    <td class="tabler4td">
                                        <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table_4_1" >
                                        <thead style="background: #E8DDD0;">
                                        <tr>
                                        	<th align="center" width="7%" >
                                        		
                                        	</th>
                                        	<th width="15%" align="center" class="gridHeadTh">资源名称</th>
                                        	<th width="20%" align="center" class="gridHeadTh">资源类型</th>
                                        	<th width="15%" align="center" class="gridHeadTh">科室名称</th>
                                        	<th align="center" width="25%" class="gridHeadTh">所属分类</th>
                                        </tr>
                                        </thead>
                                          <s:iterator value="initMap.projection" id="projection" status="proindx">	
                                          <tr>
                                            <td width="7%" height="35" align="center" valign="bottom">
                                             <s:if test="#projection.prThumbnail == null">
                                            	<img src="images/file/xwj_1.gif" width="30" height="25">
                                            </s:if>
                                            <s:if test="#projection.prThumbnail != null">
                                            	<img src="${projection.prThumbnail}" width="30" height="25">
                                            </s:if>  
                                            <s:set name="pname" value="'prID'" />
                                            </td>
                                   			<s:if
													test="#projection.prType == '1011' || #projection.prType  == '1022'">
													<s:set name="pcode" value="'-701010'" />
												</s:if>
												<s:if test="#projection.prType  == '1084'">
													<s:set name="pcode" value="'-701011'" />
												</s:if>
												<s:if test="#projection.prType  == '1073'">
													<s:set name="pcode" value="'-701024'" />
												</s:if>
												<s:if
													test="#projection.prType  == '2041' || #projection.prType  == '2033' || #projection.prType  == '2055'">
													<s:set name="pcode" value="'-701021'" />
												</s:if>
                                            <td align="center" width="25%"><span>
                                            <a onclick="window.parent.parent.parent.showView_redirect(this)"
			                                   code="${pcode}" 
			                                   href="javascript:void(0)"
                                            param="&path=${projection.path}&paramMap.roomtype=projection&paramMap.${pname}=${projection.prID}&paramMap.st=1&paramMap.name=${projection.prName}">${projection.prName}</a></span></td>
                                            <td align="center" width="20%"><span>
                                            
                                            	${projection.prType eq "1011" ? '高清图片':'' }
												${projection.prType eq "1022" ? '3D图片':'' }
												${projection.prType eq "1073" ? '音频':'' }
												${projection.prType eq "1084" ? '高清视频':'' }
												${projection.prType eq "1005" ? '动画类素材':'' }
												${projection.prType eq "1006" ? '其他素材':'' }
												${projection.prType eq "2041" ? 'PPT课件':'' }
												${projection.prType eq "2002" ? '动画类课件':'' }
												${projection.prType eq "2033" ? 'WORD课件':'' }
												${projection.prType eq "2055" ? 'PDF课件':'' }
												${projection.prType eq "2004" ? '其他课件':'' }
												${projection.prType eq "3031" ? '环球百科':'' }
												${projection.prType eq "3032" ? '文学报告':'' }
												${projection.prType eq "3033" ? '论文资料':'' }
												${projection.prType eq "3034" ? '资料图书':'' }
												${projection.prType eq "3035" ? '适用学段、年级与大纲':'' }
												${projection.prType eq "3036" ? '其他资料':'' }
                                                
                                                </span></td>
                                            <td align="center" width="15%"><span>影像资料室</span></td>
                                            <td align="center" width="35%"><span>${projection.prCategoryName}</span></td>
                                         
                                          </tr>
                                          </s:iterator>
                                           <s:if test="initMap.projection.isEmpty()">
	                                             <tr>
			                                            <td width="7%" height="35" id="datafour" align="center" valign="bottom" colspan="5">
				                                          <script type="text/javascript">
															$("#datafour").html("分类下数据暂时为空!!!");
															$("#table4page").hide();
														  </script>    
			                                            </td>
		                                          </tr>
	                                          </s:if>
                                          <tr style="height: 45px;">
												<td colspan="5">
													<div class="pageb" id="table4page">
														${initMap.projectionPaginated.pageContent}
													</div>
												</td>
											  </tr>
                                        </table>
                                    </td>
                                  </tr>
                                </table>
                                <table width="100%" border="0" cellpadding="0" cellspacing="0" class="table_yj hide">
                                  <tr>
                                    <td class="tabler5td">
                                        <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table_4_1" >
                                        <thead style="background: #E8DDD0;">
                                        <tr>
                                        	<th align="center" width="7%" >
                                        		
                                        	</th>
                                        	<th width="15%" align="center" class="gridHeadTh">资源名称</th>
                                        	<th width="20%" align="center" class="gridHeadTh">资源类型</th>
                                        	<th width="15%" align="center" class="gridHeadTh">科室名称</th>
                                        	<th align="center" width="25%" class="gridHeadTh">所属分类</th>
                                        </tr>
                                        </thead>
                                          <s:iterator value="initMap.lovely" id="lovely" status="crlindx">	
                                          <tr>
                                            <td width="7%" height="35" align="center" valign="bottom">
                                             <s:if test="#lovely.crThumbnail == null">
                                            	<img src="images/file/xwj_1.gif" width="30" height="25">
                                            </s:if>
                                            <s:if test="#lovely.crThumbnail != null">
                                            	<img src="${lovely.crThumbnail}" width="30" height="25">
                                            </s:if>  
                                          	 <s:set name="pname" value="'crID'" />
                                   			<s:if test="#lovely.crType == '1011'||#lovely.crType == '1022'||#lovely.crType == '1073'||#lovely.crType == '4033'">
                                   				<s:set name="pcode" value="'-701016'" />
                                   			</s:if>   
                                   			<s:if test="#lovely.crType == '1084'">
                                   				<s:set name="pcode" value="'-701017'" />
                                   			</s:if> 
                                   			<s:if
												test="#lovely.crType == '2041' || #lovely.crType == '2033' || #lovely.crType == '2055'">
												<s:set name="pcode" value="'-701022'" />
											</s:if>
                                            <td align="center" width="25%"><span>
                                            <a onclick="window.parent.parent.parent.showView_redirect(this)" 
			                                   code="${pcode}"
			                                   param="&path=${lovely.path}&paramMap.roomtype=lovely&paramMap.${pname}=${lovely.crID}&paramMap.st=1&paramMap.name=${lovely.crName}"
			                                   href="javascript:void(0)" >${lovely.crName}</a></span></td>
                                            <td align="center" width="20%"><span>
                                                ${lovely.crType eq "1011" ? '高清图片':'' }
												${lovely.crType eq "1022" ? '3D图片':'' }
												${lovely.crType eq "1073" ? '音频':'' }
												${lovely.crType eq "1084" ? '高清视频':'' }
												${lovely.crType eq "1005" ? '动画类素材':'' }
												${lovely.crType eq "1006" ? '其他素材':'' }
												${lovely.crType eq "2041" ? 'PPT课件':'' }
												${lovely.crType eq "2002" ? '动画类课件':'' }
												${lovely.crType eq "2033" ? 'WORD课件':'' }
												${lovely.crType eq "2055" ? 'PDF课件':'' }
												${lovely.crType eq "2004" ? '其他课件':'' }
												${lovely.crType eq "3031" ? '环球百科':'' }
												${lovely.crType eq "3032" ? '文学报告':'' }
												${lovely.crType eq "3033" ? '论文资料':'' }
												${lovely.crType eq "3034" ? '资料图书':'' }
												${lovely.crType eq "3035" ? '适用学段、年级与大纲':'' }
												${lovely.crType eq "3036" ? '其他资料':'' }
                                                
                                            	
                                          </span></td>
                                            <td align="center" width="15%"><span>情系家园</span></td>
                                           
                                            <td align="center" width="35%"><span>${lovely.crCategoryName}</span></td>
                                           
                                          </tr>
                                     
                                          </s:iterator>
                                          <s:if test="initMap.lovely.isEmpty()">
                                             <tr>
		                                            <td width="7%" height="35" id="datafive" align="center" valign="bottom" colspan="5">
			                                          <script type="text/javascript">
														$("#datafive").html("分类下数据暂时为空!!!");
														$("#table5page").hide();
													  </script>    
		                                            </td>
	                                          </tr>
                                          </s:if>
                                          <tr style="height: 45px;">
												<td colspan="5">
													<div class="pageb" id="table5page">
														${initMap.lovalyPaginated.pageContent}
													</div>
												</td>
											  </tr>
                                        </table>
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
</HTML>
