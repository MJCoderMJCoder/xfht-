<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>事件处理</title>

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
<script type="text/javascript" src="${path}/static/js/ajaxfileupload.js"></script>

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
			window.location.href="/cm_event_handling_list";	
		});
		//提示弹出层
		$(".close_tc_ts_btn").click(function(){
			$(".ts_block").css("display","none");
		});
	});
	$(document).ready(function(){
		doc_onchange();
		media_onchange();
		video_onchange();
		image_onchange();
	});
	$(function(){
		$('#processingCompany').bComboSelect({
			pageSize:'10',//每页显示条数
			keyField:'id',//值字段
			showField:'name',//显示属性的名称
			data:'/cm_event_handling_processingCompany',
			callback : function(data){
				$.ajax({
			        type: "POST",
			        dataType: 'json',
			        url: "cm_event_handling_getUserByOrganizational",
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
		$("#tr3").hide(); 
		$("#tr4").hide();
		$("#tr5").hide(); 
		$("#tr6").hide();
		$("#tr7").hide(); 
		$("#tr8").hide();
		$("#status").change(function() {
			var status = $("#status").val();
			if (status == "5" || status == "7" || status == "8") {
				$("#tr1").show();
				$("#tr2").hide();
				$("#tr3").hide(); 
				$("#tr4").hide();
				$("#tr5").hide(); 
				$("#tr6").hide();
				$("#tr7").hide(); 
				$("#tr8").hide();
			} else if (status == "6") {
				$("#tr1").show();
				$("#tr2").show();
				$("#tr3").show();
				$("#tr4").show();
				$("#tr5").hide(); 
				$("#tr6").hide();
				$("#tr7").hide(); 
				$("#tr8").hide();
			} else if (status == "10") {
				$("#tr1").show();
				$("#tr2").show();
				$("#tr3").show();
				$("#tr4").hide();
				$("#tr5").show(); 
				$("#tr6").show();
				$("#tr7").show(); 
				$("#tr8").show();
			} else if (status == "9") {
				$("#td1").html("<p>领导批复文件照片上传：</p><span>*</span>");
				$("#tr1").show();
				$("#tr2").hide();
				$("#tr3").hide(); 
				$("#tr4").hide();
				$("#tr5").hide();
				$("#tr6").hide();
				$("#tr7").hide();
				$("#tr8").show();
			} else {
				$("#tr1").hide(); 
				$("#tr2").hide();
				$("#tr3").hide(); 
				$("#tr4").hide();
				$("#tr5").hide(); 
				$("#tr6").hide();
				$("#tr7").hide(); 
				$("#tr8").hide();
			}
		})
	})
	function save(){
		
		var status = $("#status").val();
		if(status.trim() == ""){
			$("#warningNotice").html("处理意见不能为空！");
			$(".ts_block").css("display","block");
			return false;
		}
		
		var reason = $("#reason").val();
		if(reason.trim() == ""){
			$("#warningNotice").html("原因不能为空！");
			$(".ts_block").css("display","block");
			return false;
		}
		
		if (status == "6") {
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
		} else if (status == "10") {
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
		} else if (status == "9") {
			var fileImagePath = $("#fileImagePath").val();
			if(fileImagePath.trim() == ""){
				$("#warningNotice").html("领导批复文件照片不能为空！");
				$(".ts_block").css("display","block");
				return false;
			}
		}
		
		$.ajax({
	        type: "POST",
	        dataType: 'json',
	        url: "cm_event_handling_save",
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
					<input type="hidden" id="guestbookId" name="guestbookId" value="${guestbook.id}"/>
					<div class="cfcx">
						<div class="cfcx_2">
							<h1 class="kzt_bt">
								<span>事件处理</span>
							</h1>
							<div id="tab_sj-content1" class="block">
								<table width="0" border="0" cellspacing="0" cellpadding="0" class="shijian">
									<tbody>
										<tr>
											<td class="sj_wz"><p>处理意见：</p><span>*</span></td>
											<td>
												<select id="status" name="status">
													<option value=""></option>
													<option value="5">不予受理/不再受理</option>
													<option value="6">转办/交办</option>
													<option value="7">上报</option>
													<option value="8">口头回复/书面回复</option>
													<option value="10">处理中</option>
													<option value="9">办结归档</option>
												</select>
											</td>
										</tr>
										<tr id="tr1">
											<td class="sj_wz"><p>处理意见：</p><span>*</span></td>
											<td><textarea id="reason" name="reason"></textarea></td>
										</tr>
										<tr id="tr2">
											<td class="sj_wz"><p>案件负责单位：</p><span>*</span></td>
											<td colspan="2"><input class="input-block-level" id="processingCompany" name="processingCompany" data-init="${guestbook.ext.processingCompany.id}" type="text" placeholder="请输入案件负责单位" maxlength="20" style="width:473px"/></td>
										</tr>
										<tr id="tr3">
											<td class="sj_wz"><p>案件负责人：</p><span>*</span></td>
											<td colspan="2">
												<select id="processingHead" name="processingHead">
													<option value=""></option>
													<c:forEach items="${userList}" var="list" varStatus="status">
														<option value="${list.id}" ${guestbook.ext.processingHead.id==list.id?'selected':''}>${list.description}</option>
													</c:forEach>
												</select>
											</td>
										</tr>
										<tr id="tr4">
											<td width="20%" class="sj_wz"><p>处理截止日期：</p><span>*</span></td>
											<td width="30%" colspan="5"><input onclick="SetDate(this,'yyyy-MM-dd hh:mm:ss')" placeholder="请输入处理截止日期" class="select_time" id="endTime" name="endTime"/></td>
										</tr>
										<tr id="tr5">
											<td class="sj_wz"><p>处理文档上传：</p></td>
											<td colspan="4">
												<div class="sj_sc table_bordernone">
													<div class="file_wai">
														<div class="upfile">
															<p id="fileName" style="width:251px"></p>
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
										<tr id="tr6">
											<td class="sj_wz"><p>处理音频上传：</p></td>
											<td colspan="4">
												<div class="sj_sc table_bordernone">
													<div class="file_wai">
														<div class="upfile">
															<p id="fileName2" style="width:251px"></p>
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
										<tr id="tr7">
											<td class="sj_wz"><p>处理视频上传：</p></td>
											<td colspan="4">
												<div class="sj_sc table_bordernone">
													<div class="file_wai">
														<div class="upfile">
															<p id="fileName3" style="width:251px"></p>
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
										<tr id="tr8">
											<td id="td1" class="sj_wz"><p>处理图片上传：</p></td>
											<td colspan="4">
												<div class="sj_sc table_bordernone">
													<div class="file_wai">
														<div class="upfile">
															<p id="fileName4" style="width:251px"></p>
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
									</tbody>
								</table>
								<div class="sj_bt_wai">
									<div class="sj_bt">
										<input type="button" class="bt_small bt_green2" value="保&nbsp;&nbsp;&nbsp;存" onclick="save();"/>
										<input type="button" class="bt_small bt_yellow" value="返&nbsp;&nbsp;&nbsp;回" onclick="javascript:window.location.href='/cm_event_handling_list'"/>
									</div>
								</div>
							</div>
						</div>
						<div class="clear"></div>
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