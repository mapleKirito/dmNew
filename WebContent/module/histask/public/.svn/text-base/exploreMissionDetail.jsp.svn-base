<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="fn" uri="/WEB-INF/taglib/fn.tld"%>
<html><% String basePath = "http://" + request.getLocalAddr() + ":" + request.getLocalPort() + request.getContextPath(); %>
<title></title>
<head> 
<style type="text/css"></style>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/htask/common803.css" />
<%-- <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/htask/detail803.css" /> --%>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/htask/circle.css" />
<link href="<%=request.getContextPath()%>/qc/css/style-ce.css" rel="stylesheet" />
<script type="text/javascript">
$(function(){
	
	
	//回答框控制
	$("#answer-bar").die().live("click",function(){
		var answerbareditor = $("#answer-bar-editor").css("display");
		var answerbarsub = $("#answer-bar-sub").css("display");
		if(answerbareditor=="none" && answerbarsub=="none"){
			$("#answer-bar-editor,#answer-bar-sub").show();
			$("#answer-bar-img").attr("src", "images/htask/thedown.png");
			if("${session.srUnicomNet}"=="1")
				$("#answer-bar-search").show();
		}else{
			$("#answer-bar-editor,#answer-bar-sub").hide();
			$("#answer-bar-img").attr("src", "images/htask/theup.png");
			if("${session.srUnicomNet}"=="1")
				$("#answer-bar-search").hide();
		}
	});
	//回答
	$("#anser_question").live("click",function(){
		concoleCode = "-1891";
		//var htaskID = '${paramMap.htaskID}';
		var htaskID=$("#manyAnswerID").val();
		var taskchoosetagindex=$("#taskchoosetagindex").val();
		var appparam = "&paramMap.taHtaskIndex="+taskchoosetagindex;
		var keywords='${initMap.testdetailInfo.htaskKeywords}';
		var getAttrID = $(this).parent("div").siblings("textarea").attr("id");
		var rcontent = CKEDITOR.instances[getAttrID].getData() == '' ? false: true;
		if (rcontent) {
			$.ajax({
				url: 'ajaxAction.action?code='+concoleCode + '&paramMap.taHtaskID='+htaskID+'&paramMap.taContent=' + CKEDITOR.instances[getAttrID].getData() + '&paramMap.taUserID=' + '${paramMap.s_userID}'+appparam,
				type: 'post',
				timeout: '60000',
				data: Array(),
				dataType: 'json',
				beforeSend: function(request) {},
				complete: function(request, textStatus) {},
				success: function(jsonData, textStatus) {
					if (textStatus == "success") {
						//alert("success");
						alert("回复成功");
						location.href = "decorateForwardAction.action?code=-1890002&paramMap.taskchoosetagindexhref="+taskchoosetagindex+"&paramMap.htaskKeywords="+keywords+"&paramMap.htaskID=${paramMap.htaskID}";
					}
				},
				error: function(request, textStatus, error) {}
			});
		} else {
			alert("内容不能为空！！！");
		}	
	});

	//多任务相关
	var $tab = $("#tags ul li");
	var $tab2 = $("#tags2 ul");
	$tab.click(function(){
		$("#answer-bar-editor,#answer-bar-sub").hide();
		$("#answer-bar-img").attr("src", "images/htask/theup.png");
		$("#shmt-5").hide();
		$("#missionWealth").hide();
		$("#manyAnswerID").val($(this).attr("missionID"));
		var index = $tab.index(this);
		//$("#best-answer").hide();
		var theindex = index+1;
		$("#taskchoosetagindex").val(theindex);
		$tab2.find("li").eq(index).show().siblings('li').hide();
		
		checkAnswer(index);
		$("#answerContent").html($("#defaultAnswerContent").html());
		$("#answerContent").load("decorateForwardAction.action?code=-1897&paramMap.htaskSplitIndex="+(theindex)+"&paramMap.htaskID="+$("#manyAnswerID").val());
	});
	
	//初始化默认子任务回答列表
	var taskchoosetagindex=$("#taskchoosetagindex").val();
	$("#answerContent").load("decorateForwardAction.action?code=-1897&paramMap.htaskSplitIndex="+(taskchoosetagindex)+"&paramMap.htaskID="+$("#tags ul").find("li").eq(taskchoosetagindex-1).attr("missionID"));
	
	checkAnswer(taskchoosetagindex-1);
	
});

function checkAnswer(i){
	
	var sUserType='${session.s_userType}';
	var sUserID='${session.s_userID}';
	var creater='${initMap.testdetailInfo.htaskUserCreate}';
	var isAccept=$("#tags ul").find("li").eq(i).attr("isAccept");
	var missionID=$("#tags ul").find("li").eq(i).attr("missionID");
	$("#manyAnswerID").val(missionID);
	var isAnswer=$("#isAnswer_"+missionID).val();
	$("#missionWealth").html("财富值"+$("#wealth_"+i).val()+"(系统奖励1+悬赏"+(parseInt($("#wealth_"+i).val())-1)+")");
	if(isAnswer==null){
		isAnswer=0;
	}
	//alert(sUserType!='3'&&isAnswer=='0'&&isAccept!='1'&&creater!=sUserID);
	if(sUserType!='3'&&isAnswer=='0'&&isAccept!='1'&&creater!=sUserID){
		$("#shmt-5").show();
	}
	if(isAccept!='1'){
		$("#missionWealth").show();
	}
	
}
</script>
<style type="text/css">
.panel{background: #FAF7EF;}
#tags ul li {height: 50px;}
ul.task-list li a em {top: 5px;}
ul.task-list li a.uncompleted {
background-position:-516px 0px;}
.wgt-answers{padding: 20px;}
.user-name a{color: #924100;}
#nokey{
background: url(<%=request.getContextPath()%>/images-ce/key.png) center no-repeat;
	background-size: cover;
	-ms-behavior: url(<%=request.getContextPath()%>/css/backgroundsize.min.htc);
	behavior: url(<%=request.getContextPath()%>/css/backgroundsize.min.htc);
}
</style>
</head>
<body>
<input type="hidden" id="taskchoosetagindex" value="${paramMap.taskchoosetagindexhref }">
<div id="layout_mainbody" style =" visibility : hidden">	
		<div class="page-container ssjh">
			<div class="ssjh-taskview">
				<div class="left">
					<div class="wgt-ask accuse-response line mb-5  panel" id="wgt-ask">
						<p class="title topborder" style="background: #F5F1E6;color: #482D0D;font-size: 18px;padding-left: 15px;line-height: 50px;border-bottom: 1px solid #DED8C9;font-weight: bold;">问题详细</p>
						<div class="wgt-body"  style="padding: 18px;">
							<h5 style="font-size: 16px;margin-bottom: 10px;"><span>【题目】</span>
							<%-- <s:if test="initMap.testdetailInfo.htaskTitle.length() > 9">
								 <s:property value="initMap.testdetailInfo.htaskTitle.substring(0,9)" />
								...
							</s:if> <s:else>
								 <s:property value="initMap.testdetailInfo.htaskTitle" />
							 </s:else> --%>
							<!--我是想不通为啥要把问题内容截取成9个字以内，难道题目只看九个字就会做题，就能明白下边的问题？还要把问题内容隐藏，真是不知所谓啊  -->
							${initMap.testdetailInfo.htaskTitle }</h5>
							<div class="line f-aid mb-10" id="ask-info" style="height: 35px;line-height: 35px;color: #333333;font-size: 14px;">
													<p>
								<span style="float: left;">
									关键词&nbsp; : &nbsp;
								</span>
								<span id="nokey"  style="float: left;height: 30px;background:url(<%=request.getContextPath()%>/images-ce/key.png) center no-repeat;background-size:100% 100%;border: none;padding: 0 20px;padding-bottom: 3px;">
									${initMap.testdetailInfo.htaskKeywords==""?"暂无关键字":initMap.testdetailInfo.htaskKeywords}
								</span>
								<span style="float: right;">
									提问时间：${initMap.testdetailInfo.htaskCreatetime}
									<%-- 提问人:${initMap.testdetailInfo.htaskUserCreate } --%>
								</span>
								</p>
							</div>
							<s:if test="initMap.testdetailInfo.htaskContent!=''">
							<div class="paddingdiv_main">
								<h5><span>【问题内容】</span></h5>
								<div class="mt-10 mb-10 f-12 f-gray guide-count-down" style="color: #999;">
									${initMap.testdetailInfo.htaskContent}
								</div>
							</div>
							</s:if> 
							<div class="tabcontents" style="  height: 50px;margin: 15px 0px;">
									<div class="tabcontent tlfb" style="position: relative;  " id="tags">
										<a href="javascript:void(0);" class="fb-task-list-prev"></a>
										<a href="javascript:void(0);" class="fb-task-list-next"></a>
										<ul class="task-list fb">
											<s:iterator value="initMap.htasksort" id="hsid" status="hsindex">
												<s:if test="#hsid.htaskIsAccept == 1"><li isAccept="${hsid.htaskIsAccept }" missionID="${hsid.htaskID }"><a href="javascript:void(0);" class="procing" style="height: 50px;"><i class="icon-right-arrow-big"></i><em>${hsindex.index+1}&nbsp;&nbsp;已完成</em>&nbsp;</a></li></s:if>
												<s:if test="#hsid.htaskIsAccept == 0"><li isAccept="${hsid.htaskIsAccept }" missionID="${hsid.htaskID }"><a href="javascript:void(0);" class="uncompleted"  style="height: 50px;"> <i class="icon-right-arrow-big"></i><em>${hsindex.index+1}&nbsp;&nbsp;未完成</em>&nbsp;</a></li></s:if>
												<s:if test="#hsid.htaskIsAccept == 2"><li isAccept="${hsid.htaskIsAccept }" missionID="${hsid.htaskID }"><a href="javascript:void(0);" class="completed"  style="height: 50px;"> <i class="icon-right-arrow-big"></i><em>${hsindex.index+1}&nbsp;&nbsp;未完成</em>&nbsp;</a></li></s:if>
											</s:iterator>
										</ul>
									</div>
							</div>
							<div id="taskchoosetag">
							<input type="hidden" id="manyAnswerID" />
							<s:iterator value="initMap.testIsAnswer" id="tia" status="tiaIndex">
								<input type="hidden" id="isAnswer_${tia.htaskID }" value="${tia.isAnswer }" />
							</s:iterator>
							
							<div class="mt-10 mb-10 f-12 f-gray" id="tags2">
								<ul class="guide-count-down">
									<s:iterator value="initMap.htasksort" id="hsid" status="hsindex">
										<li style="${(paramMap.taskchoosetagindexhref==(hsindex.index+1))?'':'display:none'}" >
											<input type="hidden" id="wealth_${hsindex.index }" value="${hsid.htaskWealthval}">
											<h5><span>【任务${hsindex.index+1 }】</span></h5>
											${hsid.htaskContent}
										</li>
									</s:iterator>
								</ul>
							</div>
								
								<div id="shmt-5" style="display: none;">
									<span class="mt-5 mb-10 f-12 f-blue inline-block" id="answer-bar">我来解答</span>
									<img id="answer-bar-img" src="images/htask/theup.png" height="7px" border="0">
									<s:if test="#session.srUnicomNet == 1 ">
									<span id="answer-bar-search" style="display: none;">
										<span class="f-pipe f-12 search-relate-pipe">|</span>
										<a class="mb-10 mt-5 search-relate" href="http://www.baidu.com/s?wd=${initMap.testdetailInfo.htaskTitle}" target="_blank"><span></span>搜索资料</a>
									</span>
									</s:if>
									<div class="mt-10 mb-10 f-12 f-gray" id="answer-bar-editor" style="display: none;">
										<textarea cols="50"  id="editorAnswer" rows="10"></textarea>
									    <script type="text/javascript">
											  CKEDITOR.replace('editorAnswer',{height : 120, filebrowserUploadUrl : 'ckeditor/uploader?Type=File&TypeRoom=userFile&userFileID='+'${paramMap.s_userID}', filebrowserImageUploadUrl : 'ckeditor/uploader?Type=Image&TypeRoom=userFile&userFileID='+'${paramMap.s_userID}', filebrowserFlashUploadUrl : 'ckeditor/uploader?Type=Flash&TypeRoom=userFile&userFileID='+'${paramMap.s_userID}' } );
										</script>
										<div id="answer-bar-sub" style="display: none;">
											<input id="anser_question" type="submit" class="btn-32-green btn-32-green-submit question-submit" value="提交回答" data-old-bg="rgb(230, 71, 71)" style="background-color: rgb(230, 71, 71);">
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!--回答  -->
					<div id="answerContent">
						<div id="taskchoosetaganswer" class="answer-list-panel panel">
							<div class="wgt-answers" id="wgt-answers">
								<div class="hd line title topborder-green" id="answerTop" >
									<span class="grid-r f-12" style="float: right;display:none;">
										<span>
											按默认排序
										</span>
										<span class="f-pipe">
											|
										</span>
										<a rel="nofollow" href="javascript:void(0)">
											按时间排序
										</a>
									</span>
									<p class="title line">其它<span id="answercount">${fn:length(initMap.htasksort)}</span>条回答</p>
								</div>
							</div>
						</div>
					</div>
					<div id="defaultAnswerContent" style="display: none;">
						<div id="taskchoosetaganswer" class="answer-list-panel panel">
							<div class="wgt-answers" id="wgt-answers">
								<div class="hd line title topborder-green" id="answerTop" >
									<span class="grid-r f-12" style="float: right;display:none;">
										<span>
											按默认排序
										</span>
										<span class="f-pipe">
											|
										</span>
										<a rel="nofollow" href="javascript:void(0)">
											按时间排序
										</a>
									</span>
									<p class="title line">其它<span id="answercount">${fn:length(initMap.htasksort)}</span>条回答</p>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="right">
					<div class="article-list-panel panel">
						<p class="title topborder"  style="   border-top: 1px solid #CFBDA7;    font-size: 18px;  font-weight: bold;  border-bottom: 1px solid #CFBDA7;  padding-left: 20px;line-height: 50px;">
						相关问题</p>
						<div class="body">
							<ul class="article-list">
								<li class="askList" htaskIssplit="213" createkeywords="213" createhtaskID="213" createuser="213"><a href="javascript:void(0);"><i></i>哈哈哈哈啊啊啊哈哈哈</a></li>
								<s:iterator value="initMap.htaskRightList" id="fv" status="fvindx">
									<li class="askList" htaskIssplit="${fv.htaskIssplit }" createkeywords="${fv.htaskKeywords}" createhtaskID="${fv.htaskID}" createuser="${fv.htaskUserCreate}"><a href="javascript:void(0);"><i></i>${fv.htaskTitle }</a></li>
								</s:iterator>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
<script src="<%=request.getContextPath()%>/qc/js/jquery-1.7.2.min.js"></script>
<script src="<%=request.getContextPath()%>/qc/js/tweenmax.min.js"></script>
<script src="<%=request.getContextPath()%>/qc/js/scripts.js"></script>
<script src="<%=request.getContextPath()%>/qc/js/jquery.bxslider.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/ckeditor/ckeditor.js"></script>
<script src="js/jquery.bxslider.min.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
        $(".tlfb>ul").bxSlider({
            maxSlides: 3,
            infiniteLoop: false,
            slideWidth: 140,
            slideMargin: 12,
            controls: true,
            nextText: "",
            prevText: "",
            prevSelector: "a.fb-task-list-prev",
            nextSelector: "a.fb-task-list-next",
            pager: false
        });
        $(".askList").click(function(){
    		var s_userID = '${paramMap.s_userID}';
    		var createhtaskID = $(this).attr("createhtaskID");
    		var keywords=$(this).attr("createkeywords");
    		var htaskIssplit=$(this).attr("htaskIssplit");
    		var thecode = "-1890001";
    		if(htaskIssplit==1){
    			thecode = "-1890002";
    		}
    		window.parent.tabClick("munu_name","问题浏览",thecode,"paramMap.htaskID="+createhtaskID+"&paramMap.taskchoosetagindexhref=1&pageSize=8&type=1&paramMap.htaskKeywords="+keywords);
    	});
    });
    var i = setTimeout('check()',500);
    function check() {
    	$("#layout_mainbody").attr("style","");
    }
</script>

</body>
</HTML>