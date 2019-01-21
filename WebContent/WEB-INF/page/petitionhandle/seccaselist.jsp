<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>信访处理-案件关联</title>
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
		$(".bg_block").css("display","none");
	}); 
    $(".close_tc_ts_btn").click(function(){
		$(".ts_block").css("display","none");
	}); 
});  
 
</script> 
<script type="text/javascript" language="javascript">  
	function subform() {
		if(chkCheckBoxChs("c1")== false){
			 $(".sec_block").css("display","block");
			}
		else{ 
			document.getElementById("caseform").submit();
		} 
	}

	function chkCheckBoxChs(objNam) { //檢測是否有選擇多选框的至少一项
		var obj = document.getElementsByName(objNam); //獲取多選框數組
		var objLen = obj.length; //獲取數據長度
		var objYN; //是否有選擇
		var i;
		objYN = false;
		for (i = 0; i < objLen; i++) {
			if (obj[i].checked == true) {
				objYN = true;
				break;
			}
		}
		return objYN;
	}
</script>
<!--控制表格奇数偶数颜色结束----------------------->
</head>
<body>

<c:if test="${not empty sulogin}">
<input type="hidden" value="${sulogin}" name="hid_sulogin" id="hid_sulogin"/> 
</c:if>
<c:if test="${empty sulogin}">
<input type="hidden" value="" id="hid_sulogin" name="hid_sulogin" /> 
</c:if>

<script type="text/javascript" language="javascript">  
	window.onload = function(){
	var sss=$("#hid_sulogin").val();
		if(sss=="suss")
		 $(".sec_block11").css("display","block");  
	}
</script> 
<jsp:include page="../include/top.jsp"></jsp:include>
<div class="center">
	<jsp:include page="../include/handle_left.jsp"></jsp:include>
	<div class="pubilc_right fl">
	<div id="ContainerPanel" style="display:none;"><div id="calendarPanel" style="position: absolute;display: none;z-index: 9999;background: #fff;border: 1px solid #ccc;width:200px;font:12px/18px 微软雅黑;margin-left:25px;"></div></div>
    	<div class="pubilc_right_cn">
      		<div class="cfcx">
      	  		<div class="cfcx_2">
      	  	   		<h1 class="kzt_bt"><span>关联列表</span></h1>
      	  	   	 	 <div class="select_eg">
						<form action="cm_getcaselist_${xfid }" id="searchForm" name="searchForm" method="post">
						<table width="100%" border="0" cellpadding="0" cellspacing="0">
						  	<tbody>
								<tr>
							  		<td class="Txt_right">被举报人：</td>
							  		<td><input class="" id="reportedName" name="reportedName" type="text" value="${reportedName }" /></td>
							  	 	<td class="Txt_right">上访时间：</td>
							  		<td colspan="5">
						  			<input   id="createTime_star" name="createTime_star" class="select_time" value="${createTime_star }" onclick="SetDate(this,'yyyy-MM-dd')" placeholder="选择时间">&nbsp;-&nbsp;
						  			<input   id="createTime_end" name="createTime_end" class="select_time" value="${createTime_end }" onclick="SetDate(this,'yyyy-MM-dd')" placeholder="选择时间">
							  		</td>
							  </tr>
							</tbody>
						</table>
						<div class="select_btn">
							<input type="submit" class="select_ss bt_small" value="搜&nbsp;&nbsp;索" /> 
							<input onclick="subform();" type="button" class="select_ss bt_small" value="关联所选" /> 
						</div>
			        	</form>
					</div>
      	  		</div>
      	  		<div class="clear"></div>
      	  	</div>
      	  	<div class="kzt_table">
      	  	<form action="docase_${xfid }" method="post" id="caseform" name="caseform">
      	  		<table id="Table" class="table_bg">
      	  	   	   <tbody>
      	  	   	   	   <tr>
      	  	   	   	    <th>选择</th>
      	  	   	   	   	  <th>序号</th>
      	  	   	   	   	  <th>上访单号</th>
      	  	   	   	   	  <th>上访人姓名</th>
      	  	   	   	   	  <th>上访人身份证号</th>
      	  	   	   	   	  <th>被举报人</th>
      	  	   	   	   	  <th>来访类型</th>
      	  	   	   	   	  <th>上访时间</th>
      	  	   	   	   	  <th>标题</th> 
      	  	   	   	   	   
      	  	   	   	   </tr>
      	  	   	   	   <c:forEach items="${GuestList }" var="obj" varStatus="status">
      	  	   	   	   <tr>
      	  	   	   	      <td>
      	  	   	   	        <input name="c1" value="${obj.getId() }" 
      	  	   	   	      <c:forEach items="${casedls }" var="cased"> 
      	  	   	   	      <c:if test="${cased.follower ==obj.getId()}">
      	  	   	   	          checked="checked"   
      	  	   	   	        </c:if> 
      	  	   	   	      </c:forEach> 
      	  	   	   	       type="checkbox" />
      	  	   	   	      </td>
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
      	  	   	   	   </tr>
                       </c:forEach>
      	  	   	   </tbody>
      	  	   </table>
      	  	   </form>
      	  	</div>
      		<jsp:include page="../include/page.jsp"></jsp:include>
    	</div>
	</div>
</div> 

<!--成功弹出 START-->
<div class="bg_block sec_block11" id="cktcc">
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
<div class="bg_block sec_block" id="cktcc11" >
  <div class="t_tcc">
    <div class="tcc_w">
      <div class="ts_img"><img src="${path}/static/images/tc_jg.png" alt=""/></div>
      <div class="ts_txt">请至少选择一项<br /><span id="sucessNotice" name="sucessNotice"></span></div>
      <div class="tc_btn"><input type="button" class="close_tc_btn" value="关闭" /></div> 
    </div>
  </div>
</div>
<!--成功弹出 END--> 


</body>
</html>
