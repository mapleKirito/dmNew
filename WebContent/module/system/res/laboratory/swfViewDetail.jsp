<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title></title>
<link href="css/style-ce.css" rel="stylesheet" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/js/artDialog/artDialog.css">
 	<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.7.2.min.js"></script>
 	<script type="text/javascript" src="<%=request.getContextPath()%>/js/tweenmax.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/artDialog/artDialog.4.1.4.js?skin=default"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/artDialog/iframeTools.4.1.4.js"></script>
 	<script src="<%=request.getContextPath()%>/js/scripts.js"></script>  
  	<script type="text/javascript" src="<%=request.getContextPath()%>/js/flexpaper_flash_debug.js"></script>

<script type="text/javascript">
$(document).ready(function(){	
	
/* 	$(".res-detail").height($(window).innerHeight()-60);
 */	$("#viewerPlaceHolder").height($(window).innerHeight()-38).css("margin-top","20px");
	
	$("#centermiddleimg").LoadImage(true,$("#mainFramewidth",parent.document).val(),$("#mainFrameheight",parent.document).val()).parent().parent().css("height",$("#mainFrameheight",parent.document).val());
	
	//   #revM  评论信息模块
	
	$(".relative-res-body .imgresource a").click(function(){
		var i_ = $(this).attr("name");
		var resid = i_.substring(i_.indexOf("lrID")+5,i_.indexOf("&"));
		var roomtype = i_.substring(i_.indexOf("roomtype")+9,i_.lastIndexOf("&"));

		$.ajax({
		  	url:		'SmallServlet/ser?ID='+resid+'&roomname='+roomtype,
			type:	    'post',
			timeout:	'60000',
			data:	Array(),
			dataType:	'json',
			beforeSend:function(request){},
			complete:function(request,textStatus){},
			success:function(jsonData,textStatus){
			if (textStatus == "success"){
				$("#lrCode").html(jsonData.LR_Code);
				$("#centermiddleimg").attr("src",jsonData.LR_InThum);
			}}
		});
	});
	
	$(".rc-position").click(function(){
		$("#revM").hide();
		art.dialog.data('lrlalo', '${paramMap.lrLoLa}');
		art.dialog.data('contextPath', '<%=request.getContextPath()%>');
		art.dialog.open('<%=request.getContextPath()%>/module/enginev/MapBaidu2.jsp',{width:611,height:374,title:'出土地',lock:'true',background:'#000000',opacity: '0.85'}) ;
	});
	
	$(".rc-qrcode").click(function(){
		$("#revM").hide();
		var curWwwPath=window.document.location.href; 
		var pathName=window.document.location.pathname; 
		var pos=curWwwPath.indexOf(pathName); 
		var localhostPaht=curWwwPath.substring(0,pos); 
		//var st=localhostPaht+"/dm/show_page?id=${initMap.videoDetail.lrCode}&pageName=scanner";
		var st=localhostPaht+"/dm/page/scanner/"+code+"/scanner.html";
		art.dialog.data('str', st);
		art.dialog.data('code', "${initMap.videoDetail.lrCode}");
		art.dialog.data('contextPath', '<%=request.getContextPath()%>');
		art.dialog.open('<%=request.getContextPath()%>/qrcode.jsp',{width:266,height:304,title:'二维码扫描',lock:'true',background:'#000000',opacity: '0.85'}) ;
	});
	
	//$("#revL").load("decorateForwardAction.action?code=-600604&paramMap.ptype=laboratory&paramMap.pid="+$("#reviewID").val()+"&paramMap.resURL="+$(".addFavorite").attr("id")+"&paramMap.userID=${paramMap.s_userID}&paramMap.userType=${paramMap.s_userType}");
	$("#revR").click(function(){
		//$("#revL").load("decorateForwardAction.action?code=-600604&paramMap.ptype=exhibition&paramMap.pid="+$("#reviewID").val()+"&paramMap.resURL="+$(".addFavorite").attr("id")+"&paramMap.userID=${paramMap.s_userID}&paramMap.userType=${paramMap.s_userType}");
		art.dialog.data('ptype', "laboratory");
		art.dialog.data('reviewID', $("#reviewID").val());
		art.dialog.data('resURL', $(".addFavorite").attr("id"));
		$("#isOpen",window.parent.document).attr("value",1);
		art.dialog.open('<%=request.getContextPath()%>/module/enginev/pinglun.jsp',{width:611,height:374,title:'资源评论详情',lock:'true',background:'#000000',opacity: '0.85'}) ;
	});
	
	 /*资源详细页面JS*/
    $(".res-controls li>a.rc").mouseover(function () {
        $(this).addClass("hover");
        $("div.hide-popup").fadeOut();
        $("div.popup-" + $(this).attr("data-type")).fadeIn();
    });
    $("div.hide-popup").mouseleave(function () {
        $(".res-controls li>a.rc").removeClass("hover");
        $("div.hide-popup").fadeOut();
    });

    $('#revL,.hide-popup-content').rollbar({ zIndex: 10, pathPadding: "0px" });

    $.ajax({
		url:		'ajaxAction.action?suiji='+new Date().getTime()+'&code=${code}&paramMap.roomtype=laboratory&paramMap.lrID=${initMap.videoDetail.lrID}',
		type:	    'post',
		timeout:	'60000',
		data:	Array(),
		dataType:	'json',
		beforeSend:function(request){},//ajax执行前调用函数
		complete:function(request,textStatus){},//ajax请求完成后调用函数
		success:function(jsonData,textStatus){//ajax请求成功调用函数
			if (textStatus == "success"){
				//alert(jsonData.list.length);
				for(var i=0;i<jsonData.list.length;i++){
					var resType=jsonData.list[i].resType;
					var pname="";
					var broomname="";
					var pcode="";
					if(resType=="exhibition"){
						pname="erID";
						broomname="er";
						pcode="-701003";
						if(jsonData.list[i].fileType=="1011"){
							pcode="-701001";
						}else if(jsonData.list[i].fileType=="1073"||jsonData.list[i].fileType=="1084"){
							pcode="-701002";
						}else if(jsonData.list[i].fileType=="2041"||jsonData.list[i].fileType=="2033"||jsonData.list[i].fileType=="2055"){
							pcode="-701018";
						}
					}else if(resType=="observation"){
						pname="orID";
						broomname="or";
						pcode="-701006";
						if(jsonData.list[i].fileType=="1011"||jsonData.list[i].fileType=="1022"){
							pcode="-701004";
						}else if(jsonData.list[i].fileType=="4033"){
							pcode="-701023";
						}else if(jsonData.list[i].fileType=="1073"||jsonData.list[i].fileType=="1084"){
							pcode="-701005";
						}else if(jsonData.list[i].fileType=="2041"||jsonData.list[i].fileType=="2033"||jsonData.list[i].fileType=="2055"){
							pcode="-701019";
						}
					}else if(resType=="laboratory"){
						pname="lrID";
						broomname="lr";
						pcode="-701009";
						if(jsonData.list[i].fileType=="1011"||jsonData.list[i].fileType=="1022"){
							pcode="-701007";
						}else if(jsonData.list[i].fileType=="1073"||jsonData.list[i].fileType=="1084"){
							pcode="-701008";
						}else if(jsonData.list[i].fileType=="2041"||jsonData.list[i].fileType=="2033"||jsonData.list[i].fileType=="2055"){
							pcode="-701020";
						}
					}else if(resType=="projection"){
						pname="prID";
						broomname="pr";
						pcode="-701012";
						if(jsonData.list[i].fileType=="1011"||jsonData.list[i].fileType=="1022"){
							pcode="-701010";
						}else if(jsonData.list[i].fileType=="1073"||jsonData.list[i].fileType=="1084"){
							pcode="-701011";
						}else if(jsonData.list[i].fileType=="2041"||jsonData.list[i].fileType=="2033"||jsonData.list[i].fileType=="2055"){
							pcode="-701021";
						}
					}else if(resType=="lovely"){
						pname="crID";
						broomname="cr";
						pcode="-701013";
						if(jsonData.list[i].fileType=="1011"||jsonData.list[i].fileType=="1022"){
							pcode="-701016";
						}else if(jsonData.list[i].fileType=="1073"||jsonData.list[i].fileType=="1084"){
							pcode="-701017";
						}else if(jsonData.list[i].fileType=="2041"||jsonData.list[i].fileType=="2033"||jsonData.list[i].fileType=="2055"){
							pcode="-701022";
						}else if(jsonData.list[i].fileType=="3036"){
							pcode="-701030";
						}
					}
					
					//alert(jsonData.list[i].id);
					var hreft="decorateForwardAction.action?code="+pcode+"&path="+jsonData.list[i].path+"&paramMap."+broomname+"Type="+jsonData.list[i].fileType+"&paramMap.fileType="+jsonData.list[i].fileType+"&paramMap."+pname+"="+jsonData.list[i].id+"&paramMap.st=1&paramMap.temppname="+pname+"&paramMap.temppid="+jsonData.list[i].id+"&paramMap.name="+jsonData.list[i].name+"&paramMap.roomtype="+jsonData.list[i].resType;
					//alert($("#resAll_"+jsonData.list[i].id).html());
					$(".resAll_"+jsonData.list[i].id).find("a").attr("hreft",hreft);
					$(".resAll_"+jsonData.list[i].id).find("a").find("img").attr("src",jsonData.list[i].thumbnail)
					
				}
				
			}
		},
		//ajax请求错误后调用函数
		error:function(request,textStatus,error){}
	}); 
  
});
function reflushSwfPlayer(path){
	var fp = new FlexPaperViewer(	
			 '<%=request.getContextPath()%>/online_read_module/FlexPaperViewer',
			 'viewerPlaceHolder', { config : {
			 SwfFile : path,
			 Scale : 1.3, 
			 ZoomTransition : 'easeOut',
			 ZoomTime : 0.5,
			 ZoomInterval : 0.2,
			 FitPageOnLoad : false,
			 FitWidthOnLoad : false,
			 PrintEnabled : true,
			 FullScreenAsMaxWindow : false,
			 ProgressiveLoading : false,
			 MinZoomSize : 0.2,
			 MaxZoomSize : 5,
			 SearchMatchAll : false,
			 InitViewMode : 'Portrait',
			 ViewModeToolsVisible : true,
			 ZoomToolsVisible : true,
			 NavToolsVisible : true,
			 CursorToolsVisible : true,
			 SearchToolsVisible : true,
				 localeChain: 'en_US'
			 }});
}
</script>
<style type="text/css">
.res_name{
	margin: 0;
	background: url(<%=request.getContextPath()%>/images-ce/detaltop.png) center no-repeat;
	background-size: cover;
	-ms-behavior: url(<%=request.getContextPath()%>/css/backgroundsize.min.htc);
	behavior: url(<%=request.getContextPath()%>/css/backgroundsize.min.htc);
}
</style> 
</head>
<body>
<input type="hidden" class="image_w" value="">
<input type="hidden" class="image_h" value="">
<input type="hidden" class="roomname" value="laboratory">
<input type="hidden" id="lrCode" value="${initMap.videoDetail.lrNo}">
<input type="hidden" id="lrName" value="${initMap.videoDetail.lrName}">
<input type="hidden" id="lrUpload" value="${initMap.videoDetail.lrUpload}">
<input type="hidden" id="resURL" value="${code}|${paramMap.path}|laboratory|${paramMap.st}|${initMap.videoDetail.lrName}|${initMap.videoDetail.lrType}|${initMap.videoDetail.lrID}">
<input type="hidden" id="userID" value="${paramMap.s_userID}">
<input type="hidden" id="userType" value="${paramMap.s_userType}">

 <div id="layout_mainbody">
 	 <div class="res-detail-info">
                    <h4 class="res_name" style="background:url(<%=request.getContextPath()%>/images-ce/detaltop.png) center bottom no-repeat; background-size:100% 100%;background-image: url('<%=request.getContextPath()%>/images-ce/detaltop.png');background-size: cover; "><b>资源名称：</b>${initMap.videoDetail.lrName}</h4>
                    
                </div>
                <!--弹出菜单数据-->
                
                <div class="page-container">
                    <!--资源详细开始-->
                    <div class="res-detail_x">
                        <div class="controll">
                            <a href="javascript:void(0);" data-type="pre" class="btn pre"><i class="res-scroll-pre"></i></a>
                            <a href="javascript:void(0);" data-type="next" class="btn next"><i class="res-scroll-next"></i></a>
                         </div> 
                          <div  class="controll" style="display: none;">
                            <a href="javascript:void(0);" data-type="pre_x" class="btn_x pre_x"><i class="res-scroll-pre_x"></i></a>
                            <a href="javascript:void(0);" data-type="next_x" class="btn_x next_x"><i class="res-scroll-next_x"></i></a>
                           </div>
                           <div class="res-detail-container">
                           <a href="javascript:void(0);">
                           	 <img src=""  style="display:none;"/> 
                          	<div id="viewerPlaceHolder"  style="display:block" > 
                          	</div>
						        <script type="text/javascript"> 
						       	var swfPath = "<%=request.getContextPath()%>/${initMap.videoDetail.lrFileSwfPath}";
								var fp = new FlexPaperViewer(	
										 '<%=request.getContextPath()%>/online_read_module/FlexPaperViewer',
										 'viewerPlaceHolder', { config : {
										 SwfFile : swfPath,
										 Scale : 1.3, 
										 ZoomTransition : 'easeOut',
										 ZoomTime : 0.5,
										 ZoomInterval : 0.2,
										 FitPageOnLoad : false,
										 FitWidthOnLoad : false,
										 PrintEnabled : true,
										 FullScreenAsMaxWindow : false,
										 ProgressiveLoading : false,
										 MinZoomSize : 0.2,
										 MaxZoomSize : 5,
										 SearchMatchAll : false,
										 InitViewMode : 'Portrait',
										 ViewModeToolsVisible : true,
										 ZoomToolsVisible : true,
										 NavToolsVisible : true,
										 CursorToolsVisible : true,
										 SearchToolsVisible : true,
					 						 localeChain: 'en_US'
										 }});
						 
						        </script>	                                         	
											
                            </a>
                           <%--  <span class="title"><b>资源名称：</b>${initMap.videoDetail.lrName}</span> --%>
                        </div>
                    </div>
                    <!--资源详细结束-->

                    <!--相关资源-->
                    <div class="relative-res res-detail-info">
                         <div class="relative-res-title">
                            <a class="tab on shiqi" href="javascript:void(0);">相关资源</a>
                           <!--  <a class="tab leixing" href="javascript:void(0);">相关资源</a> -->
                            <span class="toggle">
                                <a href="javascript:void(0);"><i></i><b>展开</b></a>
                            </span>
                            <ul class="res-controls">
		                       <li title="下载">
				                  	<a href="javascript:void(0);" title="资源下载" data-type="rc-cloud-down" class="rc rc-cloud-down"></a>
				                  	<div class="hide-popup popup-rc-cloud-down rc-cloud-down">
				                         
				                          <div class="hide-popup-content hide-popup-content-cloud-down">
				                              <table>
				                                  <tr>
				                                      <td class="key keya"><a href="downloadAction.action?code=-706&paramMap.resDownRoom=laboratory&paramMap.resDownType=${initMap.videoDetail.lrType}&paramMap.resPath=${initMap.videoDetail.lrUpload}">资源下载</a></td>
				                                  </tr>
				                              </table>
				                          </div>
				                           <i class="icon-up-arrow"></i>
				                      </div>
				                  </li>
				              
				               <s:if test="session.s_userType != 3 and paramMap.st == 1 and session.s_userType != 5">
		                  			 <li>
		                  			 	<a  data-type="rc-query" title="加入收藏" onclick="window.parent.insert_fav(this)" class="addFavorite rc rc-query"  href="javascript:void(0);"   id="${code}|${paramMap.path}|laboratory|${paramMap.st}|${initMap.videoDetail.lrName}|${initMap.videoDetail.lrType}|${initMap.videoDetail.lrID}" >
		                  				</a>  
		                  			</li>
		                  		</s:if>
				                  
		                        
				              
		                        <!-- 二维码 -->
		                        <li><a href="javascript:void(0);" title="二维码" data-type="rc-qrcode" class="rc rc-qrcode"></a></li>
		                       
		                        <%-- <s:if test="session.s_userType != 3 and paramMap.st == 1 and session.s_userType != 5"> --%>
		                        <!-- 评论 -->
		                        <li><a href="javascript:void(0);" title="评论" data-type="rc-comment" class="rb rc-comment" id="revR" ></a>
		                       		 <div id="revM" class="hide-popup popup-rc-comment" style="display: none;">
										<i class="icon-up-arrow"></i>
										<div  class="hide-popup-comment" id="revL" style="width:360px;height:290px;float: left;overflow-x:hidden;overflow-y:scroll; background-color: #F8F4ED;position: relative;">评论加载中...</div>
									 </div>
		                       	
		                       	</li>
		                       <%-- </s:if> --%>	<input type="hidden" id="reviewID" value="${initMap.videoDetail.lrID}">
		                        <!-- 资源详细信息 -->
		                        <li>
		                            <a href="javascript:void(0);" title="资源详细信息" data-type="rc-info" class="rc rc-info"></a>
		                            <div class="hide-popup popup-rc-info">
		                                
		                                <div class="hide-popup-content">
		                                  
		                                 <table>
		                                 <tr>
												<td width="25%" align="center">资源编号</td>
												<td width="75%" align="center" class="erCode">${initMap.videoDetail.lrNO}</td>
											</tr>
											<tr>
												<td width="25%" align="center">资源名称</td>
												<td width="75%" align="center" class="erName">${initMap.videoDetail.lrName}</td>
											</tr>
											<tr>
												<td width="25%" align="center">资源类型</td>
												<td width="75%" align="center" class="erType">
													    ${initMap.videoDetail.lrType eq "1011" ? '高清图片':'' }
														${initMap.videoDetail.lrType eq "1022" ? '3D图片':'' }
														${initMap.videoDetail.lrType eq "1073" ? '音频':'' }
														${initMap.videoDetail.lrType eq "1084" ? '高清视频':'' }
														${initMap.videoDetail.lrType eq "1005" ? '动画类素材':'' }
														${initMap.videoDetail.lrType eq "1006" ? '其他素材':'' }
														${initMap.videoDetail.lrType eq "2041" ? 'PPT课件':'' }
														${initMap.videoDetail.lrType eq "2002" ? '动画类课件':'' }
														${initMap.videoDetail.lrType eq "2033" ? 'WORD课件':'' }
														${initMap.videoDetail.lrType eq "2055" ? 'PDF课件':'' }
														${initMap.videoDetail.lrType eq "2004" ? '其他课件':'' }
														${initMap.videoDetail.lrType eq "3031" ? '环球百科':'' }
														${initMap.videoDetail.lrType eq "3032" ? '文学报告':'' }
														${initMap.videoDetail.lrType eq "3033" ? '论文资料':'' }
														${initMap.videoDetail.lrType eq "3034" ? '资料图书':'' }
														${initMap.videoDetail.lrType eq "3035" ? '适用学段、年级与大纲':'' }
														${initMap.videoDetail.lrType eq "3036" ? '其他资料':'' }
												
												</td>
											</tr>
											<tr>
												<td width="25%" align="center">一级分类</td>
												<td width="75%" align="center" class="erTotal">${initMap.videoDetail.lrCategoryName}</td>
											</tr>
										<tr>
												<td width="25%" align="center">二级分类</td>
												<td width="75%" align="center" class="lrCateTwLevelName">${initMap.videoDetail.lrCateTwLevelName}</td>
											</tr>
										  <tr <c:if test="${empty initMap.videoDetail.lrRemarks }">style="display:none"</c:if>>
												<td width="25%" align="center">备注</td>
												<td width="75%" align="center" class="lrTotal">${initMap.videoDetail.lrRemarks}</td>
											</tr>
		                            
		                              </table>
		                                </div>
		                                <i class="icon-up-arrow"></i>
		                            </div>
		                        </li>
		                    </ul>
                        </div>
                        <div class="relative-res-body">
                           <!-- <div class="controll">
                            <a href="javascript:void(0);" data-type="pre" class="btn pre"><i class="res-scroll-pre"></i></a>
                            <a href="javascript:void(0);" data-type="next" class="btn next"><i class="res-scroll-next"></i></a>
                            </div>  -->
                            <div  class="controll" >
                            <a href="javascript:void(0);" data-type="pre_x" class="btn_x pre_x"><i class="res-scroll-pre_x"></i></a>
                            <a href="javascript:void(0);" data-type="next_x" class="btn_x next_x"><i class="res-scroll-next_x"></i></a>
                           </div>
                           
                           <%--  <div class="relative-res-container">
                            	<!-- 图片资源 -->
                            	
                                <ul class="res_t" id="relative-res-body_res_t">
                                    <li>
										<a href="javascript:void(0)" onclick="reflushSwfPlayer('${initMap.videoDetail.lrFileSwfPath}')">
										        <img src="${initMap.videoDetail.lrThumbnail}"  title="主资源"   height="110" width="145"/>
										</a>
									</li>
									<s:iterator value="initMap.refer" id="fv" status="fvindx">
										<li >
				                  			<a href="javascript:void(0);" onclick="reflushSwfPlayer('${fv.referFileSwfPath}')">
				                  				<img src="${fv.thumbnail}" width="145" height="110"/>
				                  			</a>
			                  			<span>
			                  				<s:if test="#fv.name.length() > 4"><s:property value="#fv.name.substring(0,4)" />...</s:if><s:else><s:property value="#fv.name" /></s:else>
			                  			</span>
			                  			</li>
										
									</s:iterator>
                                   
                                </ul>
                            </div> --%>
                            <div class="relative-res-container" >
                               <!-- 相关资源 -->
                                <ul class="res_x" id="relative-res-body_res_x">
                                
	                              <s:iterator value="initMap.resAllView" id="fv" status="fvindx">
									<s:set name="pcode" value="''" />
				                   		<s:set name="pname" value="''" />
				                   		<s:set name="expurl" value="''" />                   		
				                   		<s:if test="#fv.resType == 'exhibition'">
				                   			<s:set name="pcode" value="'-701003'" />
				                   			<s:set name="pname" value="'erID'" />
				                   			<s:set name="broomname" value="'er'" />
				                   			<s:if test="#fv.fileType == '1011'">
				                   				<s:set name="pcode" value="'-701001'" />
				                   			</s:if>
				                   			<s:if test="#fv.fileType == '1073' || #fv.fileType == '1084'">
				                   				<s:set name="pcode" value="'-701002'" />
				                   			</s:if>
				                   			<s:if test="#fv.fileType == '2041' || #fv.fileType == '2033' || #fv.fileType == '2055'">
				                   				<s:set name="pcode" value="'-701018'" />
				                   			</s:if>
				                   		</s:if>
				                   		<s:if test="#fv.resType == 'observation'">
				                    		<s:set name="pcode" value="'-701006'" />
				                   			<s:set name="pname" value="'orID'" />
				                   			<s:set name="broomname" value="'or'" />
				                   			<s:if test="#fv.fileType == '1011' || #fv.fileType == '1022'">
				                   				<s:set name="pcode" value="'-701004'" />
				                   			</s:if>
				                   			<s:if test="#fv.fileType == '4033' ">
				                   				<s:set name="pcode" value="'-701023'" />
				                   			</s:if>
				                   			<s:if test="#fv.fileType == '1073' || #fv.fileType == '1084'">
				                   				<s:set name="pcode" value="'-701005'" />
				                   			</s:if>
				                   			<s:if test="#fv.fileType == '2041' || #fv.fileType == '2033' || #fv.fileType == '2055'">
				                   				<s:set name="pcode" value="'-701019'" />
				                   			</s:if>
				                   		</s:if>
				                   		<s:if test="#fv.resType == 'laboratory'">
				                   			<s:set name="pcode" value="'-701009'" />
				                   			<s:set name="pname" value="'lrID'" />
				                   			<s:set name="broomname" value="'lr'" />
				                   			<s:if test="#fv.fileType == '1011' || #fv.fileType == '1022'">
				                   				<s:set name="pcode" value="'-701007'" />
				                   			</s:if>
				                   			<s:if test="#fv.fileType == '1073' || #fv.fileType == '1084'">
				                   				<s:set name="pcode" value="'-701008'" />
				                   			</s:if>
				                   			<s:if test="#fv.fileType == '2041' || #fv.fileType == '2033' || #fv.fileType == '2055'">
				                   				<s:set name="pcode" value="'-701020'" />
				                   			</s:if>
				                   		</s:if>
				                   		<s:if test="#fv.resType == 'projection'">
				                   			<s:set name="pcode" value="'-701012'" />
				                   			<s:set name="pname" value="'prID'" />
				                   			<s:set name="broomname" value="'pr'" />
				                   			<s:if test="#fv.fileType == '1011' || #fv.fileType == '1022'">
				                   				<s:set name="pcode" value="'-701010'" />
				                   			</s:if>
				                   			<s:if test="#fv.fileType == '1073' || #fv.fileType == '1084'">
				                   				<s:set name="pcode" value="'-701011'" />
				                   			</s:if>
				                   			<s:if test="#fv.fileType == '2041' || #fv.fileType == '2033' || #fv.fileType == '2055'">
				                   				<s:set name="pcode" value="'-701021'" />
				                   			</s:if>
				                   		</s:if>
				                   		<s:if test="#fv.resType == 'lovely'">
				                   			<s:set name="pcode" value="'-701013'" />
				                   			<s:set name="pname" value="'crID'" />
				                   			<s:set name="broomname" value="'cr'" />
				                   			<s:if test="#fv.fileType == '1011' || #fv.fileType == '1022'">
				                   				<s:set name="pcode" value="'-701016'" />
				                   			</s:if>
				                   			<s:if test="#fv.fileType == '1073' || #fv.fileType == '1084'">
				                   				<s:set name="pcode" value="'-701017'" />
				                   			</s:if>
				                   			<s:if test="#fv.fileType == '2041' || #fv.fileType == '2033' || #fv.fileType == '2055'">
				                   				<s:set name="pcode" value="'-701022'" />
				                   			</s:if>
				                    		<s:if test="#fv.fileType == '3036'">
				                    			<s:set name="pcode" value="'-701030'" />
				                    		</s:if>
				                   		</s:if>
				                   		<s:if test="#expurl == ''">
				                  			<li class="resAll_${fv.id}">
					                  			<a href="javascript:void(0);" onclick="otherRes(this)" hreft="decorateForwardAction.action?code=${pcode}&path=${fv.path}&paramMap.${broomname}Type=${fv.fileType}&paramMap.fileType=${fv.fileType}&paramMap.${pname}=${fv.id}&paramMap.st=1&paramMap.temppname=${pname}&paramMap.temppid=${fv.id}&paramMap.name=${fv.name}&paramMap.roomtype=${fv.resType}">
					                  				<img src="images/ajax-loader.gif" width="77" height="77" title="${fv.name}"/>
					                  			</a>
				                  			<span>
				                  				<s:if test="#fv.name.length() > 4"><s:property value="#fv.name.substring(0,4)" />...</s:if><s:else><s:property value="#fv.name" /></s:else>
				                  			</span>
				                  			</li>		
				                  		</s:if>					     							
								</s:iterator>
                               
                         	   </ul>
                      	  </div>
                   	  </div>
               	  </div>
            	</div>
			</div>
	
	</body>
</html>