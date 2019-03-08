<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page import="java.io.*,java.util.* "%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script src="js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/artDialog/artDialog.4.1.4.js?skin=default"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/artDialog/iframeTools.4.1.4.js"></script>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/js/artDialog/artDialog.css">
<script>
$(document).ready(function(){ 
	
	$("#btn_scale").css("top",($(window).innerHeight())/2);
	
	//根据用户类型修改提示文字
	if('${session.s_userType}' == 1){
		$("#002032 span").html("教师工作室");
		
	}else if('${session.s_userType}' == 2){
		$("#002032 span").html("学生学习室");
	}
	//点击头像菜单自动收回左侧
	$(".xt li").click(function () {
        var leftWidth = $("#layout_left").width();
        if (leftWidth == 0) {
            
        } else {
            $(".search-box").css({ left: 0 });
            $(".page-controller").css({ left: 0 });
			$("#navigation").stop(true,true).animate({ left: 0 });
            $("#navigation").show().animate({ width: '100%' });           
		   $("#layout_left").stop(true, true).animate({ width: 0 }, 500, function () {
               // $(this).hide();
            });
		   $("#layout_left_pms").stop(true, true).animate({ width: 0 }, 500, function () {
              // $(this).hide();
           });
            $("#btn_scale").stop(true, true).animate({ left: 0 }, 500);
            $("#layout_right").stop(true, true).animate({ left: 0 }, 500);
           /*  $("#btn_scale a").html("&gt;"); *//*  */
        }
    });
	
	$(".menuTabTextNavigation").html("系统主页");
	
	//alert(window.navigator.userAgent);
	if('${session.s_userType}' != 3){
		$.ajax({
			url:		'ajaxAction.action?code=-0450',
			type:	    'post',
			timeout:	'60000',
			data:	Array(),
			dataType:	'json',
			beforeSend:function(request){},
			complete:function(request,textStatus){},
			success:function(jsonData,textStatus){
				var cateList = new Array();
				if (textStatus == "success"){
					if (jsonData.data){
						for (var i=0; i<jsonData.data.length;i++){
							var userImg = jsonData.data[i].userImg;
							$("#userimg").attr("src",userImg);
						}
					} 
				}
			},	
			error:function(request,textStatus,error){}
		});
	}
	
	//隐藏事件
	$("#div_sub_submenu").hover(function () {
        $(this).attr("isOnMouseOver", true);
        $(this).show();
    }, function () {
        $(this).hide();
        $(this).removeAttr("isOnMouseOver");
    });
	
	//备课中心
	$("#backupCenter").click(function(){
		tabClick('munu','高级查询','-1301','');
	});
	//高级查询
	$("#bigserach_").click(function(){
		tabClick('munu','高级查询','-1301','');
	});
	//系统信息
	$("#sysInfo").click(function(){
		tabClick('munu','高级查询','-1301','');
	});
	$("#teste").click(function(){
		tabClick('munu','高级查询','-120001','');
	});

	//地图定位
	$("#area").click(function(){
		tabClick(4,'地图定位','-2019','');
	});
	
	//系统退出
	$("#logout_").click(function(){
		/* if (confirm("您确认要退出吗?"))
			location = "index.jsp"; */
		
		      art.dialog({ content: '您确认要退出吗', title:'退出系统提示', width:160, height:60, lock: true,  
		    background: '#000000', opacity: 0.9, icon: 'question', ok: function () { location = "exit.jsp"; }, cancelVal: '取消', cancel: true ,drag:false});
			$(".aui_dialog").css("background",'#ffffff');
	});	
	
	//返回首页
	$("#logoimg").click(function(){
		//location.reload();
		location.href="forwardAction.action?code=-1700&id=0&suiji="+new Date().getTime();
	});
	
	
	//回退
	$("#houtui").click(function(){
		history.go(-1);
	});
	
	//前进
	$("#qianjin").click(function(){
		history.go(+1);
	});
		
	//搜索 ----自动搜索数据---------开始
	

	
});
function houtui(){
	history.go(-1);
}
function qianjin(){
	history.go(+1);
}
function sou(){
	var keyword = $("#search_").val().replace(/(^\s*)|(\s*$)/g,'');
	var title = "查询资源" ;
	if(keyword==''){
		art.dialog.alert('查询内容不能为空!!!');
	   return false;
	}
	forwardUrl = "decorateForwardAction.action";
	tabClick("-1101", title, '-1101','paramMap.resType=' + "-1101" + '&paramMap.keyword=' + keyword +"&pageSize=8");

}
function shou(){
	location.href="forwardAction.action?code=-1700&id=0&suiji="+new Date().getTime();
}
function gao(){
	tabClick('munu','高级查询','-1301','');
}
function info(){
	tabClick('munu','高级查询','-1301','');
}
function menuTabTextNavigation(t){
	/*  var message=t;
	var keyMessage=message.substring(message.indexOf("keyMessage")+10,message.length);
	var strMessage=t.substring(0,message.indexOf("keyMessage"));
	//alert(keyMessage+"\n\n"+strMessage);
	var pathArr=keyMessage.split(",");
	var code=pathArr[0];
	var  wordArr=strMessage.split("&gt;");
	var newNavigation="";
	for (var i=0;i<wordArr.length;i++){
		var path='';
		for (var j=0;j<i+2;j++){
		  path +=","+pathArr[j+1];
		}
		path +=",";
		newNavigation +="<a href='javascript:void(0);' onclick='decorateForwardAction.action?code="+code+"&paramMap.path="+path+"' >"+wordArr[i]+"</a>"; 
	} */
	//alert(newNavigation);
	var isOpen=$("#isOpen",window.parent.document).attr("value");
	//alert(isOpen);
	if(isOpen==0){
	if(t!=null && t!=""){
		$(".menuTabTextNavigation").html(t);	
	}else{
		$(".menuTabTextNavigation").html("系统主页");
	}
	}else{}
	$("#isOpen",window.parent.document).attr("value",0);
}
function manager_pms(flag){
	if(flag==1){
		$("#layout_left").show();
		$("#layout_left_pms").hide();
	}else if(flag==0){
		$("#layout_left").hide();
		$("#layout_left_pms").show();
	}else if(flag==2){
        var localIp=GetLocalIPAddr();
        //alert(localIp);
	//跳转，统计页面
		tabClickHref(localIp+"/UniteCount-school/ShowDitalServlet");
	}
	
}
 function GetLocalIPAddr(){ 
	 var url=window.location.href;
 	 var startoint = url.indexOf("//");
 	 var endPoint = url.indexOf("8086");
 	 return url.substring(startoint, endPoint+4);

 }
</script>
<style>


#menu li{
background: #681F14;
z-index:99999;
}
#layout_top{
	margin: 0;
	background: url(<%=request.getContextPath()%>/images-ce/top.png) center no-repeat;
	background-size: cover;
	-ms-behavior: url(<%=request.getContextPath()%>/css/backgroundsize.min.htc);
	behavior: url(<%=request.getContextPath()%>/css/backgroundsize.min.htc);
}
</style>
<div id="layout_top" style=" position:relative; background:url(images-ce/top.png) center bottom no-repeat; background-size:100% 100%; ">
	
	 <img id="logoimg"  src="images-ce/name.png" style="float: left;position: relative;top: 20px;left: 30px;"></img>
	 <div style="position: relative; width: 396px; height: 70px; float: right;">
	   
		<img  usemap="#map" class="region_button"  src="images-ce/top_fun.jpg" style="float: right;position: relative;right: 230px;height: 69px;"></img>
		<map  name="map" id="map">
			<area  shape="rect"
			coords="0,20,35,52" 
			alt="login"
			class="hotpoint shou" 
		    href ="javascript:shou();" />
			<area  shape="rect"
			coords="43,20,78,52" 
			alt="login"
			class="hotpoint houtui" 
		    href ="javascript:houtui();" />
		    <area  shape="rect"
			coords="83,20,117,52" 
			alt="login"
			class="hotpoint qianjin" 
		    href ="javascript:qianjin();" />
		    <area  shape="rect"
			coords="261,20,297,52" 
			alt="login"
			class="hotpoint sou" 
		    href ="javascript:sou();" />
		    <area  shape="rect"
			coords="307,20,340,52" 
			alt="login"
			class="hotpoint gao" 
		    href ="javascript:gao();" />
		    <area  shape="rect"
			coords="348,20,380,52" 
			alt="login"
			class="hotpoint info sys_info" 
		    href ="javascript:info();" />
		</map>
		<input type="text"   name="searchText" id="search_" placeholder="输入查询内容"  style=" position: relative;top: -48px;float: left; right:74px; width: 118PX;height: 30px;background: url(images-ce/top_input.jpg) repeat;border: none;color: white;line-height: 30px; "/>
		<script>
		$(document).ready(function(){ 
			if($('.region_button').length){
		        $('.hotpoint').unbind().bind('mouseenter',function(){
		            if($(this).hasClass('shou')){
		                $('.region_button').attr('src','images-ce/top_fun_shou.jpg');
		            }else if($(this).hasClass('houtui')){
		                $('.region_button').attr('src','images-ce/top_fun_houtui.jpg');
		            }else if($(this).hasClass('qianjin')){
		                $('.region_button').attr('src','images-ce/top_fun_qianjin.jpg');
		            }else if($(this).hasClass('gao')){
		                $('.region_button').attr('src','images-ce/top_fun_gao.jpg');
		            }else if($(this).hasClass('info')){
		                $('.region_button').attr('src','images-ce/top_fun_info.jpg');
		            }else if($(this).hasClass('sou')){
		                $('.region_button').attr('src','images-ce/top_fun_search.jpg');
		            }
		        }).bind('mouseleave',function(){
		        	 $('.region_button').attr('src','images-ce/top_fun.jpg');
		        });
		    }
		});
		</script>
	</div>
	<div class="login-info" style=" width: 180px;height: 55px; background: red;float: right; left: 354px; position: relative;top: 5px;background: url(images-ce/info.jpg) repeat;">
		<label style="position: relative;left: 49px;top: 7px;width: 120px;float: left;color: white;">${session.s_userLoginName}</label>
		<ul class="login-info-more" id="menu" style="display:none;">
				<s:iterator value="subPermission" id="pms" status="ind">			
					<!-- 管理员 -->
					<s:if test="session.s_userType == 3 ">
						<s:if test="#pms.code != '004' && #pms.code != '005'">
							<li class="mli">
								<div class="label_${session.s_userType}" id="${pms.code}" ></div>
								<ul >
									<s:iterator value="allPermission" id="allpms" status="allind">	
										<s:if test="#pms.code == #allpms.parentCode and #allpms.code != '003016' and #allpms.code != '003000'">	
                                            
											<li><a href="javascript:void(0);" onclick="manager_pms(0)" id="${allpms.code}">&nbsp;<span>${allpms.name}</span></a></li>
											
										</s:if>
		 					</s:iterator>				
								</ul>
							</li>
						</s:if>
						<li><a href="javascript:void(0)"  onclick="manager_pms(2)">信息统计</a></li> 
						<li><a href="javascript:void(0)"  onclick="manager_pms(1)">返回浏览</a></li>
						<li><a href="javascript:void(0)">下载备课中心客户端</a></li>
						
					</s:if>	
					<!-- 老师 或者 学生 -->
					<s:if test="session.s_userType == 1 || session.s_userType == 2 ">
						<s:if test="#pms.code != '004' && #pms.code != '005'">
							<li class="mli">
								<div class="label_${session.s_userType}" id="${pms.code}" ></div>
								<ul class="xt">
									<s:iterator value="allPermission" id="allpms" status="allind">	
										<s:if test="#pms.code == #allpms.parentCode and #allpms.code != '003016' and #allpms.code != '003000'">
											<li><a href="javascript:void(0);" id="${allpms.code}">&nbsp;<span>${allpms.name}</span></a></li>
										</s:if> 
				 					</s:iterator>				
								</ul>
							</li>
							<s:if test=" session.s_userType == 1 ">
								<li><a href="javascript:void(0)" >下载备课中心客户端</a></li>
							</s:if>
							
							
						</s:if>
					</s:if>
 				</s:iterator>
				
				
				<li><a href="javascript:void(0)" id="logout_">退出系统</a></li>
			</ul>
	</div>
	<div class="sys_info" style="  position: relative;  display: inline;  float: right;  overflow: visible;  z-index: 14;  left: 345px;">
			<a href="javascript:void(0)" class="fade-button" title="系统信息" style="left:350px;padding-right: 0px;  height: 48px; display: block;  margin-left: 30px;">
				<i style="background:none;width: 35px;height: 50px; top: 15px;" class="icon-advsearch"></i>
			</a>
			<ul id="sys_info_more"  style="  position: absolute;  top: 57px;  right: -10px;  width: 170px;  height: auto;display: none; " >
					<li style="display:block;"><a style="height:34px;background:#681F14;  line-height:30px; text-align:center; display:block; clear:both;" href="javascript:void(0)" data-fade-to="#ca3d3d" onclick="alert('当前版本:${paramMap.version}');" >系统信息</a></li> 
					<li style="display:block;"><a style="height:34px; background:#681F14;line-height:30px; text-align:center; display:block; clear:both;" href="javascript:void(0)" data-fade-to="#ca3d3d" onclick="alert('暂无信息');">系统升级</a></li>
			</ul>
		</div>
	 <div id="btn_scale"><a href="javascript:;"></a></div>
</div>
<div class="navigation" id="navigation">
	<div><span style="width:26px;height:24px;background:url(images-ce/daohangleft.png) no-repeat;float: left;margin-top: 10px;margin-left: 50px;"></span><span style="float:left;height:24px;background:url(images-ce/daohang.png) repeat;margin-top: 10px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;位置：<span class="menuTabTextNavigation"></span></span><span style="margin-top: 10px;width:24px;height:24px;background:url(images-ce/daohangright.png) no-repeat;float: left;"></span></div>
</div>
<script src="js/jquery-main-tag.js"></script>