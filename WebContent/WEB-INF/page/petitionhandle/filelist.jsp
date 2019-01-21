<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>办结存档</title>
<link type="text/css" href="${path}/static/css/style.css" rel="stylesheet"/>
<link type="text/css" href="${path}/static/css/public.css" rel="stylesheet"/>
<link type="text/css" href="${path}/static/css/other.css" rel="stylesheet"/>
<link type="text/css" href="${path}/static/css/tcc.css" rel="stylesheet"/>
<script type="text/javascript" src="${path}/static/js/jquery.min.js"></script>
<script type="text/javascript" src="${path}/static/js/jquery.SuperSlide.2.1.js"></script>
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
$(function(){
	$(".subNav").click(function(){
		$(this).toggleClass("currentDd").siblings(".subNav").removeClass("currentDd")
		$(this).toggleClass("currentDt").siblings(".subNav").removeClass("currentDt")
		// 修改数字控制速度， slideUp(500)控制卷起速度
		$(this).next(".navContent").slideToggle(500).siblings(".navContent").slideUp(500);
	})	
})
</script>
<!--控制表格奇数偶数颜色不一样开始----------------------->
<script type="text/javascript" language="javascript">  
$(document).ready(function(){  
    //设置偶数的  
    $("#Table tr:even").addClass("even");  
    //设置奇数的  
    $("#Table tr:odd").addClass("odd");  
    $("#Table tr").mouseover(function(){  
        $(this).removeClass("even odd");  
        $(this).toggleClass("d");  
    });  
    $("#Table tr").mouseout(function(){  
        $(this).toggleClass("d");  
        $("#Table tr:even").addClass("even");;  
        $("#Table tr:odd").addClass("odd");  
    });  
    $("").each(function(){  
        $(this).click(function(){  
            if(this.checked==true){  
            $(this).parent().parent() 
            }  
            if(this.checked==false){  
                $(this).parent().parent() 
                }  
            });  
        }); 
    $("#cktcc_center_gb").click(function(){
		$("#cktcc").css("display","none");
	}); 
    $(".close_tc_btn").click(function(){
		$(".cg_block").css("display","none");
	}); 
    $(".close_tc_ts_btn").click(function(){
		$(".ts_block").css("display","none");
	}); 
}); 
function exportlist(){
	var form = $("<form>");   //定义一个form表单
    form.attr('style', 'display:none');   //在form表单中添加查询参数
    form.attr('target', '');
    form.attr('method', 'post');
    form.attr('action', "cm_petitionhandle_fileExport");
    
    var informantName = $('<input>');
    informantName.attr('type', 'hidden');
    informantName.attr('name', 'informantName');
    informantName.attr('value', $("#informantName").val());

    var informantCardNo = $('<input>');
    informantCardNo.attr('type', 'hidden');
    informantCardNo.attr('name', 'informantCardNo');
    informantCardNo.attr('value', $("#informantCardNo").val());

    var reportedName = $('<input>');
    reportedName.attr('type', 'hidden');
    reportedName.attr('name', 'reportedName');
    reportedName.attr('value', $("#reportedName").val());

    var complaintNumber = $('<input>');
    complaintNumber.attr('type', 'hidden');
    complaintNumber.attr('name', 'complaintNumber');
    complaintNumber.attr('value', $("#complaintNumber").val());

    var ctgId = $('<input>');
    ctgId.attr('type', 'hidden');
    ctgId.attr('name', 'ctgId');
    ctgId.attr('value', $("#ctgId").val());

    var createTime_star = $('<input>');
    createTime_star.attr('type', 'hidden');
    createTime_star.attr('name', 'createTime_star');
    createTime_star.attr('value', $("#createTime_star").val());

    var createTime_end = $('<input>');
    createTime_end.attr('type', 'hidden');
    createTime_end.attr('name', 'createTime_end');
    createTime_end.attr('value', $("#createTime_end").val());
    $('body').append(form);  //将表单放置在web中
    form.append(informantName);   //将查询参数控件提交到表单上
    form.append(informantCardNo);   //将查询参数控件提交到表单上
    form.append(reportedName);   //将查询参数控件提交到表单上
    form.append(complaintNumber);   //将查询参数控件提交到表单上
    form.append(ctgId);   //将查询参数控件提交到表单上
    form.append(createTime_star);   //将查询参数控件提交到表单上
    form.append(createTime_end);   //将查询参数控件提交到表单上
    form.submit();
}
function view(id){
	$.ajax({
        type: "POST",
        dataType: 'json',
        url: "cm_petitionhandle_view",
        data: {"id":id},
        traditional: true,
        success: function(data){
        	if(data.status==0) {
        		$("#complaintNumbers").html(data.complaintNumber);
        		$("#createTimes").html(data.createTime);
        		$("#informantNames").html(data.informantName);
        		$("#informantSexs").html(data.informantSex);
        		$("#informantAges").html(data.informantAge);
        		$("#informantNations").html(data.informantNation);
        		$("#informantCardNos").html(data.informantCardNo);
        		$("#informantEducations").html(data.informantEducation);
        		$("#informantpoliticalFaces").html(data.informantpoliticalFace);
        		$("#informantLevels").html(data.informantLevel);
        		$("#informantPlaces").html(data.informantPlace);
        		$("#informantEmails").html(data.informantEmail);
        		$("#ctgIds").html(data.ctgId);
        		$("#informantPhones").html(data.informantPhone);
        		$("#informantOtherTels").html(data.informantOtherTel);
        		$("#processingCompanys").html(data.processingCompany);
        		$("#processingHeads").html(data.processingHead);
        		$("#matterPropertys").html(data.matterProperty);
        		$("#matterCategorys").html(data.matterCategory);
        		$("#matterDetaileds").html(data.matterDetailed);
        		$("#informantGrades").html(data.informantGrade);
        		$("#peopleCounts").html(data.peopleCount);
        		$("#leaders").html(data.leader);
        		$("#abnormalBehaviors").html(data.abnormalBehavior);
        		$("#createUsers").html(data.createUser);
        		$("#receptionists").html(data.receptionist);
        		$("#satisfieds").html(data.satisfied);
        		$("#appealss").html(data.appeals);
        		$("#contents").html(data.content);
        		$("#preliminaryOpinions").html(data.preliminaryOpinion);
        		$("#reportedCompanys").html(data.reportedCompany);
        		$("#reportedName").html(data.reportedName);
        		$("#reportedSexs").html(data.reportedSex);
        		$("#reportedDutiess").html(data.reportedDuties);
        		$("#reportedLevels").html(data.reportedLevel);

        		$("#cktcc").css("display","block");
            }else{
            	$("#notice").text("查询信息错误！");
        		$(".ts_block").css("display","block");
            }
        },
        error:function(){
 	 	}
    });
}
</script> 
<!--控制表格奇数偶数颜色结束----------------------->
</head>
<body>
<jsp:include page="../include/top.jsp"></jsp:include>
<div class="center">
	<jsp:include page="../include/handle_left.jsp"></jsp:include>
	<div class="pubilc_right fl">
	<div id="ContainerPanel" style="display:none;"><div id="calendarPanel" style="position: absolute;display: none;z-index: 9999;background: #fff;border: 1px solid #ccc;width:200px;font:12px/18px 微软雅黑;margin-left:25px;"></div></div>
    	<div class="pubilc_right_cn">
      		<div class="cfcx">
      	  		<div class="cfcx_2">
      	  	   		<h1 class="kzt_bt"><span>办结存档</span></h1>
      	  	   	 	 <div class="select_eg">
						<form action="cm_petitionhandle_filelist" id="searchForm" name="searchForm" method="post">
						<table width="100%" border="0" cellpadding="0" cellspacing="0">
						  	<tbody>
								<tr>
							  		<td class="Txt_right">上访人姓名：</td>
							  		<td><input class="" id="informantName" name="informantName" type="text" value="${informantName }" /></td>
							  		<td class="Txt_right">上访人身份证号：</td>
							  		<td><input class="" id="informantCardNo" name="informantCardNo" type="text" value="${informantCardNo }" /></td>
							  		<td class="Txt_right">被举报人：</td>
							  		<td><input class="" id="reportedName" name="reportedName" type="text" value="${reportedName }" /></td>
							  		<td class="Txt_right">上访编号：</td>
							  		<td><input class="" id="complaintNumber" name="complaintNumber" type="text" value="${complaintNumber }"/></td>  
							  	</tr>
								<tr>
							  		<td class="Txt_right">来访类型：</td>
							  		<td>
							  			<select id="ctgId" name="ctgId">
							  				<option>==请选择==</option>
							  				<c:choose>
							  					<c:when test="${!empty ctgId }">
							  						<c:choose>
							  							<c:when test="${ctgId==1 }"><option value="1" selected>网上信访</option></c:when>
							  							<c:otherwise><option value="1">网上信访</option></c:otherwise>
							  						</c:choose>
							  						<c:choose>
							  							<c:when test="${ctgId==2 }"><option value="2" selected>来访登记</option></c:when>
							  							<c:otherwise><option value="2">来访登记</option></c:otherwise>
							  						</c:choose>
							  						<c:choose>
							  							<c:when test="${ctgId==3 }"><option value="3" selected>来信登记</option></c:when>
							  							<c:otherwise><option value="3">来信登记</option></c:otherwise>
							  						</c:choose>
							  						<c:choose>
							  							<c:when test="${ctgId==4 }"><option value="4" selected>上级交办</option></c:when>
							  							<c:otherwise><option value="4">上级交办</option></c:otherwise>
							  						</c:choose>
							  					</c:when>
							  					<c:otherwise>
							  						<option value="1">网上信访</option>
							  						<option value="2">来访登记</option>
							  						<option value="3">来信登记</option>
							  						<option value="4">上级交办</option>
							  					</c:otherwise>
							  				</c:choose>
							  			</select>
							  		</td>
							  		<td class="Txt_right">上访时间：</td>
							  		<td colspan="5">
							  			<input onclick="SetDate(this,'yyyy-MM-dd')" placeholder="选择时间" class="select_time" id="createTime_star" name="createTime_star" value="${createTime_star}"/>
                      					&nbsp;-&nbsp;
                      					<input onclick="SetDate(this,'yyyy-MM-dd')" placeholder="选择时间" class="select_time" id="createTime_end" name="createTime_end" value="${createTime_end}"/>
							  		</td>
							  </tr>
							</tbody>
						</table>
						<div class="select_btn">
							<input type="submit" class="select_ss bt_small" value="搜&nbsp;&nbsp;索" />
							<input type="button" class="select_dc bt_small" value="导&nbsp;&nbsp;出" onclick="javascript:exportlist();" />
						</div>
			        	</form>
					</div>
      	  		</div>
      	  		<div class="clear"></div>
      	  	</div>
      	  	<div class="kzt_table">
      	  		<table id="Table" class="table_bg">
      	  	   	   <tbody>
      	  	   	   	   <tr>
      	  	   	   	   	  <th>序号</th>
      	  	   	   	   	  <th>上访单号</th>
      	  	   	   	   	  <th>上访人姓名</th>
      	  	   	   	   	  <th>上访人身份证号</th>
      	  	   	   	   	  <th>被举报人</th>
      	  	   	   	   	  <th>来访类型</th>
      	  	   	   	   	  <th>上访时间</th>
      	  	   	   	   	  <th>标题</th>
      	  	   	   	   	  <th>是否回复</th>
      	  	   	   	   	  <th>操作</th>
      	  	   	   	   </tr>
      	  	   	   	   <c:forEach items="${GuestList }" var="obj" varStatus="status">
      	  	   	   	   <tr>
      	  	   	   	   	  <td>${status.index+1 }</td>
      	  	   	   	   	  <td>${obj.complaintNumber }</td>
      	  	   	   	   	  <td>${obj.ext.informantName }</td>
      	  	   	   	   	  <td>${obj.ext.informantCardNo }</td>
      	  	   	   	   	  <td>${obj.ext.reportedName }</td>
      	  	   	   	   	  <td>
      	  	   	   	   	  	<c:choose>
      	  	   	   	   	  		<c:when test="${obj.ctgId==1 }">网上信访</c:when>
      	  	   	   	   	  		<c:when test="${obj.ctgId==2 }">来访登记</c:when>
      	  	   	   	   	  		<c:when test="${obj.ctgId==3 }">来信登记</c:when>
      	  	   	   	   	  		<c:when test="${obj.ctgId==4 }">上级交办</c:when>
      	  	   	   	   	  	</c:choose>
      	  	   	   	   	  </td>
      	  	   	   	   	  <td>${obj.createTime }</td>
      	  	   	   	   	  <td>${obj.ext.title }</td>
      	  	   	   	   	  <td>
      	  	   	   	   	  	<c:choose>
      	  	   	   	   	  		<c:when test="${!empty obj.replayTime }">已回复</c:when>
      	  	   	   	   	  		<c:otherwise>未回复</c:otherwise>
      	  	   	   	   	  	</c:choose>
      	  	   	   	   	  </td>
      	  	   	   	   	  <td><a href="javascript:view(${obj.id });">查看</a></td>
      	  	   	   	   </tr>
                       </c:forEach>
      	  	   	   </tbody>
      	  	   </table>
      	  	</div>
      		<jsp:include page="../include/page.jsp"></jsp:include>
    	</div>
	</div>
</div>
<div class="cktcc" id="cktcc">
	<div class="cktcc_center">
		<div class="wai_tittle">
			<input type="button" value="关&nbsp;闭" id="cktcc_center_gb" class="cktcc_center_gb"/>
           	<h1 class="cktcc_center_bt">详细信息</h1>
		</div>
        <div class="wai">
        	<p class="cktcc_center_fbt">来访人员信息及反应情况</p>
        	<table width="100%" border="0" cellspacing="0" cellpadding="0" class="table_one cktcc_center_table">
            	<tbody>
               		<tr>
                 		<td width="20%" class="table_grey">信访编号：</td>
                 		<td width="30%"><p id="complaintNumbers"></p></td>
                 		<td width="20%" class="table_grey">日&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;期：</td>
                 		<td width="30%"><p id="createTimes"></p></td>
               		</tr>
               		<tr>
                 		<td class="table_grey">姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名：</td>
                 		<td><p id="informantNames"></p></td>
                 		<td class="table_grey">性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别：</td>
                 		<td><p id="informantSexs"></p></td>
               		</tr>
               		<tr>
                 		<td class="table_grey" >年&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;龄：</td>
                 		<td><p id="informantAges"></p></td>
                 		<td class="table_grey" >民&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;族：</td>
                 		<td><p id="informantNations"></p></td>
               		</tr>
               		<tr>
                 		<td class="table_grey" >身份证号：</td>
                 		<td><p id="informantCardNos"></p></td>
                 		<td class="table_grey" >文化程度：</td>
                 		<td><p id="informantEducations"></p></td>
               		</tr>
               		<tr>
                 		<td class="table_grey" >政治面貌：</td>
                 		<td><p id="informantpoliticalFaces"></p></td>
                 		<td class="table_grey" >级&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别：</td>
                 		<td><p id="informantLevels"></p></td>
               		</tr>
               		<tr>
                 		<td class="table_grey" >居住地址：</td>
                 		<td><p id="informantPlaces"></p></td>
                 		<td class="table_grey" >电子邮件：</td>
                 		<td><p id="informantEmails"></p></td>
               		</tr>
               		<tr>
                 		<td class="table_grey" >来访类型：</td>
                 		<td><p id="ctgIds"></p></td>
                 		<td class="table_grey" >手&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;机：</td>
                 		<td><p id="informantPhones"></p></td>
              	 	</tr>
               		<tr>
                 		<td class="table_grey" >家庭电话：</td>
                 		<td><p id="informantOtherTels"></p></td>
                 		<td class="table_grey" >负责单位：</td>
                 		<td><p id="processingCompanys"></p></td>
               		</tr>
               		<tr>
                 		<td class="table_grey" >负责人：</td>
                 		<td><p id="processingHeads"></p></td>
                 		<td class="table_grey" >来访性质：</td>
                 		<td><p id="matterPropertys"></p></td>
	               	</tr>
               		<tr>
                 		<td class="table_grey" >问题类别：</td>
                 		<td><p id="matterCategorys"></p></td>
                 		<td class="table_grey" >问题细类：</td>
                 		<td><p id="matterDetaileds"></p></td>
	               	</tr>
               		<tr>
                 		<td class="table_grey" >上访层次：</td>
                 		<td><p id="informantGrades"></p></td>
                 		<td class="table_grey" >来访人数：</td>
                 		<td><p id="peopleCounts"></p></td>
	               	</tr>
               		<tr>
                 		<td class="table_grey" >来访代表：</td>
                 		<td><p id="leaders"></p></td>
                 		<td class="table_grey" >异常行为：</td>
                 		<td><p id="abnormalBehaviors"></p></td>
	               	</tr>
               		<tr>
                 		<td class="table_grey" >登记人：</td>
                 		<td><p id="createUsers"></p></td>
                 		<td class="table_grey" >接待人：</td>
                 		<td><p id="receptionists"></p></td>
	               	</tr>
               		<tr>
                 		<td class="table_grey" >是否满意：</td>
                 		<td><p id="satisfieds"></p></td>
                 		<td class="table_grey" >所属问题：</td>
                 		<td><p id="appealss"></p></td>
	               	</tr>
               		<tr>
                 		<td class="table_grey" >案件说明：</td>
                 		<td colspan="3"><p id="contents"></p></td>
	               	</tr>
               		<tr>
                 		<td class="table_grey" >初步处理意见：</td>
                 		<td colspan="3"><p id="preliminaryOpinions"></p></td>
	               	</tr>
              	</tbody>
			</table>
           	<p class="cktcc_center_fbt">被举报人（单位）信息</p>
           	<table width="100%" border="0" cellspacing="0" cellpadding="0" class="table_one cktcc_center_table">
            	<tbody>
               		<tr>
                 		<td width="20%" class="table_grey">被举报人/单位：</td>
                 		<td width="30%"><p id="reportedCompanys"></p></td>
                 		<td width="20%" class="table_grey">姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名：</td>
                 		<td width="30%"><p id="reportedNames"></p></td>
               		</tr>
               		<tr>
                 		<td class="table_grey" >性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别：</td>
                 		<td><p id="reportedSexs"></p></td>
                 		<td class="table_grey" >职&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;务：</td>
                 		<td><p id="reportedDutiess"></p></td>
               		</tr>
               		<tr>
                 		<td class="table_grey" >级&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别：</td>
                 		<td><p id="reportedLevels"></p></td>
                 		<td class="table_grey" ></td>
                 		<td></td>
               		</tr>
              	</tbody>
			</table>
		</div>
	</div>
</div>
<!--成功弹出 START-->
<div class="bg_block cg_block">
  <div class="t_tcc">
    <div class="tcc_w">
      <div class="ts_img"><img src="${path}/static/images/tc_cg.png" alt=""/></div>
      <div class="ts_txt">操作成功！<br /><span id="sucessNotice" name="sucessNotice"></span></div>
      <div class="tc_btn"><input type="button" class="close_tc_btn" value="关闭" /></div>

    </div>
  </div>
</div>
<!--成功弹出 END--> 
<!--成功弹出 START-->
<div class="bg_block ts_block">
  <div class="t_tcc">
    <div class="tcc_w">
      <div class="ts_img"><img src="${path}/static/images/tc_jg.png" alt=""/></div>
      <div class="ts_txt">警告！<br /><span id="notice" name="notice"></span></div>
      <div class="tc_btn"><input type="button" class="close_tc_ts_btn" value="关闭" /></div>

    </div>
  </div>
</div>
<!--成功弹出 END-->
</body>
</html>
