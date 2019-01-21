<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>重置密码</title>
<link type="text/css" href="${path}/static/css/style.css" rel="stylesheet"/>
<link type="text/css" href="${path}/static/css/public.css" rel="stylesheet"/>
<link type="text/css" href="${path}/static/css/other.css" rel="stylesheet"/>
<link type="text/css" href="${path}/static/css/tcc.css" rel="stylesheet"/>
<script type="text/javascript" src="${path}/static/js/jquery-1.11.1.min.js"></script> 
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
function save(){
	if($("#username").val().trim() == ""){
		$("#notice").text("用户名不能为空！");
		$(".ts_block").css("display","block");
		return false;
	}
	var password = $("#password1").val().trim();
	if(password == ""){
		$("#notice").text("新密码不能为空！");
		$(".ts_block").css("display","block");
		return false;
	}
	var password1 = $("#password2").val().trim();
	if(password1 == ""){
		$("#notice").text("确认密码不能为空！");
		$(".ts_block").css("display","block");
		return false;
	}
	if(password != password1){
		$("#notice").text("两次密码输入不一致！");
		$(".ts_block").css("display","block");
		return false;
	}
	$.ajax({
        type: "POST",
        dataType: 'json',
        url: "cm_user_saveReset",
        data: $("#editForm").serialize(),
        traditional: true,
        success: function(data){
        	if(data.status==0) {
        		$("#sucessNotice").text("重置密码成功！");
        		$(".cg_block").css("display","block");
        		$("#username").val("");
        		$("#password1").val("");
        		$("#password2").val("");
            }else if(data.status == 1){
            	$("#notice").text("用户不存在！");
        		$(".ts_block").css("display","block");
            }else if(data.status == 2){
            	$("#notice").text("用户名不正确，请重新输入！");
        		$(".ts_block").css("display","block");
            }else{
            	$("#notice").text("重置密码失败！");
        		$(".ts_block").css("display","block");
            }
        },
        error:function(){
 	 	}
    });
}
</script>
<script type="text/javascript">
$(document).ready(function(){
	$(".close_tc_btn").click(function(){
		$(".cg_block").css("display","none");
	});
	$(".close_tc_ts_btn").click(function(){
		$(".ts_block").css("display","none");
	});
});
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
      	  	   		<h1 class="kzt_bt"><span>重置密码</span></h1>
      	  	   	  	<div class="table_eg">
      	  	   	  		<form action="cm_user_saveReset" id="editForm" name="editForm" method="post">
      	  	   	  		<input type="hidden" id="id" name="id" value="" />
				  		<table width="60%" border="0" cellspacing="0" cellpadding="0" class="table_one">
							<tbody>
					  		<tr>
								<td width="20%" class="table_grey"><span>*</span>用户名：</td>
								<td width="30%" colspan="2"><input class="input_color" id="username" name="username" type="text"/></td>
					  		</tr>
					  		<tr>
								<td width="20%" class="table_grey"><span>*</span>新密码：</td>
								<td width="30%" colspan="2"><input class="input_color" id="password1" name="password1" type="password"/></td>
					  		</tr>
					  		<tr>
								<td class="table_grey" ><span>*</span>确认密码：</td>
								<td colspan="2"><input class="input_color" id="password2" name="password2" type="password"/></td>
					  		</tr>
							</tbody>
				   		</table>
				   		</form>
					</div>
					<div class="sj_bt_wai">
                  		<div class="sj_bt">
                    		<input type="button" class="bt_small bt_green2" value="保&nbsp;&nbsp;&nbsp;存" onclick="save()">
                  		</div>
                	</div>
      	  	   </div>
      	  	   <div class="clear"></div>
      		</div>
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
