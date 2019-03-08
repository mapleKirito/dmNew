<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>数字历史管主页</title>
    <link href="qc/css/style.css" rel="stylesheet" />
    <link href="qc/css/gallery.css" rel="stylesheet" />
    <style type="text/css">
.tag { 
font-size: 20px;
}
#attention p{
width: 80px;
background: #ae9b84;
margin: 0 auto;
margin-top: 4px;
height: 22px;
}
.ssjh-grxx div.left {border: 0px solid #dfdfdf;}
.group-user-list li a {width: 60px;height: 60px;}
.ssjh-grxx div.left dl dd a { margin-left: 13px;background: none;}

.tabcontrol p.tabtitle a.tag { color:#555555;width: 114px; float: left; margin-top:3px; z-index:2; display: inline; cursor: pointer; font-size: 16px; color: #8f8f8f; text-align: center; border-right:1px solid #e2e2e2; overflow:hidden;height: 42px;  margin-top: -1px;  border-right: 1px solid #A98534;}
 .tabcontrol p.tabtitle a.tag.on { color:#482D0D;margin-top:0px; border-top:2px solid #D7B593;  background: #F8F4ED url(<%=request.getContextPath()%>/images-ce/xiaozutop.png) no-repeat;}
 .ssjh-grxx div.left dl dd{height: 30px;}
.tabtitle{
background: url(<%=request.getContextPath()%>/images-ce/topmenu.png) center no-repeat;
	background-size: cover;
	-ms-behavior: url(<%=request.getContextPath()%>/css/backgroundsize.min.htc);
	behavior: url(<%=request.getContextPath()%>/css/backgroundsize.min.htc);
}
</style>
    
 <script type="text/javascript">
 	$(document).ready(function() {
		$('.left  img').each(function() {
			if ($(this).attr('src') == '') {
				$(this).attr('src', 'images/default/default_img.jpg');
			}
		});
	});
 
 
 </script>   
</head>
<body>
<input type="hidden" id="uid" value="${paramMap.userID }" >
<input type="hidden" id="currentUserId" value="${session.s_userID}" >
<div id="layout_mainbody">
   	 <div class="page-container ssjh">
        <div id="layout_main">
            <div class="ssjh-grxx">
				<div class="left"  style="background: url(<%=request.getContextPath()%>/images-ce/personmiddlle.png);">
					<div style="background: url(<%=request.getContextPath()%>/images-ce/person.png) center bottom no-repeat;background-size: 100% 100%;padding-top: 10px;height: 350px;text-align: center;">
					<img style="width: 128px;height: 128px;margin-top: 25px;margin-bottom: 10px;" src="${initMap.userInfo.userImg }" onerror="this.src='images/default/default_img.jpg'" />
					
					<s:if test="initMap.userInfo.userName.length() > 5">
						<p>名称：<span title="${initMap.userInfo.userName}"><s:property value="initMap.userInfo.userName.substring(0,5)" /> ...</span></p>
	                </s:if>
					<s:else>
						<p>名称：<span title="${initMap.userInfo.userName}"><s:property value="initMap.userInfo.userName" /></span></p>
				 	</s:else>
					
	                <p>类型：${(initMap.userInfo.userType==1)?'老师':(initMap.userInfo.userType==2?'学生':'管理员')}</p>
	                <p>财富值：${initMap.userInfo.wealth}</p>
	               
	                <div id="attention" attention="${initMap.userInfo.attention}" style="cursor:pointer;">
	                <p>${(initMap.userInfo.attention!=0)?'已关注':'关注'}</p>
	                </div>
	              
	                 <s:if test="#initMap.userInfo.qq !=''|| #initMap.userInfo.qq !=null">
	                  <a  style="  height: 40px;  float: left;  width: 185px;" target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=${initMap.userInfo.qq}&site=qq&menu=yes"></a>
	                </s:if>
	                <s:else>
	                 <a><div  style="margin-top:-1px;border: none;height: 49px;width:185px;background: url(<%=request.getContextPath()%>/images-ce/qqq.png) center bottom no-repeat;" ></div></a>
	                
	                </s:else>
				</div>
				
					<dl>
					
						<dd  >
							<div class="body">
                                    <ul class="group-user-list"  >
                                    <li style="background: url(<%=request.getContextPath()%>/images-ce/persontop.png) center bottom no-repeat;background-size: 100% 100%;height:49px;  height: 49px;  width: 185px;  margin-left: 15px;  margin-top: -1px;"></li>
	                                    <s:iterator id="t" value="initMap.userList">
	                                   		<li style="margin-top: 0px;margin-bottom: 35px;">
	                                   			<a decorateForwardAction.action?code=-25200&paramMap.userID=${t.targetID }" style=""><img style="width:60px;height: 60px;display: block;" src="${t.userImg}"></a>
	                                   		
	                                   			<s:if test="#t.userName.length() gt 5">
	                                               <a href="decorateForwardAction.action?code=-25200&paramMap.userID=${t.targetID }" style="width: 60px;height: 20px;backgroundColor:#F1EADD;"> <span title="${t.userName }" style="cursor:pointer;  margin-left: -30px;backgroundColor:#F1EADD;"><s:property value="#t.userName.substring(0,5)+'...'" /></span></a>
                                               	</s:if>
                                               	<s:else>
	                                               	<a href="decorateForwardAction.action?code=-25200&paramMap.userID=${t.targetID }" style="width: 60px;height: 20px;backgroundColor:#F1EADD;"><span title="${t.userName }" style="cursor:pointer;  margin-left: -30px;backgroundColor:#F1EADD;"><s:property value="#t.userName" /></span></a>
	                                            </s:else>
	                                   			
	                                   			
	                                   		</li>
	                                    </s:iterator>
	                                    <li style="background: url(<%=request.getContextPath()%>/images-ce/personbottom.png) center bottom no-repeat;background-size: 100% 100%;height:49px;  height: 49px;  width: 185px;  margin-left: 15px;  margin-top: -49px;  border-bottom: 2px solid #A98534;"></li>
                                    </ul>
                                    
                            </div>
						</dd>
					</dl>
				</div>
				
				<div class="right">
					<div class="ssjh-index-row3 tabcontrol">
				     <div class="tabtitle-bg"></div>
				          <p class="tabtitle" style=" position:relative; background:url(images-ce/topmenu.png) center bottom no-repeat; background-size:100% 100%;">
					        <a  class="tag on" subHref="decorateForwardAction.action?code=${pmsIndex.user_dynamimc.code}&paramMap.userID=${paramMap.userID }&paramMap.isShare=1">最新动态</a>
					         <s:if test="initMap.userInfo.userType==1">
					            <a class="tag" subHref="decorateForwardAction.action?code=${pmsIndex.share_resource.code}&paramMap.userID=${paramMap.userID }&paramMap.isShare=1&paramMap.personalShare=1">分享资源</a>
					          </s:if>
					         <a  class="tag" subHref="decorateForwardAction.action?code=${pmsIndex.share_images.code}&paramMap.userID=${paramMap.userID }&paramMap.gaShare=1">图库</a>
					     </p>
				     <iframe id="childrenMain" name="childrenMain" scrolling="no" style="background: #F8F4ED;" marginheight="0" marginwidth="0" frameborder="0" src="decorateForwardAction.action?code=${pmsIndex.user_dynamimc.code}&paramMap.userID=${paramMap.userID }&paramMap.isShare=1" width="727px"   ></iframe>
				    </div> 
					
				</div>
				
			</div>
        </div>
       </div>
       </div>
    <script src="qc/js/jquery-1.7.2.min.js"></script>
    <script src="qc/js/tweenmax.min.js"></script>
    <script src="qc/js/jquery.bxslider.min.js"></script>
    <script src="qc/js/scripts.js"></script>
    <script type="text/javascript">
    
    
    	
        $(document).ready(function () {
        	
        	$(".tabcontrol .tabtitle a").click(function(){

				var srcPath = $(this).attr("subHref");
        		$(this).addClass("on").siblings().removeClass("on");
        		$("#childrenMain").attr("src",srcPath);
        	});
        	
        	
        	$("#childrenMain").height($(".left").height()+40);
            $(".rs-slider>ul").bxSlider({
                controls: true,
                nextText: "",
                prevText: "",
                auto: true,
                autoStart:true,
                prevSelector: "em.rs-prev",
                nextSelector: "em.rs-next",
                pager:false
            });
            
            $("#attention").hover(function(){
            	if($(this).attr("attention")==0){
            		$("#attention p").css({"background": "#e64747"});
            	}
            },function(){
            	$("#attention p").css({"background": "#ae9b84"});
            });
            
            $("#attention").die().live("click",function(){
        		var uid=$("#uid").val();
        		var currentUserId=$("#currentUserId").val();
        		var liObj=$(this);
        		if(uid==currentUserId){
        			alert("您不能关注您自己！");
        		}else{
        		var attention=$("#attention").attr("attention");
        		if(attention==0){
        			$.ajax({
            			url:		'ajaxAction.action?code=002032004001&paramMap.attentionType=add&paramMap.targetID='+uid,
            			type:	    'post',
            			timeout:	'60000',
            			data:	Array(),
            			dataType:	'json',
            			beforeSend:function(request){},
            			complete:function(request,textStatus){},
            			success:function(jsonData,textStatus){
            				if (textStatus == "success"){
            					//alert(jsonData.flag);
            					if(jsonData.flag>0){
            						//liObj.remove();
            						$("#attention p").html("已关注");
            						$("#attention").attr("attention",1);
            					}
            				}
            			}
            		}); 
        		}else{
        			alert("你已关注过此用户了！");
        		}
        		
        		 }
        	})
           
        });
    </script>
</body>
</html>
