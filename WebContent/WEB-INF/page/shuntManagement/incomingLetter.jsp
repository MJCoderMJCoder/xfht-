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

<!-- <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/2.3.2/css/bootstrap.min.css" />
<link rel="stylesheet" href="http://cdn.bootcss.com/font-awesome/4.6.3/css/font-awesome.min.css"/>  -->
<link rel="stylesheet" href="${path}/static/css/comboselect.css"/>
<link rel="stylesheet" href="${path}/static/css/demo.css" />

<title>分流管理</title>
<script type="text/javascript" src="${path}/static/js/jquery-1.11.1.min.js"></script> 
<script type="text/javascript" src="${path}/static/js/jquery.min.js"></script>
<script type="text/javascript" src="${path}/static/js/jquery.SuperSlide.2.1.js"></script>
<script type="text/javascript" src="${path}/static/js/ajaxfileupload.js" ></script>
<script src="${path}/static/js/date.js"></script><!--时间控件js-->

<script type="text/javascript" src="${path}/static/js/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="${path}/static/js/comboselect.min.js" ></script>
<script type="text/javascript" src="${path}/static/js/b.comboselect.js" ></script>

<script type="text/javascript">//内容部分高度自适应
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
      	  	   	  <h1 class="kzt_bt"><span>来访人员信息及反应情况</span></h1>
      	  	   	  <div class="table_eg">
				  <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table_one">
					<tbody>
					  <tr>
						<td width="20%" class="table_grey">信访编号：</td>
						<td width="30%" colspan="2"><input class="input_color" id="informantName" name="informantName" type="text" value="${g.complaintNumber }" readonly="readonly"/></td>
						<td width="20%" class="table_grey">创建日期：</td>
						<td width="30%" colspan="2">&nbsp;&nbsp;&nbsp;<fmt:formatDate value="${g.createTime}" pattern="yyyy-MM-dd hh:mm:ss" type="date"/></td>
					  </tr>
					  <tr>
						<td width="20%" class="table_grey">姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名：</td>
						<td width="30%" colspan="2"><input class="input_color" id="informantName" name="informantName" type="text" value="${g.ext.informantName }" readonly="readonly"/></td>
						<td width="20%" class="table_grey">性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别：</td>
						<td colspan="2">
							<select id="informantSex" name="informantSex" disabled="disabled">
							  	 <option value=""></option>
							  	 <c:forEach items="${genderList}" var="obj">
							         <option value="${obj.value}" <c:if test="${obj.value eq g.ext.informantSex}">selected="selected"</c:if>>${obj.name}</option>
							     </c:forEach>
							 </select>
						</td>
					  </tr>
					  <tr>
						<td class="table_grey" >年&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;龄：</td>
						<td colspan="2"><input class="input_color" id="informantAge" name="informantAge" type="text" value="${g.ext.informantAge }" readonly="readonly"/></td>
						<td class="table_grey" >民&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;族：</td>
						<td colspan="2">
						<select id="informantNation" name="informantNation" disabled="disabled">
						  	<option value=""></option>
						  	<c:forEach items="${nationList }" var="obj" varStatus="status">
						  		<option value="${obj.name }" <c:if test="${obj.name eq g.ext.informantNation}">selected="selected"</c:if>>${obj.name }</option>
						  	</c:forEach>
						 </select>
						</td>
					  </tr>
					  <tr>
						<td class="table_grey" >身份证号：</td>
						<td colspan="2"><input class="input_color" id="informantCardNo" name="informantCardNo" type="text" value="${g.ext.informantCardNo }" readonly="readonly"/></td>
						<td class="table_grey" >文化程度：</td>
						<td colspan="2">
						<select id="informantEducation" name="informantEducation" disabled="disabled">
						  	<option value=""></option>
						  	<c:forEach items="${educationList }" var="obj" varStatus="status">
						  		<option value="${obj.name }" <c:if test="${obj.name eq g.ext.informantEducation}">selected="selected"</c:if>>${obj.name }</option>
						  	</c:forEach>
						 </select>
						</td>
					  </tr>
					  <tr>
						<td class="table_grey" >居住地址：</td>
						<td colspan="2"><input class="input_color" id="informantPlace" name="informantPlace" type="text" value="${g.ext.informantPlace }" readonly="readonly"/></td>
					    <td class="table_grey" >政治面貌：</td>
						<td colspan="2">
						<select id="informantpoliticalFace" name="informantpoliticalFace" disabled="disabled">
						  	<option value=""></option>
						  	<c:forEach items="${politicalFaceList }" var="obj" varStatus="status">
						  		<option value="${obj.name }" <c:if test="${obj.name eq g.ext.informantpoliticalFace}">selected="selected"</c:if>>${obj.name }</option>
						  	</c:forEach>
						</select>
						</td>
				      </tr>
					  <tr>
						<td class="table_grey" >手&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;机：</td>
						<td colspan="2"><input class="input_color" id="informantPhone" name="informantPhone" type="text" value="${g.ext.informantPhone }" readonly="readonly"/></td>
					 	<td class="table_grey" >发信时间：</td>
						<td colspan="2">
							<fmt:formatDate value="${g.ext.letterTime}"  pattern="yyyy-MM-dd hh:mm:ss"/>
						</td>
					 
					  </tr>
					  <tr>
					  	<td width="20%" class="table_grey">所属问题：</td>
						<td colspan="2">
						<select id="matterCategory" name="matterCategory" disabled="disabled">
						  	<option value=""></option>
						  	<c:forEach items="${matterCategoryList }" var="obj" varStatus="status">
						  		<option value="${obj.name }" <c:if test="${obj.name eq g.ext.matterCategory}">selected="selected"</c:if>>${obj.name }</option>
						  	</c:forEach>
						</select>
						</td>
						<td class="table_grey" >来访性质：</td>
						<td colspan="2">
						<select id="matterProperty" name="matterProperty" disabled="disabled">
						  	<option value=""></option>
						  	<c:forEach items="${matterPropertyList }" var="obj" varStatus="status">
						  		<option value="${obj.name }" <c:if test="${obj.name eq g.ext.matterProperty}">selected="selected"</c:if>>${obj.name }</option>
						  	</c:forEach>
						</select>
						</td>
					  </tr>
					  <tr>
						<td class="table_grey" >上访层次：</td>
						<td colspan="2">
						<select id="informantGrade" name="informantGrade" disabled="disabled">
						  	<option value=""></option>
						  	<c:forEach items="${informantGradeList }" var="obj" varStatus="status">
						  		<option value="${obj.name }" <c:if test="${obj.name eq g.ext.informantGrade}">selected="selected"</c:if>>${obj.name }</option>
						  	</c:forEach>
						</select>
						</td>
						<td class="table_grey" >来信举报人数：</td>
						<td colspan="2"><input class="input_color" id="peopleCount" name="peopleCount" type="text" value="${g.peopleCount }" readonly="readonly"/></td>
					  </tr>
					  <tr>
						<td class="table_grey" >来信代表：</td>
						<td colspan="2"><input class="input_color" id="leader" name="leader" type="text" value="${g.leader }" readonly="readonly"/></td>
						<td class="table_grey" >异常行为：</td>
						<td colspan="2"><input class="input_color" id="abnormalBehavior" name="abnormalBehavior" type="text" value="${g.ext.abnormalBehavior }" readonly="readonly"/></td>
					  </tr>
					  <tr>
						  <td class="sj_wz table_grey">处理文档：</td>
						  <td colspan="4">
							<div class="sj_sc table_bordernone">
							  <div class="file_wai">
							  </div>
							  <div id="fileDocName">
								  <c:forEach items="${docList}" var="list" varStatus="status">
								  		<div class="fj fj2"><a href="${list.path }" download="${list.name }">附件${status.count}：${list.name }</a></div>
								  </c:forEach>
							  </div>
							  <div class="clear"></div>
							  </div>
						  </td>
						</tr>
						 <tr>
								  <td class="sj_wz table_grey">处理音频：</td>
								  <td colspan="4">
									<div class="sj_sc table_bordernone">
									  <div class="file_wai">
										</div>
										<div id="fileMediaName">
											  <c:forEach items="${mediaList}" var="list" varStatus="status">
											  		<div class="fj fj2"><a href="${list.path }" download="${list.name }">附件${status.count}：${list.name }</a></div>
											  </c:forEach>
										</div>
									  <div class="clear"></div>
									  </div>
								  </td>
								</tr>
								<tr>
								  <td class="sj_wz table_grey">处理视频：</td>
								  <td colspan="4">
									<div class="sj_sc table_bordernone">
									  <div class="file_wai">
										</div>
									  </div>
									  <div id="fileVideoName">
									  	  <c:forEach items="${videoList}" var="list" varStatus="status">
										  		<div class="fj fj2"><a href="${list.path }" download="${list.name }">附件${status.count}：${list.name }</a></div>
										  </c:forEach>
									  </div>
								  </td>
								</tr>
								<tr>
								  <td class="sj_wz table_grey">处理图片：</td>
								  <td colspan="4">
									<div class="sj_sc table_bordernone">
									  <div class="file_wai">
										</div>
										<div id="fileImageName">
											<c:forEach items="${picList}" var="list" varStatus="status">
										 		<div class="sj_pic">
													<div class="sj_zp"><img src="${list.path }"></div>
													<div class="fj fl"><a href="${list.path }" download="${list.name}">附件${status.count}：${list.name }</a></div>
												</div>
										 	</c:forEach>
										</div>
									  <div class="clear"></div>
									</div>
								  </td>
								</tr>
								<tr>
									<td width="20%" class="table_grey">反应问题及诉求：</td>
									<td colspan="4"><textarea id="appeals" name="appeals" readonly="readonly">${g.appeals }</textarea></td>
								</tr>
								<tr>
									<td width="20%" class="table_grey">初步处理意见：</td>
									<td colspan="4"><textarea id="preliminaryOpinion" name="preliminaryOpinion" readonly="readonly">${g.preliminaryOpinion }</textarea></td>
								</tr>
								<tr>
									<td class="table_grey" >案件负责单位：</td>
									<td colspan="2">&nbsp;&nbsp;${g.ext.processingCompany.name }</td>
									<td class="table_grey" >案件负责人：</td>
									<td colspan="2">&nbsp;&nbsp;${g.ext.processingHead.description }</td>
								</tr>
								
								<tr>
									<td width="20%" class="table_grey">是否为重复信件：</td>
									
									<td colspan="2"><input type="radio" id="repeatLetter" name="repeatLetter" disabled="disabled" class="sex"  <c:if test="${g.ext.repeatLetter==true}">checked </c:if>>是 <input type="radio" id="repeatLetter" name="repeatLetter" disabled="disabled" class="sex" <c:if test="${g.ext.repeatLetter==false}">checked </c:if>>否</td>
									<td class="table_grey" >接待人：</td>
									<td colspan="2"><input class="input_color" id="receptionist" name="receptionist" type="text" value="${g.receptionist }" readonly="readonly"/></td>
								</tr>
								
								
					</tbody>
				   </table>
				</div>
     	  	      <h1 class="kzt_bt"><span>被举报人信息</span></h1>
      	  	   	  <div class="table_eg">
					  <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table_one">
						<tbody>
						  <tr>
							<td width="20%" class="table_grey">被举报人：</td>
							<td width="30%" colspan="2"><input class="input_color" id="reportedName" name="reportedName" type="text" value="${g.ext.reportedName }" readonly="readonly"/></td>
							<td width="20%" class="table_grey">性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别：</td>
							<td width="30%" colspan="2">
							<select id="reportedSex" name="reportedSex" disabled="disabled">
							  	<option value=""></option>
							  	<c:forEach items="${genderList }" var="obj" varStatus="status">
							  		<option value="${obj.value }" <c:if test="${obj.value eq g.ext.reportedSex}">selected="selected"</c:if>>${obj.name }</option>
							  	</c:forEach>
							 </select>
							</td>
						  </tr>
						  <tr>
							<td width="20%" class="table_grey">单&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;位：</td>
							<td colspan="2"><input class="input_color" type="text" id="reportedCompany" name="reportedCompany" value="${g.ext.reportedCompany }" readonly="readonly"/></td>
							<td width="20%" class="table_grey">职&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;务：</td>
							<td width="30%" colspan="2"><input class="input_color" id="reportedDuties" name="reportedDuties" type="text" value="${g.ext.reportedDuties }" readonly="readonly"/></td>
						  </tr>
						  <tr>
							
							<td class="table_grey" >级&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别：</td>
							<td colspan="4">
							<select id="reportedLevel" name="reportedLevel" disabled="disabled">
							  	<option value=""></option>
							  	<c:forEach items="${levelList }" var="obj" varStatus="status">
							  		<option value="${obj.name }" <c:if test="${obj.name eq g.ext.reportedLevel}">selected="selected"</c:if>>${obj.name }</option>
							  	</c:forEach>
							 </select>
							</td>
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
                    <input type="button" class="bt_small bt_yellow" value="返&nbsp;&nbsp;&nbsp;回" onclick="javascript:window.location.href='/cm_shunt_management_list'"/>
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
