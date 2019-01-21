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
	file_onchange();
	edit_onchange();
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

function vs_phone(text){
	var reg = /^1[3|4|5|7|8][0-9]{9}$/;
	if (!reg.test(text)) {
		return false;
	}
	return true;
}

function deleteById(id){
	$.ajax({
        type: "POST",
        dataType: 'json',
        url: "cm_user_delete",
        data: {"id":id},
        dataType: "json",
        success: function(data){
        	if(data.status==0) {
        		$("#sucessNotice").text("此用户信息删除成功！");
        		$(".cg_block").css("display","block");
        		/* alert("删除成功！");
        		location.reload(); */
            }else{
            	$("#sucessNotice").text("此用户信息删除失败！");
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
        url: "cm_user_batchdelete",
        data: {"ids":ids},
        traditional: true,
        dataType: "json",
        success: function(data){
        	if(data.status==0) {
        		$("#sucessNotice").text("此用户信息删除成功！");
        		$(".cg_block").css("display","block");
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
function save(){
	if($("#addusername").val().trim() == ""){
		$("#notice").text("用户名不能为空！");
		$(".ts_block").css("display","block");
		return false;
	}
	if($("#adddescription").val().trim() == ""){
		$("#notice").text("姓名不能为空！");
		$(".ts_block").css("display","block");
		return false;
	}
	var password = $("#addpassword").val().trim();
	if(password == ""){
		$("#notice").text("密码不能为空！");
		$(".ts_block").css("display","block");
		return false;
	}
	var password1 = $("#addpassword1").val().trim();
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
	
	var addsex = $("#addsex").val();
	if(addsex.trim() == ""){
		$("#notice").text("性别不能为空！");
		$(".ts_block").css("display","block");
		return false;
	}
	var addorganization = $("#addorganization").val();
	if(addorganization.trim() == ""){
		$("#notice").text("部门不能为空！");
		$(".ts_block").css("display","block");
		return false;
	}
	var addrole = $("#addrole").val();
	if(addrole.trim() == ""){
		$("#notice").text("角色不能为空！");
		$(".ts_block").css("display","block");
		return false;
	}
	
	if($("#addtelephone").val().trim() == ""){
		$("#notice").text("联系方式不能为空！");
		$(".ts_block").css("display","block");
		return false;
	}
	if (!vs_phone($("#addtelephone").val().trim())) {
		$("#notice").text("联系方式格式不正确！");
		$(".ts_block").css("display","block");
		return false;
	}
	
	$.ajax({
        type: "POST",
        dataType: 'json',
        url: "cm_user_save",
        data: $("#addFrom").serialize(),
        traditional: true,
        success: function(data){
        	if(data.status==0) {
        		$("#sucessNotice").text("用户保存成功！");
        		$(".cg_block").css("display","block");
        		//location.reload();
            }else if(data.status == 1){
            	$("#notice").text("用户已存在,请修改用户名！");
        		$(".ts_block").css("display","block");
            }else{
            	$("#notice").text("用户保存失败！");
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
        url: "cm_user_edit",
        data: {"id":id},
        traditional: true,
        success: function(data){
        	if(data.status==0) {
        		$("#editId").val(data.id);
        		$("#editusername").val(data.username);
        		$("#editdescription").val(data.description);
        		$("#editIDNumber").val(data.IDNumber);
        		$("#editsex").val(data.sex);
        		$("#editorganization").val(data.organization);
        		$("#editrole").val(data.role);
        		$("#editposition").val(data.position);
        		$("#editenabled").val(data.enabled);
        		$("#edittelephone").val(data.telephone);
        		$("#editemail").val(data.email);

        		if(data.imagePath != null){
					$("#editfilePath").val(data.imagePath);
					$("#editImage").attr("src",data.imagePath);
					document.getElementById("editfileName").innerHTML = data.imagePath.split('/')[data.imagePath.split('/').length-1];
        		}
        		
        		$(".edit_block").css("display","block");
            }else if(data.status == 1){
            	$("#notice").text("用户不存在！");
        		$(".ts_block").css("display","block");
            }
        },
        error:function(){
 	 	}
    });
}
function update(){
	if($("#editdescription").val().trim() == ""){
		$("#notice").text("姓名不能为空！");
		$(".ts_block").css("display","block");
		return false;
	}
	var password = $("#editpassword").val().trim();
	if(password != ""){
		var password1 = $("#editpassword1").val().trim();
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
	}
	
	var editorganization = $("#editorganization").val();
	if(editorganization.trim() == ""){
		$("#notice").text("部门不能为空！");
		$(".ts_block").css("display","block");
		return false;
	}
	var editrole = $("#editrole").val();
	if(editrole.trim() == ""){
		$("#notice").text("角色不能为空！");
		$(".ts_block").css("display","block");
		return false;
	}
	
	if($("#edittelephone").val().trim() == ""){
		$("#notice").text("联系方式不能为空！");
		$(".ts_block").css("display","block");
		return false;
	}
	if (!vs_phone($("#edittelephone").val().trim())) {
		$("#notice").text("联系方式格式不正确！");
		$(".ts_block").css("display","block");
		return false;
	}
	
	$.ajax({
        type: "POST",
        dataType: 'json',
        url: "cm_user_update",
        data: $("#editForm").serialize(),
        traditional: true,
        success: function(data){
        	if(data.status==0) {
        		$("#updateNotice").text("修改用户成功！");
        		$(".cg_block").css("display","block");
        		//location.reload();
            }else if(data.status == 1){
            	$("#notice").text("用户不存在！");
        		$(".ts_block").css("display","block");
            }else{
            	$("#notice").text("修改用户失败！");
        		$(".ts_block").css("display","block");
            }
        },
        error:function(){
 	 	}
    });
}
function close(){
	$(".zl_block").css("display","none");
	$(".edit_block").css("display","none");
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
      	  	   	  <h1 class="kzt_bt"><span>用户管理</span></h1>
      	  	   	  <div class="select_eg">
					<table width="100%" border="0" cellpadding="0" cellspacing="0">
						  <tbody>
							<form action="cm_user_list" id="searchForm" name="searchForm" method="post">
		        			<tr>
		          				<td class="Txt_right">姓名：</td>
		          				<td><input type="text" id="s_description" name="s_description" value="${s_description }" /></td>
		          				<td class="Txt_right">用户名：</td>
		          				<td><input type="text" id="s_username" name="s_username" value="${s_username }" /></td>
		          				<td class="Txt_right">身份证号：</td>
		          				<td ><input type="text" id="s_IDNumber" name="s_IDNumber" value="${s_IDNumber }" /></td>
		          				<td class="Txt_right">性别：</td>
		          				<td>
		          					<select id="s_sex" name="s_sex" >
								  		<option value=""></option>
									  	<c:forEach items="${genderList }" var="group" varStatus="status">
									  	<option value="${group.id }" <c:if test="${group.id == s_sex}">selected="selected"</c:if>>${group.name }</option>
									  	</c:forEach>
								 	</select>
		          				</td>
		        			</tr>
		        			<tr>
		        			  <td class="Txt_right">联系方式：</td>
		          			  <td><input type="text" id="s_telephone" name="s_telephone" value="${s_telephone }" /></td>
							  <td class="Txt_right">角色：</td>
							  <td>
							  		<select id="s_role" name="s_role" >
								  		<option value=""></option>
									  	<c:forEach items="${roleList }" var="group" varStatus="status">
									  	<option value="${group.id }" <c:if test="${group.id == s_role}">selected="selected"</c:if>>${group.roleName }</option>
									  	</c:forEach>
								 	</select>
							  </td>       
							  <td class="Txt_right">部门：</td>
							  <td>
							  		<select id="s_organization" name="s_organization" >
								  		<option value=""></option>
									  	<c:forEach items="${organizationList }" var="group" varStatus="status">
									  	<option value="${group.id }" <c:if test="${group.id == s_organization}">selected="selected"</c:if>>${group.name }</option>
									  	</c:forEach>
								 	</select>
							  </td>  
							</tr>
		        			<tr>
		        				<td colspan="8">
		        					<div class="select_btn">
		        						<input type="submit" class="select_ss bt_small" value="搜 索" />
		        						<input type="button" class="select_xz bt_small select_add" value="新增"  />
		        					</div>
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
	 						<th>用户名</th> 
	 						<th>姓名</th> 
	 						<th>性别</th> 
	 						<th>身份证号</th> 
	 						<th>联系方式</th> 
	 						<th>邮箱</th> 
	 						<th>部门</th> 
	 						<th>职位</th> 
	 						<th>角色</th> 
	 						<th>照片</th>
	 						<th>状态</th> 
	 						<th>操作</th>
      	  	   	   	   </tr>
      	  	   	   	   <c:forEach items="${userList }" var="obj" varStatus="status">
	      	  	   	   	   <tr>
	     	  	   	   	   	<td>
	     	  	   	   	   	<c:if test="${obj.id != 1}">
	     	  	   	   	   		<input type="checkbox" id="chooseExport" name="chooseExport" value="${obj.id }"/>
	     	  	   	   	   	</c:if>
	     	  	   	   	   	</td>
	      	  	   	   	   	<td>${obj.id }</td> 
	 						<td>${obj.username}</td>  
	 						<td>${obj.description}</td> 
	 						<td>${obj.sex.name}</td> 
	 						<td>${obj.IDNumber}</td> 
	 						<td>${obj.telephone}</td> 
	 						<td>${obj.email}</td> 
	 						<td>${obj.organization.name}</td> 
	 						<td>${obj.position}</td> 
	 						<td>${obj.role.roleName}</td>
	 						<td>
		 						<c:choose>
									<c:when test="${obj.image != null}">
										<img src="${obj.image}" style="width: 42px;height: 59.18px" />
									</c:when>
								</c:choose>
	 						</td>
	 						<td class="wx_yellow">${obj.enabled?"正常":"禁用"}</td> 
	      	  	   	   	   	<td>
	      	  	   	   	   		<a href="javascript:edit(${obj.id })">修改</a>  
	      	  	   	   	   		<c:if test="${obj.id != 1}">
	      	  	   	   	   			| <a href="javascript:deleteById(${obj.id })">删除</a>
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
    <div class="tcc_title tcc_title_zl"><a href="javascript:close();" class="title_close_btn"></a>添加用户</div>
    <div class="tcc_w">
          <form  action="cm_user_save" id="addFrom" name="addFrom" method="post">
      <div class="tc_tab">
        <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table_one">
          <tbody>
            <tr>
              <td class="table_grey">用户名：</td>
              <td><span>*</span> 
              	<input type="text" id="addusername" name="addusername" />
              </td>
              <td class="table_grey" rowspan="6">人像照片：</td>
              <td rowspan="6">
              	<div class="tanle_rx">
                	<img name="addImage" id="addImage" src="${path}/static/images/camera.png">
                </div>
                <div class="file_wai2">
                	<div class="upfile2">  
                  		<p id="addfileName"></p>  
                  		<label for="addfile" id="addupFile">上&nbsp;&nbsp;&nbsp;传</label>  
                  		<input type="file" id="addfile" name="addfile" style="display: none;">  
                  		<input type="hidden" id="addfilePath" name="addfilePath" value=""/>
                	</div>  
                	<script>  //文件上传
                	function file_onchange(){
	                	$("#addfile").on("change",function(){  
							if ($("#addfile").val() == "") {
								return;
							}
							$.ajaxFileUpload({
				            	url:"cm_user_addimage_upload",
				            	type:"post",
				            	secureuri: false, //是否需要安全协议，一般设置为false
								fileElementId: 'addfile', //文件上传域的ID
								dataType: 'JSON', //返回值类型 一般设置为json
				            	success:function(data){
				            		data = JSON.parse(data);
				            		if (data.status==0) {
				    					$("#addfilePath").val(data.imagePath);
				            			var name = data.path.split("/");
				    					document.getElementById("addfileName").innerHTML = name[name.length - 1];
				    					var url = data.path.split("\\");
				    					$("#addImage").attr("src",url[url.length - 1]);
				    					//document.getElementById("fileImg1").innerHTML = "<img src='"+ url[url.length - 1] +"' id='photo'>";
				            		} else if (data.status==1) {
				            			alert("上传图片不能为空！");
				            		} else if (data.status==2) {
				            			alert("上传图片不能超过5M！");
				            		} else if (data.status==3) {
				            			alert("请上传后缀名为jpg、bmp、png的图片！！");
				            		}
				            		file_onchange();
				            	},
				            	error:function(e){
				            		//请求出错处理
									alert("系统错误。");
				            	}
				        	}); 
						});
                	}
					</script> 
              	</div>
              </td>
            </tr>
            <tr>
            	<td class="table_grey">姓名 ：</td>
              <td><span>*</span> <input type="text" id="adddescription" name="adddescription"  /></td>
            </tr>
            <tr>
              <td class="table_grey">密码：</td>
              <td><span>*</span> <input type="password" id="addpassword" name="addpassword"/></td>
            </tr>
            <tr>
            	<td class="table_grey">确认密码：</td>
            	<td><span>*</span> <input type="password" id="addpassword1" name="addpassword1"/></td>
            </tr>
            <tr>
              <td class="table_grey">身份证号：</td>
              <td><input type="text" id="addIDNumber" name="addIDNumber"/></td>
            </tr>
            <tr>
            	<td class="table_grey">性别：</td>
              	<td><span>*</span>
              		<select id="addsex" name="addsex" >
				  		<option value=""></option>
					  	<c:forEach items="${genderList }" var="group" varStatus="status">
					  	<option value="${group.id }">${group.name }</option>
					  	</c:forEach>
				 	</select>
              	</td>
            </tr>
            <tr>
              <td class="table_grey">部门：</td>
              <td> <span>*</span>
              	<select id="addorganization" name="addorganization">
              		<option value=""></option>
              		<c:forEach items="${organizationList}" var="obj" varStatus="status">
              		<option value="${obj.id }">${obj.getName() }</option>
              		</c:forEach>
	  			</select>
              </td>
              <td class="table_grey">角色：</td>
              <td> <span>*</span>
              	<select id="addrole" name="addrole">
              		<option value=""></option>
              		<c:forEach items="${roleList}" var="obj" varStatus="status">
              		<option value="${obj.id }">${obj.getRoleName() }</option>
              		</c:forEach>
	  			</select>
              </td>
            </tr>
            <tr>
              <td class="table_grey">职位：</td>
              <td><input type="text" id="addposition" name="addposition" /></td>
              <td class="table_grey">是否禁用：</td>
              <td>
              	<select id="addenabled" name="addenabled">
	  				<option value="1">正常</option>
	  				<option value="0">禁用</option>
	  			</select>
              </td>
            </tr>
            <tr>
              <td class="table_grey">联系方式：</td>
              <td><span>*</span> <input type="text" id="addtelephone" name="addtelephone"/></td>
              <td class="table_grey">邮箱：</td>
              <td><input type="text" id="addemail" name="addemail"/></td>
            </tr>
          </tbody>
        </table>
      </div>
      <div class="tc_btn"><input type="button" class="tc_btn_org" onclick="save()" value="保存" /><input type="button" class="close_tc_btn" value="关闭" /></div>
        </form>
    </div>
  </div>
</div>
<!--小弹出 END--> 
<!--修改 START-->
<div class="bg_block edit_block">
  <div class="b_tcc">
    <div class="tcc_title tcc_title_zl"><a href="javascript:close();" class="title_close_btn"></a>修改用户</div>
    <div class="tcc_w">
          <form  action="cm_user_update" id="editForm" name="editForm" method="post">
      <div class="tc_tab">
        <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table_one">
          <tbody>
            <tr>
              <td class="table_grey">用户名：</td>
              <td><span>*</span> 
              	<input type="text" id="editusername" name="editusername" disabled="disabled"/>
              	<input type="hidden" id="editId" name="editId">
              </td>
              <td class="table_grey" rowspan="6">人像照片：</td>
              <td rowspan="6">
              	<div class="tanle_rx">
                	<img name="editImage" id="editImage" src="${path}/static/images/camera.png">
                </div>
                <div class="file_wai2">
                	<div class="upfile2">  
                  		<p id="editfileName"></p>  
                  		<label for="editfile" id="editupFile">上&nbsp;&nbsp;&nbsp;传</label>  
                  		<input type="file" id="editfile" name="editfile" style="display: none;">  
                  		<input type="hidden" id="editfilePath" name="editfilePath" value=""/>
                	</div>  
                	<script>  //文件上传
					function edit_onchange(){
	                	$("#editfile").on("change",function(){  
							if ($("#editfile").val() == "") {
								return;
							}
							$.ajaxFileUpload({
				            	url:"cm_user_editimage_upload",
				            	type:"post",
				            	secureuri: false, //是否需要安全协议，一般设置为false
								fileElementId: 'editfile', //文件上传域的ID
								dataType: 'JSON', //返回值类型 一般设置为json
				            	success:function(data){
				            		data = JSON.parse(data);
				            		if (data.status==0) {
				    					$("#editfilePath").val(data.imagePath);
				            			var name = data.path.split("/");
				    					document.getElementById("editfileName").innerHTML = name[name.length - 1];
				    					var url = data.path.split("\\");
				    					$("#editImage").attr("src",url[url.length - 1]);
				    					//document.getElementById("editImage").innerHTML = "<img src='"+ url[url.length - 1] +"' id='photo'>";
				            		} else if (data.status==1) {
				            			alert("上传图片不能为空！");
				            		} else if (data.status==2) {
				            			alert("上传图片不能超过5M！");
				            		} else if (data.status==3) {
				            			alert("请上传后缀名为jpg、bmp、png的图片！！");
				            		}
				            		edit_onchange();
				            	},
				            	error:function(e){
				            		//请求出错处理
									alert("系统错误。");
				            	}
				        	}); 
						}); 
                	}
					</script> 
              	</div>
              </td>
            </tr>
            <tr>
              <td class="table_grey">姓名 ：</td>
              <td><span>*</span> <input type="text" id="editdescription" name="editdescription"  /></td>
            </tr>
            <tr>
              <td class="table_grey">密码：</td>
              <td><input type="password" id="editpassword" name="editpassword"/></td>
            </tr>
            <tr>
              <td class="table_grey">确认密码：</td>
              <td><input type="password" id="editpassword1" name="editpassword1"/></td>
            </tr>
            <tr>
              <td class="table_grey">身份证号：</td>
              <td><input type="text" id="editIDNumber" name="editIDNumber"/></td>
            </tr>
            <tr>
              <td class="table_grey">性别：</td>
              <td><span>*</span>
            	<select id="editsex" name="editsex" >
			  		<option value=""></option>
				  	<c:forEach items="${genderList }" var="group" varStatus="status">
				  	<option value="${group.id }">${group.name }</option>
				  	</c:forEach>
		 		</select>
             </td>
            </tr>
            <tr>
              <td class="table_grey">部门：</td>
              <td> 
              	<select id="editorganization" name="editorganization">
	  				<option value=""></option>
              		<c:forEach items="${organizationList}" var="obj" varStatus="status">
              		<option value="${obj.id }">${obj.getName() }</option>
              		</c:forEach>
	  			</select>
              </td>
              <td class="table_grey">角色：</td>
              <td><span>*</span> 
              	<select id="editrole" name="editrole">
	  				<option value=""></option>
              		<c:forEach items="${roleList}" var="obj" varStatus="status">
              		<option value="${obj.id }">${obj.getRoleName() }</option>
              		</c:forEach>
	  			</select>
              </td>
            </tr>
            <tr>
              <td class="table_grey">职位：</td>
              <td><input type="text" id="editposition" name="editposition" /></td>
              <td class="table_grey">是否禁用：</td>
              <td>
              	<select id="editenabled" name="editenabled">
	  				<option value="1">正常</option>
	  				<option value="0">禁用</option>
	  			</select>
              </td>
            </tr>
            <tr>
              <td class="table_grey">联系方式：</td>
              <td><span>*</span> <input type="text" id="edittelephone" name="edittelephone"/></td>
              <td class="table_grey">邮箱：</td>
              <td><input type="text" id="editemail" name="editemail"/></td>
            </tr>
            <tr>
            <td colspan="4"><span style="text-align:left;">注：密码为空保存时密码为原始密码</span> </td>
            </tr>
          </tbody>
        </table>
      </div>
      <div class="tc_btn"><input type="button" class="tc_btn_org" onclick="update()" value="保存" /><input type="button" class="close_tc_edit" value="关闭" /></div>
        </form>
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
