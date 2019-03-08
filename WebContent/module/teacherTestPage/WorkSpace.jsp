<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="qc/css/style.css" rel="stylesheet" />
<link href="qc/css/calendar.css" rel="stylesheet" />
<script src="qc/js/jquery-1.7.2.min.js"></script>
    <script src="qc/js/tweenmax.min.js"></script>
    <script src="qc/js/scripts.js"></script>
<style type="text/css">
.childrenxt li{margin:15px 0px;}
body{margin: 0px; font-size: 12px;}
a{ text-decoration:none;color: #333;}
a:hover{ text-decoration:none;color: #333;}
.qqImg{
/* for IE */
  filter:alpha(opacity=0);
  /* CSS3 standard */
  opacity:0.0;
}
.menu_title{ font-size: 14px;
		font-weight: bold; }
.ssjh-grxx div.left dl dd {
height: 32px;
line-height: 32px;}
.ssjh-grxx div.left dl dt {background: none;}
.left p{height: 25px;line-height: 25px;font-size: 14px;color: #333333;}


</style>
<script>
$(document).ready(function(){
/* 	$("#childrenMain").height($(window).height());
 */	var url='${paramMap.url }';
	//alert(url);
	if(url!=""){
		$("#childrenMain").attr("src","decorateForwardAction.action?code="+url+"&paramMap.userID=${s_userID}&suijichileren="+new Date());	
	}
	$(".left dl dd").click(function(i){
		var id_li_a = $(this).find("a").attr("id");
		if(id_li_a=="prea_"){
			
		}else{
		    $("#childrenMain").attr("src","decorateForwardAction.action?code="+id_li_a+"&paramMap.userID=${s_userID}&suijichileren="+new Date());		
		}
	});
});

	/* 解决头像问题 */
	$(document).ready(function(){
	    $('.left  img').each(function(){               
	        if($(this).attr('src')==''){                   
	            $(this).attr('src','images/default/default_img.jpg');               
	        }           
	    });                   
	}); 

</script>
</head>
<body>
	<div id="layout_mainbody">
		<div class="page-container ssjh" style="padding-bottom: 0px;">
			<div class="ssjh-grxx">
				<s:if test="session.s_userType == 1 ">
					<div class="left" style="background: url(<%=request.getContextPath()%>/images-ce/menu.png) center bottom no-repeat;background-size: 100% 100%;height:921px;border:none;">
				</s:if>
				<s:else>
					<div class="left" style="background: url(<%=request.getContextPath()%>/images-ce/menu_sheng.png) center bottom no-repeat;background-size: 100% 100%;height:843px;border:none;">
				</s:else>
					<div style="padding-top: 10px;height: 295px;text-align: center;">
						<img style="width: 128px;height: 128px;margin-top: 22px;margin-bottom: 17px;" src="${initMap.userInfo.userImg } " onerror="this.src='images/default/default_img.jpg'" />
						<p>名称：${initMap.userInfo.userName}</p>
		                <p>类型：${(initMap.userInfo.userType==1)?'老师':(initMap.userInfo.userType==2?'学生':'管理员')}</p>
		                <p>财富值：${initMap.userInfo.wealth}</p>
		 
		                 <s:if test="initMap.userInfo.qq !='' && initMap.userInfo.qq !=null">
		                     <a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=${initMap.userInfo.qq}&site=qq&menu=yes"><div  style="border: none;height: 30px;width:100px;" ></div></a>
					     </s:if>
					      <s:if test="initMap.userInfo.qq =='' || initMap.userInfo.qq ==null">
		                     <a><div  style="margin-top:-1px;border: none;height: 49px;width:185px;background: url(<%=request.getContextPath()%>/images-ce/qqq.png) center bottom no-repeat;" ></div></a>
					     </s:if>
					</div>
					<dl>
						<dt class="menu_title" style="position: relative;"></dt>
						<dd style="cursor:pointer ">
							<a id="${pmsIndex.myWelcome.code}&paramMap.gaShare=1" href="javascript:void(0);"><i></i><em></em>
							</a>
						</dd>
						<dd style="cursor:pointer ">
							<a id="002032005"  href="javascript:void(0);"><i></i><em></em>
							</a>
						</dd>
						<dd style="cursor:pointer ">
							<a id="002032008"  href="javascript:void(0);"><i></i><em></em>
							</a>
						</dd>
						<dd style="cursor:pointer ">
							<a id="002032004" href="javascript:void(0);"><i></i><em></em>
							</a>
						</dd>
						<dd style="cursor:pointer ">
							<a id="002032002" href="javascript:void(0);"><i></i><em></em>
							</a>
						</dd>
						
						<dt class="menu_title" style="position: relative;"></i>
						</dt>
						
						<s:if test="session.s_userType == 1 ">
							<dd style="cursor:pointer ">
								<a  id="prea_" target="_block" href="pcp://start"><i></i><em></em>
								</a>
							</dd>
							<dd style="cursor:pointer ">
								<a id="002032010"  href="javascript:void(0);"><i></i><em></em>
								</a>
							</dd>
						</s:if> 
						<dd style="cursor:pointer ">
							<a id="002032001" href="javascript:void(0);"><i></i><em></em>
							</a>
						</dd>
						<dd style="cursor:pointer ">
							<a id="002032003" href="javascript:void(0);"><i></i><em></em>
							</a>
						</dd>
						
						<dt class="menu_title" style="position: relative;"></i>
						</dt>
						<dd style="cursor:pointer ">
							<a id="002032009"  href="javascript:void(0);"><i></i><em></em>
							</a>
						</dd>
						<dd style="cursor:pointer ">
							<a id="002032006"  href="javascript:void(0);"><i></i><em></em>
							</a>
						</dd>
						
						
					</dl>
				</div>
				<div class="right" style="height: auto;overflow: inherit;">
				    <div class="ssjh-index-row3 tabcontrol">
						<iframe id="childrenMain" name="childrenMain" scrolling="no" marginheight="0" marginwidth="0" frameborder="0" src="decorateForwardAction.action?code=002032000&paramMap.gaShare=1&paramMap.userID=${s_userID}" width="715px" height='921px'  ></iframe>
					</div>
				</div>
				
			</div>
     </div>


</body>
</html>