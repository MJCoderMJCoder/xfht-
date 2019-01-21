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
</script>
<script type="text/javascript">
$(document).ready(function(){
	//添加弹出层
	$(".btn_tc_add").click(function(){
		$(".add_block").css("display","block");
	}); 
	$(".close_tc_btn").click(function(){
		$(".add_block").css("display","none");
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
	//修改弹出层
	$(".btn_tc_edit").click(function(){
		$(".edit_block").css("display","block");
	}); 
	$(".close_tc_edit").click(function(){
		$(".edit_block").css("display","none");
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

<script>
function deleteById(id){
	$.ajax({
        type: "POST",
        dataType: 'json',
        url: "cm_dictionary_delete",
        data: {"id":id},
        dataType: "json",
        success: function(data){
        	if(data.status==0) {
        		$("#sucessNotice").text("您已经删除了这条信息！");
        		$(".cg_block").css("display","block");
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
		$("#notice").text("您还没有选中！");
		$(".ts_block").css("display","block");
    	return false;
    }
	$.ajax({
        type: "POST",
        dataType: 'json',
        url: "cm_dictionary_batchdelete",
        data: {"ids":ids},
        traditional: true,
        dataType: "json",
        success: function(data){
        	if(data.status==0) {
        		$("#sucessNotice").text("您已经删除了这条信息！");
        		$(".cg_block").css("display","block");
        		//location.reload();
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
	if($("#addName").val().trim() == ""){
		$("#notice").text("名称不能为空！");
		$(".ts_block").css("display","block");
		return false;
	}
	if($("#addValue").val().trim() == ""){
		$("#notice").text("值不能为空！");
		$(".ts_block").css("display","block");
		return false;
	}
	if($("#addType").val().trim() == ""){
		$("#notice").text("字典项不能为空！");
		$(".ts_block").css("display","block");
		return false;
	}
	if($("#addSort").val().trim() == ""){
		$("#notice").text("排序不能为空！");
		$(".ts_block").css("display","block");
		return false;
	}
	$.ajax({
        type: "POST",
        dataType: 'json',
        url: "cm_dictionary_save",
        data: $("#addForm").serialize(),
        traditional: true,
        dataType: "json",
        success: function(data){
        	if(data.status==0) {
        		$("#sucessNotice").text("字典项保存成功！");
        		$(".cg_block").css("display","block");
        		//location.reload();
            }else if(data.status == 1){
            	$("#notice").text("字典项已存在！");
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
        url: "cm_dictionary_edit",
        data: {"id":id},
        traditional: true,
        dataType: "json",
        success: function(data){
        	if(data.status==0) {
        		$("#editId").val(data.id);
        		$("#editName").val(data.name);
        		$("#editValue").val(data.value);
        		$("#editType").val(data.type);
        		$("#editSort").val(data.sort);
        		$(".edit_block").css("display","block");
            }else if(data.status == 1){
            	$("#notice").text("字典项不存在！");
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
	if($("#editValue").val().trim() == ""){
		$("#notice").text("值不能为空！");
		$(".ts_block").css("display","block");
		return false;
	}
	if($("#editType").val().trim() == ""){
		$("#notice").text("字典项不能为空！");
		$(".ts_block").css("display","block");
		return false;
	}
	if($("#editSort").val().trim() == ""){
		$("#notice").text("排序不能为空！");
		$(".ts_block").css("display","block");
		return false;
	}
	$.ajax({
        type: "POST",
        dataType: 'json',
        url: "cm_dictionary_update",
        data: $("#editForm").serialize(),
        traditional: true,
        dataType: "json",
        success: function(data){
        	if(data.status==0) {
        		$("#updateNotice").text("字典项修改成功！");
        		$(".cg_block").css("display","block");
        		//location.reload();
            }else if(data.status == 1){
            	$("#notice").text("字典项不存在！");
        		$(".ts_block").css("display","block");
            }else if(data.status == 2){
            	$("#notice").text("字典项已存在！");
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
      	  	   	  <h1 class="kzt_bt"><span>字典管理</span></h1>
      	  	   	  <div class="select_eg">
					<table width="100%" border="0" cellpadding="0" cellspacing="0">
						  <tbody>
							<form action="cm_dictionary_list" id="searchForm" name="searchForm">
		        			<tr>
							  <td class="Txt_right">字典项分类：</td>
							  <td>
							  	<select id="type" name="type">
							  		<option value="">所有分类</option>
							  		<c:forEach items="${typeList }" var="typeV" varStatus="status">
							  		<c:choose> 
									<c:when test="${!empty type }">
										<c:choose> 
										<c:when test="${type == typeV }">
								  		<option value="${typeV }" selected = "selected">${typeV }</option>
										</c:when> 
										<c:otherwise>    
								  		<option value="${typeV }">${typeV }</option>
										</c:otherwise> 
										</c:choose>
									</c:when> 
									<c:otherwise>    
							  		<option value="${typeV }">${typeV }</option>
									</c:otherwise> 
									</c:choose>
									</c:forEach>
							  	</select>
							  </td>
							  <td><input type="submit" class="select_ss bt_small" value="搜 索" /></td>
							  <td ><input type="button" class="select_xz bt_small btn_tc_add" value="新增"  /></td>
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
							<th>ID</th> 
							<th>名称</th> 
							<th>值</th> 
							<th>字典项分类</th> 
							<th>排序</th> 
							<th>操作</th>
      	  	   	   	   </tr>
      	  	   	   	   <c:forEach items="${dictionarys }" var="dictionary" varStatus="status">
	      	  	   	   	   <tr> 
							 <td><input type="checkbox" id="chooseExport" name="chooseExport" value="${dictionary.id }" name="kzt_xz"/></td> 
							 <td>${dictionary.id }</td> 
							 <td>${dictionary.name }</td> 
							 <td>${dictionary.value }</td> 
							 <td>${dictionary.type }</td> 
							 <td>${dictionary.sort }</td> 
							 <td><a href="javascript:edit(${dictionary.id });">修改</a> | <a href="javascript:deleteById(${dictionary.id })">删除</a></td> 
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
<div class="bg_block add_block">
  <div class="s_tcc">
    <div class="tcc_title tcc_title_add"><a href="" class="title_close_btn"></a>添加字典</div>
    <div class="tcc_w">
      <div class="tc_tab">
          <form  action="cm_dictionary_save" id="addForm" name="addForm" method="post">
        <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table_one">
          <tbody>
            <tr>
              <td class="table_grey">名　　称：</td>
              <td><span>*</span> <input type="text" id="addName" name="addName" /></td>
            </tr>
            <tr>
              <td class="table_grey">  值     ：</td>
              <td><span>*</span> <input type="text" id="addValue" name="addValue"  /></td>
            </tr>
            <tr>
              <td class="table_grey">字  典  项：</td>
              <td><span>*</span> <input type="text"  id="addType" name="addType" /></td>
            </tr>
            <tr>
              <td class="table_grey">排　　序：</td>
              <td><span>*</span> <input type="text" id="addSort" name="addSort" value="10"/></td>
            </tr>
          </tbody>
        </table>
        </form>
      </div>
      <div class="tc_btn"><input type="button" class="tc_btn_org" onclick="save()" value="保存" /><input type="button" class="close_tc_btn" value="关闭" /></div>
    </div>
  </div>
</div>
<!--小弹出 END--> 
<!--修改 START-->
<div class="bg_block edit_block">
  <div class="s_tcc">
    <div class="tcc_title tcc_title_add"><a href="" class="title_close_btn"></a>修改字典</div>
    <div class="tcc_w">
      <div class="tc_tab">
          <form  action="cm_dictionary_update" id="editForm" name="editForm" method="post">
          <input type="hidden" id="editId" name="editId" value=""/>
        <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table_one">
          <tbody>
            <tr>
              <td class="table_grey">名　　称：</td>
              <td><span>*</span> <input type="text" id="editName" name="editName" /></td>
            </tr>
            <tr>
              <td class="table_grey">  值     ：</td>
              <td><span>*</span> <input type="text" id="editValue" name="editValue"  /></td>
            </tr>
            <tr>
              <td class="table_grey">字  典  项：</td>
              <td><span>*</span> <input type="text"  id="editType" name="editType" /></td>
            </tr>
            <tr>
              <td class="table_grey">排　　序：</td>
              <td><span>*</span> <input type="text" id="editSort" name="editSort" value="10"/></td>
            </tr>
          </tbody>
        </table>
        </form>
      </div>
      <div class="tc_btn"><input type="button" class="tc_btn_org" onclick="update()" value="保存" /><input type="button" class="close_tc_edit" value="关闭" /></div>
    </div>
  </div>
</div>
<!--成功弹出 START-->
<div class="bg_block cg_block" style="display: none;">
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
<div class="bg_block ts_block" style="display: none;">
  <div class="t_tcc">
    <div class="tcc_w">
      <div class="ts_img"><img src="${path}/static/images/tc_jg.png" alt=""/></div>
      <div class="ts_txt">警告！<br /><span id="notice" name="notice"></span></div>
      <div class="tc_btn"><input type="button" class="close_tc_ts_btn" value="关闭" /></div>

    </div>
  </div>
</div>
<!--成功弹出 END--> 
<!--小弹出 END--> 
<!--修改成功弹出 START-->
<div class="bg_block cg_block" style="display: none;">
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
