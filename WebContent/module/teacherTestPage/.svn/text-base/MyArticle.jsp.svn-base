<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
    <%
    	String basePath = "http://" + request.getLocalAddr() + ":"
    			+ request.getLocalPort() + request.getContextPath();
    %>
    <title></title>
    <head>
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/bodyfocus.js"></script>
     <link href="<%=request.getContextPath()%>/css/manager.css" rel="stylesheet" >
<script type="text/javascript">
var gridtb;
$(document).ready(function(){	
	
	var ujdata = {
		//表单ID
		formID:'actionForm',			
		globalParam:$("#actionForm").formSerialize(),
	    //first,last
    	checkbox:{name:'',type:'first',width:'5%'},
    	shortcut:{
    		name:'操作',
	    	url:'decorateForwardAction.action',
	    	width:'25%',
	    	event:[
    			{operate:'modify',name:'${pmsIndex.myArticle_modify.name}',disabled:'false',isvalid:'${!empty pmsIndex.myArticle_modify}',param:'code=${pmsIndex.myArticle_modify.code}'},
    			//{operate:'preview',name:'${pmsIndex.res_exhibition_room_preview.name}',disabled:'false',isvalid:'${!empty pmsIndex.res_exhibition_room_preview}',param:'preview_'},
      			{operate:'del',name:'${pmsIndex.myArticle_del.name}',disabled:'false',isvalid:'${!empty pmsIndex.myArticle_del}',param:'code=${pmsIndex.myArticle_del.code}'}
	        ]
	    },
    	columnDesc:{
	    	//列表要显示的列（在json中对应的key）
			showColumn: ['aTitle','aTime'],
			//列表头显示名称
			columnName:   ['标题','发表时间'],
			//列表头宽度
			columnWidth:   ['55%','15%'],
			//可以作为主键的类，在页面传送的过程中为paramMap.orgID=value的形式
			//多个主键的时候为["orgID","orgCode"]:paramMap.orgID=value&paramMap.orgCode=value
			primkeyColumn:["aID"],
			//为ujoption中columnCode_替换值做准备
			typeColumn:["erType"],
			//为ujoption中name替换值做准备
			nameColumn:["aTitle"],
			//要增加链接的列，可以为多个
			linkColumn:[{name:'aTitle',url:'decorateForwardAction.action',param:'code=002031003'}]
    	},		
    	ajax:{
        	url:'ajaxAction.action',
        	data:'code=${pmsIndex.myArticle_serach.code}&paramMap.userID=${paramMap.userID}'
	    },
	    //是否有分页工具条
	    isPagination:'true',	    
    	paginationData:{
			pageSize:'6'
    	}
	};
	var ujoption = {
		autoclose: true,
		columnAlias:function(col,val){
			if(col == 'erType') {
				if (val == '1011') { 
					val = "高清图片"; 
				}
			}
			
			if(col == 'erStoryState') {
				if (val == '0') { 
					val = "转换失败"; 
				}else if (val == '3') {
					val = "处理完成";
				}else if (val == '4') {
					val = "处理中";
				}
			}
			
			if(col == 'erRelLinksState') {
				if (val == '0') { 
					val = "转换失败"; 
				}else if (val == '3') {
					val = "处理完成";
				}else if (val == '4') {
					val = "处理中";
				}
			}
			
			return val;
			
		},
		columnCode_:function(col,val){
			if(col == 'code_') {
				if (val == '1011') { 
					val = "003011009"; 
				}
			}
			return val+"&paramMap.roomtype=exhibition&paramMap.fileType=1011";
		},
		extendDrawShortcut:function(key){
			return '';
		}
	};
    $('#grid').gridTB(ujdata, ujoption);
   	$("#search_article").click(function(){
   		ujdata = $.extend(ujdata,{globalParam:$("#actionForm").formSerialize(),
       	ajax:{
           url:'ajaxAction.action',
           data:'code=${pmsIndex.myArticle_serach.code}'
            }
       	})
       	$('#grid').gridTB(ujdata, ujoption);
    });
    $('#delete_article').screenTB({
    	windowDocument:window.parent.document,
   		width:'250',
   		height:'150',
   		content:'测试内容',
   		contentAlign:'center',
   		contentValign:'middle',
   		title:'系统提示信息',
   		buttonValueYes:'确定',	
   		buttonValueNo:'取消',	
   		dialogType:'alert',
   		iframeSrc:''			
   		},{
   		clickEvent:function(data){
   			if ($("#grid tbody input[type='checkbox']:checked").size() == 0){
   				//data = $.extend(data,{content:'请选择您要删除的参数记录！'})
   				$.extend(data,{returnValue:'true'})
   				alert("请选择您要删除的参数记录！");
   			}
   			else{
   				$.extend(data,{returnValue:'true'})
   				var faction = $("#actionForm").attr("action");
   				$("#actionForm").attr("action",faction +"?code=${pmsIndex.myArticle_del.code}");
   				$("#actionForm").submit();   
   			}
   		}
   	});
    
    document.onkeydown=function(evt){
		if(evt.keyCode ==13){
			return false;
		}
	}
    
});
</script>
<style type="text/css">
*{font-family: "微软雅黑";}
html,body{overflow: hidden;}
.list-table .lt-title {position: relative; height: 50px; line-height: 50px; font-weight: bold;  font-size: 16px;  color: #482D0D;  background: url(<%=request.getContextPath()%>/images-ce/topmenu.png) no-repeat ;background-size:100% 100%;

background: url(<%=request.getContextPath()%>/images-ce/topmenu.png) center no-repeat;
	background-size: cover;
	-ms-behavior: url(<%=request.getContextPath()%>/css/backgroundsize.min.htc);
	behavior: url(<%=request.getContextPath()%>/css/backgroundsize.min.htc);

}
.list-table .lt-command {}
INPUT, button { border: 1px solid #9D714A;}
.aTitle{color: #333333;}
.list-table .lt-command {
  background: #F8F4ED;}
  form{ border: 1px solid #A98534;border-top: none;}
</style>
</head>
<body>
<form name="actionForm" method="post" action="decorateForwardAction.action" id="actionForm" >
<table width="100%" border="0" cellpadding="0" cellspacing="0" class="list-table" >
	<tr>
        <td class="tableCcenter">
       
	 				<div class="lt-title">${pmsIndex.myArticle.name}</div>
					<div class="lt-command">
	 					
					 	<s:if test="pmsIndex.myArticle_del">
					 		<a id="delete_article" href="javascript:void(0)" style="  background: #F8F4ED;border: 1px solid #E3D9CC;color: #AA947A;width: 50px;">
					 			删除
					 		</a>
					 	</s:if>
					 	<div style="float: right;margin-right: 15px;">
					 	    <s:if test="pmsIndex.myArticle_create">
		 						<a href="decorateForwardAction.action?code=${pmsIndex.myArticle_create.code}" class="fade-button" data-old-bg="rgb(124, 109, 91)" style="background-color:#A83737;">
								 	+${pmsIndex.myArticle_create.name}
							 	</a>
					 	    </s:if>
					 		
			       		    <input type="text"  placeholder="输入查询内容" name="searchMap.aTitle" value="${paramMap.aTitle}" id="aTitle" style="width: 100px;height: 30px;padding-left: 10px;" />
			       		    <s:if test="pmsIndex.myArticle_serach">
							<a href="javascript:void(0)" id="search_article"  style="background:#957F75;width: 50px;"><span>搜索</span></a>
							</s:if>
							
						</div>
				 	</div>
				
       </td>
   </tr>
    <tr>
        <td class="tableCcenter">
            <table width="100%" border="0" align="left" cellpadding="0" cellspacing="1" class="SkyTDLine" style="background-color: #E7E7E7">
                <tr>
                    <td  valign="top" colspan="6" id="paginationList" class="MeNewTDLine"><div id="grid">  </div></td>
                </tr>
            </table>
        </td>
    </tr>
</table>
</form>
</body>
</HTML>
