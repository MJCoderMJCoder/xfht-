<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link type="text/css" href="${path}/static/css/style.css" rel="stylesheet" /> 
<link type="text/css" href="${path}/static/css/public.css" rel="stylesheet" /> 
<link type="text/css" href="${path}/static/css/other.css" rel="stylesheet" /> 
<link type="text/css" href="${path}/static/css/tcc.css" rel="stylesheet"/>
<script type="text/javascript" src="${path}/static/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="${path}/static/js/test.js"></script>
<script type="text/javascript" src="${path}/static/js/date.js"></script><!--时间控件js-->
<script type="text/javascript" src="${path}/static/js/Verification.js"></script>
<script type="text/javascript">
function saves(){
	if($("#addname").val().trim() == ""){
		$("#notice").text("部门名称不能为空！");
		$(".ts_block").css("display","block");
		return false;
	}
	if($("#addinsystem").val().trim() == ""){
		$("#notice").text("请选择是否系统内部门！");
		$(".ts_block").css("display","block");
		return false;
	}
	if($("#addmanager").val().trim() == ""){
		$("#notice").text("负责人不能为空！");
		$(".ts_block").css("display","block");
		return false;
	}
	if($("#addcontact").val().trim() == ""){
		$("#notice").text("联系方式不能为空！");
		$(".ts_block").css("display","block");
		return false;
	}
	
	$.ajax({
        type: "POST",
        dataType: 'json',
        url: "cm_organization_save",
        data: $("#addFrom").serialize(),
        traditional: true,
        success: function(data){
        	if(data.status==0) {
        		$("#sucessNotice").text("部门保存成功！");
        		$(".cg_block").css("display","block");
            }else if(data.status == 1){
            	$("#updateNotice").text("部门修改成功！");
        		$(".cg_block").css("display","block");
            }else if(data.status == 2){
            	$("#notice").text("部门保存失败！");
        		$(".ts_block").css("display","block");
            }else if(data.status == 3){
            	$("#notice").text("部门修改失败！");
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
        url: "cm_organization_edit",
        data: {"id":id},
        traditional: true,
        success: function(data){
        	if(data.status==0) {
        		$("#id").val(data.id);
        		$("#addparentid").val(data.parentid);
        		$("#addparentname").val(data.parentname);
        		$("#addname").val(data.name);
        		$("#addcode").val(data.code);
        		$("#addmanager").val(data.manager);
        		$("#addcontact").val(data.contact);
        		
        		if(data.insystem){
        			$("#addinsystem").val(1);
        		}else{
        			$("#addinsystem").val(0);
        		}
        		
        		$("#addext").val(data.ext);
        		
        		if(data.parentid==undefined){
        			$("#delete").hide();
        			$("#peer").hide();
        			$("#subordinate").show();
        			$("#save").show();
        		}else if(data.parentid != "100001"){
        			$("#delete").show();
        			$("#peer").show();
        			$("#subordinate").hide();
        			$("#save").show();
        		}else{
        			$("#delete").show();
        			$("#peer").show();
        			$("#subordinate").show();
        			$("#save").show();
        		}
        		
        		$(".edit_block").css("display","block");
            }else if(data.status == 1){
            	$("#notice").text("部门不存在！");
        		$(".ts_block").css("display","block");
            }
        },
        error:function(){
 	 	}
    });
}
function deleteById(){
	if($("#id").val().trim() == ""){
		$("#notice").text("请选择要删除的部门！");
		$(".ts_block").css("display","block");
		return false;
	}
	$.ajax({
        type: "POST",
        dataType: 'json',
        url: "cm_organization_delete",
        data: {"id":$("#id").val().trim()},
        dataType: "json",
        success: function(data){
        	if(data.status==0) {
        		$("#sucessNotice").text("部门删除成功！");
        		$("#id").val("");
        		$("#addparentid").val("");
        		$("#addparentname").val("");
        		$("#addname").val("");
        		$("#addcode").val("");
        		$("#addmanager").val("");
        		$("#addcontact").val("");
        		$("#addinsystem").val("");
        		$("#addext").val("");
        		$(".cg_block").css("display","block");
            }else if(data.status == 1){
            	$("#notice").text("此部门下有下级部门，无法删除！");
        		$(".ts_block").css("display","block");
            }else if(data.status == 2){
            	$("#notice").text("此部门下有人员，无法删除！");
        		$(".ts_block").css("display","block");
            }else{
            	$("#sucessNotice").text("部门删除失败！");
        		$(".ts_block").css("display","block");
            }
        },
        error:function(){
 	 	}
    });
}
function peers(){
	if($("#id").val().trim() == ""){
		$("#notice").text("请选择一个部门！");
		$(".ts_block").css("display","block");
		return false;
	}
	$("#id").val("");
	//$("#addparentid").val(data.parentid);
	//$("#addparentname").val(data.parentname);
	$("#addname").val("");
	$("#addcode").val("");
	$("#addmanager").val("");
	$("#addcontact").val("");
	$("#addinsystem").val("");
	$("#addext").val("");
	
	$("#save").show();
}
function subordinates(){
	if($("#id").val().trim() == ""){
		$("#notice").text("请选择一个部门！");
		$(".ts_block").css("display","block");
		return false;
	}
	$("#addparentid").val($("#id").val().trim());
	$("#addparentname").val($("#addname").val().trim());
	$("#id").val("");
	$("#addname").val("");
	$("#addcode").val("");
	$("#addmanager").val("");
	$("#addcontact").val("");
	$("#addinsystem").val("");
	$("#addext").val("");
	$("#save").show();
}
</script>
<script type="text/javascript">
function treePropagation(){
	$('.tree li:has(ul)').addClass('parent_li').find(' > span').attr('title', '关闭');
	$('.tree li.parent_li > span').on('click', function (e) {
		var children = $(this).parent('li.parent_li').find(' > ul > li');
		if (children.is(":visible")) {
			children.hide('fast');
			$(this).attr('title', '展开').find(' > i').addClass('icon-plus-sign').removeClass('icon-minus-sign');
		} else {
			children.show('fast');
			$(this).attr('title', '关闭').find(' > i').addClass('icon-minus-sign').removeClass('icon-plus-sign');
		}
		e.stopPropagation();
	});
}
$(function(){
	$(".center").css("height",$(window).height()-90);
	var h = (window.innerHeight || (window.document.documentElement.clientHeight || window.document.body.clientHeight));
	$(".center").css({"height":h-90});
	window.onresize = resize;
	function resize(){
		var h = (window.innerHeight || (window.document.documentElement.clientHeight || window.document.body.clientHeight));
		$(".center").css({"height":h-90});
	}
});
$(document).ready(function(){
	$("#save").hide();
	$.ajax({
	    type: "POST",
	    dataType: 'json',
	    url: "cm_organization_showbyjson",
	    data: {"id":100001,"now":new Date()},
	    dataType: "json",
	    success: function(data){
	    	if(data.status==0) {
	    		var json =eval(data.jsons);
	    		tree(json);
	    		treePropagation();
	        }else{
	        	$("#sucessNotice").text("查询部门错误！");
	    		$(".ts_block").css("display","block");
	        }
	    },
	    error:function(){
		 	}
	});
	
	//成功提示弹出层
	$(".btn_tc_cg").click(function(){
		$(".cg_block").css("display","block");
	}); 
	$(".close_tc_btn").click(function(){
		$(".cg_block").css("display","none");
		$(".add_block").css("display","none");
		location.reload();
	});
	//提示弹出层
	$(".btn_tc_ts").click(function(){
		$(".ts_block").css("display","block");
	}); 
	$(".close_tc_ts_btn").click(function(){
		$(".ts_block").css("display","none");
	});
	//修改成功提示弹出层
	$(".btn_xg_cg").click(function(){
		$(".xg_cg_block").css("display","block");
	}); 
	//修改成功弹出层
	$(".close_xg_btn").click(function(){
		$(".xg_cg_block").css("display","none");
		$(".edit_block").css("display","none");
		location.reload();
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
		<h1 class="kzt_bt"><span>部门管理</span></h1>
			<!--树形图-->
			<div class="tree-cn">
				<div class="tree-cn-border">
					<div class="tree well">
						<ul id="rootUL">

						</ul>
					</div>
					<div class="tree-xk">
          				<form action="cm_organization_save" id="addFrom" name="addFrom" method="post">
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
			  			<tbody>
							<tr>
				  				<th width="20%" class="tree-bt">上级部门：</th>
				  				<th width="30%">
				  					<input type="text" readonly="readonly" id="addparentname" name="addparentname"/>
				  					<input type="hidden" id="addparentid" name="addparentid"/>
				  					<input type="hidden" id="id" name="id"/>
				  				</th>
							</tr>
							<tr>
				  				<td class="tree-bt"><span style="color: red;">*</span>部门名称：</td>
				  				<td><input type="text" id="addname" name="addname" maxlength="40"/></td>
							</tr>
							<tr>
				  				<td class="tree-bt">部门编码：</td>
				  				<td><input type="text" id="addcode" name="addcode" maxlength="20"/></td>
							</tr>
							<tr>
				  				<td class="tree-bt">部门介绍：</td>
				  				<td><textarea id="addext" name="addext"></textarea></td>
							</tr> 
							<tr>
				  				<td class="tree-bt"><span style="color: red;">*</span>是否系统内部门：</td>
				  				<td>
					  				<select id="addinsystem" name="addinsystem" >
								  		<option value=""></option>
								  		<option value="1">是</option>
								  		<option value="0">否</option>
							 		</select>
				  				</td>
							</tr>
							<tr>
				  				<td class="tree-bt"><span style="color: red;">*</span>部门负责人：</td>
				  				<td><input type="text" id="addmanager" name="addmanager" maxlength="10"/></td>
							</tr>
							<tr>
				  				<td class="tree-bt"><span style="color: red;">*</span>联系方式：</td>
				  				<td><input type="text" id="addcontact" name="addcontact" maxlength="15"/></td>
							</tr>
			  			</tbody>
			 			</table>
			 			<div style="height:10px;"></div>
			 			<div class="tc_btn">
			 				<input id="peer" name="peer" type="button" class="tc_btn_org" onclick="peers()" value="添加同级" />
			 				<input id="subordinate" name="subordinate" type="button" class="tc_btn_org" onclick="subordinates()" value="添加下级" />
			 				<input id="delete" name="delete" type="button" class="tc_btn_org" onclick="deleteById()" value="删除" />
			 				<input id="save" name="save" type="button" class="tc_btn_org" onclick="saves()" value="保存" />
			 			</div>
			 			</form>
					</div>
					<div class="clear"></div>
				</div>
			</div>
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
<!--修改成功弹出 START-->
<div class="bg_block cg_block">
  <div class="t_tcc">
    <div class="tcc_w">
      <div class="ts_img"><img src="${path}/static/images/tc_cg.png" alt=""/></div>
      <div class="ts_txt">操作成功！<br /><span id="updateNotice" name="updateNotice"></span></div>
      <div class="tc_btn"><input type="button" class="close_xg_btn" value="关闭" /></div>

    </div>
  </div>
</div>
<!--成功弹出 END--> 
</body>
</html>