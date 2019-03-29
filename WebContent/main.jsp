<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"  "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title><s:text name="systemName" />
</title>
<META HTTP-EQUIV="pragma" CONTENT="no-cache">
<META HTTP-EQUIV="Cache-Control" CONTENT="no-cache, must-revalidate">
<META HTTP-EQUIV="expires" CONTENT="Wed, 26 Feb 1997 08:21:57 GMT">
<link href="<%=request.getContextPath()%>/css/style-ce.css"  rel="stylesheet" />
<script src="<%=request.getContextPath()%>/js/jquery-1.7.2.min.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery-main-tag.js"></script>
<script src="<%=request.getContextPath()%>/js/jq-main.js"></script>
<script type="text/javascript">

function myfun()
{
	var isFlash='${paramMap.flash}';
	var ipPath =window.location.href ;
	var exceptStr=ipPath.indexOf("code=-1700&url=");
	if(exceptStr<0){
		if(isFlash = 1){
			
			
			 var startoint = ipPath.indexOf("path"); 
			 
				 if(startoint>=0){
					 var code="-701";
						ipPath = ipPath.substring(startoint,ipPath.length );
						if(ipPath.indexOf("zizhureshen")>=0){
							code="-17010";
						}else if(ipPath.indexOf("zizhuguang")>=0){
							code="-13899";
						}else if(ipPath.indexOf("zizhuchengguo")>=0){
							code="-14899";
						}else{
							code="-701";
						}
						  $("#mainFrameWelcome").attr("src","decorateForwardAction.action?code="+code+"&"+ipPath);
				 }else{
					  $("#mainFrameWelcome").attr("src","decorateForwardAction.action?code=004");
				 }
	
			 
		}else{
			 $("#mainFrameWelcome").attr("src","decorateForwardAction.action?code=004");
		}
	}
	
}
window.onload=myfun;//不要括号


function func(){
	$(".layout_left_menutab_title").attr("src","images-ce/function.jpg");
	var index = 0;
    $(".left_menutab_body .rollbar-content").animate({"top":"0px"},600);
    $("ul.menutab_body").eq(index).show().siblings().hide();
    $("#manager").show();
}
function area(){
	$(".layout_left_menutab_title").attr("src","images-ce/area.jpg");
	var index = 1;
    $(".left_menutab_body .rollbar-content").animate({"top":"0px"},600);
    $("ul.menutab_body").eq(index).show().siblings().hide();
    $("#manager").show();
}
function classic(){
	$(".layout_left_menutab_title").attr("src","images-ce/class.jpg");
	var index = 2;
    $(".left_menutab_body .rollbar-content").animate({"top":"0px"},600);
    $("ul.menutab_body").eq(index).show().siblings().hide();
    $("#manager").show();
}
function resource(){
	$(".layout_left_menutab_title").attr("src","images-ce/resource.jpg");
	var index = 3;
    $(".left_menutab_body .rollbar-content").animate({"top":"0px"},600);
    $("ul.menutab_body").eq(index).show().siblings().hide();
    $("#manager").show();
}
</script>

<style type="text/css">
body{

	background: url(<%=request.getContextPath()%>/images-ce/loginbg.jpg) center no-repeat;
	background-size: cover;
	-ms-behavior: url(<%=request.getContextPath()%>/css/backgroundsize.min.htc);
	behavior: url(<%=request.getContextPath()%>/css/backgroundsize.min.htc);
}
#layout_left_pms {
	float: left;
	position: absolute;
	top: -40px;
	left: 0;
	width: 192px;
	height: 100%;
	background: #504538;
	display: block;
	z-index: 2;
}

#lookimage_ {
	position: absolute;
	z-index: 9999;
	overflow: auto;
	text-align: center;
	display: none;
}

#lookimageclose {
	position: absolute;
	z-index: 10000;
	width: 40px;
	height: 40px;
	display: none;
	right: 40px;
	cursor: pointer;
}

.mainloading {
	position: fixed;
	top: 50%;
	left: 50%;
}
</style>
<script type="text/javascript">
function jumpCity(){
	
	 var localIp=GetLocalIPAddr();
		var url=localIp+"/UniteCount-school/ShowDitalServlet?type=City";
	    $("#mainFrameWelcome").attr("src",url);
}
function jumpNext(this_){
	var id=	$(this_).attr("id");
	 var localIp=GetLocalIPAddr();
		var url=localIp+"/UniteCount-school/ShowDitalServlet?type=dis&id="+id;
	    $("#mainFrameWelcome").attr("src",url);
}
function jumpSchool(this_){
	var id=	$(this_).attr("id");
	 var localIp=GetLocalIPAddr();
		var url=localIp+"/UniteCount-school/ShowDitalServlet?type=school&id="+id;
	    $("#mainFrameWelcome").attr("src",url);
}

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

<body style=" position:relative; background:url(images-ce/loginbg.jpg) center bottom no-repeat; background-size:100% 100%;">

<input type="hidden"  id="isOpen" value="0">
<input type="hidden"  id="code" value="${param.code }">
<input type="hidden"  id="path" value="${param.path }">
<input type="hidden"  id="pageSize" value="${param.pageSize }">
<input type="hidden"  id="paramMap.path" value="${param.paramMap.path }">
<input type="hidden"  id="paramMap.orCategory" value="${param.paramMap.orCategory }">
<input type="hidden"  id="pageSize" value="${param.pageSize }">
<input type="hidden"  id="type" value="${param.type }">
	<div id="message__" class="showDiv" style="display: none;"></div>
	<div id="lookimage_" class="lookimage_" style="display: none;">
		<img src="" border="0">
	</div>
	<div id="lookimageclose" class="lookimageclose" style="display: none;">
		<img src="images/deleted_1.png" border="0">
	</div>
	<div id="message_only" class="message_only" style="display: none;">
		<s:include value="messonly.jsp"></s:include>
	</div>
	<div id="message_refer" class="message_refer" style="display: none;">
		<s:include value="messrefer.jsp"></s:include>
	</div>
	<div id="screen__">
		<iframe id="iframeScreen__" scrolling="no" frameborder="0"
			style="display: none;"></iframe>
	</div>
	<s:include value="top.jsp"></s:include>
	<div id="layout_left">

		<div class="layout_left_menutab">
<img class="layout_left_menutab_title" src="images-ce/function.jpg"   usemap="#function"/>
			<map  name="function" id="function">
				<area  shape="rect"
				coords="9,9,53,55" 
				alt="功能"
			    href ="javascript:func();" />
			    <area  shape="rect"
				coords="48,9,95,55" 
				alt="区域"
			    href ="javascript:area();" />
			    <area  shape="rect"
				coords="95,9,139,55" 
				alt="年级"
			    href ="javascript:classic();" />
			    <area  shape="rect"
				coords="139,9,182,55" 
				alt="资源"
			    href ="javascript:resource();" />
			</map>
			<div class="left_menutab_body">

				<ul class="menutab_body menu-nav">
					<li class="exhibition" roomtype="exhibition" style=" background:url(images-ce/BLS.jpg) no-repeat;"><a
						href="javascript:void(0);" path=",0,1," key="0" title="文物博览室"
						onclick="message('exhibition',this)"></a>
						<dl class="sub-menu" style="display: none;">

						</dl></li>
					<li class="observation" roomtype="observation"  style=" background:url(images-ce/YDS.jpg) no-repeat;"><a
						href="javascript:void(0);" path=",0,219," key="0" title="专题研读室"
						onclick="message('observation',this)">
					</a>
						<dl class="sub-menu" style="display: none;">

						</dl></li>
					<li class="projection" roomtype="projection"  style=" background:url(images-ce/ZLS.jpg) no-repeat;"><a
						href="javascript:void(0);" path=",0,213," key="0" title="影像资料室"
						onclick="message('projection',this)">
					</a>
						<dl class="sub-menu" style="display: none;">

						</dl></li>
					<li class="expand" roomtype="expand"  style=" background:url(images-ce/TJS.jpg) no-repeat;"><a
						href="javascript:void(0);" path=",0,206," key="0" title="自主探究室"
						onclick="message('expand',this)">
					</a>
						<dl class="sub-menu" style="display: none;">

						</dl></li>
					<li class="laboratory" roomtype="laboratory"  style=" background:url(images-ce/YJS.jpg) no-repeat;"><a
						href="javascript:void(0);" path=",0,218," key="0" title="教学研究室"
						onclick="message('laboratory',this)">
					</a>
						<dl class="sub-menu" style="display: none;">

						</dl></li>
					<li class="lovely" roomtype="lovely"  style=" background:url(images-ce/XJY.jpg) no-repeat;"><a
						href="javascript:void(0);" path=",0,259," key="0" title="情系家园"
						onclick="message('lovely',this)">
					</a>
						<dl class="sub-menu" style="display: none;">

						</dl></li>
						
				</ul>
				<ul class="menutab_body menu-nav" style="display: none">
					<li class="area" roomtype="area" style=" background:url(images-ce/zhongguo.jpg) no-repeat;"><a 
					key="0" id="1" class="on" title="中国"
						onclick="findChildArea(this)">
					</a>
						<dl class="sub-menu">

						</dl></li>

				</ul>
				<ul class="menutab_body menu-nav" style="display: none">
					<li class="middlegrade" roomtype="middlegrade" style=" background:url(images-ce/chuzhong.jpg) no-repeat;"><a>
					</a>
						<dl class="sub-menu" style="display: none;">

							<!-- <dd subindex="0" style="background:url(images-ce/one.jpg)  center  no-repeat;">
								<a key="2"
									onclick="resType(this,'G_Grade','七年级资源','-901','paramMap.grGrade=311&pageSize=8&type=1');"
									href="javascript:void(0);">七年级</a>
							</dd>
							<div class="subdiv" style="display:none;width: 166px;background: #EAE3D3;margin-left: 7px;margin-top: -6px;margin-bottom: 10px;border:1px solid #87571E;"><div style="border:3px solid #ffffff;border-top:none;">
								<dd class="sub_res0  sub_res_sub" style="background:url(images-ce/in.jpg)  center  no-repeat;color:black;display:none;color:black;">
									<a path=",0,1,160,163," onclick="resType(this,'G_Grade','七年级资源','-901','paramMap.grGrade=311&pageSize=8&type=1&paramMap.resTypeName=sucai');" style="color: black;" href="javascript:void(0);" title="素材">
										素材
									</a>
								</dd>
								<dd class="sub_res0  sub_res_sub" style="background:url(images-ce/in.jpg)  center  no-repeat;color:black;display:none;color:black;">
									<a path=",0,1,160,163," onclick="resType(this,'G_Grade','七年级资源','-901','paramMap.grGrade=311&pageSize=8&type=1&paramMap.resTypeName=kejian');" style="color: black;" href="javascript:void(0);" title="课件">
										课件
									</a>
								</dd>
							</div></div> -->
							<dd subindex="0" style="background:url(images-ce/one.jpg)  center  no-repeat;">
								<a key="2"
									onclick="resType(this,'G_Grade','七年级上','-901','paramMap.grGrade=700&pageSize=8&type=1');"
									href="javascript:void(0);">七年级上</a>
							</dd>
							<div class="subdiv" style="display:none;width: 166px;background: #EAE3D3;margin-left: 7px;margin-top: -6px;margin-bottom: 10px;border:1px solid #87571E;"><div style="border:3px solid #ffffff;border-top:none;">
								<dd class="sub_res0  sub_res_sub" style="background:url(images-ce/in.jpg)  center  no-repeat;color:black;display:none;color:black;">
									<a path=",0,1,160,163," onclick="resType(this,'G_Grade','七年级资源','-901','paramMap.grGrade=700&pageSize=8&type=1&paramMap.grJieIDSelf=1');" 
										style="color: black;
											width: 150px;
										    text-overflow: ellipsis;
										    overflow: hidden;
										    white-space: nowrap" 
									    href="javascript:void(0);" 
									    title="史前时期：中国境内人类的活动">
										史前时期：中国境内人类的活动
									</a>
								</dd>
								<dd class="sub_res0  sub_res_sub" style="background:url(images-ce/in.jpg)  center  no-repeat;color:black;display:none;color:black;">
									<a path=",0,1,160,163," onclick="resType(this,'G_Grade','七年级资源','-901','paramMap.grGrade=700&pageSize=8&type=1&paramMap.grJieIDSelf=2');" 
										style="color: black;
											width: 150px;
										    text-overflow: ellipsis;
										    overflow: hidden;
										    white-space: nowrap" 
									    href="javascript:void(0);" 
									    title="夏商周时期：早期国家的产生与社会变革">
										夏商周时期：早期国家的产生与社会变革
									</a>
								</dd>
								<dd class="sub_res0  sub_res_sub" style="background:url(images-ce/in.jpg)  center  no-repeat;color:black;display:none;color:black;">
									<a path=",0,1,160,163," onclick="resType(this,'G_Grade','七年级资源','-901','paramMap.grGrade=700&pageSize=8&type=1&paramMap.grJieIDSelf=3');" 
										style="color: black;
											width: 150px;
										    text-overflow: ellipsis;
										    overflow: hidden;
										    white-space: nowrap" 
									    href="javascript:void(0);" 
									    title="秦汉时期：统一多民族国家的建立和巩固">
										秦汉时期：统一多民族国家的建立和巩固
									</a>
								</dd>
								<dd class="sub_res0  sub_res_sub" style="background:url(images-ce/in.jpg)  center  no-repeat;color:black;display:none;color:black;">
									<a path=",0,1,160,163," onclick="resType(this,'G_Grade','七年级资源','-901','paramMap.grGrade=700&pageSize=8&type=1&paramMap.grJieIDSelf=4');" 
										style="color: black;
											width: 150px;
										    text-overflow: ellipsis;
										    overflow: hidden;
										    white-space: nowrap" 
									    href="javascript:void(0);" 
									    title="三国两晋南北朝时期：政权分立与民族融合">
										三国两晋南北朝时期：政权分立与民族融合
									</a>
								</dd>
							</div></div>
							<dd subindex="1" style="background:url(images-ce/one.jpg)  center  no-repeat;">
								<a key="2"
									onclick="resType(this,'G_Grade','七年级下','-901','paramMap.grGrade=700&pageSize=8&type=1');"
									href="javascript:void(0);">七年级下</a>
							</dd>
							<div class="subdiv" style="display:none;width: 166px;background: #EAE3D3;margin-left: 7px;margin-top: -6px;margin-bottom: 10px;border:1px solid #87571E;"><div style="border:3px solid #ffffff;border-top:none;">
								<dd class="sub_res1  sub_res_sub" style="background:url(images-ce/in.jpg)  center  no-repeat;color:black;display:none;color:black;">
									<a path=",0,1,160,163," onclick="resType(this,'G_Grade','七年级资源','-901','paramMap.grGrade=700&pageSize=8&type=1&paramMap.grJieIDSelf=5');" 
										style="color: black;
											width: 150px;
										    text-overflow: ellipsis;
										    overflow: hidden;
										    white-space: nowrap" 
									    href="javascript:void(0);" 
									    title="隋唐时期：繁荣与开放的时代">
										隋唐时期：繁荣与开放的时代
									</a>
								</dd>
								<dd class="sub_res1  sub_res_sub" style="background:url(images-ce/in.jpg)  center  no-repeat;color:black;display:none;color:black;">
									<a path=",0,1,160,163," onclick="resType(this,'G_Grade','七年级资源','-901','paramMap.grGrade=700&pageSize=8&type=1&paramMap.grJieIDSelf=6');" 
										style="color: black;
											width: 150px;
										    text-overflow: ellipsis;
										    overflow: hidden;
										    white-space: nowrap" 
									    href="javascript:void(0);" 
									    title="辽宋夏金元时期：民族关系发展和社会变化">
										辽宋夏金元时期：民族关系发展和社会变化
									</a>
								</dd>
								<dd class="sub_res1  sub_res_sub" style="background:url(images-ce/in.jpg)  center  no-repeat;color:black;display:none;color:black;">
									<a path=",0,1,160,163," onclick="resType(this,'G_Grade','七年级资源','-901','paramMap.grGrade=700&pageSize=8&type=1&paramMap.grJieIDSelf=7');" 
										style="color: black;
											width: 150px;
										    text-overflow: ellipsis;
										    overflow: hidden;
										    white-space: nowrap" 
									    href="javascript:void(0);" 
									    title="明清时期：统一多民族国家的巩固与发展">
										明清时期：统一多民族国家的巩固与发展
									</a>
								</dd>
							</div></div>
							
							<dd subindex="2"  style="background:url(images-ce/one.jpg)  center  no-repeat;">
								<a key="2"
									onclick="resType(this,'G_Grade','八年级上','-901','paramMap.grGrade=800&pageSize=8&type=1');"
									href="javascript:void(0);">八年级上</a>
							</dd>
							<div class="subdiv" style="display:none;width: 166px;background: #EAE3D3;margin-left: 7px;margin-top: -6px;margin-bottom: 10px;border:1px solid #87571E;"><div style="border:3px solid #ffffff;border-top:none;">
								<dd class="sub_res2  sub_res_sub" style="background:url(images-ce/in.jpg)  center  no-repeat;color:black;display:none;color:black;">
									<a path=",0,1,160,163," onclick="resType(this,'G_Grade','八年级资源','-901','paramMap.grGrade=800&pageSize=8&type=1&paramMap.grJieIDSelf=1');" 
									style="color: black;
										width: 150px;
									    text-overflow: ellipsis;
									    overflow: hidden;
									    white-space: nowrap;" 
									href="javascript:void(0);" 
									title="中国开始沦为半殖民地半封建社会">
										中国开始沦为半殖民地半封建社会
									</a>
								</dd>
								<dd class="sub_res2  sub_res_sub" style="background:url(images-ce/in.jpg)  center  no-repeat;color:black;display:none;color:black;">
									<a path=",0,1,160,163," onclick="resType(this,'G_Grade','八年级资源','-901','paramMap.grGrade=800&pageSize=8&type=1&paramMap.grJieIDSelf=2');" 
									style="color: black;
										width: 150px;
									    text-overflow: ellipsis;
									    overflow: hidden;
									    white-space: nowrap;" 
									href="javascript:void(0);" 
									title="近代化的早期探索与民族危机的加剧">
										近代化的早期探索与民族危机的加剧
									</a>
								</dd>
								<dd class="sub_res2  sub_res_sub" style="background:url(images-ce/in.jpg)  center  no-repeat;color:black;display:none;color:black;">
									<a path=",0,1,160,163," onclick="resType(this,'G_Grade','八年级资源','-901','paramMap.grGrade=800&pageSize=8&type=1&paramMap.grJieIDSelf=3');" 
									style="color: black;
										width: 150px;
									    text-overflow: ellipsis;
									    overflow: hidden;
									    white-space: nowrap;" 
									href="javascript:void(0);" 
									title="资产阶级民主革命与中华民国的建立">
										资产阶级民主革命与中华民国的建立
									</a>
								</dd>
								<dd class="sub_res2  sub_res_sub" style="background:url(images-ce/in.jpg)  center  no-repeat;color:black;display:none;color:black;">
									<a path=",0,1,160,163," onclick="resType(this,'G_Grade','八年级资源','-901','paramMap.grGrade=800&pageSize=8&type=1&paramMap.grJieIDSelf=4');" 
									style="color: black;
										width: 150px;
									    text-overflow: ellipsis;
									    overflow: hidden;
									    white-space: nowrap;" 
									href="javascript:void(0);" 
									title="新民主主义革命的开始">
										新民主主义革命的开始
									</a>
								</dd>
								<dd class="sub_res2  sub_res_sub" style="background:url(images-ce/in.jpg)  center  no-repeat;color:black;display:none;color:black;">
									<a path=",0,1,160,163," onclick="resType(this,'G_Grade','八年级资源','-901','paramMap.grGrade=800&pageSize=8&type=1&paramMap.grJieIDSelf=5');" 
									style="color: black;
										width: 150px;
									    text-overflow: ellipsis;
									    overflow: hidden;
									    white-space: nowrap;" 
									href="javascript:void(0);" 
									title="从国共合作到国共对峙">
										从国共合作到国共对峙
									</a>
								</dd>
								<dd class="sub_res2  sub_res_sub" style="background:url(images-ce/in.jpg)  center  no-repeat;color:black;display:none;color:black;">
									<a path=",0,1,160,163," onclick="resType(this,'G_Grade','八年级资源','-901','paramMap.grGrade=800&pageSize=8&type=1&paramMap.grJieIDSelf=6');" 
									style="color: black;
										width: 150px;
									    text-overflow: ellipsis;
									    overflow: hidden;
									    white-space: nowrap;" 
									href="javascript:void(0);" 
									title="中华民族的抗日战争">
										中华民族的抗日战争
									</a>
								</dd>
								<dd class="sub_res2  sub_res_sub" style="background:url(images-ce/in.jpg)  center  no-repeat;color:black;display:none;color:black;">
									<a path=",0,1,160,163," onclick="resType(this,'G_Grade','八年级资源','-901','paramMap.grGrade=800&pageSize=8&type=1&paramMap.grJieIDSelf=7');" 
									style="color: black;
										width: 150px;
									    text-overflow: ellipsis;
									    overflow: hidden;
									    white-space: nowrap;" 
									href="javascript:void(0);" 
									title="解放战争">
										解放战争
									</a>
								</dd>
								<dd class="sub_res2  sub_res_sub" style="background:url(images-ce/in.jpg)  center  no-repeat;color:black;display:none;color:black;">
									<a path=",0,1,160,163," onclick="resType(this,'G_Grade','八年级资源','-901','paramMap.grGrade=800&pageSize=8&type=1&paramMap.grJieIDSelf=8');" 
									style="color: black;
										width: 150px;
									    text-overflow: ellipsis;
									    overflow: hidden;
									    white-space: nowrap;" 
									href="javascript:void(0);" 
									title="近代经济、社会生活与教育文化事业的发展">
										近代经济、社会生活与教育文化事业的发展
									</a>
								</dd>
							</div></div>
							<dd subindex="3"  style="background:url(images-ce/one.jpg)  center  no-repeat;">
								<a key="2"
									onclick="resType(this,'G_Grade','八年级下','-901','paramMap.grGrade=800&pageSize=8&type=1');"
									href="javascript:void(0);">八年级下</a>
							</dd>
							<div class="subdiv" style="display:none;width: 166px;background: #EAE3D3;margin-left: 7px;margin-top: -6px;margin-bottom: 10px;border:1px solid #87571E;"><div style="border:3px solid #ffffff;border-top:none;">
								<dd class="sub_res3  sub_res_sub" style="background:url(images-ce/in.jpg)  center  no-repeat;color:black;display:none;color:black;">
									<a path=",0,1,160,163," onclick="resType(this,'G_Grade','八年级资源','-901','paramMap.grGrade=800&pageSize=8&type=1&paramMap.grJieIDSelf=9');" 
									style="color: black;
										width: 150px;
									    text-overflow: ellipsis;
									    overflow: hidden;
									    white-space: nowrap;" 
									href="javascript:void(0);" 
									title="中华人民共和国的成立和巩固">
										中华人民共和国的成立和巩固
									</a>
								</dd>
								<dd class="sub_res3  sub_res_sub" style="background:url(images-ce/in.jpg)  center  no-repeat;color:black;display:none;color:black;">
									<a path=",0,1,160,163," onclick="resType(this,'G_Grade','八年级资源','-901','paramMap.grGrade=800&pageSize=8&type=1&paramMap.grJieIDSelf=10');" 
									style="color: black;
										width: 150px;
									    text-overflow: ellipsis;
									    overflow: hidden;
									    white-space: nowrap;" 
									href="javascript:void(0);" 
									title="社会主义制度的建立与社会主义建设的探索">
										社会主义制度的建立与社会主义建设的探索
									</a>
								</dd>
								<dd class="sub_res3  sub_res_sub" style="background:url(images-ce/in.jpg)  center  no-repeat;color:black;display:none;color:black;">
									<a path=",0,1,160,163," onclick="resType(this,'G_Grade','八年级资源','-901','paramMap.grGrade=800&pageSize=8&type=1&paramMap.grJieIDSelf=11');" 
									style="color: black;
										width: 150px;
									    text-overflow: ellipsis;
									    overflow: hidden;
									    white-space: nowrap;" 
									href="javascript:void(0);" 
									title="中国特色社会主义道路">
										中国特色社会主义道路
									</a>
								</dd>
								<dd class="sub_res3  sub_res_sub" style="background:url(images-ce/in.jpg)  center  no-repeat;color:black;display:none;color:black;">
									<a path=",0,1,160,163," onclick="resType(this,'G_Grade','八年级资源','-901','paramMap.grGrade=800&pageSize=8&type=1&paramMap.grJieIDSelf=12');" 
									style="color: black;
										width: 150px;
									    text-overflow: ellipsis;
									    overflow: hidden;
									    white-space: nowrap;" 
									href="javascript:void(0);" 
									title="民族团结与祖国统一">
										民族团结与祖国统一
									</a>
								</dd>
								<dd class="sub_res3  sub_res_sub" style="background:url(images-ce/in.jpg)  center  no-repeat;color:black;display:none;color:black;">
									<a path=",0,1,160,163," onclick="resType(this,'G_Grade','八年级资源','-901','paramMap.grGrade=800&pageSize=8&type=1&paramMap.grJieIDSelf=13');" 
									style="color: black;
										width: 150px;
									    text-overflow: ellipsis;
									    overflow: hidden;
									    white-space: nowrap;" 
									href="javascript:void(0);" 
									title="国防建设与外交成就">
										国防建设与外交成就
									</a>
								</dd>
								<dd class="sub_res3  sub_res_sub" style="background:url(images-ce/in.jpg)  center  no-repeat;color:black;display:none;color:black;">
									<a path=",0,1,160,163," onclick="resType(this,'G_Grade','八年级资源','-901','paramMap.grGrade=800&pageSize=8&type=1&paramMap.grJieIDSelf=14');" 
									style="color: black;
										width: 150px;
									    text-overflow: ellipsis;
									    overflow: hidden;
									    white-space: nowrap;" 
									href="javascript:void(0);" 
									title="科技文化与社会生活">
										科技文化与社会生活
									</a>
								</dd>
							</div></div>
							<dd subindex="4"  style="background:url(images-ce/one.jpg)  center  no-repeat;">
								<a key="2"
									onclick="resType(this,'G_Grade','九年级上','-901','paramMap.grGrade=900&pageSize=8&type=1');"
									href="javascript:void(0);">九年级上</a>
							</dd>
							<div class="subdiv" style="display:none;width: 166px;background: #EAE3D3;margin-left: 7px;margin-top: -6px;margin-bottom: 10px;border:1px solid #87571E;"><div style="border:3px solid #ffffff;border-top:none;">
									<dd class="sub_res4  sub_res_sub" style="background:url(images-ce/in.jpg)  center  no-repeat;color:black;display:none;color:black;">
										<a path=",0,1,160,163," onclick="resType(this,'G_Grade','九年级资源','-901','paramMap.grGrade=900&pageSize=8&type=1&paramMap.grJieIDSelf=1');" 
										style="color: black;
											width: 150px;
										    text-overflow: ellipsis;
										    overflow: hidden;
										    white-space: nowrap;" 
										href="javascript:void(0);" 
										title="古代亚非文明">
											古代亚非文明
										</a>
									</dd>
									<dd class="sub_res4  sub_res_sub" style="background:url(images-ce/in.jpg)  center  no-repeat;color:black;display:none;color:black;">
										<a path=",0,1,160,163," onclick="resType(this,'G_Grade','九年级资源','-901','paramMap.grGrade=900&pageSize=8&type=1&paramMap.grJieIDSelf=2');" 
										style="color: black;
											width: 150px;
										    text-overflow: ellipsis;
										    overflow: hidden;
										    white-space: nowrap;" 
										href="javascript:void(0);" 
										title="古代欧洲文明">
											古代欧洲文明
										</a>
									</dd>
									<dd class="sub_res4  sub_res_sub" style="background:url(images-ce/in.jpg)  center  no-repeat;color:black;display:none;color:black;">
										<a path=",0,1,160,163," onclick="resType(this,'G_Grade','九年级资源','-901','paramMap.grGrade=900&pageSize=8&type=1&paramMap.grJieIDSelf=3');" 
										style="color: black;
											width: 150px;
										    text-overflow: ellipsis;
										    overflow: hidden;
										    white-space: nowrap;" 
										href="javascript:void(0);" 
										title="封建时代的欧洲">
											封建时代的欧洲
										</a>
									</dd>
									<dd class="sub_res4  sub_res_sub" style="background:url(images-ce/in.jpg)  center  no-repeat;color:black;display:none;color:black;">
										<a path=",0,1,160,163," onclick="resType(this,'G_Grade','九年级资源','-901','paramMap.grGrade=900&pageSize=8&type=1&paramMap.grJieIDSelf=4');" 
										style="color: black;
											width: 150px;
										    text-overflow: ellipsis;
										    overflow: hidden;
										    white-space: nowrap;" 
										href="javascript:void(0);" 
										title="封建时代的亚洲国家">
											封建时代的亚洲国家
										</a>
									</dd>
									<dd class="sub_res4  sub_res_sub" style="background:url(images-ce/in.jpg)  center  no-repeat;color:black;display:none;color:black;">
										<a path=",0,1,160,163," onclick="resType(this,'G_Grade','九年级资源','-901','paramMap.grGrade=900&pageSize=8&type=1&paramMap.grJieIDSelf=5');" 
										style="color: black;
											width: 150px;
										    text-overflow: ellipsis;
										    overflow: hidden;
										    white-space: nowrap;" 
										href="javascript:void(0);" 
										title="步入近代">
											步入近代
										</a>
									</dd>
									<dd class="sub_res4  sub_res_sub" style="background:url(images-ce/in.jpg)  center  no-repeat;color:black;display:none;color:black;">
										<a path=",0,1,160,163," onclick="resType(this,'G_Grade','九年级资源','-901','paramMap.grGrade=900&pageSize=8&type=1&paramMap.grJieIDSelf=6');" 
										style="color: black;
											width: 150px;
										    text-overflow: ellipsis;
										    overflow: hidden;
										    white-space: nowrap;" 
										href="javascript:void(0);" 
										title="资本主义制度的初步确立">
											资本主义制度的初步确立
										</a>
									</dd>
									<dd class="sub_res4  sub_res_sub" style="background:url(images-ce/in.jpg)  center  no-repeat;color:black;display:none;color:black;">
										<a path=",0,1,160,163," onclick="resType(this,'G_Grade','九年级资源','-901','paramMap.grGrade=900&pageSize=8&type=1&paramMap.grJieIDSelf=7');" 
										style="color: black;
											width: 150px;
										    text-overflow: ellipsis;
										    overflow: hidden;
										    white-space: nowrap;" 
										href="javascript:void(0);" 
										title="工业革命和工人运动的兴起">
											工业革命和工人运动的兴起
										</a>
									</dd>
							</div></div>
							<dd subindex="5"  style="background:url(images-ce/one.jpg)  center  no-repeat;">
								<a key="2"
									onclick="resType(this,'G_Grade','九年级下','-901','paramMap.grGrade=900&pageSize=8&type=1');"
									href="javascript:void(0);">九年级下</a>
							</dd>
							<div class="subdiv" style="display:none;width: 166px;background: #EAE3D3;margin-left: 7px;margin-top: -6px;margin-bottom: 10px;border:1px solid #87571E;"><div style="border:3px solid #ffffff;border-top:none;">
									<dd class="sub_res5  sub_res_sub" style="background:url(images-ce/in.jpg)  center  no-repeat;color:black;display:none;color:black;">
										<a path=",0,1,160,163," onclick="resType(this,'G_Grade','九年级资源','-901','paramMap.grGrade=900&pageSize=8&type=1&paramMap.grJieIDSelf=8');" 
										style="color: black;
											width: 150px;
										    text-overflow: ellipsis;
										    overflow: hidden;
										    white-space: nowrap;" 
										href="javascript:void(0);" 
										title="殖民地人民的反抗与资本主义制度的扩展">
											殖民地人民的反抗与资本主义制度的扩展
										</a>
									</dd>
									<dd class="sub_res5  sub_res_sub" style="background:url(images-ce/in.jpg)  center  no-repeat;color:black;display:none;color:black;">
										<a path=",0,1,160,163," onclick="resType(this,'G_Grade','九年级资源','-901','paramMap.grGrade=900&pageSize=8&type=1&paramMap.grJieIDSelf=9');" 
										style="color: black;
											width: 150px;
										    text-overflow: ellipsis;
										    overflow: hidden;
										    white-space: nowrap;" 
										href="javascript:void(0);" 
										title="第二次工业革命和近代科学文化">
											第二次工业革命和近代科学文化
										</a>
									</dd>
									<dd class="sub_res5  sub_res_sub" style="background:url(images-ce/in.jpg)  center  no-repeat;color:black;display:none;color:black;">
										<a path=",0,1,160,163," onclick="resType(this,'G_Grade','九年级资源','-901','paramMap.grGrade=900&pageSize=8&type=1&paramMap.grJieIDSelf=10');" 
										style="color: black;
											width: 150px;
										    text-overflow: ellipsis;
										    overflow: hidden;
										    white-space: nowrap;" 
										href="javascript:void(0);" 
										title="第一次世界大战和战后初期的世界">
											第一次世界大战和战后初期的世界
										</a>
									</dd>
									<dd class="sub_res5  sub_res_sub" style="background:url(images-ce/in.jpg)  center  no-repeat;color:black;display:none;color:black;">
										<a path=",0,1,160,163," onclick="resType(this,'G_Grade','九年级资源','-901','paramMap.grGrade=900&pageSize=8&type=1&paramMap.grJieIDSelf=11');" 
										style="color: black;
											width: 150px;
										    text-overflow: ellipsis;
										    overflow: hidden;
										    white-space: nowrap;" 
										href="javascript:void(0);" 
										title="经济大危机和第二次世界大战">
											经济大危机和第二次世界大战
										</a>
									</dd>
									<dd class="sub_res5  sub_res_sub" style="background:url(images-ce/in.jpg)  center  no-repeat;color:black;display:none;color:black;">
										<a path=",0,1,160,163," onclick="resType(this,'G_Grade','九年级资源','-901','paramMap.grGrade=900&pageSize=8&type=1&paramMap.grJieIDSelf=12');" 
										style="color: black;
											width: 150px;
										    text-overflow: ellipsis;
										    overflow: hidden;
										    white-space: nowrap;" 
										href="javascript:void(0);" 
										title="冷战和美苏对峙的世界">
											冷战和美苏对峙的世界
										</a>
									</dd>
									<dd class="sub_res5  sub_res_sub" style="background:url(images-ce/in.jpg)  center  no-repeat;color:black;display:none;color:black;">
										<a path=",0,1,160,163," onclick="resType(this,'G_Grade','九年级资源','-901','paramMap.grGrade=900&pageSize=8&type=1&paramMap.grJieIDSelf=13');" 
										style="color: black;
											width: 150px;
										    text-overflow: ellipsis;
										    overflow: hidden;
										    white-space: nowrap;" 
										href="javascript:void(0);" 
										title="冷战结束后的世界">
											冷战结束后的世界
										</a>
									</dd>
							</div></div>
						</dl>
					</li>
					<li class="highgrade" roomtype="highgrade" style=" background:url(images-ce/gaozhong.jpg) no-repeat;"><a>
					</a>
						<dl class="sub-menu" style="display: none;">
							<dd subindex="0"  style="background:url(images-ce/one.jpg)  center  no-repeat;">
								<a key="2"
									onclick="resType(this,'G_Grade','必修资源','-901','paramMap.grGrade=100&pageSize=8&type=1');"
									href="javascript:void(0);">必修-中外历史纲要</a>
							</dd>
							<div class="subdiv" style="display:none;width: 166px;background: #EAE3D3;margin-left: 7px;margin-top: -6px;margin-bottom: 10px;border:1px solid #87571E;"><div style="border:3px solid #ffffff;border-top:none;">
								<dd class="sub_res0  sub_res_sub" style="background:url(images-ce/in.jpg)  center  no-repeat;color:black;display: none;">
									<a path=",0,1,160,163," onclick="resType(this,'G_Grade','必修资源','-901','paramMap.grGrade=100&pageSize=8&type=1&paramMap.grJieIDSelf=1');" 
									style="color: black;
										width: 150px;
									    text-overflow: ellipsis;
									    overflow: hidden;
									    white-space: nowrap;" 
									href="javascript:void(0);" 
									title="早期中华文明">
										早期中华文明
									</a>
								</dd>
								<dd class="sub_res0  sub_res_sub" style="background:url(images-ce/in.jpg)  center  no-repeat;color:black;display: none;">
									<a path=",0,1,160,163," onclick="resType(this,'G_Grade','必修资源','-901','paramMap.grGrade=100&pageSize=8&type=1&paramMap.grJieIDSelf=2');" 
									style="color: black;
										width: 150px;
									    text-overflow: ellipsis;
									    overflow: hidden;
									    white-space: nowrap;" 
									href="javascript:void(0);" 
									title="春秋战国时期的政治、社会及思想变动">
										春秋战国时期的政治、社会及思想变动
									</a>
								</dd>
								<dd class="sub_res0  sub_res_sub" style="background:url(images-ce/in.jpg)  center  no-repeat;color:black;display: none;">
									<a path=",0,1,160,163," onclick="resType(this,'G_Grade','必修资源','-901','paramMap.grGrade=100&pageSize=8&type=1&paramMap.grJieIDSelf=3');" 
									style="color: black;
										width: 150px;
									    text-overflow: ellipsis;
									    overflow: hidden;
									    white-space: nowrap;" 
									href="javascript:void(0);" 
									title="秦汉大一统国家的建立与巩固">
										秦汉大一统国家的建立与巩固
									</a>
								</dd>
								<dd class="sub_res0  sub_res_sub" style="background:url(images-ce/in.jpg)  center  no-repeat;color:black;display: none;">
									<a path=",0,1,160,163," onclick="resType(this,'G_Grade','必修资源','-901','paramMap.grGrade=100&pageSize=8&type=1&paramMap.grJieIDSelf=4');" 
									style="color: black;
										width: 150px;
									    text-overflow: ellipsis;
									    overflow: hidden;
									    white-space: nowrap;" 
									href="javascript:void(0);" 
									title="三国两晋南北朝的民族交融与隋唐大一统的发展">
										三国两晋南北朝的民族交融与隋唐大一统的发展
									</a>
								</dd>
								<dd class="sub_res0  sub_res_sub" style="background:url(images-ce/in.jpg)  center  no-repeat;color:black;display: none;">
									<a path=",0,1,160,163," onclick="resType(this,'G_Grade','必修资源','-901','paramMap.grGrade=100&pageSize=8&type=1&paramMap.grJieIDSelf=5');" 
									style="color: black;
										width: 150px;
									    text-overflow: ellipsis;
									    overflow: hidden;
									    white-space: nowrap;" 
									href="javascript:void(0);" 
									title="辽宋夏金多民族证券并立与元朝的统一">
										辽宋夏金多民族证券并立与元朝的统一
									</a>
								</dd>
								<dd class="sub_res0  sub_res_sub" style="background:url(images-ce/in.jpg)  center  no-repeat;color:black;display: none;">
									<a path=",0,1,160,163," onclick="resType(this,'G_Grade','必修资源','-901','paramMap.grGrade=100&pageSize=8&type=1&paramMap.grJieIDSelf=6');" 
									style="color: black;
										width: 150px;
									    text-overflow: ellipsis;
									    overflow: hidden;
									    white-space: nowrap;" 
									href="javascript:void(0);" 
									title="明至清中叶中国版图的奠定、封建专制的发展与社会变动">
										明至清中叶中国版图的奠定、封建专制的发展与社会变动
									</a>
								</dd>
								<dd class="sub_res0  sub_res_sub" style="background:url(images-ce/in.jpg)  center  no-repeat;color:black;display: none;">
									<a path=",0,1,160,163," onclick="resType(this,'G_Grade','必修资源','-901','paramMap.grGrade=100&pageSize=8&type=1&paramMap.grJieIDSelf=7');" 
									style="color: black;
										width: 150px;
									    text-overflow: ellipsis;
									    overflow: hidden;
									    white-space: nowrap;" 
									href="javascript:void(0);" 
									title="晚清时期的内忧外患与救国图存">
										晚清时期的内忧外患与救国图存
									</a>
								</dd>
								<dd class="sub_res0  sub_res_sub" style="background:url(images-ce/in.jpg)  center  no-repeat;color:black;display: none;">
									<a path=",0,1,160,163," onclick="resType(this,'G_Grade','必修资源','-901','paramMap.grGrade=100&pageSize=8&type=1&paramMap.grJieIDSelf=8');" 
									style="color: black;
										width: 150px;
									    text-overflow: ellipsis;
									    overflow: hidden;
									    white-space: nowrap;" 
									href="javascript:void(0);" 
									title="辛亥革命与中华民国的建立">
										辛亥革命与中华民国的建立
									</a>
								</dd>
								<dd class="sub_res0  sub_res_sub" style="background:url(images-ce/in.jpg)  center  no-repeat;color:black;display: none;">
									<a path=",0,1,160,163," onclick="resType(this,'G_Grade','必修资源','-901','paramMap.grGrade=100&pageSize=8&type=1&paramMap.grJieIDSelf=9');" 
									style="color: black;
										width: 150px;
									    text-overflow: ellipsis;
									    overflow: hidden;
									    white-space: nowrap;" 
									href="javascript:void(0);" 
									title="中国共产党成立于新民主主义革命兴起">
										中国共产党成立与新民主主义革命兴起
									</a>
								</dd>
								<dd class="sub_res0  sub_res_sub" style="background:url(images-ce/in.jpg)  center  no-repeat;color:black;display: none;">
									<a path=",0,1,160,163," onclick="resType(this,'G_Grade','必修资源','-901','paramMap.grGrade=100&pageSize=8&type=1&paramMap.grJieIDSelf=10');" 
									style="color: black;
										width: 150px;
									    text-overflow: ellipsis;
									    overflow: hidden;
									    white-space: nowrap;" 
									href="javascript:void(0);" 
									title="中华民族的抗日战争">
										中华民族的抗日战争
									</a>
								</dd>
								<dd class="sub_res0  sub_res_sub" style="background:url(images-ce/in.jpg)  center  no-repeat;color:black;display: none;">
									<a path=",0,1,160,163," onclick="resType(this,'G_Grade','必修资源','-901','paramMap.grGrade=100&pageSize=8&type=1&paramMap.grJieIDSelf=11');" 
									style="color: black;
										width: 150px;
									    text-overflow: ellipsis;
									    overflow: hidden;
									    white-space: nowrap;" 
									href="javascript:void(0);" 
									title="人民解放战争">
										人民解放战争
									</a>
								</dd>
								<dd class="sub_res0  sub_res_sub" style="background:url(images-ce/in.jpg)  center  no-repeat;color:black;display: none;">
									<a path=",0,1,160,163," onclick="resType(this,'G_Grade','必修资源','-901','paramMap.grGrade=100&pageSize=8&type=1&paramMap.grJieIDSelf=12');" 
									style="color: black;
										width: 150px;
									    text-overflow: ellipsis;
									    overflow: hidden;
									    white-space: nowrap;" 
									href="javascript:void(0);" 
									title="中华人民共和国的成立及向社会主义过渡">
										中华人民共和国的成立及向社会主义过渡
									</a>
								</dd>
								<dd class="sub_res0  sub_res_sub" style="background:url(images-ce/in.jpg)  center  no-repeat;color:black;display: none;">
									<a path=",0,1,160,163," onclick="resType(this,'G_Grade','必修资源','-901','paramMap.grGrade=100&pageSize=8&type=1&paramMap.grJieIDSelf=13');" 
									style="color: black;
										width: 150px;
									    text-overflow: ellipsis;
									    overflow: hidden;
									    white-space: nowrap;" 
									href="javascript:void(0);" 
									title="社会主义建设道路的探索">
										社会主义建设道路的探索
									</a>
								</dd>
								<dd class="sub_res0  sub_res_sub" style="background:url(images-ce/in.jpg)  center  no-repeat;color:black;display: none;">
									<a path=",0,1,160,163," onclick="resType(this,'G_Grade','必修资源','-901','paramMap.grGrade=100&pageSize=8&type=1&paramMap.grJieIDSelf=14');" 
									style="color: black;
										width: 150px;
									    text-overflow: ellipsis;
									    overflow: hidden;
									    white-space: nowrap;" 
									href="javascript:void(0);" 
									title="改革开放新时期与中国特色社会主义进入新时代">
										改革开放新时期与中国特色社会主义进入新时代
									</a>
								</dd>
								<dd class="sub_res0  sub_res_sub" style="background:url(images-ce/in.jpg)  center  no-repeat;color:black;display: none;">
									<a path=",0,1,160,163," onclick="resType(this,'G_Grade','必修资源','-901','paramMap.grGrade=100&pageSize=8&type=1&paramMap.grJieIDSelf=15');" 
									style="color: black;
										width: 150px;
									    text-overflow: ellipsis;
									    overflow: hidden;
									    white-space: nowrap;" 
									href="javascript:void(0);" 
									title="古代文明的产生与发展">
										古代文明的产生与发展
									</a>
								</dd>
								<dd class="sub_res0  sub_res_sub" style="background:url(images-ce/in.jpg)  center  no-repeat;color:black;display: none;">
									<a path=",0,1,160,163," onclick="resType(this,'G_Grade','必修资源','-901','paramMap.grGrade=100&pageSize=8&type=1&paramMap.grJieIDSelf=16');" 
									style="color: black;
										width: 150px;
									    text-overflow: ellipsis;
									    overflow: hidden;
									    white-space: nowrap;" 
									href="javascript:void(0);" 
									title="中古世界的多元面貌">
										中古世界的多元面貌
									</a>
								</dd>
								<dd class="sub_res0  sub_res_sub" style="background:url(images-ce/in.jpg)  center  no-repeat;color:black;display: none;">
									<a path=",0,1,160,163," onclick="resType(this,'G_Grade','必修资源','-901','paramMap.grGrade=100&pageSize=8&type=1&paramMap.grJieIDSelf=17');" 
									style="color: black;
										width: 150px;
									    text-overflow: ellipsis;
									    overflow: hidden;
									    white-space: nowrap;" 
									href="javascript:void(0);" 
									title="全球联系的建立">
										全球联系的建立
									</a>
								</dd>
								<dd class="sub_res0  sub_res_sub" style="background:url(images-ce/in.jpg)  center  no-repeat;color:black;display: none;">
									<a path=",0,1,160,163," onclick="resType(this,'G_Grade','必修资源','-901','paramMap.grGrade=100&pageSize=8&type=1&paramMap.grJieIDSelf=18');" 
									style="color: black;
										width: 150px;
									    text-overflow: ellipsis;
									    overflow: hidden;
									    white-space: nowrap;" 
									href="javascript:void(0);" 
									title="西方人文主义的发展与资本主义制度的确立">
										西方人文主义的发展与资本主义制度的确立
									</a>
								</dd>
								<dd class="sub_res0  sub_res_sub" style="background:url(images-ce/in.jpg)  center  no-repeat;color:black;display: none;">
									<a path=",0,1,160,163," onclick="resType(this,'G_Grade','必修资源','-901','paramMap.grGrade=100&pageSize=8&type=1&paramMap.grJieIDSelf=19');" 
									style="color: black;
										width: 150px;
									    text-overflow: ellipsis;
									    overflow: hidden;
									    white-space: nowrap;" 
									href="javascript:void(0);" 
									title="改变世界面貌的工业革命">
										改变世界面貌的工业革命
									</a>
								</dd>
								<dd class="sub_res0  sub_res_sub" style="background:url(images-ce/in.jpg)  center  no-repeat;color:black;display: none;">
									<a path=",0,1,160,163," onclick="resType(this,'G_Grade','必修资源','-901','paramMap.grGrade=100&pageSize=8&type=1&paramMap.grJieIDSelf=20');" 
									style="color: black;
										width: 150px;
									    text-overflow: ellipsis;
									    overflow: hidden;
									    white-space: nowrap;" 
									href="javascript:void(0);" 
									title="马克思主义的诞生">
										马克思主义的诞生
									</a>
								</dd>
								<dd class="sub_res0  sub_res_sub" style="background:url(images-ce/in.jpg)  center  no-repeat;color:black;display: none;">
									<a path=",0,1,160,163," onclick="resType(this,'G_Grade','必修资源','-901','paramMap.grGrade=100&pageSize=8&type=1&paramMap.grJieIDSelf=21');" 
									style="color: black;
										width: 150px;
									    text-overflow: ellipsis;
									    overflow: hidden;
									    white-space: nowrap;" 
									href="javascript:void(0);" 
									title="世界殖民体系的形成与亚非拉民族独立运动">
										世界殖民体系的形成与亚非拉民族独立运动
									</a>
								</dd>
								<dd class="sub_res0  sub_res_sub" style="background:url(images-ce/in.jpg)  center  no-repeat;color:black;display: none;">
									<a path=",0,1,160,163," onclick="resType(this,'G_Grade','必修资源','-901','paramMap.grGrade=100&pageSize=8&type=1&paramMap.grJieIDSelf=22');" 
									style="color: black;
										width: 150px;
									    text-overflow: ellipsis;
									    overflow: hidden;
									    white-space: nowrap;" 
									href="javascript:void(0);" 
									title="世界大战、十月革命与国际秩序的演变">
										世界大战、十月革命与国际秩序的演变
									</a>
								</dd>
								<dd class="sub_res0  sub_res_sub" style="background:url(images-ce/in.jpg)  center  no-repeat;color:black;display: none;">
									<a path=",0,1,160,163," onclick="resType(this,'G_Grade','必修资源','-901','paramMap.grGrade=100&pageSize=8&type=1&paramMap.grJieIDSelf=23');" 
									style="color: black;
										width: 150px;
									    text-overflow: ellipsis;
									    overflow: hidden;
									    white-space: nowrap;" 
									href="javascript:void(0);" 
									title="冷战与20世纪下半期世界的新变化">
										冷战与20世纪下半期世界的新变化
									</a>
								</dd>
								<dd class="sub_res0  sub_res_sub" style="background:url(images-ce/in.jpg)  center  no-repeat;color:black;display: none;">
									<a path=",0,1,160,163," onclick="resType(this,'G_Grade','必修资源','-901','paramMap.grGrade=100&pageSize=8&type=1&paramMap.grJieIDSelf=24');" 
									style="color: black;
										width: 150px;
									    text-overflow: ellipsis;
									    overflow: hidden;
									    white-space: nowrap;" 
									href="javascript:void(0);" 
									title="当代世界的发展特点和主要趋势">
										当代世界的发展特点和主要趋势
									</a>
								</dd>
							</div></div>
							<dd subindex="1"  style="background:url(images-ce/one.jpg)  center  no-repeat;">
								<a key="2"
									onclick="resType(this,'G_Grade','选择性必修','-901','paramMap.grGrade=200&pageSize=8&type=1');"
									href="javascript:void(0);">选择性必修</a>
							</dd>
							 <div class="subdiv" style="display:none;width: 166px;background: #EAE3D3;margin-left: 7px;margin-top: -6px;margin-bottom: 10px;border:1px solid #87571E;"><div style="border:3px solid #ffffff;border-top:none;">
									<dd class="sub_res1  sub_res_sub" style="background:url(images-ce/in.jpg)  center  no-repeat;color:black;display:none;color:black;">
										<a path=",0,1,160,163," onclick="resType(this,'G_Grade','国家制度与社会治理','-901','paramMap.grGrade=200&pageSize=8&type=1&paramMap.grJieIDSelf=1');" 
										style="color: black;
											width: 150px;
										    text-overflow: ellipsis;
										    overflow: hidden;
										    white-space: nowrap;" 
										href="javascript:void(0);" 
										title="国家制度与社会治理">
											国家制度与社会治理
										</a>
									</dd>
									<dd class="sub_res1  sub_res_sub" style="background:url(images-ce/in.jpg)  center  no-repeat;color:black;display:none;color:black;">
										<a path=",0,1,160,163," onclick="resType(this,'G_Grade','经济与社会生活','-901','paramMap.grGrade=200&pageSize=8&type=1&paramMap.grJieIDSelf=2');" 
										style="color: black;
											width: 150px;
										    text-overflow: ellipsis;
										    overflow: hidden;
										    white-space: nowrap;" 
										href="javascript:void(0);" 
										title="经济与社会生活">
											经济与社会生活
										</a>
									</dd>
									<dd class="sub_res1  sub_res_sub" style="background:url(images-ce/in.jpg)  center  no-repeat;color:black;display:none;color:black;">
										<a path=",0,1,160,163," onclick="resType(this,'G_Grade','文化交流与传播','-901','paramMap.grGrade=200&pageSize=8&type=1&paramMap.grJieIDSelf=3');" 
										style="color: black;
											width: 150px;
										    text-overflow: ellipsis;
										    overflow: hidden;
										    white-space: nowrap;" 
										href="javascript:void(0);" 
										title="文化交流与传播">
											文化交流与传播
										</a>
									</dd>
								</div></div>
							<dd subindex="2"  style="background:url(images-ce/one.jpg)  center  no-repeat;">
								<a key="2"
									onclick="resType(this,'G_Grade','选修资源','-901','paramMap.grGrade=300&pageSize=8&type=1');"
									href="javascript:void(0);">选修</a>
							</dd>
								<div class="subdiv" style="display:none;width: 166px;background: #EAE3D3;margin-left: 7px;margin-top: -6px;margin-bottom: 10px;border:1px solid #87571E;"><div style="border:3px solid #ffffff;border-top:none;">
									<dd class="sub_res2  sub_res_sub" style="background:url(images-ce/in.jpg)  center  no-repeat;color:black;display:none;color:black;">
										<a path=",0,1,160,163," onclick="resType(this,'G_Grade','史学入门','-901','paramMap.grGrade=300&pageSize=8&type=1&paramMap.grJieIDSelf=1');" 
										style="color: black;
											width: 150px;
										    text-overflow: ellipsis;
										    overflow: hidden;
										    white-space: nowrap;" 
										href="javascript:void(0);" 
										title="史学入门">
											史学入门
										</a>
									</dd>
									<dd class="sub_res2  sub_res_sub" style="background:url(images-ce/in.jpg)  center  no-repeat;color:black;display:none;color:black;">
										<a path=",0,1,160,163," onclick="resType(this,'G_Grade','史料研读','-901','paramMap.grGrade=300&pageSize=8&type=1&paramMap.grJieIDSelf=2');" 
										style="color: black;
											width: 150px;
										    text-overflow: ellipsis;
										    overflow: hidden;
										    white-space: nowrap;" 
										href="javascript:void(0);" 
										title="史料研读">
											史料研读
										</a>
									</dd>
								</div></div>
						</dl>
					</li>
				</ul>
				<ul class="menutab_body menu-nav" style="display: none">
					<li class="resmedia" roomtype="resmedia" style=" background:url(images-ce/sucai.jpg) no-repeat;"><a>
					</a>
						<dl class="sub-menu" style="display: none;">
							<dd  style="background:url(images-ce/one.jpg)  center  no-repeat;">
								<a
									onclick="resType(this,'R_Res','高清图片','-1001','paramMap.rrType=1011&pageSize=8&type=1');"
									href="javascript:void(0);">高清图片</a>
							</dd>
							<!-- <dd>
								<a
									onclick="resType(this,'R_Res','3D图片','-1001','paramMap.rrType=1022&pageSize=8&type=1');"
									href="javascript:void(0);">3D图片</a>
							</dd> -->
							<dd  style="background:url(images-ce/one.jpg)  center  no-repeat;">
								<a
									onclick="resType(this,'R_Res','音频','-1001','paramMap.rrType=1073&pageSize=8&type=1');"
									href="javascript:void(0);">音频</a>
							</dd>
							<dd  style="background:url(images-ce/one.jpg)  center  no-repeat;">
								<a
									onclick="resType(this,'R_Res','高清视频','-1001','paramMap.rrType=1084&pageSize=8&type=1');"
									href="javascript:void(0);">高清视频</a>
							</dd>
							<dd  style="background:url(images-ce/one.jpg)  center  no-repeat;">
								<a
									onclick="resType(this,'R_Res','其他','-1001','paramMap.rrType=2002&pageSize=8&type=1');"
									href="javascript:void(0);">其他</a>
							</dd>
						</dl>
					</li>
					<li class="resbook" roomtype="resbook" style=" background:url(images-ce/kejian.jpg) no-repeat;"><a>
					</a>
						<dl class="sub-menu" style="display: none;">
							<dd style="background:url(images-ce/one.jpg)  center  no-repeat;">
								<a
									onclick="resType(this,'R_Res','PPT课件','-1001','paramMap.rrType=2041&pageSize=8&type=1');"
									href="javascript:void(0);">PPT课件</a>
							</dd>
							<dd style="background:url(images-ce/one.jpg)  center  no-repeat;">
								<a
									onclick="resType(this,'R_Res','WORD课件','-1001','paramMap.rrType=2033&pageSize=8&type=1');"
									href="javascript:void(0);">word课件</a>
							</dd>
							<dd style="background:url(images-ce/one.jpg)  center  no-repeat;">
								<a
									onclick="resType(this,'R_Res','PDF课件','-1001','paramMap.rrType=2055&pageSize=8&type=1');"
									href="javascript:void(0);">PDF课件</a>
							</dd>
							<dd style="background:url(images-ce/one.jpg)  center  no-repeat;">
								<a
									onclick="resType(this,'R_Res','Flash课件','-1001','paramMap.rrType=2002&pageSize=8&type=1');"
									href="javascript:void(0);">Flash课件</a>
							</dd>
						</dl></li>
				</ul>

			</div>
		</div>
	</div>
	<div id="layout_left_pms" style="display: none;background: transparent url('images-ce/left_bg.png') no-repeat scroll center bottom;">

		<div class="layout_left_menutab_pms">

			<div class="left_menutab_pms_body">
				<ul class="menutab_body menu-nav">
					<li
						style="line-height: 41px; text-indent: 65px; font-size: 14px; color: white;    background: url('images-ce/manager.jpg') no-repeat;width: 192px;"></li>
					<li class="left manager" roomtype="manager" style=" background:url(images-ce/keshiguanli.jpg) no-repeat;">
						<a>
						</a>
						<dl class="sub-menu">


							<dd style="background:url(images-ce/one.jpg)  center  no-repeat;">
								<a href="javascript:void(0);" onclick="tabSetting(this)"
									id="${pmsIndex.res_exhibition_room_mgr.code}">${pmsIndex.res_exhibition_room_mgr.name}
								</a>
							</dd>
							<dd style="background:url(images-ce/one.jpg)  center  no-repeat;">
								<a href="javascript:void(0);" onclick="tabSetting(this)"
									id="${pmsIndex.res_observation_room_mgr.code}">${pmsIndex.res_observation_room_mgr.name}
								</a>
							</dd>
							<dd style="background:url(images-ce/one.jpg)  center  no-repeat;">
								<a href="javascript:void(0);" onclick="tabSetting(this)"
									id="${pmsIndex.res_projection_room_mgr.code}">${pmsIndex.res_projection_room_mgr.name}
								</a>
							</dd>
							<dd style="background:url(images-ce/one.jpg)  center  no-repeat;">
								<a href="javascript:void(0);" onclick="tabSetting(this)"
									id="${pmsIndex.res_expand_room_mgr.code}">${pmsIndex.res_expand_room_mgr.name}
								</a>
							</dd>
							<dd style="background:url(images-ce/one.jpg)  center  no-repeat;">
								<a href="javascript:void(0);" onclick="tabSetting(this)"
									id="${pmsIndex.res_laboratory_room_mgr.code}">${pmsIndex.res_laboratory_room_mgr.name}
								</a>
							</dd>
							<dd style="background:url(images-ce/one.jpg)  center  no-repeat;">
								<a href="javascript:void(0);" onclick="tabSetting(this)"
									id="${pmsIndex.res_lovely_room_mgr.code}">${pmsIndex.res_lovely_room_mgr.name}
								</a>
							</dd>
							
						</dl></li>
					<li class="left setting" roomtype="setting" style=" background:url(images-ce/xitongguanli.jpg) no-repeat;"><a>
					</a>
						<dl class="sub-menu">
							<dd style="background:url(images-ce/one.jpg)  center  no-repeat;">
								<a href="javascript:void(0);" onclick="tabSetting(this)"
									id="${pmsIndex.sys_resource_history.code}">${pmsIndex.sys_resource_history.name}
								</a>
							</dd>
							<dd style="background:url(images-ce/one.jpg)  center  no-repeat;">
								<a href="javascript:void(0);" onclick="tabSetting(this)"
									id="${pmsIndex.sys_resource_news.code}">${pmsIndex.sys_resource_news.name}
								</a>
							</dd>
							 <dd style="background:url(images-ce/one.jpg)  center  no-repeat;">
									<a href="javascript:void(0);" onclick="tabSetting(this)" id="${pmsIndex.sys_count_mgr.code}" >${pmsIndex.sys_count_mgr.name}
									</a>
								</dd> 
								<!-- 角色管理 -->
							<%-- <dd style="background:url(images-ce/one.jpg)  center  no-repeat;">
								<a href="javascript:void(0);" onclick="tabSetting(this)"
									id="${pmsIndex.sys_role_mgr.code}">${pmsIndex.sys_role_mgr.name}
								</a>
							</dd> --%>
							<dd style="background:url(images-ce/one.jpg)  center  no-repeat;">
								<a href="javascript:void(0);" onclick="tabSetting(this)"
									id="${pmsIndex.sys_user_mgr.code}">${pmsIndex.sys_user_mgr.name}
								</a>
							</dd>
							<dd style="background:url(images-ce/one.jpg)  center  no-repeat;">
								<a href="javascript:void(0);" onclick="tabSetting(this)"
									id="${pmsIndex.bsms_category_mgr.code}">${pmsIndex.bsms_category_mgr.name}
								</a>
							</dd>
							<%-- <dd style="background:url(images-ce/one.jpg)  center  no-repeat;">
								<a href="javascript:void(0);" onclick="tabSetting(this)"
									id="${pmsIndex.sys_area_mgr.code}">${pmsIndex.sys_area_mgr.name}
								</a>
							</dd> --%>
							<dd style="background:url(images-ce/one.jpg)  center  no-repeat;">
								<a href="javascript:void(0);" onclick="tabSetting(this)"
									id="${pmsIndex.sys_operate_log.code}">操作日志 </a>
							</dd>
							<dd style="background:url(images-ce/one.jpg)  center  no-repeat;">
								<a href="javascript:void(0);" onclick="tabSetting(this)"
									id="${pmsIndex.sys_settings_db_param.code}">系统设置 </a>
							</dd>
                        </dl></li>

				</ul>

			</div>
		</div>
	</div>
	<div id="layout_right">
	
		<iframe height="100%" width="100%" id="mainFrameWelcome"
			name="mainFrameWelcome" scrolling="no" marginheight="0"
			marginwidth="0" allowtransparency="true" hspace="0" frameborder="0"
			src="${param.url==null?paramMap.welcome:param.url }"
			></iframe>

	</div>

	<input type="hidden" id="windowheight" />
	<input type="hidden" id="mainFrameheight" />
	<input type="hidden" id="windowwidth" />
	<input type="hidden" id="mainFramewidth" />
	<script src="js/tweenmax.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/scripts.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#windowheight").val($(window).height());
			$("#mainFrameheight").val($(window).height() - 48 - 120);
			$("#windowwidth").val($(window).width());
			$("#mainFramewidth").val($(window).width() - 618);

			$("dl.sub-menu>dd").hover(function() {
				//查询子集分类  传入相关ID
				$("#div_sub_submenu").hide();
				var index = $("dl.sub-menu>dd").index(this);
				var submenus = $(this).find("textarea.sub-menu-data");
				var thirdMenu = $("#div_sub_submenu");
				var thirdMenuContainer = $("#div_sub_submenu>ul");
				var $this = $(this);
				if (submenus && submenus.length > 0) {
					thirdMenuContainer.empty();
					$(submenus.val()).appendTo(thirdMenuContainer);
					thirdMenu.css({
						top : 130 + index * 35
					}).show();
				}
			});
		});
	</script>
</body>
</html>