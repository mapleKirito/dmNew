<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
    <%
        String basePath = "http://" + request.getLocalAddr() + ":" + request.getLocalPort() + request.getContextPath();
    %>
    <title></title>
    <head>
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
		    	width:'20%',
		    	event:[
					{operate:'modify',name:'${pmsIndex.sys_resource_News_class_modify.name}',disabled:'false',isvalid:'${!empty pmsIndex.sys_resource_News_class_modify}',param:'code=${pmsIndex.sys_resource_News_class_modify.code}'},
	    			{operate:'del',name:'${pmsIndex.sys_resource_News_class_delete.name}',disabled:'false',isvalid:'${!empty pmsIndex.sys_resource_News_class_delete}',param:'code=${pmsIndex.sys_resource_News_class_delete.code}'}
	      	  ]
		    },
	    	columnDesc:{
		    	//列表要显示的列（在json中对应的key）
				showColumn: ['bigClassName','bigClassInfo','addTime'],
				//列表头显示名称
				columnName:   ['分类名称','分类信息','创建时间'],
				//列表头宽度
				columnWidth:   ['35%','20%','20%'],
				//可以作为主键的类，在页面传送的过程中为paramMap.orgID=value的形式
				//多个主键的时候为["orgID","orgCode"]:paramMap.orgID=value&paramMap.orgCode=value
				primkeyColumn:["bigClassID"],
				//要增加链接的列，可以为多个
				linkColumn:[{name:'',url:'',param:''}]
	    	},		
	    	ajax:{
	        	url:'ajaxAction.action',
	        	data:'code=${pmsIndex.sys_resource_News_class_search.code}'
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
				
				return val;
			},
			extendDrawShortcut:function(key){
				return '';
			}
		};
	    $('#grid').gridTB(ujdata,ujoption);
	    
	    $("#search_classes").click(function(){
        	ujdata = $.extend(ujdata,{globalParam:$("#actionForm").formSerialize(),
            ajax:{
                url:'ajaxAction.action',
                data:'code=${pmsIndex.sys_resource_News_class_search.code}&type=1'
                 }
            });
        	$('#grid').gridTB(ujdata,ujoption);
         });

        $('#delete_dictionary').screenTB({
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
    				data = $.extend(data,{content:'请选择您要删除的用户！'});
    			}
    			else{
    				$.extend(data,{returnValue:'true'})
    				var faction = $("#actionForm").attr("action");
    				$("#actionForm").attr("action",faction +"?code=${pmsIndex.sys_resource_News_class_delete.code}");
    				$("#actionForm").submit();		    			
    			}
   			}
   		});
	    
	    
	    
	    
	    
	    
});
</script>
</head>
<body>
<form name="actionForm" method="post" action="decorateForwardAction.action" id="actionForm">
<table width="100%" border="0" cellpadding="0" cellspacing="0" class="list-table" >
   <tr>
        <td class="tableCcenter">
        <div style="   background-repeat:repeat;">
			<table width="100%" border="0" align="center" cellpadding="0" cellspacing="1" class="SkyTableLine">
				<tr >
				<td class="leftmiddl">
		 			<div class="lt-title">${pmsIndex.sys_resource_News_class_List.name}</div>
					<div class="lt-command">
	 					<s:if test="pmsIndex.sys_resource_News_class_create">
	 						<a href="decorateForwardAction.action?code=${pmsIndex.sys_resource_News_class_create.code}" class="fade-button" data-old-bg="rgb(124, 109, 91)" style="background-color: rgb(124, 109, 91);">
							 	${pmsIndex.sys_resource_News_class_create.name}+
						 	</a>
					 	</s:if>
					 	<s:if test="pmsIndex.sys_resource_News_class_delete">
	 						<a href="javascript:void(0);" id="delete_dictionary">
							 	${pmsIndex.sys_resource_News_class_delete.name}×
						 	</a>
					 	</s:if>
					 	<div style="float: right;margin-right: 15px;">
						 	<span>名称</span>：
							<input type="text" name="searchMap.bigClassName" value="${paramMap.bigClassName}" id="bigClassName" style="width: 200px;" />
					
						<s:if test="pmsIndex.sys_resource_news_search">
							<a href="javascript:void(0)" id="search_classes"><img src="<%=request.getContextPath()%>/images/common/216.gif" align="absmiddle" width="14" border="0" height="14"><span>${pmsIndex.sys_resource_news_search.name}</span></a>
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
</body>
</HTML>