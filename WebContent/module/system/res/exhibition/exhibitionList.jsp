<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
    <%
    	String basePath = "http://" + request.getLocalAddr() + ":"
    			+ request.getLocalPort() + request.getContextPath();
    %>
<title></title>
<head>
   <link href="<%=request.getContextPath()%>/css/style-ce.css" rel="stylesheet" />
   <link href="<%=request.getContextPath()%>/css/manager.css" rel="stylesheet" />
  
<script type="text/javascript">
var gridtb;
$(document).ready(function(){	
	 document.onkeydown=function(evt){
			if(evt.keyCode ==13){
				return false;
			}
		}
	var ujdata = {
		//表单ID
		formID:'actionForm',			
		globalParam:$("#actionForm").formSerialize(),
	    //first,last
    	checkbox:{name:'',type:'first',width:'5%'},
    	shortcut:{
    		name:'操作',
	    	url:'decorateForwardAction.action',
	    	width:'30%',
	    	event:[
				//{operate:'statichtml',name:'${pmsIndex.res_exhibition_room_statichtml.name}',disabled:'false',isvalid:'${!empty pmsIndex.res_exhibition_room_statichtml}',param:'code=${pmsIndex.res_exhibition_room_statichtml.code}'},
				//{operate:'upload',name:'${pmsIndex.res_exhibition_room_upload.name}',disabled:'false',isvalid:'${!empty pmsIndex.res_exhibition_room_upload}',param:'code=${pmsIndex.res_exhibition_room_upload.code}'},
    			{operate:'modify',name:'${pmsIndex.res_exhibition_room_modify.name}',disabled:'false',isvalid:'${!empty pmsIndex.res_exhibition_room_modify}',param:'code=${pmsIndex.res_exhibition_room_modify.code}'},
    			//{operate:'detail',name:'${pmsIndex.res_exhibition_room_detail.name}',disabled:'false',isvalid:'${!empty pmsIndex.res_exhibition_room_detail}',param:'code=${pmsIndex.res_exhibition_room_detail.code}'},
    			{operate:'preview',name:'${pmsIndex.res_exhibition_room_preview.name}',disabled:'false',isvalid:'${!empty pmsIndex.res_exhibition_room_preview}',param:'preview_'},
      			{operate:'del',name:'${pmsIndex.res_exhibition_room_delete.name}',disabled:'false',isvalid:'${!empty pmsIndex.res_exhibition_room_delete}',param:'code=${pmsIndex.res_exhibition_room_delete.code}'}
      			//{operate:'grade',name:'${pmsIndex.res_exhibition_room_grade_modify.name}',disabled:'false',isvalid:'${!empty pmsIndex.res_exhibition_room_grade_modify}',param:'code=${pmsIndex.res_exhibition_room_grade_modify.code}'}
	        ]
	    },
    	columnDesc:{
	    	//列表要显示的列（在json中对应的key）
			showColumn: ['erName','erTotal'],
			//列表头显示名称
			columnName:   ['资源名称','资源分类'],
			//列表头宽度
			columnWidth:   ['46%','19%'],
			//可以作为主键的类，在页面传送的过程中为paramMap.orgID=value的形式
			//多个主键的时候为["orgID","orgCode"]:paramMap.orgID=value&paramMap.orgCode=value
			primkeyColumn:["erID","erCode"],
			//为ujoption中columnCode_替换值做准备
			typeColumn:["erType"],
			//为ujoption中name替换值做准备
			nameColumn:["erName"],
			//要增加链接的列，可以为多个
			linkColumn:[{name:'',url:'',param:''}]
    	},		
    	ajax:{
        	url:'ajaxAction.action',
        	data:'code=${pmsIndex.res_exhibition_room_search.code}'
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
					val = "003023001007"; 
				}
			}
			return val+"&paramMap.roomtype=exhibition&paramMap.fileType=1011";
		},
		extendDrawShortcut:function(key){
			return '';
		}
	};
    $('#grid').gridTB(ujdata, ujoption);
    
   	$("#search_exhibition").click(function(){
   		ujdata = $.extend(ujdata,{globalParam:$("#actionForm").formSerialize(),
       	ajax:{
           url:'ajaxAction.action',
           data:'code=${pmsIndex.res_exhibition_room_search.code}'
            }
       	});
       	$('#grid').gridTB(ujdata, ujoption);
    });
    $('#delete_dictionary').screenTB({
    	
    	windowDocument:window.parent.parent.document,
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
   				$.extend(data,{returnValue:'true'});
   				alert("请选择要删除的记录！");
   			}
   			else{
   				$.extend(data,{returnValue:'true'});
   				var faction = $("#actionForm").attr("action");
   				$("#actionForm").attr("action",faction +"?code=${pmsIndex.res_exhibition_room_delete.code}");
   				$("#actionForm").submit();   
   			}
   		}
   	});
    $('#res_statichtml').screenTB({
    	windowDocument:window.parent.parent.document,
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
   				data = $.extend(data,{content:'请选择您要静态化的参数记录！'});
   				
   			}
   			else{
   				$.extend(data,{returnValue:'true'});
   				var faction = $("#actionForm").attr("action");
   				$("#actionForm").attr("action",faction +"?code=${pmsIndex.res_exhibition_room_statichtml.code}");
   				$("#actionForm").submit();   
   			}
   		}
   	});
    
});
</script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/scriptsmaager.js"></script>
</head>
<body>
<div id="layout_mainbody" >
    <div class="page-container" >
<form name="actionForm" method="post" action="decorateForwardAction.action" id="actionForm">
<table width="100%" border="0" cellpadding="0" cellspacing="0" class="list-table" >
	<tr>
        <td class="tableCcenter">
        <div style="   background-repeat:repeat;">
			<table width="100%" border="0" align="center" cellpadding="0" cellspacing="1" class="SkyTableLine">
				<tr>
				<td align="left">
					<div class="lt-title">${pmsIndex.res_exhibition_room_mgr.name}</div>
					<div class="lt-command">
	 					
					 	<s:if test="pmsIndex.res_exhibition_room_delete">
					 		<a id="delete_dictionary" href="javascript:void(0)" style="background: none;color: #924100;">
					 			${pmsIndex.res_exhibition_room_delete.name}
					 		</a>
					 	</s:if>
					 	<%-- <s:if test="pmsIndex.res_exhibition_room_statichtml">
					 		<a id="res_statichtml" href="javascript:void(0)">
					 			${pmsIndex.res_exhibition_room_statichtml.name}
					 		</a>
					 	</s:if> --%>
					 	<s:if test="pmsIndex.res_exhibition_room_welcome_manager" >
					 		<a href="decorateForwardAction.action?code=${pmsIndex.res_exhibition_room_welcome_manager.code}" style="background: none;color: #924100;">
						 		${pmsIndex.res_exhibition_room_welcome_manager.name}
					 		</a>
					 	</s:if>
					 	<div style="float: right;margin-right: 15px;">
					 	<span>名称：</span>
		       		    <input type="text" name="searchMap.erName" value="${paramMap.erName}" id="erName" style="width: 200px;" />
		       		    <s:if test="pmsIndex.res_exhibition_room_search">
							<a href="javascript:void(0)" id="search_exhibition"><span>${pmsIndex.res_exhibition_room_search.name}</span></a>
						</s:if>
						<s:if test="pmsIndex.res_exhibition_room_create">
	 						<a href="decorateForwardAction.action?code=${pmsIndex.res_exhibition_room_create.code}" class="fade-button" data-old-bg="rgb(124, 109, 91)" >
							 	+${pmsIndex.res_exhibition_room_create.name}
						 	</a>
					 	</s:if>
						</div>
						
				 	</div>
				</td>
				</tr>
		  	</table> 
		  </div>     
       </td>
   </tr>
    <tr>
        <td class="tableCcenter">
            <table width="100%" border="0" align="left" cellpadding="0" cellspacing="1" class="SkyTDLine" style="border-collapse: collapse;border: 1px solid #dfdfdf;">
                <tr>
                    <td  valign="top" colspan="6" id="paginationList" class="MeNewTDLine"><div id="grid">  </div></td>
                </tr>
            </table>
        </td>
    </tr>
</table>
</form>
</div></div>
</body>
</HTML>
