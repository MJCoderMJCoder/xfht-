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
<script type="text/javascript" src="${path}/static/js/jquery.min.js"></script>
<script type="text/javascript" src="${path}/static/js/jquery.SuperSlide.2.1.js"></script>
<script type="text/javascript" src="${path}/static/js/wordsSearch.js"></script>

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
		HiddenDiv();
		//成功提示弹出层
		$(".close_tc_cg_btn").click(function(){
			//$(".cg_block").css("display","none");
			var form = $("<form>");   //定义一个form表单
		    form.attr('style', 'display:none');   //在form表单中添加查询参数
		    form.attr('target', '');
		    form.attr('method', 'post');
		    form.attr('action', "/cm_visitingRegistration_list");
			
			$(document.body).append(form);
			form.submit();
		});
		//提示弹出层
		$(".close_tc_ts_btn").click(function(){
			$(".ts_block").css("display","none");
		});
	});
</script>
<script type="text/javascript">
function goBack(id) {
	var form = $("<form>");   //定义一个form表单
    form.attr('style', 'display:none');   //在form表单中添加查询参数
    form.attr('target', '');
    form.attr('method', 'post');
    form.attr('action', "cm_visitingRegistration_picList");
	
	var guestbookId = $('<input>');
	guestbookId.attr('type', 'hidden');
	guestbookId.attr('name', 'id');
	guestbookId.attr('value', id);
	
	form.append(guestbookId);
	
	$(document.body).append(form);
	form.submit();
}
function distinguish(attrId){
	$.ajax({
        type: "POST",
        dataType: 'json',
        url: "cm_visitingRegistration_recognition",
        data: {"attrId":attrId},
        traditional: true,
        dataType: "json",
        async:true, 
		beforeSend: function () {
			$("#distinguishButton").hide();
			ShowDiv();
			},
		complete: function () {
			$("#distinguishButton").show();
			HiddenDiv();
			}, 
        success: function(data){
        	$("#content").text(data.word);
        },
        error:function(){
 	 	}
    });
}

function update(id) {
	
	var content = $("#content").text();
	if(content.trim() == ""){
		$("#warningNotice").html("翻译结果不能为空！");
		$(".ts_block").css("display","block");
		return false;
	}
	
	$.ajax({
        url:"cm_visitingRegistration_recognition_update",
        type:"post",
        data:{
        	attachmentsId:id,
        	content:$("#content").text()
        },
        success:function(data){
        	data = JSON.parse(data);
        	if (data.status==0) {
        		$("#sucessNotice").text("保存成功！");
        		$(".cg_block").css("display","block");
        	} else if (data.status==1) {
        		$("#warningNotice").text("保存失败！");
        		$(".ts_block").css("display","block");
        	}
        },
        error:function(e){
        	//请求出错处理
        	$("#warningNotice").text("系统错误。");
       		$(".ts_block").css("display","block");
        }
    }); 
}
//显示加载数据
function ShowDiv() {
	$("#loading").show();
}
//隐藏加载数据
function HiddenDiv() {
	$("#loading").hide();
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
      	  	   	  <h1 class="kzt_bt"><span>AI识别</span></h1>
      	  	   	  <div class="ai_eg">				  
			   		<div class="ai_l fl">
	   			      <div class="ai_l_yi">
	   			      	<p>需识别文件：</p><a href="javascript:void(0);">${guestbookAttr.name }</a>
	   			      	<input type="button" value="更换证据" class="ai_gh" onclick="goBack(${guestbookAttr.guestbook.id});"/>
	   			      </div>
		   			   <div class="ai_l_er">
		   			   	  <img src="${guestbookAttr.path }">
		   			   </div>
		   			    <div id="loading"><div class="loading_img"><img src="${path}/static/images/loading.gif"/></div></div>  
                   		<input type="button" value="开始识别" id="distinguishButton" class="ai_sb" onclick="distinguish(${guestbookAttr.id});">
                    </div>
                 	<div class="ai_r fr">
                 		<div class="ai_r_yi">
                            <div class="ai_search">
	                            <form onsubmit="return false;">
	                              <input type="search" placeholder="请输入关键字" class="ai_search1" id="fwtext">
	                            </form>
                            </div>
                            <input type="button" value="上一个" class="select_ss syg" onclick="findprev();"/> 
							<input type="button" id="btn" value="下一个" class="select_ss syg" onclick="this.blur(); findit();"/> 
							<span id="find_msg"><br /></span>
               		    </div>
                 		<div class="ai_r_er"  id="content" contentEditable="true">
                 				${guestbookAttr.imageRecognition}
                 		</div>
                 		<input type="button" value="存储识别文件" class="ai_cc" onclick="update(${guestbookAttr.id});">
                 	</div>
                  </div>	   	  
   	  	    </div>
      	  	   <div class="clear"></div>
      	  </div>


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
					警告！<br /> <span id="warningNotice"></span>
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
					操作成功！<br /> <span id="sucessNotice"></span>
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
