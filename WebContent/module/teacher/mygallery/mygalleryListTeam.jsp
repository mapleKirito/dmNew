<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
    <%
    	String basePath = "http://" + request.getLocalAddr() + ":"
    			+ request.getLocalPort() + request.getContextPath();
    %>
    <title></title>
    <head>
    <link href="qc/css/style.css" rel="stylesheet" />
<link href="qc/css/calendar.css" rel="stylesheet">
<script src="qc/js/scripts.js"></script>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/main.css">
<script type="text/javascript">  

$(function(){
	 
	 $(".mem_class").hover(function () {
		 if($("#uid").val()==$("#createId").val()){
	    	$(this).find(".mem_remove").show();
			$(this).find(".mem_share").show();
		 }
	    }, function () {
	    	
			$(this).find(".mem_remove").hide();
			$(this).find(".mem_share").hide();
	    });
	$(".mem_remove").die().live("click",function(){
		var uid=$(this).attr("uid");
		var liObj=$(this);
		if(confirm("确定要删除这个相册吗")){
			$.ajax({
				url:		'ajaxAction.action?code=002032008003&paramMap.gaID='+uid+'&paramMap.gaParentId='+uid,
				type:	    'post',
				timeout:	'60000',
				data:	Array(),
				dataType:	'json',
				beforeSend:function(request){},
				complete:function(request,textStatus){},
				success:function(jsonData,textStatus){
					if (textStatus == "success"){
						if(jsonData.flag>0){
							//alert(liObj.parent().html());
							liObj.parent().remove();
						}
					}
				}
			}); 
		}
		
	})
	
	$(".mem_share").die().live("click",function(){
		var uid=$(this).attr("uid");
		var share=$(this).attr("share");
		var liObj=$(this);
		var shareChange=1;
		var str="确定要共享这个相册吗";
		if(share=="1"){
			str="确定要取消共享这个相册吗";
			shareChange=0;
		}
		if(confirm(str)){
			$.ajax({
				url:		'ajaxAction.action?code=002032008006&paramMap.gaID='+uid+'&paramMap.gaShare='+shareChange+'&paramMap.gaParentId='+uid,
				type:	    'post',
				timeout:	'60000',
				data:	Array(),
				dataType:	'json',
				beforeSend:function(request){},
				complete:function(request,textStatus){},
				success:function(jsonData,textStatus){
					if (textStatus == "success"){
						if(jsonData.flag>0){
							//alert(liObj.parent().html());
							if(shareChange==1){
								liObj.html("已共享");
							}else{
								liObj.html("共享");
							}
							liObj.attr("share",shareChange);
							
						}
					}
				}
			}); 
		}
		
	})
	
})
function toxiangce(f){
    		//alert(123);
    		$("#childrenMain" , parent.document).attr("src","decorateForwardAction.action?code=00203200208007&paramMap.gaParentId="+f+"&paramMap.userID=${paramMap.userID }&paramMap.teamID=${paramMap.tID }&suijichileren="+new Date());		
		    //alert($("#childrenMain" , parent.document).attr("src")  );
    	}
</script>
<style type="text/css">
.mem_class{
position: relative;
text-align: center;
}
.mem_remove{
display:none;
  position: absolute;
  right: -24px;
  top: 7px;
  color: white;
  font-size: 12px;
  cursor: pointer;
  z-index: 3;
  background-color: #AB413C;
  font-size: 12px;
  width: 19px;
  line-height: 11px;
  height: 15px;
}

.mem_share{
  display:none;
  position: absolute;
  right: -24px;
  top: 88px;
  color: white;
  font-size: 12px;
  cursor: pointer;
  z-index: 3;
  background-color: #AB413C;
  font-size: 12px;
  width: 49px;
  line-height: 20px;
  height: 20px;
}
.imgDiv{
position: relative;
left: 45px;
margin:0 auto;
width: 128px;
height: 100px;
background: #f3f3f3;
border: 1px solid #504538;

/*非IE的主流浏览器识别的垂直居中的方法*/ 
display: table-cell; 
vertical-align:middle; 
/*设置水平居中*/ 
text-align:center; 
/* 针对IE的Hack */ 
*display: block; 
*font-size: 175px;/*约为高度的0.873，200*0.873 约为175*/ 
*font-family:Arial;/*防止非utf-8引起的hack失效问题，如gbk编码*/ 
}
.imgDiv img{
/*设置图片垂直居中*/ 
vertical-align:middle; 
}
ul.groups li {
  width: 150px;}
</style>
</head>
<body>
<input type="hidden" id="uid" value="${paramMap.s_userID }" >
<input type="hidden" id="tid" value="${paramMap.teamID }" >
<input type="hidden" id="createId" value="${paramMap.createrID }" >
	<div id="layout_mainbody">
		<div class="my-article panel page-container ssjh" style="margin-top: 0px;">
		
			<p class="title topborder">
				相册
				
				<span id="addPic">
				
						<a href="decorateForwardAction.action?code=00203200208001&paramMap.tID=${paramMap.tID }">添加</a> 
				
				</span>
			
			</p>
			
			<div class="body">
				<ul class="groups">
					<s:iterator id="t" value="initMap.imgList" status="index">
					 <s:if test="#t.gaParentId==null||#t.gaParentId==0">
						<li class="mem_class" style="height: 160px;padding-top: 6px;"><s:if
								test="#t.gaUserID==#session.s_userID">
								<div uid="${t.gaID }" class="mem_remove">x</div>
								<div uid="${t.gaID }" share="${t.gaShare }" class="mem_share">${(t.gaShare==1)?'已共享':'共享'}</div>
							</s:if>
							<div class="imgDiv">
								<span></span> <a title="${t.gaDescription }" 
									href="decorateForwardAction.action?code=00203200208007&paramMap.gaParentId=${t.gaID }&paramMap.teamID=${paramMap.teamID }&paramMap.picNum=${index.index}&paramMap.currentUserID=${paramMap.userID }&paramMap.createrID=${paramMap.createrID }">
									<img src="${fn:substringBefore ( t.gaSrc,'gagellery')}T_gagellery${fn:substringAfter  ( t.gaSrc,'gagellery')}"
									onerror="this.src='images/default/default_img.jpg'"
									onload="if(this.width >= 128){this.height=(this.height/this.width)*128;this.width = 128;}if(this.height >= 100){this.width=(this.width/this.height)*100;this.height = 100;}" />
								</a>
							</div>
							<p
								style="width: 150px; left:45px;;position:relative;white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">${(t.gaDescription)==""?"&nbsp":(t.gaDescription)
								}</p>
							<p style="width: 150px; left:45px;;position:relative;white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">
								${t.user_name  }
							</p>
							<p style="width: 150px; left:45px;;position:relative;white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">
								${t.gaCreateTime }
							</p>
						</li>
						</s:if>
					</s:iterator>
				</ul>
			</div>
			<div class="pageb" id="table3page" style="margin-right: 20px;">
				${initMap.paginated.pageContent}</div>

		</div>
	</div>


	<script type="text/javascript">
$(document).ready(function () {
	$('#table3page').pageTB();
	if($("#uid").val()==$("#createId").val()){
		$("#addPic").show(); 
		
	 }else{
		
		 $("#addPic").hide(); 
	 }

})

</script>
</body>
</HTML>
