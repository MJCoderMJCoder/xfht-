<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>网上信访</title>

<link type="text/css" href="${path}/static/css/style.css" rel="stylesheet" />
<link type="text/css" href="${path}/static/css/public.css" rel="stylesheet" />
<link type="text/css" href="${path}/static/css/other.css" rel="stylesheet" />
<link type="text/css" href="${path}/static/css/tcc.css" rel="stylesheet" />

<script type="text/javascript" src="${path}/static/js/jquery.min.js"></script>
<script type="text/javascript" src="${path}/static/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="${path}/static/js/jquery.SuperSlide.2.1.js"></script>
<script type="text/javascript" src="${path}/static/js/ajaxfileupload.js" ></script>
<script src="${path}/static/js/date.js"></script><!--时间控件js-->

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
			window.location.href="/cm_online_petition_list";	
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
	});

	function save(){
		
		var fileDocPath = $("#fileDocPath").val();
		if(fileDocPath.trim() == ""){
			$("#warningNotice").html("请上传ZIP压缩包不能为空！");
			$(".ts_block").css("display","block");
			return false;
		}
		
		$.ajax({
	        type: "POST",
	        dataType: 'json',
	        url: "cm_online_petition_import",
	        data: $("#addForm").serialize(),
	        traditional: true,
	        dataType: "json",
	        success: function(data){
	        	if(data.status==0) {
	        		$("#sucessNotice").text("保存成功！");
	        		$(".cg_block").css("display","block");
	            }else if(data.status == 1){
	            	$("#warningNotice").text("压缩包解压失败！");
	        		$(".ts_block").css("display","block");
	            }else if(data.status == 2){
	            	$("#warningNotice").text("压缩包内只能有一个EXCEL文件！");
	        		$(".ts_block").css("display","block");
	            }else if(data.status == 3){
	            	$("#warningNotice").text("EXCEL文件格式不正确！");
	        		$(".ts_block").css("display","block");
	            }else if(data.status == 4){
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
	<jsp:include page="../../include/top.jsp"></jsp:include>
	<div class="center">
		<jsp:include page="../../include/public_voice_register_left.jsp"></jsp:include>
		<div class="pubilc_right fl">
			<div class="pubilc_right_cn">
				<form action="cm_visitingRegistration_save" id="addForm" name="addForm" method="post">
					<div class="cfcx">
						<div class="cfcx_2">
							<h1 class="kzt_bt">
								<span>文件上传</span>
							</h1>
							<div class="table_eg">
								<table width="100%" border="0" cellspacing="0" cellpadding="0" class="table_one">
									<tbody>
										<tr>
											<td class="table_grey"><span>*</span>ZIP压缩包上传：</td>
											<td colspan="4">
												<div class="sj_sc table_bordernone">
													<div class="file_wai">
														<div class="upfile">
															<p id="fileName"></p>
															<label for="fileDoc" id="upFile">上　　传</label>
															<input type="file" id="fileDoc" name="fileDoc" style="display: none;" accept="application/zip"/>
														</div>
														<input type="hidden" id="fileDocPath" name="fileDocPath" value="" /> 
														<script>
															//文件上传
															function doc_onchange() {
																$("#fileDoc").on("change",function() {
																	if ($("#fileDoc").val() == "") {
																		return;
																	}
																	$.ajaxFileUpload({
																		url : "cm_online_petition_file_upload",
																		type : "post",
																		secureuri : false, //是否需要安全协议，一般设置为false
																		fileElementId : 'fileDoc', //文件上传域的ID
																		dataType : 'JSON', //返回值类型 一般设置为json
																		success : function(data) {
																			data = JSON.parse(data);
																			if (data.status == 0) {
																				$("#fileName").html(data.fileName);
	
																				$("#fileDocPath").val(data.fileUrl);
	
																				doc_onchange();

																			} else if (data.status == 1) {
																				$("#warningNotice").html("上传压缩包不能为空！");
																				$(".ts_block").css("display","block");
																			} else if (data.status == 2) {
																				$("#warningNotice").html("请上传后缀名为ZIP的压缩包！");
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
													<div class="clear"></div>
												</div>
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
								<input type="button" class="bt_small bt_yellow" value="返&nbsp;&nbsp;&nbsp;回" onclick="javascript:window.location.href='/cm_online_petition_list'" />
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