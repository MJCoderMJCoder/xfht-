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
<title>事件处理</title>
<script type="text/javascript" src="${path}/static/js/jquery-1.11.1.min.js"></script> 
<script type="text/javascript" src="${path}/static/js/jquery.min.js"></script>
<script type="text/javascript" src="${path}/static/js/jquery.SuperSlide.2.1.js"></script>
<script type="text/javascript" src="${path}/static/js/ajaxfileupload.js" ></script>
<script src="${path}/static/js/date.js"></script><!--时间控件js-->

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
</head>
<body>
	
	<jsp:include page="../include/top.jsp"></jsp:include>
	
<div class="center">

<jsp:include page="../include/handle_left.jsp"></jsp:include>

<div class="pubilc_right fl">
      <div class="pubilc_right_cn">
      	  
      	  <div class="cfcx">
      	  	   <div class="cfcx_2">
      	  	   	  <h1 class="kzt_bt"><span>来访人员信息及反应情况</span></h1>
      	  	   	  <div class="table_eg">
				  <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table_one">
					<tbody>
					  <tr>
						<td width="20%" class="table_grey"><span>*</span>姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名：</td>
						<td width="30%" colspan="2"><input class="input_color" id="informantName" name="informantName" type="text" value="${g.ext.informantName }" readonly="readonly"/></td>
						<td width="20%" class="table_grey"><span>*</span>性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别：</td>
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
						<td class="table_grey" ><span>*</span>年&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;龄：</td>
						<td colspan="2"><input class="input_color" id="informantAge" name="informantAge" type="text" value="${g.ext.informantAge }" readonly="readonly"/></td>
						<td class="table_grey" ><span>*</span>民&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;族：</td>
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
						<td class="table_grey" ><span>*</span>身份证号：</td>
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
						<td class="table_grey" ><span>*</span>居住地址：</td>
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
						<td colspan="4"><input class="input_color" id="informantPhone" name="informantPhone" type="text" value="${g.ext.informantPhone }" readonly="readonly"/></td>
					  </tr>
					  <tr>
					  	<td width="20%" class="table_grey"><span>*</span>所属问题：</td>
						<td colspan="2">
						<select id="matterCategory" name="matterCategory" disabled="disabled">
						  	<option value=""></option>
						  	<c:forEach items="${matterCategoryList }" var="obj" varStatus="status">
						  		<option value="${obj.name }" <c:if test="${obj.name eq g.ext.matterCategory}">selected="selected"</c:if>>${obj.name }</option>
						  	</c:forEach>
						</select>
						</td>
						<td class="table_grey" ><span>*</span>来访性质：</td>
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
						<td class="table_grey" ><span>*</span>上访层次：</td>
						<td colspan="2">
						<select id="informantGrade" name="informantGrade" disabled="disabled">
						  	<option value=""></option>
						  	<c:forEach items="${informantGradeList }" var="obj" varStatus="status">
						  		<option value="${obj.name }" <c:if test="${obj.name eq g.ext.informantGrade}">selected="selected"</c:if>>${obj.name }</option>
						  	</c:forEach>
						</select>
						</td>
						<td class="table_grey" >来访人数：</td>
						<td colspan="2"><input class="input_color" id="peopleCount" name="peopleCount" type="text" value="${g.peopleCount }" readonly="readonly"/></td>
					  </tr>
					  <tr>
						<td class="table_grey" >来访代表：</td>
						<td colspan="2"><input class="input_color" id="leader" name="leader" type="text" value="${g.leader }" readonly="readonly"/></td>
						<td class="table_grey" >异常行为：</td>
						<td colspan="2"><input class="input_color" id="abnormalBehavior" name="abnormalBehavior" type="text" value="${g.ext.abnormalBehavior }" readonly="readonly"/></td>
					  </tr>
					  <tr>
							<td class="sj_wz table_grey">文档附件：</td>
							<td colspan="4">
								<div id="fileDocName">
									<c:forEach items="${guestbook.attachments}" var="list">
										<c:if test="${list.type==1 || list.type==5}"><p><a href="${list.path}" download="${list.name}">${list.name}</a></p></c:if>
									</c:forEach>
								</div>
							</td>
						</tr>
						<tr>
							<td class="sj_wz table_grey">音频附件：</td>
							<td colspan="4">
								<div id="fileMediaName">
									<c:forEach items="${guestbook.attachments}" var="list">
										<c:if test="${list.type==2 || list.type==6}"><p><a href="${list.path}" download="${list.name}">${list.name}</a></p></c:if>
									</c:forEach>
								</div>
							</td>
						</tr>
						<tr>
							<td class="sj_wz table_grey">视频附件：</td>
							<td colspan="4">
								<div id="fileVideoName">
									<c:forEach items="${guestbook.attachments}" var="list">
										<c:if test="${list.type==3 || list.type==7}"><p><a href="${list.path}" download="${list.name}">${list.name}</a></p></c:if>
									</c:forEach>
								</div>
							</td>
						</tr>
						<tr>
							<td class="sj_wz table_grey">图片附件：</td>
							<td colspan="4">
								<div id="fileImageName">
									<c:forEach items="${guestbook.attachments}" var="list">
										<c:if test="${list.type==4 || list.type==8}"><p><a href="${list.path}" download="${list.name}">${list.name}</a></p></c:if>
									</c:forEach>
								</div>
							</td>
						</tr>
						<tr>
							<td class="sj_wz table_grey">领导批复文件照片：</td>
							<td colspan="4">
								<div id="fileImageName">
									<c:forEach items="${guestbook.attachments}" var="list">
										<c:if test="${list.type==12}"><p><a href="${list.path}" download="${list.name}">${list.name}</a></p></c:if>
									</c:forEach>
								</div>
							</td>
						</tr>
								<tr>
									<td width="20%" class="table_grey"><span>*</span>反应问题及诉求：</td>
									<td colspan="4"><textarea id="appeals" name="appeals" readonly="readonly">${g.appeals }</textarea></td>
								</tr>
								<tr>
									<td width="20%" class="table_grey"><span>*</span>初步处理意见：</td>
									<td colspan="4"><textarea id="preliminaryOpinion" name="preliminaryOpinion" readonly="readonly">${g.preliminaryOpinion }</textarea></td>
								</tr>
								<tr>
									<td class="table_grey" >案件负责单位：</td>
									<td colspan="2">&nbsp;&nbsp;${g.ext.processingCompany.name }</td>
									<td class="table_grey" >案件负责人：</td>
									<td colspan="2">&nbsp;&nbsp;${g.ext.processingHead.description }</td>
								</tr>
								
								<tr>
									<td width="20%" class="table_grey"><span>*</span>是否满意：</td>
									<td colspan="2"><input type="radio" id="satisfied" name="satisfied" disabled="disabled" class="sex"  <c:if test="${g.satisfied==true}">checked </c:if>> 满意 <input type="radio" id="satisfied" name="satisfied" disabled="disabled" class="sex" <c:if test="${g.satisfied==false}">checked </c:if>>不满意</td>
									<td class="table_grey" ><span>*</span>接待人：</td>
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
							<td width="20%" class="table_grey"><span>*</span>被举报人：</td>
							<td width="30%" colspan="2"><input class="input_color" id="reportedName" name="reportedName" type="text" value="${g.ext.reportedName }" readonly="readonly"/></td>
							<td width="20%" class="table_grey"><span>*</span>性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别：</td>
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
							<td width="20%" class="table_grey"><span>*</span>单&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;位：</td>
							<td colspan="2"><input class="input_color" type="text" id="reportedCompany" name="reportedCompany" value="${g.ext.reportedCompany }" readonly="readonly"/></td>
							<td width="20%" class="table_grey"><span>*</span>职&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;务：</td>
							<td width="30%" colspan="2"><input class="input_color" id="reportedDuties" name="reportedDuties" type="text" value="${g.ext.reportedDuties }" readonly="readonly"/></td>
						  </tr>
						  <tr>
							
							<td class="table_grey" ><span>*</span>级&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别：</td>
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
      	  	   </div>
      	  	   <div class="clear"></div>
      	  	   <div class="sj_bt_wai">
                  <div class="sj_bt">
                    <input type="button" class="bt_small bt_yellow" value="返&nbsp;&nbsp;&nbsp;回" onclick="javascript:window.location.href='/cm_event_handling_list'"/>
                  </div>
                </div>
      	  </div>
      </div>
</div>
</div>
</body>
</html>
