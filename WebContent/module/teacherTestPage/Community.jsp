<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	String basePath = "http://" + request.getLocalAddr() + ":"
			+ request.getLocalPort() + request.getContextPath();
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<title></title>
<head>
<link href="qc/css/style.css" rel="stylesheet" />
<link href="qc/css/calendar.css" rel="stylesheet" />

<style type="text/css">

/* "更多"的样式 */
.more {
	font-size: 12px;
	float: right;
	margin-right: 20px;
	line-height: 40px;
	vertical-align: bottom;
}

.more:hover {
	color: red;
}
</style>

<script type="text/javascript">
	$(function() {
		$(".team_applyIn")
				.die()
				.live(
						"click",
						function() {
							var tid = $(this).attr("tid");
							var liObj = $(this);
							if (confirm("确定要申请加入该小组吗")) {
								$
										.ajax({
											url : 'ajaxAction.action?code=0020320020206&paramMap.uID=${s_userID}&paramMap.tID='
													+ tid,
											type : 'post',
											timeout : '60000',
											data : Array(),
											dataType : 'json',
											beforeSend : function(request) {
											},
											complete : function(request,
													textStatus) {
											},
											success : function(jsonData,
													textStatus) {
												if (textStatus == "success") {
													if (jsonData.flag > 0) {
														//alert("删除成功！");
														liObj.remove();
													}
												}
											}
										});
							}

						});

	})
	function noPermission(){
		alert("对不起，您还未加入该小组，请加入后重试！");
	}
</script>
<style type="text/css">
.mem_class {
	position: relative;
}

.team_applyIn {
	position: absolute;
	right: 6px;
	top: 4px;
	color: #ea183f;
	font-size: 12px;
	cursor: pointer;
}
.team_applying{
	position: absolute;
	right: 6px;
	top: 4px;
	color: #ea183f;
	font-size: 12px;
}
   
.tabcontrol {width:725px;  position:relative; overflow: hidden; margin-top: 20px;}
.tabcontrol p.tabtitle a.tab { width: 114px; float: left; margin-top:0px; z-index:2; display: inline; cursor: pointer; font-size: 12px; color: #8f8f8f; text-align: center; border-right:1px solid #A98534; overflow:hidden;height:40px;}
    .tabcontrol p.tabtitle a.tab:first-child { margin-left:0px;  }
.tabcontrol p.tabtitle a.tab.on { margin-top:0px; border-top:2px solid #D7B593;  background: #F8F4ED url(<%=request.getContextPath()%>/images-ce/xiaozutop.png) no-repeat;}

.tabcontrol .tabcontents { border: 1px solid #e2e2e2; border-top:none; }
.tabcontrol .tabcontents .tabcontent{ padding: 20px; background: #F8F4ED;}
#btn_scale a{ display:block; color:white; text-decoration:none; font-size:18px; font-family:"微软雅黑" ;}
.ssjh-index { margin-top:3%; width:725px; }
.panel { background: white; width:auto; overflow:hidden; border:1px solid #CFBDA7; }
.panel>p.title{ position:relative; height:50px; line-height:50px;  font-size:14px; color:#666666;   margin-left: 0px;}
ul.groups li{ width:218px; height:95px; float:left; display:inline; margin-left:12px; margin-bottom:18px; border:1px solid #C5BDAB;background: white; }
ul.xiangce li{border:0px solid #C5BDAB;background: #F8F4ED;}
   ul.my-article-list li div.article-info-area p.title{ position:relative; display:block; font-size:14px; line-height:30px; margin-bottom:10px; color:#000; }
 ul.my-article-list li div.article-info-area { margin-top:0px; font-size:12px; color:#888888; line-height:180%; }
.tabcontrol {width:725px;  position:relative; overflow: hidden; border: 1px solid #A98534;}
ul.my-article-list li{ border-bottom:1px solid #979797; padding:20px; padding-top:30px; }
 .panel>p.title{ position:relative;padding-left: 21px; height:50px; line-height:50px;font-weight:bold;  font-size:16px; color:#482D0D; background:url(<%=request.getContextPath()%>/images-ce/topmenu.png) no-repeat;}
 .body{ background: #F8F4ED;}
 .bx-viewport{text-align: center;padding-top: 40px;}
 .rs-slider li span {
position: absolute;
width: 342px;
height: 20px;
line-height: 20px;
text-indent: 0px;
bottom: 80px;
left: 15px;
background: #A83737;
overflow: hidden;}
.ssjh-index-row1 .right.tabcontrol.jifen p.tabtitle a.on {
background:none;}
.ssjh-index-row1 .right.tabcontrol p.tabtitle a {background:none;}
.ssjh-index-row1 .right.tabcontrol p.tabtitle a:hover{background:none;}
.more{color: gray; font-size:14px; }
.more:HOVER{color: #A83737;}
.tabtitle{
   background: url(<%=request.getContextPath()%>/images-ce/topmenu.png) center no-repeat;
	background-size: cover;
	-ms-behavior: url(<%=request.getContextPath()%>/css/backgroundsize.min.htc);
	behavior: url(<%=request.getContextPath()%>/css/backgroundsize.min.htc);
}
.shequtab{
background: url(<%=request.getContextPath()%>/images-ce/topmenu.png) center no-repeat;
	background-size: cover;
	-ms-behavior: url(<%=request.getContextPath()%>/css/backgroundsize.min.htc);
	behavior: url(<%=request.getContextPath()%>/css/backgroundsize.min.htc);
}
</style>
</head>
<body>
	<div id="layout_mainbody">
		<div class="page-container ssjh-index">
			<div class="ssjh-index">
				<div class="ssjh-index-row1"  style=" position:relative; background:url(images-ce/hudongshequ.png) no-repeat; background-size:100% 100%;;height: 260px;">
					<div class="recommend-res left" style="width: 490px;">
						<p class="title" style="width: 490px;display: none;">
							<i class="icon-title-line"></i>最新图片 <span class="rs-control">
							<em class="rs-prev" ></em> <em class="rs-next"></em> </span>
						</p>
						
						<div class="rs-slider">
							<ul>
								<li><a href="javascript:void(0)"><img src="qc/uploadfiles/1.jpg" width="400px" /><span style="width: 20px;">1师生风采</span>
								</a></li>
								<li><a href="javascript:void(0)"><img src="qc/uploadfiles/2.jpg" width="400px"/><span style="width: 20px;">2师生互动</span>
								</a></li>
								<li><a href="javascript:void(0)"><img src="qc/uploadfiles/3.jpg" width="400px"/><span style="width: 20px;">3互帮互助</span>
								</a></li>
							</ul>
						</div>
					</div>
					<div class="right tabcontrol jifen" style="width: 220px;border: none;margin-top: 0px;">
						<p class="tabtitle shequ" style="height:30px;margin-top:40px;   position:relative; background:url(images-ce/shequtab.png) center bottom no-repeat; background-size:100% 100%;">
							<a href="javascript:void(0)" style="line-height: 30px;border: none;font-size: 18px;" class="tab on">积分榜</a> 
							<a href="javascript:void(0)" style="line-height: 30px;border: none;color: #C0964D;font-size: 18px;"  class="tab">答题榜</a>
						</p>
						<div class="tabcontents" style="background: none;  height: 180px;overflow: hidden;">
							<div class="tabcontent" style="background: none;">
								<ul class="rank-list">
									<s:subset source="initMap.wealthList" start="0" count="7">
										<s:iterator id="t" status="index">
											<li><i class="icon-no ${index.index<3?'top3':'' }">${index.index+1
													}</i><a href="decorateForwardAction.action?code=-25200&paramMap.userID=${t.userID }">${t.userName }</a>
											</li>
										</s:iterator>
									</s:subset>

								</ul>
							</div>
							<div class="tabcontent" style="display: none;background: none;">
								<ul class="rank-list">
									<s:subset source="initMap.ansList" start="0" count="7">
										<s:iterator id="t" status="index">
											<li><i class="icon-no ${index.index<3?'top3':'' }">${index.index+1}</i><a
												href="decorateForwardAction.action?code=-25200&paramMap.userID=${t.taUserID }">${t.taUserName}</a>
											</li>
										</s:iterator>
									</s:subset>
								</ul>
							</div>
						</div>
					</div>
				</div>
                        <div class="ssjh-index-row3 tabcontrol">
                            <div class="tabtitle-bg"></div>
                            <p class="tabtitle" style=" position:relative; background:url(images-ce/topmenu.png) center bottom no-repeat; background-size:100% 100%;">
                                <a href="javascript:;" class="tab on">活跃小组</a>
                                <a href="javascript:;" class="tab">最新空间</a>
                                <a href="decorateForwardAction.action?code=002031001" class="more" id="more_one">更多</a>
                            </p>
                            
                            <div class="tabcontents">
                                <div class="tabcontent">
                                    <ul class="groups">
										<s:subset source="initMap.teamList" start="0" count="10">
											<s:iterator id="t" status="newsIndex">
												<li class="mem_class">
													<s:if test="#t.stateT==0">
													<div tid="${t.tID }" class="team_applyIn">申请加入</div>
													</s:if>
													<a
													<s:if test="#t.memState==0&&#t.isPublic==0"> href="javascript:;" onclick="noPermission();" </s:if>
													<s:if test="#t.memState==1&&#t.isPublic==0"> href="javascript:;" onclick="noPermission();" </s:if>
													<s:else> href="decorateForwardAction.action?code=00203200201&paramMap.tID=${t.tID }"</s:else>
													class="left"> <img src="${t.userImg}"
														onerror="this.src='images/default/default_team.png'"
														width="64" height="64" /> </a>
													<div class="right">
														<h5>
															<a
																<s:if test="#t.stateT==0&&#t.isPublic==0">href="javascript:;" onclick="noPermission();"</s:if>
																<s:if test="#t.stateT==1&&#t.isPublic==0">href="javascript:;" onclick="noPermission();"</s:if>
																<s:else>href="decorateForwardAction.action?code=00203200201&paramMap.tID=${t.tID }" </s:else>
																title="${t.tName }">
																<s:if
																	test="#t.tName.length() > 5">
																	<s:property value="#t.tName.substring(0,5)" /> ...
										                     </s:if> <s:else>
																	<s:property value="#t.tName" />
																</s:else> </a>
														</h5>
		
														<p>
															成员数量：<em>${t.peoples}</em>
														</p>
														<p>
															创建人：<span class="red">${t.tUserName }</span>
														</p>
													</div>
												</li>
											</s:iterator>
										</s:subset>
									</ul>
                                </div>
                                <div class="tabcontent" style="display:none">
                                    <ul class="groups">
                                    <s:subset source="initMap.spaceList" start="0" count="10">
											<s:iterator id="t" status="newsIndex">
	                                        <li>
	                                            <a href="decorateForwardAction.action?code=-25200&paramMap.userID=${t.userID }" class="left">
	                                            	<img src="${t.userImg}" onerror="this.src='images/default/default_img.jpg'"  width="64" height="64" />
	                                            </a>
	                                            <div class="right">
	                                                <%-- <h5><a href="decorateForwardAction.action?code=-25200&paramMap.userID=${t.userID }" href="javascript:void(0)">${t.userName }</a></h5> --%>
	                                                <s:if test="#t.userName.length() gt 9">
	                                                	<h5><a href="decorateForwardAction.action?code=-25200&paramMap.userID=${t.userID }" title="${t.userName }"><s:property value="#t.userName.substring(0,9)+'...'" /></a></h5>
                                               		</s:if>
                                               		<s:else>
	                                               		<h5><a href="decorateForwardAction.action?code=-25200&paramMap.userID=${t.userID }" title="${t.userName }"><s:property value="#t.userName" /></a></h5>
	                                               	</s:else>
	                                                
	                                               
	                                                <p>用户身份：<em>${(t.userType==1)?'老师':(t.userType==2?'学生':'管理员')}</em></p>
	                                                <p>qq：<span class="red">${t.qq }</span></p>
	                                            </div>
	                                        </li>
                                    	</s:iterator>
                                    	</s:subset>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        
						<div class="ssjh-index-row2 tabcontrol">
                            <div class="tabtitle-bg"></div>
                            <p class="tabtitle" style=" position:relative; background:url(images-ce/topmenu.png) center bottom no-repeat; background-size:100% 100%;">
                            	<a href="javascript:;" class="tab on">教师专栏</a>
                                <a href="javascript:;" class="tab">学生专栏</a>
                                <a href="decorateForwardAction.action?code=002031010&paramMap.uType=1" class="more" id="more_two">更多</a>
                            </p>
                            <div class="tabcontents">
                            	<div class="tabcontent">
                                    <ul class="rank-list">
                                    	<s:subset source="initMap.TarticleList" start="0" count="10">
                                    	<s:iterator id="t" status="index">
                                        	<li><i class="icon-no ${index.index<3?'top3':'' }">${index.index+1 }</i><a title="${t.aTitle}" href="decorateForwardAction.action?code=002031003&paramMap.readWidth=1&paramMap.aID=${t.aID}">${t.aTitle}</a></li>
                                        </s:iterator>
                                        </s:subset>
                                    </ul>
                                </div>
                                <div class="tabcontent" style="display:none">
                                    <ul class="rank-list">
                                   	 	<s:subset source="initMap.SarticleList" start="0" count="10">
                                    	<s:iterator id="t" status="index">
                                        	<li><i class="icon-no ${index.index<3?'top3':'' }">${index.index+1 }</i><a title="${t.aTitle}" href="decorateForwardAction.action?code=002031003&paramMap.aID=${t.aID}">${t.aTitle}</a></li>
                                        </s:iterator>
                                        </s:subset>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        
                        <div class="ssjh-index-row1 tabcontrol">
                            <div class="tabtitle-bg"></div>
                            <p class="tabtitle" style=" position:relative; background:url(images-ce/topmenu.png) center bottom no-repeat; background-size:100% 100%;">
                                <a href="javascript:;" class="tab on">探究广场</a>
                                <a href="javascript:;" class="tab">探究成果</a>
                                <a href="decorateForwardAction.action?code=002031011" class="more" id="more_three">更多</a>
                            </p>
                            <div class="tabcontents">
                                <div class="tabcontent">
                                    <ul class="rank-list">
                                    <s:subset source="initMap.tasklist" start="0" count="10">
                                    	<s:iterator id="task" status="index">
                                        	<li><i class="icon-no ${index.index<3?'top3':'' }">${index.index+1 }</i>
                                        		<a href="decorateForwardAction.action?code=${task.htaskIssplit==1?'-1890002':'-1890001' }&paramMap.htaskKeywords=${task.htaskKeywords }&paramMap.taskchoosetagindexhref=1&paramMap.htaskID=${task.htaskID}">${task.htaskTitle}</a>
                                        		</li>
                                    	</s:iterator>
                                    </s:subset>
                                    </ul>
                                </div>
                                <div class="tabcontent" style="display:none">
                                    <ul class="rank-list">
                                    	<s:subset source="initMap.taskAcceptList" start="0" count="10">
                                    	<s:iterator id="t" status="index">
                                        	<li><i class="icon-no ${index.index<3?'top3':'' }">${index.index+1 }</i>
                                        		<a href="decorateForwardAction.action?code=${t.htaskIssplit==1?'-1890002':'-1890001' }&paramMap.htaskKeywords=${t.htaskKeywords }&paramMap.taskchoosetagindexhref=1&paramMap.htaskID=${t.htaskID}">${t.htaskTitle }</a>
                                        	</li>
                                    	</s:iterator>
                                    </s:subset>
                                    </ul>
                                </div>
                                
                            </div>
                        </div>
                    </div>
                </div>
            </div>
				


	<script src="qc/js/jquery-1.7.2.min.js"></script>
	<script src="qc/js/tweenmax.min.js"></script>
	<script src="qc/js/scripts.js"></script>

	<!--师生交互JS-->
	<script src="qc/js/jquery.bxslider.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$(".rs-slider>ul").bxSlider({
				controls : true,
				nextText : "",
				prevText : "",
				auto : true,
				autoStart : true,
				prevSelector : "em.rs-prev",
				nextSelector : "em.rs-next",
				pager : false
			});

		});

		/* 切换第 '更多'的链接地址 */
		$(".tabcontrol .tabtitle a")
				.click(
						function() {

							var index = $(".tabcontrol .tabtitle a")
									.index(this);
							console.info(index);
							if (index == 2) {
								$("#more_one")
										.attr("href",
												"decorateForwardAction.action?code=002031001");
							} else if (index == 3) {
								$("#more_one")
										.attr("href",
												"decorateForwardAction.action?code=002031002");
							} else if (index == 5) {
								$("#more_two")
										.attr("href",
												"decorateForwardAction.action?code=002031010&paramMap.uType=1");
							} else if (index == 6) {
								$("#more_two")
										.attr("href",
												"decorateForwardAction.action?code=002031010&paramMap.uType=2");
							} else if (index == 8) {
								$("#more_three")
										.attr("href",
												"decorateForwardAction.action?code=002031011");
							} else if (index == 9) {
								$("#more_three")
										.attr("href",
												"decorateForwardAction.action?code=002031012");
							}
						});

		/* 将没有头像的小组设为默认头像 */
		$(document).ready(function() {
			$('.tabcontrol .tabcontents img').each(function() {
				if ($(this).attr('src') == '') {
					$(this).attr('src', 'images/default/default_img.jpg');
				}
			});
		});
	</script>

</body>
</html>
