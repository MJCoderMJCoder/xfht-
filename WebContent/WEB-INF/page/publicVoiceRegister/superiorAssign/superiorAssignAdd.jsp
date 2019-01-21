<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>上级交办</title>

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
<script src="${path}/static/js/date.js"></script><!--时间控件js-->

<script type="text/javascript" src="${path}/static/js/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="${path}/static/js/comboselect.min.js" ></script>
<script type="text/javascript" src="${path}/static/js/b.comboselect.js" ></script>
<script type="text/javascript" src="${path}/static/js/ajaxfileupload.js" ></script>

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
</script>
<script type="text/javascript">
	$(document).ready(function(){
		//成功提示弹出层
		$(".close_tc_cg_btn").click(function(){
			$(".cg_block").css("display","none");
			window.location.href="/cm_superior_assign_list";	
		});
		//提示弹出层
		$(".close_tc_ts_btn").click(function(){
			$(".ts_block").css("display","none");
		});
	});
</script>
<script type="text/javascript">
	$(document).ready(function(){
		doc_onchange();
		media_onchange();
		video_onchange();
		image_onchange();
	});
	
	function save(){
		
		var assignNumber = $("#assignNumber").val();
		if(assignNumber.trim() == ""){
			$("#warningNotice").html("上级交办号不能为空！");
			$(".ts_block").css("display","block");
			return false;
		}
		
		var assignPerson = $("#assignPerson").val();
		if(assignPerson.trim() == ""){
			$("#warningNotice").html("交办人不能为空！");
			$(".ts_block").css("display","block");
			return false;
		}
		
		var assignPersonPost = $("#assignPersonPost").val();
		if(assignPersonPost.trim() == ""){
			$("#warningNotice").html("交办人职务不能为空！");
			$(".ts_block").css("display","block");
			return false;
		}
		
		var assignCompany = $("#assignCompany").val();
		if(assignCompany.trim() == ""){
			$("#warningNotice").html("交办人单位不能为空！");
			$(".ts_block").css("display","block");
			return false;
		}
		
		var assignModality = $("#assignModality").val();
		if(assignModality.trim() == ""){
			$("#warningNotice").html("交办形式不能为空！");
			$(".ts_block").css("display","block");
			return false;
		}
		
		var complaintNumber = $("#complaintNumber").val();
		if(complaintNumber.trim() == ""){
			$("#warningNotice").html("信访编号不能为空！");
			$(".ts_block").css("display","block");
			return false;
		}
		
		var createTime = $("#createTime").val();
		if(createTime.trim() == ""){
			$("#warningNotice").html("创建日期不能为空！");
			$(".ts_block").css("display","block");
			return false;
		}
		
		var informantCardNo = $("#informantCardNo").val();
		if(informantCardNo.trim() != ""){
			var reg = /(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/;
			
			if(reg.test(informantCardNo) === false){ 
				$("#warningNotice").html("没有输入正确的身份证号！");
				$(".ts_block").css("display","block");
				return false;
			} 
		}

		var informantPhone = $("#informantPhone").val();
		if(informantPhone.trim() != ""){
			var reg = /^1(3|4|5|7|8)\d{9}$/;
			if(reg.test(informantPhone) === false){
				$("#warningNotice").html("举报人手机号输入的格式不正确！");
				$(".ts_block").css("display","block");
				return false;
			}
		}
		
		var matterCategory = $("#matterCategory").val();
		if(matterCategory.trim() == ""){
			$("#warningNotice").html("所属问题不能为空！");
			$(".ts_block").css("display","block");
			return false;
		}
		
		var matterProperty = $("#matterProperty").val();
		if(matterProperty.trim() == ""){
			$("#warningNotice").html("上访类型不能为空！");
			$(".ts_block").css("display","block");
			return false;
		}
		
		var informantGrade = $("#informantGrade").val();
		if(informantGrade.trim() == ""){
			$("#warningNotice").html("上访层次不能为空！");
			$(".ts_block").css("display","block");
			return false;
		}
		
		var appeals = $("#appeals").val();
		if(appeals.trim() == ""){
			$("#warningNotice").html("反应问题及诉求不能为空！");
			$(".ts_block").css("display","block");
			return false;
		}
		
		var preliminaryOpinion = $("#preliminaryOpinion").val();
		if(preliminaryOpinion.trim() == ""){
			$("#warningNotice").html("初步处理意见不能为空！");
			$(".ts_block").css("display","block");
			return false;
		}
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
		
		var reportedName = $("#reportedName").val();
		if(reportedName.trim() == ""){
			$("#warningNotice").html("被举报人姓名不能为空！");
			$(".ts_block").css("display","block");
			return false;
		}
		
		var reportedCompany = $("#reportedCompany").val();
		if(reportedCompany.trim() == ""){
			$("#warningNotice").html("被举报人单位不能为空！");
			$(".ts_block").css("display","block");
			return false;
		}
		
		var reportedDuties = $("#reportedDuties").val();
		if(reportedDuties.trim() == ""){
			$("#warningNotice").html("被举报人职务不能为空！");
			$(".ts_block").css("display","block");
			return false;
		}
		
		var reportedLevel = $("#reportedLevel").val();
		if(reportedLevel.trim() == ""){
			$("#warningNotice").html("被举报人级别不能为空！");
			$(".ts_block").css("display","block");
			return false;
		}
		
		$.ajax({
	        type: "POST",
	        dataType: 'json',
	        url: "cm_superior_assign_save",
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
	
	$(function(){
		$('#processingCompany').bComboSelect({
			pageSize:'10',//每页显示条数
			keyField:'id',//值字段
			showField:'name',//显示属性的名称
			data:'/cm_superior_assign_processingCompany',
			callback : function(data){
				$.ajax({
			        type: "POST",
			        dataType: 'json',
			        url: "cm_superior_assign_getUserByOrganizational",
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
</script>
</head>
<body>
	<jsp:include page="../../include/top.jsp"></jsp:include>
	<div class="center">
		<jsp:include page="../../include/public_voice_register_left.jsp"></jsp:include>
		<div class="pubilc_right fl">
			<div id="ContainerPanel" style="display:none;"><div id="calendarPanel" style="position: absolute;display: none;z-index: 9999;background: #fff;border: 1px solid #ccc;width:200px;font:12px/18px 微软雅黑;margin-left:25px;"></div></div>
			<div class="pubilc_right_cn">
				<form action="cm_visitingRegistration_save" id="addForm" name="addForm" method="post">
					<div class="cfcx">
						<div class="cfcx_2">
							<h1 class="kzt_bt">
								<span>交办信息</span>
							</h1>
							<div class="table_eg">
								<table width="100%" border="0" cellspacing="0" cellpadding="0" class="table_one">
									<tbody>
										<tr>
											<td width="20%" class="table_grey"><span>*</span>交办号：</td>
											<td width="30%" colspan="2"><input class="input_color" id="assignNumber" name="assignNumber" type="text" placeholder="请输入交办号 " maxlength="50" /></td>
											<td width="20%" class="table_grey"><span>*</span>交办人：</td>
											<td width="30%" colspan="2"><input class="input_color" id="assignPerson" name="assignPerson" type="text" placeholder="请输入交办人 " maxlength="50" /></td>
										</tr>
										<tr>
											<td width="20%" class="table_grey"><span>*</span>交办人职务：</td>
											<td width="30%" colspan="2"><input class="input_color" id="assignPersonPost" name="assignPersonPost" type="text" placeholder="请输入交办人职务 " maxlength="50" /></td>
											<td width="20%" class="table_grey"><span>*</span>交办人单位：</td>
											<td width="30%" colspan="2"><input class="input_color" id="assignCompany" name="assignCompany" type="text" placeholder="请输入交办人单位 " maxlength="50" /></td>
										</tr>
										<tr>
											<td width="20%" class="table_grey"><span>*</span>交办形式：</td>
											<td colspan="2">
												<select id="assignModality" name="assignModality">
													<option value=""></option>
													<c:forEach items="${assignModalityList }" var="obj" varStatus="status">
														<option value="${obj.name }">${obj.name }</option>
													</c:forEach>
												</select>
											</td>
											<td width="20%" class="table_grey">保管人：</td>
											<td width="30%" colspan="2"><input class="input_color" id="preserver" name="preserver" type="text" placeholder="请输入保管人" maxlength="50" /></td>
										</tr>
										<tr>
											<td width="20%" class="table_grey">地点：</td>
											<td width="30%" colspan="5"><input class="input_color" id="place" name="place" type="text" placeholder="请输入地点" maxlength="200" /></td>
										</tr>
									</tbody>
								</table>
							</div>
							<h1 class="kzt_bt">
								<span>来访人员信息及反应情况</span>
							</h1>
							<div class="table_eg">
								<table width="100%" border="0" cellspacing="0" cellpadding="0" class="table_one">
									<tbody>
										<tr>
											<td width="20%" class="table_grey"><span>*</span>信访编号：</td>
											<td width="30%" colspan="2">
												<input class="input_color" id="complaintNumber" name="complaintNumber" type="text" placeholder="请输入信访编号" maxlength="50" />
											</td>
											<td width="20%" class="table_grey"><span>*</span>创建日期：</td>
											<td width="30%" colspan="2">
												<input onclick="SetDate(this,'yyyy-MM-dd hh:mm:ss')" placeholder="请输入创建日期" class="select_time" id="createTime" name="createTime"/>
											</td>
										</tr>
										<tr>
											<td width="20%" class="table_grey">姓　　名：</td>
											<td width="30%" colspan="2">
												<input class="input_color" id="informantName" name="informantName" type="text" placeholder="请输入姓名" maxlength="10" />
											</td>
											<td width="20%" class="table_grey">性　　别：</td>
											<td colspan="2">
												<select id="informantSex" name="informantSex">
													<option value=""></option>
													<c:forEach items="${genderList }" var="obj" varStatus="status">
														<option value="${obj.value }">${obj.name }</option>
													</c:forEach>
												</select>
											</td>
										</tr>
										<tr>
											<td class="table_grey">年　　龄：</td>
											<td colspan="2">
												<input class="input_color" id="informantAge" name="informantAge" type="text" placeholder="请输入年龄" maxlength="2" onkeyup="(this.v=function(){this.value=this.value.replace(/[^0-9-]+/,'');}).call(this)" onblur="this.v();" />
											</td>
											<td class="table_grey">民　　族：</td>
											<td colspan="2">
												<select id="informantNation" name="informantNation">
													<option value=""></option>
													<c:forEach items="${nationList }" var="obj" varStatus="status">
														<option value="${obj.name }">${obj.name }</option>
													</c:forEach>
												</select>
											</td>
										</tr>
										<tr>
											<td class="table_grey">身份证号：</td>
											<td colspan="2">
												<input class="input_color" id="informantCardNo" name="informantCardNo" type="text" placeholder="请输入身份证号" maxlength="18" />
											</td>
											<td class="table_grey">文化程度：</td>
											<td colspan="2">
												<select id="informantEducation" name="informantEducation">
													<option value=""></option>
													<c:forEach items="${educationList }" var="obj" varStatus="status">
														<option value="${obj.name }">${obj.name }</option>
													</c:forEach>
												</select>
											</td>
										</tr>
										<tr>
											<td class="table_grey">居住地址：</td>
											<td colspan="2">
												<input class="input_color" id="informantPlace" name="informantPlace" type="text" placeholder="请输入居住地址" maxlength="50" />
											</td>
											<td class="table_grey">政治面貌：</td>
											<td colspan="2">
												<select id="informantpoliticalFace" name="informantpoliticalFace">
													<option value=""></option>
													<c:forEach items="${politicalFaceList }" var="obj" varStatus="status">
														<option value="${obj.name }">${obj.name }</option>
													</c:forEach>
												</select>
											</td>
										</tr>
										<tr>
											<td class="table_grey">手　　机：</td>
											<td colspan="2">
												<input class="input_color" id="informantPhone" name="informantPhone" type="text" placeholder="请输入手机号" maxlength="11" />
											</td>
											<td width="20%" class="table_grey"><span>*</span>所属问题：</td>
											<td colspan="2">
												<select id="matterCategory" name="matterCategory">
													<option value=""></option>
													<c:forEach items="${matterCategoryList }" var="obj" varStatus="status">
														<option value="${obj.name }">${obj.name }</option>
													</c:forEach>
												</select>
											</td>
										</tr>
										<tr>
											<td class="table_grey"><span>*</span>上访类型：</td>
											<td colspan="2">
												<select id="matterProperty" name="matterProperty">
													<option value=""></option>
													<c:forEach items="${matterPropertyList }" var="obj" varStatus="status">
														<option value="${obj.name }">${obj.name }</option>
													</c:forEach>
												</select>
											</td>
											<td class="table_grey"><span>*</span>上访层次：</td>
											<td colspan="2">
												<select id="informantGrade" name="informantGrade">
													<option value=""></option>
													<c:forEach items="${informantGradeList }" var="obj" varStatus="status">
														<option value="${obj.name }">${obj.name }</option>
													</c:forEach>
												</select>
											</td>
										</tr>
										<tr>
											<td class="table_grey">来访人数：</td>
											<td colspan="2">
												<input class="input_color" id="peopleCount" name="peopleCount" type="text" placeholder="请输入来访人数" onkeyup="(this.v=function(){this.value=this.value.replace(/[^0-9-]+/,'');}).call(this)" onblur="this.v();" />
											</td>
											<td class="table_grey">来访代表：</td>
											<td colspan="2">
												<input class="input_color" id="leader" name="leader" type="text" placeholder="请输入来访代表" maxlength="10" />
											</td>
										</tr>
										<tr>
											<td class="sj_wz table_grey">处理文档上传：</td>
											<td colspan="4">
												<div class="sj_sc table_bordernone">
													<div class="file_wai">
														<div class="upfile">
															<p id="fileName"></p>
															<label for="fileDoc" id="upFile">上　　传</label>
															<input type="file" id="fileDoc" name="fileDoc" style="display: none;" multiple="multiple"/>
														</div>
														<input type="hidden" id="fileDocPath" name="fileDocPath" value="" /> 
														<input type="hidden" id="fileDocOriginalName" name="fileDocOriginalName" value="" />
														<script>
															//文件上传
															function doc_onchange() {
																$("#fileDoc").on("change",function() {
																	if ($("#fileDoc").val() == "") {
																		return;
																	}
																	$.ajaxFileUpload({
																		url : "file_upload_doc",
																		type : "post",
																		secureuri : false, //是否需要安全协议，一般设置为false
																		fileElementId : 'fileDoc', //文件上传域的ID
																		dataType : 'JSON', //返回值类型 一般设置为json
																		success : function(data) {
																			data = JSON.parse(data);
																			if (data.status == 0) {
																				var fileNames = data.fileName;
																				var fileDocName = "";
																				var strs = new Array();
																				strs = fileNames.split("|");
																				for (var i = 0; i < strs.length - 1; i++) {
																					fileDocName += "<div class=\"fj fj2\"><p>附件"
																							+ [ i + 1 ]
																							+ ":"
																							+ strs[i]
																							+ "</p></div>";
																				}
																				$("#fileDocName").html(fileDocName);
	
																				$("#fileDocPath").val(data.fileUrl);
																				$("#fileDocOriginalName").val(data.fileName);
	
																				doc_onchange();

																			} else if (data.status == 1) {
																				$("#warningNotice").html("上传文档不能为空！");
																				$(".ts_block").css("display","block");
																			} else if (data.status == 2) {
																				$("#warningNotice").html("上传文档不能超过5M！");
																				$(".ts_block").css("display","block");
																			} else if (data.status == 3) {
																				$("#warningNotice").html("请上传后缀名为DOC、DOCX、XLS、XLSX、TXT、PDF的文档！");
																				$(".ts_block").css("display","block");
																			} else if (data.status == 4) {
																				$("#warningNotice").html("上传文档过多！");
																				$(".ts_block").css("display","block");
																			}
																		},
																		error : function(e) {
																			//请求出错处理
																		}
																	});
																});
															}
														</script>
													</div>
													<div id="fileDocName"></div>
													<div class="clear"></div>
												</div>
											</td>
										</tr>
										<tr>
											<td class="sj_wz table_grey">处理音频上传：</td>
											<td colspan="4">
												<div class="sj_sc table_bordernone">
													<div class="file_wai">
														<div class="upfile">
															<p id="fileName2"></p>
															<label for="fileMedia" id="upFile2">上　　传</label>
															<input type="file" id="fileMedia" name="fileMedia" style="display: none;" multiple="multiple" accept="audio/*">
														</div>
														<input type="hidden" id="fileMediaPath" name="fileMediaPath" value="" /> 
														<input type="hidden" id="fileMediaOriginalName" name="fileMediaOriginalName" value="" />
														<script>
															//文件上传
															function media_onchange() {
																$("#fileMedia").on("change",function() {
																	if ($("#fileMedia").val() == "") {
																		return;
																	}
																	$.ajaxFileUpload({
																		url : "file_upload_media",
																		type : "post",
																		secureuri : false, //是否需要安全协议，一般设置为false
																		fileElementId : 'fileMedia', //文件上传域的ID
																		dataType : 'JSON', //返回值类型 一般设置为json
																		success : function(data) {
																			data = JSON.parse(data);
																			if (data.status == 0) {
																				var fileNames = data.fileName;
																				var fileDocName = "";
																				var strs = new Array();
																				strs = fileNames.split("|");
																				for (var i = 0; i < strs.length - 1; i++) {
																					fileDocName += "<div class=\"fj fj2\"><p>附件"
																							+ [ i + 1 ]
																							+ ":"
																							+ strs[i]
																							+ "</p></div>";
																				}
																				$("#fileMediaName").html(fileDocName);
	
																				$("#fileMediaPath").val(data.fileUrl);
																				$("#fileMediaOriginalName").val(data.fileName);
																				media_onchange();
	
																			} else if (data.status == 1) {
																				$("#warningNotice").html("上传音频不能为空！");
																				$(".ts_block").css("display","block");
																			} else if (data.status == 2) {
																				$("#warningNotice").html("上传音频不能超过20M！");
																				$(".ts_block").css("display","block");
																			} else if (data.status == 3) {
																				$("#warningNotice").html("请上传后缀名为wav,mp3的音频！");
																				$(".ts_block").css("display","block");
																			} else if (data.status == 4) {
																				$("#warningNotice").html("上传音频文件过多！");
																				$(".ts_block").css("display","block");
																			}
																		},
																		error : function(e) {
																			//请求出错处理
																		}
																	});
																});
															}
														</script>
													</div>
													<div id="fileMediaName"></div>
													<div class="clear"></div>
												</div>
											</td>
										</tr>
										<tr>
											<td class="sj_wz table_grey">处理视频上传：</td>
											<td colspan="4">
												<div class="sj_sc table_bordernone">
													<div class="file_wai">
														<div class="upfile">
															<p id="fileName3"></p>
															<label for="fileVideo" id="upFile3">上　　传</label>
															<input type="file" id="fileVideo" name="fileVideo" style="display: none;" multiple="multiple" accept="video/*">
														</div>
														<input type="hidden" id="fileVideoPath" name="fileVideoPath" value="" /> 
														<input type="hidden" id="fileVideoOriginalName" name="fileVideoOriginalName" value="" />
														<script>
															//文件上传
															function video_onchange() {
																$("#fileVideo").on("change",function() {
																	if ($("#fileVideo").val() == "") {
																		return;
																	}
																	$.ajaxFileUpload({
																		url : "file_upload_video",
																		type : "post",
																		secureuri : false, //是否需要安全协议，一般设置为false
																		fileElementId : 'fileVideo', //文件上传域的ID
																		dataType : 'JSON', //返回值类型 一般设置为json
																		success : function(data) {
																			data = JSON.parse(data);
																			if (data.status == 0) {
																				var fileNames = data.fileName;
																				var fileDocName = "";
																				var strs = new Array();
																				strs = fileNames.split("|");
																				for (var i = 0; i < strs.length - 1; i++) {
																					fileDocName += "<div class=\"fj\"><p>附件"
																							+ [ i + 1 ]
																							+ ":"
																							+ strs[i]
																							+ "</p></div>";
																				}
																				$("#fileVideoName").html(fileDocName);
	
																				$("#fileVideoPath").val(data.fileUrl);
																				$("#fileVideoOriginalName").val(data.fileName);
																				video_onchange();
	
																			} else if (data.status == 1) {
																				$("#warningNotice").html("上传视频不能为空！");
																				$(".ts_block").css("display","block");
																			} else if (data.status == 2) {
																				$("#warningNotice").html("上传文档不能超过300M！");
																				$(".ts_block").css("display","block");
																			} else if (data.status == 3) {
																				$("#warningNotice").html("请上传后缀名为MP4/WMV/AVI的视频！");
																				$(".ts_block").css("display","block");
																			} else if (data.status == 4) {
																				$("#warningNotice").html("上传音频文件过多！");
																				$(".ts_block").css("display","block");
																			}
																		},
																		error : function(e) {
																			//请求出错处理
																		}
																	});
																});
															}
														</script>
													</div>
												</div>
												<div id="fileVideoName"></div>
											</td>
										</tr>
										<tr>
											<td class="sj_wz table_grey">处理图片上传：</td>
											<td colspan="4">
												<div class="sj_sc table_bordernone">
													<div class="file_wai">
														<div class="upfile">
															<p id="fileName4"></p>
															<label for="fileImage" id="upFiletj">上　　传</label>
															<input type="file" id="fileImage" name="fileImage" style="display: none;" multiple="multiple" accept="image/*">
														</div>
														<input type="hidden" id="fileImagePath" name="fileImagePath" value="" /> 
														<input type="hidden" id="fileImageOriginalName" name="fileImageOriginalName" value="" />
														<script>
															//文件上传
															function image_onchange() {
																$("#fileImage").on("change",function() {
																	if ($("#fileImage").val() == "") {
																		return;
																	}
																	$.ajaxFileUpload({
																		url : "file_upload_image",
																		type : "post",
																		secureuri : false, //是否需要安全协议，一般设置为false
																		fileElementId : 'fileImage', //文件上传域的ID
																		dataType : 'JSON', //返回值类型 一般设置为json
																		success : function(data) {
																			data = JSON.parse(data);
																			if (data.status == 0) {
																				var fileNames = data.fileUrl;
																				var fileDocName = "";
																				var strs = new Array();
																				strs = fileNames.split(",");
	
																				var origName = data.fileName;
																				var tempName = new Array();
																				tempName = origName.split("|");
	
																				for (var i = 0; i < strs.length - 1; i++) {
																					fileDocName += "<div class=\"sj_pic\"><div class=\"sj_zp\"><img src=\""+strs[i]+"\"></div><div class=\"fj fl\"><p>附件"
																							+ [ i + 1 ]
																							+ "：</p><p>"
																							+ tempName[i]
																							+ "</p></div></div>";
																				}
	
																				$("#fileImageName").html(fileDocName);
	
																				$("#fileImagePath").val(data.fileUrl);
																				$("#fileImageOriginalName").val(data.fileName);
																				image_onchange();
	
																			} else if (data.status == 1) {
																				$("#warningNotice").html("上传图片不能为空！");
																				$(".ts_block").css("display","block");
																			} else if (data.status == 2) {
																				$("#warningNotice").html("上传图片不能超过4M！");
																				$(".ts_block").css("display","block");
																			} else if (data.status == 3) {
																				$("#warningNotice").html("请上传后缀名为PNG、JPG、BMP、JPEG的图片！");
																				$(".ts_block").css("display","block");
																			} else if (data.status == 4) {
																				$("#warningNotice").html("上传图片文件过多！");
																				$(".ts_block").css("display","block");
																			}
																		},
																		error : function(e) {
																			//请求出错处理
																		}
																	});
																});
															}
														</script>
													</div>
													<div id="fileImageName"></div>
													<div class="clear"></div>
												</div>
											</td>
										</tr>
										<tr>
											<td width="20%" class="table_grey"><span>*</span>反应问题及诉求：</td>
											<td colspan="4"><textarea id="appeals" name="appeals"></textarea></td>
										</tr>
										<tr>
											<td width="20%" class="table_grey"><span>*</span>初步处理意见：</td>
											<td colspan="4"><textarea id="preliminaryOpinion" name="preliminaryOpinion"></textarea></td>
										</tr>
										<tr>
											<td class="table_grey"><span>*</span>案件负责单位：</td>
											<td colspan="2"><input class="input-block-level" id="processingCompany" name="processingCompany" type="text" placeholder="请输入案件负责单位" maxlength="20" /></td>
											<td class="table_grey"><span>*</span>案件负责人：</td>
											<td colspan="2">
												<select id="processingHead" name="processingHead">
													<option value=""></option>
												</select>
											</td>
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
											<td width="20%" class="table_grey"><span>*</span>被举报人：</td>
											<td width="30%" colspan="2"><input class="input_color" id="reportedName" name="reportedName" type="text" placeholder="请输入被举报人 " maxlength="10" /></td>
											<td width="20%" class="table_grey"><span>*</span>单　　位：</td>
											<td width="30%" colspan="2"><input class="input_color" type="text" id="reportedCompany" name="reportedCompany" placeholder="请输入单位" maxlength="50" /></td>
										</tr>
										<tr>
											<td width="20%" class="table_grey"><span>*</span>职　　务：</td>
											<td width="30%" colspan="2"><input class="input_color" id="reportedDuties" name="reportedDuties" type="text" placeholder="请输入职务" maxlength="30" /></td>
											<td class="table_grey"><span>*</span>级　　别：</td>
											<td colspan="2">
												<select id="reportedLevel" name="reportedLevel">
													<option value=""></option>
													<c:forEach items="${levelList }" var="obj" varStatus="status">
														<option value="${obj.name }">${obj.name }</option>
													</c:forEach>
												</select>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
						<div class="clear"></div>
						<div class="sj_bt_wai">
							<div class="sj_bt">
								<input type="button" class="bt_small bt_green2" value="保&nbsp;&nbsp;&nbsp;存" onclick="save();"/> 
								<input type="button" class="bt_small bt_yellow" value="返&nbsp;&nbsp;&nbsp;回" onclick="javascript:window.location.href='/cm_superior_assign_list'" />
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