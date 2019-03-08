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
	
	
	$("#createresbyroom").click(function(){
		var clickthis = $("#change_type").val();
		if(clickthis==0){
			window.location.href="decorateForwardAction.action?code=002032003001001" ;
		}else if(clickthis==1){
			window.location.href="decorateForwardAction.action?code=002032003001002" ;
		}else if(clickthis==2){
			window.location.href="decorateForwardAction.action?code=002032003001003" ;
		}else if(clickthis==3){
			window.location.href="decorateForwardAction.action?code=002032003001004" ;
		}else if(clickthis==4){
			window.location.href="decorateForwardAction.action?code=002032003001005" ;
		}
	});	
	 $(".shareBtn").die().live("click",function(){
		var code=$(this).attr("code");
		
		var pValue=$(this).attr("pValue");
		var share=$(this).attr("share");
		var grShare=share.substring(share.indexOf('=')+1);
		var grResourceType="";
		var roomFlag=share.substring(share.indexOf('.')+1,share.indexOf('.')+3);
		if (roomFlag=="er"){
			grResourceType="exhibition";
		}else if(roomFlag=="or"){
			grResourceType="observation";
		}else if(roomFlag=="pr"){
			grResourceType="projection";
		}else if(roomFlag=="cr"){
			grResourceType="lovely";
		}else if(roomFlag=="lr"){
			grResourceType="laboratory";
		}
		var grResourceID=pValue.substring(pValue.indexOf('=')+1);
	  
		var liObj=$(this);
		var str="确定要分享这个资源吗";
		if(share.charAt(share.length - 1)=="0"){
			str="确定要取消分享这个资源吗";
		}
		if(confirm(str)){
			$.ajax({
				url:		'ajaxAction.action?code='+code+'&'+pValue+'&'+share+'&paramMap.grIsShare='+grShare+'&paramMap.grResourceType='+grResourceType+'&paramMap.grResourceID='+grResourceID+'&paramMap.rrIsShare='+grShare+'&paramMap.rrResourceType='+grResourceType+'&paramMap.rrResourceID='+grResourceID,
				type:	    'post',
				timeout:	'60000',
				data:	Array(),
				dataType:	'json',
				beforeSend:function(request){},
				complete:function(request,textStatus){},
				success:function(jsonData,textStatus){
					if (textStatus == "success"){
						
						//if(jsonData.flag>0){
							if(share.charAt(share.length - 1)=="0"){
								alert("取消分享成功");
								//liObj.parent().remove();
								var reg = /\d+/g;
								share = share.replace(reg, function($0){
								    var i = parseInt($0, 10);
								    if(i==1){
								    	i=0;
								    }else if(i==0){
								    	i=1;
								    }
								    return i;
								});
								//alert(share);
								liObj.attr("share",share);
								liObj.html("分享");
							}else{
							alert("分享成功");
							//liObj.parent().remove();
							var reg = /\d+/g;
							share = share.replace(reg, function($0){
							    var i = parseInt($0, 10);
							    if(i==1){
							    	i=0;
							    }else if(i==0){
							    	i=1;
							    }
							    return i;
							});
							//alert(share);
							liObj.attr("share",share);
							liObj.html("已分享");
							//liObj.parent().parent().remove();
							}		
					}
					}	
				//}
			}); 
		}
		
	})
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
.table_yj tr td span a{color: #924100;}
</style>
</head>
<body >
<form name="actionForm" method="post" action="decorateForwardAction.action" id="actionForm">
<input type="hidden" id="change_type" value="${(paramMap.change_type==null||paramMap.change_type=='')?0:paramMap.change_type}">
<table width="100%" height="100%" border="0" cellspacing="0" cellpadding="0" >
  <tr>
    <td valign="top">
		<table width="100%" border="0" cellspacing="0" cellpadding="0" >
			<tr>
				<td>
					<table width="100%" border="0" cellspacing="0" cellpadding="0" class="table_1" >
					  <tr>
						<td valign="top" bgcolor="#E6E6EA">
                        	<table width="100%" border="0" cellspacing="0" cellpadding="0" class="table_12 list-table" >
							  <tr>
								<td style="height:32px;">
									<div class="ziyuantab lt-command">
										<div class="ziyuantab lt-command">
										<div style="float: right;margin-right: 15px;">
									 	
										<input  placeholder="输入查询内容"  type="text" name="searchMap.rfName" value="" id="rfName" />
										<s:if test="pmsIndex.my_favorite_search">
											<a href="javascript:void(0)" id="search_favorite" code="${pmsIndex.my_favorite_mgr.code}"><span>${pmsIndex.my_favorite_search.name}</span></a>
										</s:if>	
									</div>
								 	<div style="float: right;margin-right: 15px;">
							 			<select name="searchMap.rfSortName" id="rfSortName" >
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
                                    <td class="tabler3td">
                                        <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table_4_1" style="background-color:#F8F4ED">
                                        <thead style="background: #E8DDD0;">
                                        <tr>
                                        	<th align="center" width="7%" >
                                        		
                                        	</th>
                                        	<th width="15%" align="center" class="gridHeadTh">资源名称</th>
                                        	<th width="20%" align="center" class="gridHeadTh">资源类型</th>
                                        	<th width="15%" align="center" class="gridHeadTh">科室名称</th>
                                        	<th width="20%" align="center" class="gridHeadTh">创建时间</th>
                                        	<th align="center" width="25%" class="gridHeadTh">操作</th></tr>
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
			                                   			<s:if test="#exhibit.erType == '1011'">
			                                   				<s:set name="pcode" value="'-701001'" />
			                                   			</s:if>
			                                            <td align="center" width="15%"><span><a onclick="window.parent.parent.parent.showView_favorite(this)" param="${exhibit.rfResourceURL}" href="javascript:void(0)">${exhibit.rfName}</a></span></td>
			                                            <td align="center" width="20%"><span>${exhibit.rfResType}</span></td>
			                                            <td align="center" width="15%"><span>文物博览室</span></td>
			                                            <td align="center" width="20%"><span>${exhibit.rfCreateTime}</span></td>
			                                            <td align="center" width="25%">
			                                            <span><a href="decorateForwardAction.action?code=${pmsIndex.my_favorite_delete.code}&paramMap.rfId=${exhibit.rfId}">删除</a></span>
			                                            </td>
		                                          </tr>
	                                          </s:iterator>
	                                           <tr style="height: 45px;">
												<td colspan="6">
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
                                    <td class="tabler3td">
                                        <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table_4_1" style="background-color:#F8F4ED;">
                                        <thead style="background: #E8DDD0;">
                                        <tr>
                                        	<th align="center" width="7%" >
                                        		
                                        	</th>
                                        	<th width="15%" align="center" class="gridHeadTh">资源名称</th>
                                        	<th width="20%" align="center" class="gridHeadTh">资源类型</th>
                                        	<th width="15%" align="center" class="gridHeadTh">科室名称</th>
                                        	<th width="20%" align="center" class="gridHeadTh">创建时间</th>
                                        	<th align="center" width="25%" class="gridHeadTh">操作</th></tr>
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
			                                   			<s:if test="#observation.orType == '1011' || #observation.orType == '1022'|| #observation.orType == '1073'|| #observation.orType == '4033'">
			                                   				<s:set name="pcode" value="'-701004'" />
			                                   			</s:if>
			                                   			<s:if test="#observation.orType == '4033' ">
			                                   				<s:set name="pcode" value="'-701004'" />
			                                   			</s:if>
			                                   			<s:if test="#observation.orType == '1084'">
			                                   				<s:set name="pcode" value="'-701005'" />
			                                   			</s:if>     
			                                   			<s:if test="#observation.orType == '2041' || #observation.orType == '2033' || #observation.orType == '2055'">
			                                   				<s:set name="pcode" value="'-701019'" />
			                                   			</s:if>                                       
			                                            <td align="center" width="15%"><span>
			                                            <a onclick="window.parent.parent.parent.showView_favorite(this)" param="${observation.rfResourceURL}" 
			                                            	href="javascript:void(0)">${observation.rfName}</a></span></td>
			                                            <td align="center" width="20%"><span>${observation.rfResType}</span></td>
			                                            <td align="center" width="15%"><span>专题研读室</span></td>
			                                            <td align="center" width="20%"><span>${observation.rfCreateTime}</span></td>
			                                            <td align="center" width="25%">
			                                            		<a href="decorateForwardAction.action?code=${pmsIndex.my_favorite_delete.code}&paramMap.rfId=${observation.rfId}">删除</a>
			                                            </td>
		                                          </tr>
	                                          </s:iterator>
	                                          <tr style="height: 45px;">
												<td colspan="6">
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
                                        <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table_4_1" style="background-color:#F8F4ED;">
                                        <thead style="background: #E8DDD0;">
                                        <tr>
                                        	<th align="center" width="7%" >
                                        		
                                        	</th>
                                        	<th width="15%" align="center" class="gridHeadTh">资源名称</th>
                                        	<th width="20%" align="center" class="gridHeadTh">资源类型</th>
                                        	<th width="15%" align="center" class="gridHeadTh">科室名称</th>
                                        	<th width="20%" align="center" class="gridHeadTh">创建时间</th>
                                        	<th align="center" width="25%" class="gridHeadTh">操作</th></tr>
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
		                                   			<s:if test="#laboratory.lrType == '1011' || #laboratory.lrType == '1022'|| #laboratory.lrType == '1073'|| #laboratory.lrType == '4033'">
		                                   				<s:set name="pcode" value="'-701007'" />
		                                   			</s:if>
		                                   			<s:if test="#laboratory.lrType == '1084'">
		                                   				<s:set name="pcode" value="'-701008'" />
		                                   			</s:if>            
		                                   			<s:if test="#laboratory.lrType == '2041' || #laboratory.lrType == '2033' || #laboratory.lrType == '2055'">
		                                   				<s:set name="pcode" value="'-701020'" />
		                                   			</s:if>                                       
		                                            <td align="center" width="15%"><span>
		                                            <a  onclick="window.parent.parent.parent.showView_favorite(this)" param="${laboratory.rfResourceURL}" 
			                                            	href="javascript:void(0)">${laboratory.rfName}</a></span></td>
		                                            <td align="center" width="20%"><span>${laboratory.rfResType}</span></td>
		                                            <td align="center" width="15%"><span>教学研究室</span></td>
		                                            <td align="center" width="20%"><span>${laboratory.rfCreateTime}</span></td>
		                                            <td align="center" width="25%">
		                                            	<a href="decorateForwardAction.action?code=${pmsIndex.my_favorite_delete.code}&paramMap.rfId=${laboratory.rfId}">删除</a>
		                                            </td>
		                                          </tr>
	                                          </s:iterator>
	                                          <tr style="height: 45px;">
												<td colspan="6">
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
                                    <td class="tabler3td">
                                        <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table_4_1" style="background-color:#F8F4ED;">
                                        <thead style="background: #E8DDD0;">
                                        <tr>
                                        	<th align="center" width="7%" >
                                        		
                                        	</th>
                                        	<th width="15%" align="center" class="gridHeadTh">资源名称</th>
                                        	<th width="20%" align="center" class="gridHeadTh">资源类型</th>
                                        	<th width="15%" align="center" class="gridHeadTh">科室名称</th>
                                        	<th width="20%" align="center" class="gridHeadTh">创建时间</th>
                                        	<th align="center" width="25%" class="gridHeadTh">操作</th></tr>
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
                                            </td>
                                   			<s:set name="pcode" value="'003023004008'" />
                                   			<s:set name="pname" value="'prID'" />
                                   			<s:if test="#projection.prType == '1084'">
                                   				<s:set name="pcode" value="'-701011'" />
                                   			</s:if>           
                                   			<s:if test="#projection.prType == '1073'">
                                   				<s:set name="pcode" value="'-701024'" />
                                   			</s:if>
                                            <td align="center" width="15%"><span>
                                            <a onclick="window.parent.parent.parent.showView_favorite(this)" param="${projection.rfResourceURL}" 
			                                   href="javascript:void(0)">${projection.rfName}</a></span></td>
                                            <td align="center" width="20%"><span>${projection.rfResType}</span></td>
                                            <td align="center" width="15%"><span>影像资料室</span></td>
                                            <td align="center" width="20%"><span>${projection.rfCreateTime}</span></td>
                                            <td align="center" width="25%">
                                            	<a href="decorateForwardAction.action?code=${pmsIndex.my_favorite_delete.code}&paramMap.rfId=${projection.rfId}">删除</a>
                                            </td>
                                          </tr>
                                          </s:iterator>
                                          <tr style="height: 45px;">
												<td colspan="6">
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
                                    <td class="tabler3td">
                                        <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table_4_1" style="background-color:#F8F4ED;">
                                        <thead style="background: #E8DDD0;">
                                        <tr>
                                        	<th align="center" width="7%" >
                                        		
                                        	</th>
                                        	<th width="15%" align="center" class="gridHeadTh">资源名称</th>
                                        	<th width="20%" align="center" class="gridHeadTh">资源类型</th>
                                        	<th width="15%" align="center" class="gridHeadTh">科室名称</th>
                                        	<th width="20%" align="center" class="gridHeadTh">创建时间</th>
                                        	<th align="center" width="25%" class="gridHeadTh">操作</th></tr>
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
                                            </td>
                                   			<s:set name="pcode" value="'003023004008'" />
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
                                            <td align="center" width="15%"><span>
                                            <a onclick="window.parent.parent.parent.showView_favorite(this)" param="${lovely.rfResourceURL}" 
			                                   href="javascript:void(0)" >${lovely.rfName}</a></span></td>
                                            <td align="center" width="20%"><span>${lovely.rfResType}</span></td>
                                            <td align="center" width="15%"><span>情系家园</span></td>
                                            <td align="center" width="20%"><span>${lovely.rfCreateTime}</span></td>
                                            <td align="center" width="25%">
                                            	<a href="decorateForwardAction.action?code=${pmsIndex.my_favorite_delete.code}&paramMap.rfId=${lovely.rfId}">删除</a>
                                            </td>
                                          </tr>
                                          </s:iterator>
                                          <tr style="height: 45px;">
												<td colspan="6">
													<div class="pageb" id="table4page">
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