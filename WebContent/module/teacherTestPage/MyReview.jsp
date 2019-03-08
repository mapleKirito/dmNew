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
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/artDialog/artDialog.4.1.4.js?skin=default"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/artDialog/iframeTools.4.1.4.js"></script>
     <link href="<%=request.getContextPath()%>/css/manager.css" rel="stylesheet" >

<script type="text/javascript">
var gridtb;
$(document).ready(function(){
	
	var ujdata = {
		//表单ID
		formID:'actionForm',			
		globalParam:$("#actionForm").formSerialize(),
	    //first,last
    	//checkbox:{name:'',type:'first',width:'5%'},
    	 shortcut:{
    		name:'操作',
	    	url:'decorateForwardAction.action',
	    	width:'0%',
	    	event:[
    			//{operate:'preview',name:'${pmsIndex.res_exhibition_room_preview.name}',disabled:'false',isvalid:'${!empty pmsIndex.res_exhibition_room_preview}',param:'preview_'},
      			//{operate:'preview',name:'${pmsIndex.myReview_read.name}',disabled:'false',isvalid:'${!empty pmsIndex.myReview_read}',param:'favorite_'}
	        ]
	    }, 
    	columnDesc:{
	    	//列表要显示的列（在json中对应的key）
			showColumn: ['srContent','resName','srTime'],
			//列表头显示名称
			columnName:   ['评论内容','资源名称','发表时间'],
			//列表头宽度
			columnWidth:   ['54%','26%','15%'],
			//可以作为主键的类，在页面传送的过程中为paramMap.orgID=value的形式
			//多个主键的时候为["orgID","orgCode"]:paramMap.orgID=value&paramMap.orgCode=value
			primkeyColumn:["srID","srPtype","srPID","srResUrl"],
			//为ujoption中name替换值做准备
			resurlColumn:["srResUrl"],
			nameColumn:["aTitle"],
			//要增加链接的列，可以为多个
			
			linkColumn:[{name:'resName',url:'decorateForwardAction.action',param:'ResUrl'},
			            {name:'srContent',url:'',param:'ResUrl2'}]
    	},		
    	
    	ajax:{
        	url:'ajaxAction.action',
        	data:'code=${pmsIndex.myReview_serach.code}'
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
			if(col == 'srContent') {
				if (val.length >= 10) { 
					val = val.substring(0, 10)+'...'; 
				}else{
					val = val;
				}
			}
			if(col == 'resName') {
				if (val.length >= 10) { 
					val = val.substring(0, 10)+'...'; 
				}else{
					val = val;
				}
			}
			return val;
			
		},
		extendDrawShortcut:function(key){
			return '';
		}
	};
    $('#grid').gridTB(ujdata, ujoption);
   	$("#search_review").click(function(){
   		ujdata = $.extend(ujdata,{globalParam:$("#actionForm").formSerialize(),
       	ajax:{
           url:'ajaxAction.action',
           data:'code=${pmsIndex.myReview_serach.code}'
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
   				data = $.extend(data,{content:'请选择您要删除的参数记录！'})
   			}
   			else{
   				$.extend(data,{returnValue:'true'})
   				var faction = $("#actionForm").attr("action");
   				$("#actionForm").attr("action",faction +"?code=${pmsIndex.myArticle_del.code}");
   				$("#actionForm").submit();   
   			}
   		}
   	});
    
    
    
});
</script>
<style type="text/css">
html,body{overflow: hidden;}
.list-table .lt-title {position: relative; height: 50px; line-height: 50px; font-weight: bold;  font-size: 16px;  color: #482D0D;  background: url(<%=request.getContextPath()%>/images-ce/topmenu.png) no-repeat ;background-size:100% 100%;

background: url(<%=request.getContextPath()%>/images-ce/topmenu.png) center no-repeat;
	background-size: cover;
	-ms-behavior: url(<%=request.getContextPath()%>/css/backgroundsize.min.htc);
	behavior: url(<%=request.getContextPath()%>/css/backgroundsize.min.htc);

}
.list-table .lt-command {}
INPUT, button { border: 1px solid #9D714A;}
.srContent,.resName,.gridBodyTd,.resNameInfo{color: #333333;font-family: "微软雅黑";}
.list-table .lt-command {background: #F8F4ED;}
 form{ border: 1px solid #A98534;border-top: none;}
 *{font-family: "微软雅黑";}
 .list{}
.resNameInfo{font-size: 16px;}
</style>
</head>
<body>
<form name="actionForm" method="post" action="decorateForwardAction.action" id="actionForm">
<table width="100%" border="0" cellpadding="0" cellspacing="0" class="list-table" >
	<tr>
        <td class="tableCcenter">
        <div style="   background-repeat:repeat;">
			
					<div class="lt-title">${pmsIndex.myReview.name}</div>
					<div class="lt-command">
		       		   	<div style="text-align: center;">
					 	 <span class="resNameInfo">资源名称：</span>
					 	   <input type="text"  placeholder="输入查询内容"  name="searchMap.resName" value="${paramMap.resName}" id="resName" style="width: 100px;height: 30px;padding-left: 10px;" />
			       		    <s:if test="pmsIndex.myReview_serach">
								<a href="javascript:void(0)" id="search_review" style="background:#957F75;width: 50px;"><span>${pmsIndex.myArticle_serach.name}</span></a>
							</s:if>
					
						</div>
							
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
