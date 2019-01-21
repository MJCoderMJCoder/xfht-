<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link type="text/css" href="${path}/static/css/style.css" rel="stylesheet"/>
<link type="text/css" href="${path}/static/css/public.css" rel="stylesheet"/>
<link type="text/css" href="${path}/static/css/other.css" rel="stylesheet"/>
<title>信访查看-智能信访数据处理平台</title>
<script type="text/javascript" src="${path}/static/js/jquery.min.js"></script>
<script type="text/javascript" src="${path}/static/js/jquery.SuperSlide.2.1.js"></script>
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
  <jsp:include page="../include/system_left.jsp"></jsp:include>
<div class="pubilc_right fl">
      <div class="pubilc_right_cn">
     
      
      	  <div class="cfcx">
      	  	   <div class="cfcx_2">
      	  	   	  <h1 class="kzt_bt"><span>来访人员信息及反应情况</span></h1>
      	  	   	   <!-- 关联列表 -->
      <c:if test="${count==1 }">
      <div class="ppg_table table_eg">
      	  	   <table id="Table" class="table_bg">
      	  	   	   <tbody>
      	  	   	   	   <tr>
     	  	   	   	   	  <th width="40"></th>
      	  	   	   	   	  <th>序号</th>
      	  	   	   	   	  <th>信访人</th>
      	  	   	   	   	  <th>案件编号</th>
      	  	   	   	   	  <th>来访类型</th> 
      	  	   	   	   	  <th>案件类型</th> 
      	  	   	   	   	  <th>上访时间</th> 
      	  	   	   	   	  <th>案件状态</th> 
      	  	   	   	   	  <th>操作</th>
      	  	   	   	   </tr>
      	  	   	   	    <c:forEach items="${casedls }" var="list" varStatus="status">  
      	  	   	   	   <tr>
     	  	   	   	   	  <td><input type="checkbox" name="kzt_xz"/></td>
     	  	   	   	   	  <td>${status.count} </td>
      	  	   	   	   	  <td>${list.receptionist} </td>
      	  	   	   	   	  <td>${list.complaintNumber} </td>
      	  	   	   	   	  <td>
							<!--1、网上信访2、来访登记3、来信登记4、上级交办 	 -->
      	  	   	   	   	  <c:choose>
      	  	   	   	   	  <c:when test="${list.ctgId =='1'}">
      	  	   	   	   	 	 网上信访
      	  	   	   	   	  </c:when>
      	  	   	   	   	   <c:when test="${list.ctgId =='2'}">
      	  	   	   	   	  	来访登记
      	  	   	   	   	  </c:when>
      	  	   	   	   	   <c:when test="${list.ctgId =='3'}">
      	  	   	   	   	  	来信登记
      	  	   	   	   	  </c:when>
      	  	   	   	   	   <c:when test="${list.ctgId =='4'}">
      	  	   	   	   	  	上级交办
      	  	   	   	   	  </c:when>
      	  	   	   	   	  </c:choose>
      	  	   	   	   	   </td>
      	  	   	   	   	  <td>${list.getId()} </td>
      	  	   	   	   	  <td>${list.createTime} </td> 
      	  	   	   	   	  <td>${list.getId()} </td>
      	  	   	   	   	  <td>
      	  	   	   	   	  <a href="cm_see_${list.getId()}"  class="help_xg">查看</a>  
      	  	   	   	   	  </td>
      	  	   	   	   </tr>
                    </c:forEach>   
      	  	   	   </tbody>
      	  	   </table>
      	  </div> 
      </c:if>
      <!-- 关联列表 -->
      	  	   	  <div class="table_eg">
				  <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table_one">
					<tbody>
					  <tr>
						<td width="20%" class="table_grey"><span>*</span>姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名：</td>
						<td width="30%" colspan="2">${ext.informantName }</td>
						<td width="20%" class="table_grey"><span>*</span>性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别：</td>
						<td colspan="2">  
						<c:if test="${ext.informantSex == 1 }">
						男
						</c:if>
						<c:if test="${ext.informantSex == 0 }">
						女
						</c:if> 
						   </td><!--单选框-->
					  </tr>
					  <tr>
						<td class="table_grey" ><span>*</span>年&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;龄：</td>
						<td colspan="2">${ext.informantAge } </td>
						<td class="table_grey" ><span>*</span>民&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;族：</td>
						<td colspan="2"> ${ext.informantNation }</td><!--下拉列表-->
					  </tr>
					  <tr>
						<td class="table_grey" ><span>*</span>身份证号：</td>
						<td colspan="2">${ext.informantCardNo }</td>
						<td class="table_grey" >文化程度：</td>
						<td colspan="2">${ext.informantEducation }</td><!--下拉列表-->
					  </tr>
					  <tr>
						<td class="table_grey" ><span>*</span>居住地址：</td>
						<td colspan="2">${ext.informantPlace }</td>
					    <td class="table_grey" >政治面貌：</td>
						<td colspan="2">${ext.informantpoliticalFace }</td><!--下拉列表-->
				      </tr>
					  <tr>
						<td class="table_grey" >手&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;机：</td>
						<td colspan="2">${ext.informantPhone }</td>
					  	<td class="table_grey" ><span>*</span>负责单位：</td>
						<td colspan="2">${ext.processingCompany }</td>
					  </tr>
					  <tr>
						<td class="table_grey" ><span>*</span>负责人：</td>
						<td colspan="2">${ext.processingHead }</td>
						<td class="table_grey" ><span>*</span>来访性质：</td>
						<td colspan="2">${ext.matterProperty }</td><!--下拉列表-->
					  </tr>
					  <tr>
						<td class="table_grey" ><span>*</span>上访层次：</td>
						<td colspan="2">${ext.informantGrade } </td><!--下拉列表-->
						<td class="table_grey" >来访人数：</td>  
						<td colspan="2">${temp.peopleCount }</td>
					  </tr>
					  <tr>
						<td class="table_grey" >来访代表：</td>
						<td colspan="2">${temp.leader }</td>
						<!-- <td class="table_grey" >异常行为：</td>
						<td colspan="2"></td> -->
					  </tr>
					  <tr>
						<td width="20%" class="table_grey">所属问题：</td>
						<td colspan="4">${ext.matterCategory }  </td><!--下拉列表-->
					  </tr>
					  <!-- 附件开始 -->
					 
					  
					  <tr>
						  <td class="sj_wz table_grey">处理文档上传：</td>
						  <td colspan="4">
							<div class="sj_sc table_bordernone">
							<c:forEach items="${listwd }" var="wd" varStatus="status">
							  <div class="fj fj2"><p>附件${status.count }：</p><p>${wd.name }</p><a href="${wd.path}" class="sj_ai">查看</a></div>
							  </c:forEach>
							  <div class="clear"></div>
							  </div>
						  </td>
						</tr>
						 <tr>
								  <td class="sj_wz table_grey">处理音频上传：</td>
								  <td colspan="4">
									<div class="sj_sc table_bordernone"> 
										<c:forEach items="${listyp }" var="yp" varStatus="status">
							  <div class="fj fj2"><p>附件${status.count }：</p><p>${yp.name }</p><a href="${yp.path}" class="sj_ai">查看</a></div>
							  </c:forEach>
									  <div class="clear"></div>
									  </div>
								  </td>
								</tr>
								<tr>
								  <td class="sj_wz table_grey">处理视频上传：</td>
								  <td colspan="4">
									<div class="sj_sc table_bordernone"> 
									<c:forEach items="${listsp }" var="sp" varStatus="status">
							  <div class="fj fj2"><p>附件${status.count }：</p><p>${sp.name }</p><a href="${sp.path}" class="sj_ai">查看</a></div>
							  </c:forEach>
									  </div>
								  </td>
								</tr>
								<tr>
								  <td class="sj_wz table_grey">处理图片上传：</td>
								  <td colspan="4">
									<div class="sj_sc table_bordernone"> 
									
									<c:forEach items="${listtp }" var="tp" varStatus="status">
									  <div class="sj_pic">
										<div class="sj_zp"><img src="${tp.path }"></div>
										<div class="fj fl"><p>附件${status.count }：</p><p>${tp.name }</p> </div>
										</div> 
												  </c:forEach>
									  <div class="clear"></div>
									</div>
								  </td>
								</tr>
								
								
								
								
								<!-- 附件结束 -->
								<tr>
									<td width="20%" class="table_grey"><span>*</span>反应问题及诉求：</td>
									<td colspan="4">${temp.appeals }</td>
								</tr>
								<tr>
									<td width="20%" class="table_grey"><span>*</span>初步处理意见：</td>
									<td colspan="4">${temp.preliminaryOpinion }</td>
								</tr>
								<tr>
									<td width="20%" class="table_grey">是否满意：</td>
									<td colspan="2">${temp.satisfied }</td><!--单选框-->
									<td class="table_grey" >接待人：</td><!--默认默认当前登录账号，可更改-->
									<td colspan="2">${temp.receptionist }</td>
								  </tr>
					</tbody>
				   </table>
				</div>
     	  	      <h1 class="kzt_bt"><span>被举报人信息</span></h1>
      	  	   	  <div class="table_eg">
					  <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table_one">
						<tbody>
						  <tr>
							<td width="20%" class="table_grey">被举报人 / 单位：：</td>
							<td width="30%" colspan="2">${ext.reportedCompany }</td>
							<td width="20%" class="table_grey"><span>*</span>姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名：</td>
							<td width="30%" colspan="2">${ext.reportedName }</td>
						  </tr>
						  <tr>
							<td width="20%" class="table_grey"><span>*</span>性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别：</td>
							<td colspan="2"> 
							<c:if test="${ext.reportedSex == 1 }">
						男
						</c:if>
						<c:if test="${ext.reportedSex == 0 }">
						女
						</c:if> 
							
							</td><!--单选框--> 
						  </tr>
						  <tr>
							<td class="table_grey" ><span>*</span>职&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;务：</td>
							<td colspan="2">${ext.reportedDuties }</td>
							<td class="table_grey" ><span>*</span>级&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别：</td>
							<td colspan="2">${ext.reportedLevel } </td><!--下拉列表-->
						  </tr>
						</tbody>
					   </table>
					</div>
      	  	   </div>
      	  	   <div class="clear"></div>
      	  </div>


      </div>  
  
</div>
</div>
</body>
</html>