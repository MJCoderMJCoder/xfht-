<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link type="text/css" href="${path}/static/css/style.css" rel="stylesheet" />
<link type="text/css" href="${path}/static/css/public.css" rel="stylesheet" />
<link type="text/css" href="${path}/static/css/other.css" rel="stylesheet" />
<link type="text/css" href="${path}/static/css/tcc.css" rel="stylesheet" />

<link rel="stylesheet" href="${path}/static/css/comboselect.css"/>
<link rel="stylesheet" href="${path}/static/css/demo.css" />

<title>供应商添加</title>
<script type="text/javascript" src="${path}/static/js/jquery.min.js"></script>
<script type="text/javascript" src="${path}/static/js/jquery-1.11.1.min.js"></script> 
<script type="text/javascript" src="${path}/static/js/jquery.SuperSlide.2.1.js"></script>
<script src="${path}/static/js/date.js"></script><!--时间控件js-->

<script type="text/javascript" src="${path}/static/js/comboselect.min.js" ></script>
<script type="text/javascript" src="${path}/static/js/b.comboselect.js" ></script>
<script type="text/javascript" src="${path}/static/js/ajaxfileupload.js" ></script>

$(function(){
	$(".center").css("height",$(window).height()-170);
});  
var h = (window.innerHeight || (window.document.documentElement.clientHeight || window.document.body.clientHeight));
  $(".center").css({"height":h-170});
  window.onresize = resize;
  function resize(){
    var h = (window.innerHeight || (window.document.documentElement.clientHeight || window.document.body.clientHeight));
    $(".center").css({"height":h-170});
  }
</script>
<script type="text/javascript">
	$(function(){
	$(".subNav").click(function(){
				$(this).toggleClass("currentDd").siblings(".subNav").removeClass("currentDd")
				$(this).toggleClass("currentDt").siblings(".subNav").removeClass("currentDt")
				// 修改数字控制速度， slideUp(500)控制卷起速度
				$(this).next(".navContent").slideToggle(500).siblings(".navContent").slideUp(500);
		})	
	})
</script>
<script type="text/javascript">
$(document).ready(function(){
	doc_onchange();
	media_onchange();
	video_onchange();
	image_onchange();
	$(".close_btn1").click(function(){
		window.location.href="cm_visitingRegistration_list"; 
	});
	$(".close_btn").click(function(){
		$(".jg_block").css("display","none");
	});
});

</script>

<script type="text/javascript">
function save(){
	
	var informantName = $("#informantName").val();
	if(informantName.trim() == ""){
		$("#notice").html("供应商名称不能为空！");
		$(".jg_block").css("display","block");
		return false;
	}
	
	var informantSex = $("#informantSex").val();
	if(informantSex.trim() == ""){
		$("#notice").html("供应商类别不能为空！");
		$(".jg_block").css("display","block");
		return false;
	}
	$.ajax({
        type: "POST",
        dataType: 'json',
        url: "cm_visitingRegistration_save",
        data: $("#addForm").serialize(),
        traditional: true,
        dataType: "json",
        success: function(data){
        	if(data.status==0) {
        		$("#sucessNotice").text("供应商信息保存成功");
        		$(".cg_block").css("display","block");
            }else if(data.status == 1){
            	$("#notice").text("保存失败！");
        		$(".jg_block").css("display","block");
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
      <div class="pubilc_right_cn">
      	  
      	  <form action="cm_visitingRegistration_save" id="addForm" name="addForm" method="post">
      	  <div class="cfcx">
      	  	   <div class="cfcx_2">
      	  	   	  <h1 class="kzt_bt"><span>添加供应商</span></h1>
      	  	   	  <div class="table_eg">
				  <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table_one">
					<tbody>
					  <tr>
						<td width="20%" class="table_grey">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span>*</span>供应商名称：</td>
						<td width="30%" colspan="2"><input class="input_color" id="informantName" name="informantName" type="text" placeholder="请输入姓名" maxlength="10"/></td>
						<td width="20%" class="table_grey">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span>*</span>供应商类别：</td>
						<td colspan="2">
							<select id="informantSex" name="informantSex" >
							  	<option value=""></option>
							  	<c:forEach items="${genderList }" var="obj" varStatus="status">
							  		<option value="${obj }">${obj }</option>
							  	</c:forEach>
							 </select>
						</td>
					  </tr>
					  <!-- 图片上传1 -->
								<tr>
								  <td class="sj_wz table_grey">供应商资质上传：</td>
								  <td colspan="4">
									<div class="sj_sc table_bordernone">
									  <div class="file_wai">
										<div class="upfile">  
										  <p id="fileName4"></p>  
										  <label for="fileImage" id="upFiletj">上&nbsp;&nbsp;&nbsp;传</label>  
										  <input type="file" id="fileImage" name="fileImage" style="display: none;" multiple="multiple" accept="image/*">    
										  </div> 
										  <input type="hidden" id="fileImagePath" name="fileImagePath" value=""/>
             							  <input type="hidden" id="fileImageOriginalName" name="fileImageOriginalName" value=""/> 
										<script>  //文件上传
						                function image_onchange(){
						                	$("#fileImage").on("change",function(){
												if ($("#fileImage").val() == "") {
													return;
												}
												$.ajaxFileUpload({
										            url:"file_upload_image",
										            type:"post",
										            secureuri: false, //是否需要安全协议，一般设置为false
													fileElementId: 'fileImage', //文件上传域的ID
													dataType: 'JSON', //返回值类型 一般设置为json
										            success:function(data){
										            	data = JSON.parse(data);
										            	if (data.status==0) {
										            		var fileNames=data.fileUrl;
										            		var fileDocName="";
										            		var strs=new Array();
										            		strs=fileNames.split(",");
										            		
										            		var origName=data.fileName;
										            		var tempName=new Array();
										            		tempName=origName.split("|");
										            		
										            		for(var i=0;i<strs.length-1;i++){
										            			fileDocName+="<div class=\"sj_pic\"><div class=\"sj_zp\"><img src=\""+strs[i]+"\"></div><div class=\"fj fl\"><p>附件"+[i+1]+"：</p><p>"+tempName[i]+"</p></div></div>";
										            		}
										            		
										            		$("#fileImageName").html(fileDocName);
										            		
										            		$("#fileImagePath").val(data.fileUrl);
										            		$("#fileImageOriginalName").val(data.fileName);
										            		image_onchange();
										            		
										            	} else if (data.status==1) {
										            		alert("上传图片不能为空！");
										            	} else if (data.status==2) {
										            		alert("上传图片不能超过4M！");
										            	} else if (data.status==3) {
										            		alert("请上传后缀名为PNG、JPG、BMP的图片！");
										            	}else if(data.status==4){
										            		alert("上传图片文件过多！");
										            	}
										            },
										            error:function(e){
										            	//请求出错处理
														//alert("系统错误。");
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
								<!-- 处理图片2 -->
								<tr>
								  <td class="sj_wz table_grey">供应商资质上传：</td>
								  <td colspan="4">
									<div class="sj_sc table_bordernone">
									  <div class="file_wai">
										<div class="upfile">  
										  <p id="fileName4"></p>  
										  <label for="fileImage" id="upFiletj">上&nbsp;&nbsp;&nbsp;传</label>  
										  <input type="file" id="fileImage" name="fileImage" style="display: none;" multiple="multiple" accept="image/*">    
										  </div> 
										  <input type="hidden" id="fileImagePath" name="fileImagePath" value=""/>
             							  <input type="hidden" id="fileImageOriginalName" name="fileImageOriginalName" value=""/> 
										<script>  //文件上传
						                function image_onchange(){
						                	$("#fileImage").on("change",function(){
												if ($("#fileImage").val() == "") {
													return;
												}
												$.ajaxFileUpload({
										            url:"file_upload_image",
										            type:"post",
										            secureuri: false, //是否需要安全协议，一般设置为false
													fileElementId: 'fileImage', //文件上传域的ID
													dataType: 'JSON', //返回值类型 一般设置为json
										            success:function(data){
										            	data = JSON.parse(data);
										            	if (data.status==0) {
										            		var fileNames=data.fileUrl;
										            		var fileDocName="";
										            		var strs=new Array();
										            		strs=fileNames.split(",");
										            		
										            		var origName=data.fileName;
										            		var tempName=new Array();
										            		tempName=origName.split("|");
										            		
										            		for(var i=0;i<strs.length-1;i++){
										            			fileDocName+="<div class=\"sj_pic\"><div class=\"sj_zp\"><img src=\""+strs[i]+"\"></div><div class=\"fj fl\"><p>附件"+[i+1]+"：</p><p>"+tempName[i]+"</p></div></div>";
										            		}
										            		
										            		$("#fileImageName").html(fileDocName);
										            		
										            		$("#fileImagePath").val(data.fileUrl);
										            		$("#fileImageOriginalName").val(data.fileName);
										            		image_onchange();
										            		
										            	} else if (data.status==1) {
										            		alert("上传图片不能为空！");
										            	} else if (data.status==2) {
										            		alert("上传图片不能超过4M！");
										            	} else if (data.status==3) {
										            		alert("请上传后缀名为PNG、JPG、BMP的图片！");
										            	}else if(data.status==4){
										            		alert("上传图片文件过多！");
										            	}
										            },
										            error:function(e){
										            	//请求出错处理
														//alert("系统错误。");
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
								 <!-- 图片上传3 -->
								<tr>
								  <td class="sj_wz table_grey">供应商资质上传：</td>
								  <td colspan="4">
									<div class="sj_sc table_bordernone">
									  <div class="file_wai">
										<div class="upfile">  
										  <p id="fileName4"></p>  
										  <label for="fileImage" id="upFiletj">上&nbsp;&nbsp;&nbsp;传</label>  
										  <input type="file" id="fileImage" name="fileImage" style="display: none;" multiple="multiple" accept="image/*">    
										  </div> 
										  <input type="hidden" id="fileImagePath" name="fileImagePath" value=""/>
             							  <input type="hidden" id="fileImageOriginalName" name="fileImageOriginalName" value=""/> 
										<script>  //文件上传
						                function image_onchange(){
						                	$("#fileImage").on("change",function(){
												if ($("#fileImage").val() == "") {
													return;
												}
												$.ajaxFileUpload({
										            url:"file_upload_image",
										            type:"post",
										            secureuri: false, //是否需要安全协议，一般设置为false
													fileElementId: 'fileImage', //文件上传域的ID
													dataType: 'JSON', //返回值类型 一般设置为json
										            success:function(data){
										            	data = JSON.parse(data);
										            	if (data.status==0) {
										            		var fileNames=data.fileUrl;
										            		var fileDocName="";
										            		var strs=new Array();
										            		strs=fileNames.split(",");
										            		
										            		var origName=data.fileName;
										            		var tempName=new Array();
										            		tempName=origName.split("|");
										            		
										            		for(var i=0;i<strs.length-1;i++){
										            			fileDocName+="<div class=\"sj_pic\"><div class=\"sj_zp\"><img src=\""+strs[i]+"\"></div><div class=\"fj fl\"><p>附件"+[i+1]+"：</p><p>"+tempName[i]+"</p></div></div>";
										            		}
										            		
										            		$("#fileImageName").html(fileDocName);
										            		
										            		$("#fileImagePath").val(data.fileUrl);
										            		$("#fileImageOriginalName").val(data.fileName);
										            		image_onchange();
										            		
										            	} else if (data.status==1) {
										            		alert("上传图片不能为空！");
										            	} else if (data.status==2) {
										            		alert("上传图片不能超过4M！");
										            	} else if (data.status==3) {
										            		alert("请上传后缀名为PNG、JPG、BMP的图片！");
										            	}else if(data.status==4){
										            		alert("上传图片文件过多！");
										            	}
										            },
										            error:function(e){
										            	//请求出错处理
														//alert("系统错误。");
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
								 <!-- 图片上传4 -->
								<tr>
								  <td class="sj_wz table_grey">供应商资质上传：</td>
								  <td colspan="4">
									<div class="sj_sc table_bordernone">
									  <div class="file_wai">
										<div class="upfile">  
										  <p id="fileName4"></p>  
										  <label for="fileImage" id="upFiletj">上&nbsp;&nbsp;&nbsp;传</label>  
										  <input type="file" id="fileImage" name="fileImage" style="display: none;" multiple="multiple" accept="image/*">    
										  </div> 
										  <input type="hidden" id="fileImagePath" name="fileImagePath" value=""/>
             							  <input type="hidden" id="fileImageOriginalName" name="fileImageOriginalName" value=""/> 
										<script>  //文件上传
						                function image_onchange(){
						                	$("#fileImage").on("change",function(){
												if ($("#fileImage").val() == "") {
													return;
												}
												$.ajaxFileUpload({
										            url:"file_upload_image",
										            type:"post",
										            secureuri: false, //是否需要安全协议，一般设置为false
													fileElementId: 'fileImage', //文件上传域的ID
													dataType: 'JSON', //返回值类型 一般设置为json
										            success:function(data){
										            	data = JSON.parse(data);
										            	if (data.status==0) {
										            		var fileNames=data.fileUrl;
										            		var fileDocName="";
										            		var strs=new Array();
										            		strs=fileNames.split(",");
										            		
										            		var origName=data.fileName;
										            		var tempName=new Array();
										            		tempName=origName.split("|");
										            		
										            		for(var i=0;i<strs.length-1;i++){
										            			fileDocName+="<div class=\"sj_pic\"><div class=\"sj_zp\"><img src=\""+strs[i]+"\"></div><div class=\"fj fl\"><p>附件"+[i+1]+"：</p><p>"+tempName[i]+"</p></div></div>";
										            		}
										            		
										            		$("#fileImageName").html(fileDocName);
										            		
										            		$("#fileImagePath").val(data.fileUrl);
										            		$("#fileImageOriginalName").val(data.fileName);
										            		image_onchange();
										            		
										            	} else if (data.status==1) {
										            		alert("上传图片不能为空！");
										            	} else if (data.status==2) {
										            		alert("上传图片不能超过4M！");
										            	} else if (data.status==3) {
										            		alert("请上传后缀名为PNG、JPG、BMP的图片！");
										            	}else if(data.status==4){
										            		alert("上传图片文件过多！");
										            	}
										            },
										            error:function(e){
										            	//请求出错处理
														//alert("系统错误。");
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
								 <!-- 图片上传5-->
								<tr>
								  <td class="sj_wz table_grey">供应商资质上传：</td>
								  <td colspan="4">
									<div class="sj_sc table_bordernone">
									  <div class="file_wai">
										<div class="upfile">  
										  <p id="fileName4"></p>  
										  <label for="fileImage" id="upFiletj">上&nbsp;&nbsp;&nbsp;传</label>  
										  <input type="file" id="fileImage" name="fileImage" style="display: none;" multiple="multiple" accept="image/*">    
										  </div> 
										  <input type="hidden" id="fileImagePath" name="fileImagePath" value=""/>
             							  <input type="hidden" id="fileImageOriginalName" name="fileImageOriginalName" value=""/> 
										<script>  //文件上传
						                function image_onchange(){
						                	$("#fileImage").on("change",function(){
												if ($("#fileImage").val() == "") {
													return;
												}
												$.ajaxFileUpload({
										            url:"file_upload_image",
										            type:"post",
										            secureuri: false, //是否需要安全协议，一般设置为false
													fileElementId: 'fileImage', //文件上传域的ID
													dataType: 'JSON', //返回值类型 一般设置为json
										            success:function(data){
										            	data = JSON.parse(data);
										            	if (data.status==0) {
										            		var fileNames=data.fileUrl;
										            		var fileDocName="";
										            		var strs=new Array();
										            		strs=fileNames.split(",");
										            		
										            		var origName=data.fileName;
										            		var tempName=new Array();
										            		tempName=origName.split("|");
										            		
										            		for(var i=0;i<strs.length-1;i++){
										            			fileDocName+="<div class=\"sj_pic\"><div class=\"sj_zp\"><img src=\""+strs[i]+"\"></div><div class=\"fj fl\"><p>附件"+[i+1]+"：</p><p>"+tempName[i]+"</p></div></div>";
										            		}
										            		
										            		$("#fileImageName").html(fileDocName);
										            		
										            		$("#fileImagePath").val(data.fileUrl);
										            		$("#fileImageOriginalName").val(data.fileName);
										            		image_onchange();
										            		
										            	} else if (data.status==1) {
										            		alert("上传图片不能为空！");
										            	} else if (data.status==2) {
										            		alert("上传图片不能超过4M！");
										            	} else if (data.status==3) {
										            		alert("请上传后缀名为PNG、JPG、BMP的图片！");
										            	}else if(data.status==4){
										            		alert("上传图片文件过多！");
										            	}
										            },
										            error:function(e){
										            	//请求出错处理
														//alert("系统错误。");
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
								 <!-- 图片上传6 -->
								<tr>
								  <td class="sj_wz table_grey">供应商资质上传：</td>
								  <td colspan="4">
									<div class="sj_sc table_bordernone">
									  <div class="file_wai">
										<div class="upfile">  
										  <p id="fileName4"></p>  
										  <label for="fileImage" id="upFiletj">上&nbsp;&nbsp;&nbsp;传</label>  
										  <input type="file" id="fileImage" name="fileImage" style="display: none;" multiple="multiple" accept="image/*">    
										  </div> 
										  <input type="hidden" id="fileImagePath" name="fileImagePath" value=""/>
             							  <input type="hidden" id="fileImageOriginalName" name="fileImageOriginalName" value=""/> 
										<script>  //文件上传
						                function image_onchange(){
						                	$("#fileImage").on("change",function(){
												if ($("#fileImage").val() == "") {
													return;
												}
												$.ajaxFileUpload({
										            url:"file_upload_image",
										            type:"post",
										            secureuri: false, //是否需要安全协议，一般设置为false
													fileElementId: 'fileImage', //文件上传域的ID
													dataType: 'JSON', //返回值类型 一般设置为json
										            success:function(data){
										            	data = JSON.parse(data);
										            	if (data.status==0) {
										            		var fileNames=data.fileUrl;
										            		var fileDocName="";
										            		var strs=new Array();
										            		strs=fileNames.split(",");
										            		
										            		var origName=data.fileName;
										            		var tempName=new Array();
										            		tempName=origName.split("|");
										            		
										            		for(var i=0;i<strs.length-1;i++){
										            			fileDocName+="<div class=\"sj_pic\"><div class=\"sj_zp\"><img src=\""+strs[i]+"\"></div><div class=\"fj fl\"><p>附件"+[i+1]+"：</p><p>"+tempName[i]+"</p></div></div>";
										            		}
										            		
										            		$("#fileImageName").html(fileDocName);
										            		
										            		$("#fileImagePath").val(data.fileUrl);
										            		$("#fileImageOriginalName").val(data.fileName);
										            		image_onchange();
										            		
										            	} else if (data.status==1) {
										            		alert("上传图片不能为空！");
										            	} else if (data.status==2) {
										            		alert("上传图片不能超过4M！");
										            	} else if (data.status==3) {
										            		alert("请上传后缀名为PNG、JPG、BMP的图片！");
										            	}else if(data.status==4){
										            		alert("上传图片文件过多！");
										            	}
										            },
										            error:function(e){
										            	//请求出错处理
														//alert("系统错误。");
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
				</div>
      	  	   </div>
      	  	   <div class="clear"></div>
      	  	   <div class="sj_bt_wai">
                  <div class="sj_bt">
                    <input type="button" class="bt_small bt_green2" value="保&nbsp;&nbsp;&nbsp;存" onclick="save();">
                    <input type="button" class="bt_small bt_yellow" value="返&nbsp;&nbsp;&nbsp;回" onclick="javascript:window.location.href='/cm_visitingRegistration_list'"/>
                  </div>
                </div>
      	  </div>
		</form>
      </div>
</div>
</div>
<!--成功弹出 START-->
<div class="bg_block cg_block" style="display: none;">
  <div class="t_tcc">
	<div class="tcc_w">
	  <div class="ts_img"><img src="${path}/static/images/tc_cg.png" alt=""/></div>
	  <div class="ts_txt">保存成功！<br /><span id="sucessNotice" name="sucessNotice"></span></div>
	  <div class="tc_btn"><input type="button" class="close_btn1" value="关闭" /></div>
	</div>
  </div>
</div>
<!--成功弹出 END-->
<!--警告弹出 START-->
<div class="bg_block jg_block" style="display: none;">
  <div class="t_tcc">
	<div class="tcc_w">
	  <div class="ts_img"><img src="${path}/static/images/tc_jg.png" alt=""/></div>
	  <div class="ts_txt" id="notice"></div>
	  <div class="tc_btn"><input type="button" class="close_btn" value="关闭" /></div>

	</div>
  </div>
</div>
<!--警告弹出 END-->
</body>
</html>
