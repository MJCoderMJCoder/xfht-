<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>分流管理</title>

<link type="text/css" href="${path}/static/css/style.css" rel="stylesheet" />
<link type="text/css" href="${path}/static/css/public.css" rel="stylesheet" />
<link type="text/css" href="${path}/static/css/other.css" rel="stylesheet" />
<link type="text/css" href="${path}/static/css/tcc.css" rel="stylesheet" />

<!-- <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/2.3.2/css/bootstrap.min.css" />
<link rel="stylesheet" href="http://cdn.bootcss.com/font-awesome/4.6.3/css/font-awesome.min.css"/>  -->
<link rel="stylesheet" href="${path}/static/css/comboselect.css"/>
<link rel="stylesheet" href="${path}/static/css/demo.css" />

<script type="text/javascript" src="${path}/static/js/jquery.min.js"></script>
<script type="text/javascript" src="${path}/static/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="${path}/static/js/jquery.SuperSlide.2.1.js"></script>
<script type="text/javascript" src="${path}/static/js/ajaxfileupload.js" ></script>
<script src="${path}/static/js/date.js"></script><!--时间控件js-->

<script type="text/javascript" src="${path}/static/js/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="${path}/static/js/comboselect.min.js" ></script>
<script type="text/javascript" src="${path}/static/js/b.comboselect.js" ></script>

<script type="text/javascript">
	//内容部分高度自适应
	$(function() {
		$(".center").css("height", $(window).height() - 170);
	});
	var h = (window.innerHeight || (window.document.documentElement.clientHeight || window.document.body.clientHeight));
	$(".center").css({
		"height" : h - 170
	});
	window.onresize = resize;
	function resize() {
		var h = (window.innerHeight || (window.document.documentElement.clientHeight || window.document.body.clientHeight));
		$(".center").css({
			"height" : h - 170
		});
	}
	$(document).ready(function(){
		//成功提示弹出层
		$(".close_tc_cg_btn").click(function(){
			$(".cg_block").css("display","none");
			window.location.href="/cm_shunt_management_list";	
		});
		//提示弹出层
		$(".close_tc_ts_btn").click(function(){
			$(".ts_block").css("display","none");
		});
	});
	$(function(){
		$('#processingCompany').bComboSelect({
			pageSize:'10',//每页显示条数
			keyField:'id',//值字段
			showField:'name',//显示属性的名称
			data:'/cm_shunt_management_processingCompany',
			callback : function(data){
				$.ajax({
			        type: "POST",
			        dataType: 'json',
			        url: "cm_shunt_management_getUserByOrganizational",
			        data: {organizationid:data.id},
			        traditional: true,
			        dataType: "json",
			        success: function(data){
			        	$("#processingHead").empty();
		    			$("#processingHead").append("<option value=''></option>");
		        		for (var i = 0; i < data.userList.length; i++) {
		            		$("#processingHead").append("<option value='"+data.userList[i].id+"'>"+data.userList[i].name+"</option>");
		        		}
			        },
			        error:function(){
			 	 	}
			    });
			}
		});
	});
	$(function(){
		$("#tr1").hide(); 
		$("#tr2").hide();
		$("#status").change(function() {
			var status = $("#status").val();
			if (status == "3") {
				$("#tr1").show();
				$("#tr2").show();
			} else {
				$("#tr1").hide(); 
				$("#tr2").hide();
			}
		})
	})
	function save(){
		
		var status = $("#status").val();
		if(status.trim() == ""){
			$("#warningNotice").html("分流处理不能为空！");
			$(".ts_block").css("display","block");
			return false;
		}
		
		var reason = $("#reason").val();
		if(reason.trim() == ""){
			$("#warningNotice").html("原因不能为空！");
			$(".ts_block").css("display","block");
			return false;
		}
		
		if (status == "3") {
			var processingCompany = $("#processingCompany").val();
			if(processingCompany.trim() == ""){
				$("#warningNotice").html("案件负责单位不能为空！");
				$(".ts_block").css("display","block");
				return false;
			}
			
			var processingHead = $("#processingHead").val();
			if(processingHead.trim() == ""){
				$("#warningNotice").html("案件负责人不能为空！");
				$(".ts_block").css("display","block");
				return false;
			}
			
			var endTime = $("#endTime").val();
			if(endTime.trim() == ""){
				$("#warningNotice").html("处理截止日期不能为空！");
				$(".ts_block").css("display","block");
				return false;
			}
		}
		
		$.ajax({
	        type: "POST",
	        dataType: 'json',
	        url: "cm_shunt_management_save",
	        data: $("#addForm").serialize(),
	        traditional: true,
	        dataType: "json",
	        success: function(data){
	        	if(data.status==0) {
	        		$("#sucessNotice").text("保存成功！");
	        		$(".cg_block").css("display","block");
	            }else if(data.status == 1){
	            	$("#warningNotice").text("保存失败！");
	        		$(".ts_block").css("display","block");
	            }
	        },
	        error:function(){
	 	 	}
	    });
	}
</script>
</head>
<body>
	<jsp:include page="../include/top.jsp"></jsp:include>
	<div class="center">
		<jsp:include page="../include/handle_left.jsp"></jsp:include>
		<div class="pubilc_right fl">
			<div id="ContainerPanel" style="display:none;"><div id="calendarPanel" style="position: absolute;display: none;z-index: 9999;background: #fff;border: 1px solid #ccc;width:200px;font:12px/18px 微软雅黑;margin-left:25px;"></div></div>
			<div class="pubilc_right_cn">
				<form action="cm_visitingRegistration_save" id="addForm" name="addForm" method="post">
					<div class="cfcx">
						<div class="cfcx_2">
							<h1 class="kzt_bt">
								<span>举报人员信息及反应情况</span>
							</h1>
							<div class="table_eg">
								<table width="100%" border="0" cellspacing="0" cellpadding="0" class="table_one">
									<tbody>
										<tr>
											<td width="20%" class="table_grey">信访编号：</td>
											<td width="30%" colspan="2"><p>${guestbook.complaintNumber}</p></td>
											<td width="20%" class="table_grey">创建日期：</td>
											<td width="30%" colspan="2"><p><fmt:formatDate value="${guestbook.createTime}" pattern="yyyy-MM-dd hh:mm:ss" type="date"/></p></td>
										</tr>
										<tr>
											<td width="20%" class="table_grey">姓　　名：</td>
											<td width="30%" colspan="2"><p>${guestbook.ext.informantName}</p></td>
											<td class="table_grey">身份证号：</td>
											<td width="30%" colspan="2"><p>${guestbook.ext.informantCardNo}</p></td>
										</tr>
										<tr>
											<td class="table_grey">级　　别：</td>
											<td width="30%" colspan="2"><p>${guestbook.ext.informantLevel}</p></td>
											<td class="table_grey">政治面貌：</td>
											<td width="30%" colspan="2"><p>${guestbook.ext.informantpoliticalFace}</p></td>
										</tr>
										<tr>
											<td class="table_grey">手　　机：</td>
											<td width="30%" colspan="2"><p>${guestbook.ext.informantPhone}</p></td>
											<td class="table_grey">居住地址：</td>
											<td width="30%" colspan="2"><p>${guestbook.ext.informantPlace}</p></td>
										</tr>
										<tr>
											<td class="table_grey">标　　题：</td>
											<td width="30%" colspan="2"><p>${guestbook.ext.title}</p></td>
											<td width="20%" class="table_grey">所属问题：</td>
											<td width="30%" colspan="2"><p>${guestbook.ext.matterCategory}</p></td>
										</tr>
										<tr>
											<td class="table_grey">问题细类：</td>
											<td width="30%" colspan="2"><p>${guestbook.ext.matterDetailed}</p></td>
											<td width="20%" class="table_grey">是否有复核意见书：</td>
											<td width="30%" colspan="2">
												<p>
													<c:choose>
														<c:when test="${guestbook.ext.reviewOpinions}">是</c:when>
														<c:otherwise>否</c:otherwise>												
													</c:choose>
												</p>
											</td>
										</tr>
										<tr>
											<td width="20%" class="table_grey">法院是否已受理：</td>
											<td width="30%" colspan="2">
												<p>
													<c:choose>
														<c:when test="${guestbook.ext.accept}">是</c:when>
														<c:otherwise>否</c:otherwise>												
													</c:choose>
												</p>
											</td>
											<td width="20%" class="table_grey">是否已经行政复议：</td>
											<td width="30%" colspan="2">
												<p>
													<c:choose>
														<c:when test="${guestbook.ext.administrativeReconsideration}">是</c:when>
														<c:otherwise>否</c:otherwise>												
													</c:choose>
												</p>
											</td>
										</tr>
										<tr>
											<td width="20%" class="table_grey">是否允许公开：</td>
											<td width="30%" colspan="2">
												<p>
													<c:choose>
														<c:when test="${guestbook.ext.publicity}">是</c:when>
														<c:otherwise>否</c:otherwise>												
													</c:choose>
												</p>
											</td>
											<td width="20%" class="table_grey"></td>
											<td width="30%" colspan="2"></td>
										</tr>
										<tr>
											<td class="sj_wz table_grey">文档附件：</td>
											<td colspan="4">
												<div id="fileDocName">
													<c:forEach items="${guestbook.attachments}" var="list">
														<c:if test="${list.type==1}"><p><a href="${list.path}" download="${list.name}">${list.name}</a></p></c:if>
													</c:forEach>
												</div>
											</td>
										</tr>
										<tr>
											<td class="sj_wz table_grey">音频附件：</td>
											<td colspan="4">
												<div id="fileMediaName">
													<c:forEach items="${guestbook.attachments}" var="list">
														<c:if test="${list.type==2}"><p><a href="${list.path}" download="${list.name}">${list.name}</a></p></c:if>
													</c:forEach>
												</div>
											</td>
										</tr>
										<tr>
											<td class="sj_wz table_grey">视频附件：</td>
											<td colspan="4">
												<div id="fileVideoName">
													<c:forEach items="${guestbook.attachments}" var="list">
														<c:if test="${list.type==3}"><p><a href="${list.path}" download="${list.name}">${list.name}</a></p></c:if>
													</c:forEach>
												</div>
											</td>
										</tr>
										<tr>
											<td class="sj_wz table_grey">图片附件：</td>
											<td colspan="4">
												<div id="fileImageName">
													<c:forEach items="${guestbook.attachments}" var="list">
														<c:if test="${list.type==4}"><p><a href="${list.path}" download="${list.name}">${list.name}</a></p></c:if>
													</c:forEach>
												</div>
											</td>
										</tr>
										<tr>
											<td width="20%" class="table_grey">反应问题及诉求：</td>
											<td width="30%" colspan="5"><p>${guestbook.appeals}</p></td>
										</tr>
										<tr>
											<td width="20%" class="table_grey">初步处理意见：</td>
											<td width="30%" colspan="5"><p>${guestbook.preliminaryOpinion}</p></td>
										</tr>
										<tr>
											<td class="table_grey">案件负责单位：</td>
											<td width="30%" colspan="2"><p>${guestbook.ext.processingCompany.name}</p></td>
											<td class="table_grey">案件负责人：</td>
											<td width="30%" colspan="2"><p>${guestbook.ext.processingHead.description}</p></td>
										</tr>
									</tbody>
								</table>
							</div>
							<h1 class="kzt_bt">
								<span>被举报人信息</span>
							</h1>
							<div class="table_eg">
								<table width="100%" border="0" cellspacing="0" cellpadding="0" class="table_one">
									<tbody>
										<tr>
											<td width="20%" class="table_grey">被举报人：</td>
											<td width="30%" colspan="2"><p>${guestbook.ext.reportedName}</p></td>
											<td width="20%" class="table_grey">单　　位：</td>
											<td width="30%" colspan="2"><p>${guestbook.ext.reportedCompany}</p></td>
										</tr>
										<tr>
											<td width="20%" class="table_grey">职　　务：</td>
											<td width="30%" colspan="2"><p>${guestbook.ext.reportedDuties}</p></td>
											<td class="table_grey">级　　别：</td>
											<td width="30%" colspan="2"><p>${guestbook.ext.reportedLevel}</p></td>
										</tr>
									</tbody>
								</table>
							</div>
							<h1 class="kzt_bt">
								<span>信访处理</span>
							</h1>
							<div class="table_eg">
								<input type="hidden" id="guestbookId" name="guestbookId" value="${guestbook.id}"/>
								<table width="100%" border="0" cellspacing="0" cellpadding="0" class="table_one">
									<tbody>
										<tr>
											<td class="table_grey"><span>*</span>分流处理：</td>
											<td colspan="2">
												<select id="status" name="status">
													<option value=""></option>
													<option value="3">通过</option>
													<option value="4">驳回</option>
												</select>
											</td>
											<td width="20%" class="table_grey"><span>*</span>原　　因：</td>
											<td width="30%" colspan="2"><input class="input_color" id="reason" name="reason" type="text" placeholder="请输入原因" maxlength="255" /></td>
										</tr>
										<tr id="tr1" style="">
											<td class="table_grey"><span>*</span>案件负责单位：</td>
											<td colspan="2"><input class="input-block-level" id="processingCompany" name="processingCompany" data-init="${guestbook.ext.processingCompany.id}" type="text" placeholder="请输入案件负责单位" maxlength="20" /></td>
											<td class="table_grey"><span>*</span>案件负责人：</td>
											<td colspan="2">
												<select id="processingHead" name="processingHead">
													<option value=""></option>
													<c:forEach items="${userList}" var="list" varStatus="status">
														<option value="${list.id}" ${guestbook.ext.processingHead.id==list.id?'selected':''}>${list.description}</option>
													</c:forEach>
												</select>
											</td>
										</tr>
										<tr id="tr2">
											<td width="20%" class="table_grey"><span>*</span>处理截止日期：</td>
											<td width="30%" colspan="5"><input onclick="SetDate(this,'yyyy-MM-dd hh:mm:ss')" placeholder="请输入处理截止日期" class="select_time" id="endTime" name="endTime"/></td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
						<div class="clear"></div>
						<div class="sj_bt_wai">
							<div class="sj_bt">
								<input type="button" class="bt_small bt_green2" value="保&nbsp;&nbsp;&nbsp;存" onclick="save();"/>
								<input type="button" class="bt_small bt_yellow" value="返&nbsp;&nbsp;&nbsp;回" onclick="javascript:window.location.href='/cm_shunt_management_list'" />
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<!--提示弹出 START-->
    <div class="bg_block ts_block">
        <div class="t_tcc">
            <div class="tcc_w">
                <div class="ts_img">
                    <img src="${path}/static/images/tc_jg.png" alt="" />
                </div>
                <div class="ts_txt">
                                                 警告！<br />
                    <span id="warningNotice"></span>
                </div>
                <div class="tc_btn">
                    <input type="button" class="close_tc_ts_btn" value="关闭" />
                </div>
            </div>
        </div>
    </div>
    <!--提示弹出 END-->
    <!--成功弹出 START-->
    <div class="bg_block cg_block">
    	<div class="t_tcc">
            <div class="tcc_w">
                <div class="ts_img">
                    <img src="${path}/static/images/tc_cg.png" alt="" />
                </div>
                <div class="ts_txt">
                                                 操作成功！<br />
                    <span id="sucessNotice"></span>
                </div>
                <div class="tc_btn">
                    <input type="button" class="close_tc_cg_btn" value="关闭" />
                </div>
            </div>
        </div>
    </div>
	<!--成功弹出 END-->
</body>
</html>