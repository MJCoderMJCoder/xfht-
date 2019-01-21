<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link type="text/css" href="${path}/static/css/style.css" rel="stylesheet"/>
<link type="text/css" href="${path}/static/css/public.css" rel="stylesheet"/>
<link type="text/css" href="${path}/static/css/other.css" rel="stylesheet"/>
<link type="text/css" href="${path}/static/css/tcc.css" rel="stylesheet"/>
<title></title>
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
<script type="text/javascript">
function save(){
	if($("#addname").val().trim() == ""){
		$("#notice").text("任务名称不能为空！");
		$(".ts_block").css("display","block");
		return false;
	}
	if($("#addcontents").val().trim() == ""){
		$("#notice").text("任务内容不能为空！");
		$(".ts_block").css("display","block");
		return false;
	}
	if($("#addremindTime").val().trim() == ""){
		$("#notice").text("任务日期不能为空！");
		$(".ts_block").css("display","block");
		return false;
	}
	$.ajax({
        type: "POST",
        dataType: 'json',
        url: "cm_task_save",
        data: $("#addForm").serialize(),
        traditional: true,
        dataType: "json",
        success: function(data){
        	if(data.status==0) {
        		$("#sucessNotice").text("任务信息保存成功！");
        		$(".cg_block").css("display","block");
            }else{
            	$("#notice").text("任务信息保存失败！");
        		$(".ts_block").css("display","block");
            }
        },
        error:function(){
 	 	}
    });
}
function edit(id){
	$.ajax({
        type: "POST",
        dataType: 'json',
        url: "cm_task_edit",
        data: {"id":id},
        traditional: true,
        success: function(data){
        	if(data.status==0) {
        		$("#editId").val(data.id);
        		$("#editname").val(data.name);
        		$("#editcontents").text(data.contents);
        		$("#editremindTime").val(data.remindTime);
        		
        		$("#cktcc2").css("display","block");
            }else{
            	$("#notice").text("任务信息不存在！");
        		$(".ts_block").css("display","block");
            }
        },
        error:function(){
 	 	}
    });
}
function update(){
	if($("#editname").val().trim() == ""){
		$("#notice").text("任务名称不能为空！");
		$(".ts_block").css("display","block");
		return false;
	}
	if($("#editcontents").val().trim() == ""){
		$("#notice").text("任务内容不能为空！");
		$(".ts_block").css("display","block");
		return false;
	}
	if($("#editremindTime").val().trim() == ""){
		$("#notice").text("任务日期不能为空！");
		$(".ts_block").css("display","block");
		return false;
	}
	$.ajax({
        type: "POST",
        dataType: 'json',
        url: "cm_task_update",
        data: $("#editForm").serialize(),
        traditional: true,
        success: function(data){
        	if(data.status==0) {
        		$("#sucessNotice").text("任务信息修改成功！");
        		$(".cg_block").css("display","block");
            }else if(data.status==1){
            	$("#notice").text("此任务信息不存在，无法修改！");
        		$(".ts_block").css("display","block");
            }else if(data.status==2){
            	$("#notice").text("任务已处理，无法修改！");
        		$(".ts_block").css("display","block");
            }
        	else{
            	$("#notice").text("任务信息修改失败！");
        		$(".ts_block").css("display","block");
            }
        },
        error:function(){
 	 	}
    });
}
function deleteById(id){
	$.ajax({
        type: "POST",
        dataType: 'json',
        url: "cm_task_delete",
        data: {"id":id},
        dataType: "json",
        success: function(data){
        	if(data.status==0) {
        		$("#sucessNotice").text("此任务信息删除成功！");
        		$(".cg_block").css("display","block");
            }else{
            	$("#sucessNotice").text("此任务信息删除失败！");
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
	//添加弹出层
	$(".select_add").click(function(){
		$("#cktcc1").css("display","block");
	}); 
	$("#cktcc_center_gb1").click(function(){
		$("#cktcc1").css("display","none");
	}); 
	$("#cktcc_center_gb2").click(function(){
		$("#cktcc2").css("display","none");
	}); 
	
	$(".close_tc_btn").click(function(){
		$("#cktcc1").css("display","none");
		$(".add_block").css("display","none");
		location.reload();
	});
	$(".close_tc_ts_btn").click(function(){
		$(".ts_block").css("display","none");
	});
	
});
function close(){
	$("#cktcc1").css("display","none");
	$("#cktcc2").css("display","none");
}
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
    }); 
</script> 
<!--控制表格奇数偶数颜色结束----------------------->
</head>
<body>
<jsp:include page="../include/top.jsp"></jsp:include>
<div class="center">
	<jsp:include page="../include/task_left.jsp"></jsp:include>
	<div class="pubilc_right fl">
		<div id="ContainerPanel" style="display:none;"><div id="calendarPanel" style="position: absolute;display: none;z-index: 9999;background: #fff;border: 1px solid #ccc;width:200px;font:12px/18px 微软雅黑;margin-left:25px;"></div></div>
    	<div class="pubilc_right_cn">
      		<div class="cfcx">
      	  		<div class="cfcx_2">
      	  	   		<h1 class="kzt_bt"><span>任务管理</span></h1>
      	  	   	 	 <div class="select_eg">
						<form action="cm_task_list" id="searchForm" name="searchForm" method="post">
						<table width="100%" border="0" cellpadding="0" cellspacing="0">
						  	<tbody>
								<tr>
							  		<td class="Txt_right">名称：</td>
							  		<td><input class="" id="s_name" name="s_name" type="text" value="${s_name }" /></td>
							  		<td class="Txt_right">提示时间：</td>
							  		<td colspan="5">
							  			<input id="stime_star" name="stime_star" class="select_time" value="${stime_star }" onclick="SetDate(this,'yyyy-MM-dd')" placeholder="选择时间" />&nbsp;-&nbsp;
							  			<input id="stime_end" name="stime_end" class="select_time" value="${stime_end }" onclick="SetDate(this,'yyyy-MM-dd')" placeholder="选择时间" />
							  		</td> 
							  		<td>
										<input type="submit" class="select_ss bt_small" value="搜&nbsp;&nbsp;索" />
		        						<input type="button" class="select_xz bt_small select_add" value="新增"  />
							  		</td>
							  	</tr>
							</tbody>
						</table>
			        	</form>
					</div>
      	  		</div>
      	  		<div class="clear"></div>
      	  	</div>
      	  	<div class="kzt_table">
      	  		<table id="Table" class="table_bg">
      	  	   	   <tbody>
      	  	   	   	   <tr>
      	  	   	   	   	  <th style="min-width:50px;">序号</th>
      	  	   	   	   	  <th>任务名称</th>
      	  	   	   	   	  <th>任务内容</th>
      	  	   	   	   	  <th style="min-width:120px;">提示时间</th>
      	  	   	   	   	  <th style="min-width:120px;">操作</th>
      	  	   	   	   </tr>
      	  	   	   	   <c:forEach items="${TaskList }" var="obj" varStatus="status">
      	  	   	   	   <tr>
      	  	   	   	   	  <td>${status.index+1 }</td>
      	  	   	   	   	  <td>${obj.name }</td>
      	  	   	   	   	  <td>${obj.contents }</td>
      	  	   	   	   	  <td><fmt:formatDate value="${obj.remindTime}"  pattern="yyyy-MM-dd"/></td>
      	  	   	   	   	  <td>
      	  	   	   	   	  	<a href="javascript:edit(${obj.id });">修改</a> | 
      	  	   	   	   	  	<a href="javascript:deleteById(${obj.id });">删除</a>
      	  	   	   	   	  </td>
      	  	   	   	   </tr>
                       </c:forEach>
      	  	   	   </tbody>
      	  	   </table>
      	  	</div>
      		<jsp:include page="../include/page.jsp"></jsp:include>
    	</div>
	</div>
</div>
<!--添加 START-->
<div class="cktcc" id="cktcc1">
	<div class="cktcc_center">
    	<div class="wai_tittle">
        	<input type="button" value="关&nbsp;闭" id="cktcc_center_gb1" class="cktcc_center_gb"/>
        	<h1 class="cktcc_center_bt">添加任务</h1>
		</div>
        <div class="wai">
        	<div class="select_eg">
        		<form  action="cm_task_save" id="addForm" name="addForm" method="post">
				<table width="100%" border="0" cellpadding="0" cellspacing="0">
					<tbody>
						<tr>
							<td class="Txt_right">任务名称：</td>
							<td><span>*</span><input class="" id="addname" name="addname" type="text" oninput="if(value.length>100) value=value.slice(0,100)" /></td>
						</tr>
						<tr>
							<td class="Txt_right">任务内容：</td>
							<td><span>*</span><textarea class="select_textarea" id="addcontents" name="addcontents" oninput="if(value.length>255) value=value.slice(0,255)"></textarea></td>
						</tr>
						<tr>
							<td class="Txt_right">任务日期：</td>
							<td><span>*</span><input id="addremindTime" name="addremindTime" class="select_time" onclick="SetDate(this,'yyyy-MM-dd')"/></td>
						</tr>
					</tbody>
				</table>
				<div class="select_btn">
					<input type="button" class="select_xz bt_small" value="新&nbsp;&nbsp;增" onclick="save()" />
				</div>
				</form>
			</div>
         </div>
	</div>
</div>
<!--小弹出 END--> 
<!--修改 START-->
<div class="cktcc" id="cktcc2">
	<div class="cktcc_center">
    	<div class="wai_tittle">
        	<input type="button" value="关&nbsp;闭" id="cktcc_center_gb2" class="cktcc_center_gb"/>
        	<h1 class="cktcc_center_bt">修改任务</h1>
		</div>
        <div class="wai">
        	<div class="select_eg">
        		<form  action="cm_task_update" id="editForm" name="editForm" method="post">
				<table width="100%" border="0" cellpadding="0" cellspacing="0">
					<tbody>
						<tr>
							<td class="Txt_right">任务名称：</td>
							<td><span>*</span>
								<input class="" id="editname" name="editname" type="text" oninput="if(value.length>100) value=value.slice(0,100)" />
              					<input type="hidden" id="editId" name="editId"/>
              				</td>
						</tr>
						<tr>
							<td class="Txt_right">任务内容：</td>
							<td><span>*</span><textarea class="select_textarea" id="editcontents" name="editcontents" oninput="if(value.length>255) value=value.slice(0,255)"></textarea></td>
						</tr>
						<tr>
							<td class="Txt_right">任务日期：</td>
							<td><span>*</span><input id="editremindTime" name="editremindTime" class="select_time" onclick="SetDate(this,'yyyy-MM-dd')"/></td>
						</tr>
					</tbody>
				</table>
				<div class="select_btn">
					<input type="button" class="select_xz bt_small" value="保&nbsp;&nbsp;存" onclick="update()" />
				</div>
				</form>
			</div>
         </div>
	</div>
</div>
<!--小弹出 END--> 
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
