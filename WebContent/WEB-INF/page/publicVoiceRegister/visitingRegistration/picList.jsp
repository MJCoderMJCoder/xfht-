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
<title>图片识别</title>
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
<script type="text/javascript">
function distinguish(id){
	var form = $("<form>");   //定义一个form表单
    form.attr('style', 'display:none');   //在form表单中添加查询参数
    form.attr('target', '');
    form.attr('method', 'post');
    form.attr('action', "cm_visitingRegistration_distinguish");
	
	var bookingId = $('<input>');
	bookingId.attr('type', 'hidden');
	bookingId.attr('name', 'attrId');
	bookingId.attr('value', id);
	form.append(bookingId);
	$(document.body).append(form);
	form.submit();
}

</script>




</head>
<body>
	
	<jsp:include page="../../include/top.jsp"></jsp:include>
	
<div class="center">

<jsp:include page="../../include/public_voice_register_left.jsp"></jsp:include>

<div class="pubilc_right fl">
      <div class="pubilc_right_cn">
      	  
      	  <div class="cfcx">
      	  	   <div class="cfcx_2">
      	  	   	  <h1 class="kzt_bt"><span>图片附件列表</span></h1>
      	  	   	  <div class="table_eg">
				  <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table_one">
					<tbody>
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
											<div class="sj_wai"><a href="javascript:void(0);" onclick="distinguish(${list.id});" class="sj_ai">AI识别</a></div>
										</div>
								 	</c:forEach>
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
                    <input type="button" class="bt_small bt_yellow" value="返&nbsp;&nbsp;&nbsp;回" onclick="javascript:window.location.href='/cm_visitingRegistration_list'"/>
                  </div>
                </div>
      	  </div>
      </div>
</div>
</div>
</body>
</html>
