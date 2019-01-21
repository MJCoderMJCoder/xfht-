<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link type="text/css" href="${path}/static/css/style.css" rel="stylesheet"/>
<link type="text/css" href="${path}/static/css/public.css" rel="stylesheet"/>
<link type="text/css" href="${path}/static/css/other.css" rel="stylesheet"/>
<link type="text/css" href="${path}/static/css/tcc.css" rel="stylesheet"/>
<title></title>
<script type="text/javascript" src="${path}/static/js/jquery-1.11.1.min.js"></script> 
<script type="text/javascript" src="${path}/static/js/jquery.SuperSlide.2.1.js"></script> 
<script type="text/javascript" src="${path}/static/js/jquery.min.js"></script>
<script type="text/javascript" src="${path}/static/js/ajaxfileupload.js" ></script>
<script src="${path}/static/js/date.js"></script><!--时间控件js-->
<script type="text/javascript">//内容部分高度自适应
$(function(){
	$(".center").css("height",$(window).height()-170);
	//file_onchange();
	//edit_onchange();
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
function deleteById(id){
	$.ajax({
        type: "POST",
        dataType: 'json',
        url: "cm_role_delete",
        data: {"id":id},
        dataType: "json",
        success: function(data){
        	if(data.status==0) {
        		$("#sucessNotice").text("此角色信息删除成功！");
        		$(".cg_block").css("display","block");
        		/* alert("删除成功！");
        		location.reload(); */
            }else if(data.status == 1){
            	$("#notice").text("该角色已不存在！");
        		$(".ts_block").css("display","block");
            }else if(data.status == 2){
            	$("#notice").text("该角色下存在用户，请先删除该角色下的用户！");
        		$(".ts_block").css("display","block");
            }else{
            	$("#notice").text("角色删除失败！");
        		$(".ts_block").css("display","block");
            }
        },
        error:function(){
 	 	}
    });
}
function batchDelete(){
	var ids = [];
    $("input[name='chooseExport']:checked").each(function() {
    	ids.push($(this).val());
    });
    if (ids.length < 1) {
    	$("#notice").text("您还没有选中要删除的用户！");
		$(".ts_block").css("display","block");
    	return false;
    }
	$.ajax({
        type: "POST",
        dataType: 'json',
        url: "cm_role_batchdelete",
        data: {"ids":ids},
        traditional: true,
        dataType: "json",
        success: function(data){
        	if(data.status==0) {
        		$("#sucessNotice").text("角色信息删除成功！");
        		$(".cg_block").css("display","block");
            }else if(data.status == 1){
            	$("#notice").text("你所删除角色有存在用户，请先删除角色下的用户！");
        		$(".ts_block").css("display","block");
            }else{
            	$("#notice").text("角色删除失败，请先删除角色下的用户！");
        		$(".ts_block").css("display","block");
            }
        },
        error:function(){
 	 	}
    });
}
function save(){
	if($("#addName").val().trim() == ""){
		$("#notice").text("名称不能为空！");
		$(".ts_block").css("display","block");
		return false;
	}
	/* if($("#adddescribe").val().trim() == ""){
		$("#notice").text("描述不能为空！");
		$(".ts_block").css("display","block");
		return false;
	} */
	$.ajax({
        type: "POST",
        dataType: 'json',
        url: "cm_role_save",
        data: $("#addForm").serialize(),
        traditional: true,
        dataType: "json",
        success: function(data){
        	if(data.status==0) {
        		$("#sucessNotice").text("角色保存成功！");
        		$(".cg_block").css("display","block");
        		//location.reload();
            }else if(data.status == 2){
            	$("#notice").text("该角色已存在！");
        		$(".ts_block").css("display","block");
            }else{
            	$("#notice").text("角色保存失败！");
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
        url: "cm_role_edit",
        data: {"id":id},
        traditional: true,
        dataType: "json",
        success: function(data){
        	if(data.status==0) {
        		$("#id").val(data.id);
        		$("#editName").val(data.roleName);
        		$("#editdescribe").val(data.describe);
        		var rolePermissions = data.rolePermission;
        		if(data.functionModularIds != null){
        			var arr = data.functionModularIds.split(',');
        			var Jurisdiction = $("input[name='editJurisdiction']");
        			arr.forEach(function(value,index,array){
        			    for(var i=0;i<Jurisdiction.length;i++){
        			    	if(Jurisdiction[i].value==value){
        			    		Jurisdiction[i].checked=true;
        			    	}
        			    }
        			});
        		}
        		$(".edit_block").css("display","block");
            }else if(data.status == 1){
            	$("#notice").text("此角色不存在！");
        		$(".ts_block").css("display","block");
            }
        },
        error:function(){
 	 	}
    });
}
function update(){
	if($("#editName").val().trim() == ""){
		$("#notice").text("名称不能为空！");
		$(".ts_block").css("display","block");
		return false;
	}
	/* if($("#editdescribe").val().trim() == ""){
		$("#notice").text("描述不能为空！");
		$(".ts_block").css("display","block");
		return false;
	} */
	$.ajax({
        type: "POST",
        dataType: 'json',
        url: "cm_role_update",
        data: $("#editForm").serialize(),
        traditional: true,
        dataType: "json",
        success: function(data){
        	if(data.status==0) {
        		$("#updateNotice").text("角色修改成功！");
        		$(".cg_block").css("display","block");
        		//location.reload();
            }else if(data.status == 1){
            	$("#notice").text("角色不存在！");
        		$(".ts_block").css("display","block");
            }else if(data.status == 2){
            	$("#notice").text("该角色已存在！");
        		$(".ts_block").css("display","block");
            }else{
            	$("#notice").text("修改失败！");
        		$(".ts_block").css("display","block");
            }
        },
        error:function(){
 	 	}
    });
}
function onChooseAll(){
	var obj = document.getElementById('allChoose');
	if(obj.checked){
		var chooseExport=document.getElementsByName('chooseExport');
		for(var i=0;i<chooseExport.length;i++)
		{
			chooseExport[i].checked=true;
		}
	}else{
		var chooseExport=document.getElementsByName('chooseExport');
		for(var i=0;i<chooseExport.length;i++)
		{
			chooseExport[i].checked=false;
		}
	}
}

</script>
<script type="text/javascript">
$(document).ready(function(){
	//添加弹出层
	$(".select_add").click(function(){
		$(".zl_block").css("display","block");
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
	$(".close_tc_edit").click(function(){
		$(".edit_block").css("display","none");
	});
});
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
<jsp:include page="../include/system_left.jsp"></jsp:include>

<div class="pubilc_right fl">
      <div class="pubilc_right_cn">
      	  <div class="cfcx">
      	  	   <div class="cfcx_2">
      	  	   	  <h1 class="kzt_bt"><span>角色管理</span></h1>
      	  	   	  <div class="select_eg">
					<table width="100%" border="0" cellpadding="0" cellspacing="0">
						  <tbody>
							<form action="cm_role_list" id="searchForm" name="searchForm" method="post">
		        			<tr>
		          				<td class="Txt_right">角色名称：</td>
		          				<td><input type="text" id="s_name" name="s_name" value="${s_name }" /></td>
		        				<td>
		        					<input type="submit" class="select_ss bt_small" value="搜 索" />
		        					<input type="button" class="select_xz bt_small select_add" value="新增"  />
		        				</td>
		        			</tr>  
			        		</form>
							</tbody>
						</table>
						</div>
      	  	   </div>
      	  	   <div class="clear"></div>
      	  </div>
      	  <div class="kzt_table">
      	  	   <table id="Table" class="table_bg">
      	  	   	   <tbody>
      	  	   	   	   <tr>
     	  	   	   	   	  	<th width="50"></th> 
	 						<th>序号</th> 
	 						<th>角色名称</th>  
	 						<th>操作</th> 
      	  	   	   	   </tr>
      	  	   	   	   <c:forEach items="${roles }" var="role" varStatus="status">
						<tr class="bmdlb-tabletr2"> 
	 						<td>
		 						<c:if test="${role.id != 1 && role.id!=2}">
		 							<input type="checkbox" id="chooseExport" name="chooseExport" value="${role.id }" />
		 						</c:if>
	 						</td> 
	 						<td>${role.id }</td> 
	 						<td>${role.roleName}</td>  
	 						<td>
	 							<a href="javascript:edit(${role.id })" class="wz_blue">修改</a>
	 							<c:if test="${role.id != 1 && role.id!=2 }">
	 								<span class="bmdlb-tabletr2tdspan">|</span>
	 								<a href="javascript:deleteById(${role.id })" class="wz_blue">删除</a>
	 							</c:if>
	 						</td> 
						</tr> 
						</c:forEach>
      	  	   	   </tbody>
      	  	   </table>
      	  </div>
    	         <div class="xz_table">
     	   			<a href="javascript:void(0);"><input type="checkbox" id="allChoose" name="allChoose" onclick="onChooseAll()"/>全选</a>|
     	   			<a href="javascript:batchDelete()">删除</a>
     	   		</div>
      	  <jsp:include page="../include/page.jsp"></jsp:include>
      </div>
</div>
</div>


<!--添加 START-->
<div class="bg_block zl_block">
  <div class="b_tcc">
    <div class="tcc_title tcc_title_add"><a href="" class="title_close_btn"></a>添加角色</div>
    <div class="tcc_w">
      <div class="tc_tab">
          <form  action="cm_role_save" id="addForm" name="addForm" method="post">
        <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table_one">
          <tbody>
            <tr>
              	<td class="table_grey">名　　称：</td>
              	<td colspan="2"><span>*</span> <input type="text" id="addName" name="addName" /></td>
            </tr>
            <tr>
              	<td class="table_grey">描　　述：</td>
              	<td colspan="2"><input type="text" id="adddescribe" name="adddescribe" /></td>
            </tr>
            <tr>
            	<td rowspan="${modularsize }" class="table_grey">权　　限：</td>
            	<td class="table_grey2">模块名称</td>
            	<td class="table_grey2">模块权限</td>
            </tr>
             <c:forEach items="${functionModulars }" var="fm1" varStatus="status">
            <tr>
            	<td class="table_list_ppg"><p>${fm1.moduleName }</p></td>
              	<td class="ppg_tdcheckbox"><input type="checkbox" id="addJurisdiction" name="addJurisdiction" value="${fm1.id }" class="ppg_checkbox"/></td>
            </tr>
            	<c:if test="${not empty fm1.childs}">
	            	<c:forEach items="${fm1.childs }" var="fm2" varStatus="status">
	            	<tr>
	            		<td class="table_list_ppg2"><p>${fm2.moduleName }</p></td>
	              		<td class="ppg_tdcheckbox"><input type="checkbox" id="addJurisdiction" name="addJurisdiction" value="${fm2.id }" class="ppg_checkbox"/></td>
	            	</tr>
		            	<c:if test="${not empty fm2.childs}">
	            		<c:forEach items="${fm2.childs }" var="fm3" varStatus="status">
	            		<tr>
	            			<td class="table_list_ppg3"><p>${fm3.moduleName }</p></td>
	            			<td class="ppg_tdcheckbox"><input type="checkbox" id="addJurisdiction" name="addJurisdiction" value="${fm3.id }" class="ppg_checkbox"/></td>
	            		</tr>
	            		</c:forEach>
	            		</c:if>
            		</c:forEach>
            	</c:if>
            </c:forEach>
            
          </tbody>
        </table>
        </form>
      </div>
      <div class="tc_btn"><input type="button" class="tc_btn_green" onclick="save()" value="保存" /><input type="button" class="close_tc_btn" value="关闭" /></div>
    </div>
  </div>
</div>
<!--小弹出 END--> 	
<!--修改 START-->
<div class="bg_block edit_block">
  <div class="b_tcc">
    <div class="tcc_title tcc_title_zl"><a href="" class="title_close_btn"></a>修改角色</div>
    <div class="tcc_w">
      <div class="tc_tab">
          <form  action="cm_role_update" id="editForm" name="editForm" method="post">
          <input type="hidden" id="editId" name="editId" value=""/>
        <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table_one">
          <tbody>
            <tr>
              <td class="table_grey">名　　称：</td>
              <td colspan="2"><span>*</span> <input type="text" id="editName" name="editName" /><input type="hidden" id="id" name="id"></td>
            </tr>
            <tr>
              <td class="table_grey">描　　述：</td>
              <td colspan="2"><input type="text" id="editdescribe" name="editdescribe" /></td>
            </tr>
            <tr>
            	<td rowspan="${modularsize }" class="table_grey">权　　限：</td>
            	<td class="table_grey2">模块名称</td>
            	<td class="table_grey2">模块权限</td>
            </tr>
            <c:forEach items="${functionModulars }" var="fm1" varStatus="status">
            <tr>
            	<td class="table_list_ppg"><p>${fm1.moduleName }</p></td>
              	<td class="ppg_tdcheckbox"><input type="checkbox" id="addJurisdiction" name="editJurisdiction" value="${fm1.id }"  class="ppg_checkbox"/></td>
            </tr>
            	<c:if test="${not empty fm1.childs}">
	            	<c:forEach items="${fm1.childs }" var="fm2" varStatus="status">
	            	<tr>
	            		<td class="table_list_ppg2"><p>${fm2.moduleName }</p></td>
	              		<td class="ppg_tdcheckbox"><input type="checkbox" id="addJurisdiction" name="editJurisdiction" value="${fm2.id }"  class="ppg_checkbox"/></td>
	            	</tr>
		            	<c:if test="${not empty fm2.childs}">
	            		<c:forEach items="${fm2.childs }" var="fm3" varStatus="status">
	            		<tr>
	            			<td class="table_list_ppg3"><p>${fm3.moduleName }</p></td>
	            			<td class="ppg_tdcheckbox"><input type="checkbox" id="addJurisdiction" name="editJurisdiction" value="${fm3.id }"  class="ppg_checkbox"/></td>
	            		</tr>
	            		</c:forEach>
	            		</c:if>
            		</c:forEach>
            	</c:if>
            </c:forEach>
            
          </tbody>
        </table>
        </form>
      </div>
      <div class="tc_btn"><input type="button" class="tc_btn_green" onclick="update()" value="保存" /><input type="button" class="close_tc_edit" value="关闭" /></div>
    </div>
  </div>
</div>
<!--修改END-->
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
