<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
    <%
    	String basePath = "http://" + request.getLocalAddr() + ":"
    			+ request.getLocalPort() + request.getContextPath();
    %>
    <title>${promptInfo.totalDescInfo}</title>
    <head>
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/bodyfocus.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/artDialog/artDialog.4.1.4.js?skin=default"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/artDialog/iframeTools.4.1.4.js"></script>
<link href="<%=request.getContextPath()%>/css/manager.css" rel="stylesheet" >
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
	    	width:'20%',
	    	event:[
				{operate:'modify',name:'${pmsIndex.tea_test_param_modify.name}',disabled:'false',isvalid:'${!empty pmsIndex.tea_test_param_modify}',param:'code=${pmsIndex.tea_test_param_modify.code}'},
    			{operate:'del',name:'${pmsIndex.tea_test_param_delete.name}',disabled:'false',isvalid:'${!empty pmsIndex.tea_test_param_delete}',param:'code=${pmsIndex.tea_test_param_delete.code}'}
      		]
	    },
    	columnDesc:{
    		//列表要显示的列（在json中对应的key）
			showColumn: ['testName','testType'],
			//列表头显示名称
			columnName:   ['考题题目','考题题型'],
			//列表头宽度
			columnWidth:   ['45%','20%'],
			//可以作为主键的类，在页面传送的过程中为paramMap.orgID=value的形式
			//多个主键的时候为["orgID","orgCode"]:paramMap.orgID=value&paramMap.orgCode=value
			primkeyColumn:["testID","testGrades"],
			//要增加链接的列，可以为多个
			linkColumn:[{name:'testName',url:'decorateForwardAction.action',param:'testUrl'}]
    	},		
    	ajax:{
        	url:'ajaxAction.action',
        	data:'code=${pmsIndex.tea_test_param.code}'
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
			if(col == 'testType') {
				if (val == '1') { 
					val = "单项选择题"; 
				}
				if (val == '2') { 
					val = "多项选择题"; 
				}
				if (val == '3') { 
					val = "判断题"; 
				}
			}
			if(col == 'testName') {
				if (val.length >=10) { 
					val = val.substring(0, 10); 
				}
			}
			if(col == 'testVal') {
				val += "分"; 
			}
			
			return val;
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
           data:'code=${pmsIndex.tea_test_param_search.code}'
            }
       	})
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
   				$.extend(data,{returnValue:'true'})
   				alert("请选择您要删除的参数记录！");
   				//data = $.extend(data,{content:'请选择您要删除的参数记录！'})
   			}
   			else{
   				$.extend(data,{returnValue:'true'})
   				var faction = $("#actionForm").attr("action");
   				$("#actionForm").attr("action",faction +"?code=${pmsIndex.tea_test_param_delete.code}");
   				$("#actionForm").submit();   
   			}
   		}
   	});
    
    
});

</script>
<style type="text/css">
*{font-family: "微软雅黑";}
html,body{overflow: hidden;}
.list-table .lt-title {position: relative; height: 50px; line-height: 50px; font-weight: bold;  font-size: 16px;  color: #482D0D;  background: url(<%=request.getContextPath()%>/images-ce/topmenu.png) no-repeat ;background-size:100% 100%;


background: url(<%=request.getContextPath()%>/images-ce/tabmenu.png) center no-repeat;
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
 .testName{color: #333333;}
</style>
</head>
<body>
<form name="actionForm" method="post" action="decorateForwardAction.action" id="actionForm">
<table width="100%" border="0" cellpadding="0" cellspacing="0" class="list-table" >
	<tr>
        <td class="tableCcenter">
       
	 				<div class="lt-title">${pmsIndex.tea_test_param.name}</div>
					<div class="lt-command">
	 					
					 	<s:if test="pmsIndex.tea_test_param_delete">
	 						<a href="javascript:void(0);" id="delete_dictionary" style="  background: #F8F4ED;border: 1px solid #E3D9CC;color: #AA947A;width: 50px;">
							 	删除
						 	</a>
					 	</s:if>
					 	<div style="float: right;margin-right: 15px;">
						 	<s:if test="pmsIndex.tea_test_param_create">
		 						<a href="decorateForwardAction.action?code=${pmsIndex.tea_test_param_create.code}" class="fade-button" data-old-bg="rgb(124, 109, 91)"  style="background-color:#A83737;">
								 	+${pmsIndex.tea_test_param_create.name}
							 	</a>
						 	</s:if>
					 		
			       		    <input type="text"  placeholder="输入查询内容"  name="searchMap.testName" value="${paramMap.testName}" id="testName"  style="padding-left: 10px;width: 100px;height: 30px;" />
			       		    <s:if test="pmsIndex.tea_test_param_search">
							<a href="javascript:void(0)" id="search_exhibition"  style="background:#957F75;width: 50px;"><span>搜索</span></a>
							</s:if>
					 	</div>
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
