<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>上级交办</title>

<link type="text/css" href="${path}/static/css/style.css" rel="stylesheet" />
<link type="text/css" href="${path}/static/css/public.css" rel="stylesheet" />
<link type="text/css" href="${path}/static/css/other.css" rel="stylesheet" />
<link type="text/css" href="${path}/static/css/tcc.css" rel="stylesheet" />

<script type="text/javascript" src="${path}/static/js/jquery.min.js"></script>
<script type="text/javascript" src="${path}/static/js/jquery-1.11.1.min.js"></script>
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
	$(document).ready(function(){
		//成功提示弹出层
		$(".close_tc_cg_btn").click(function(){
			$(".cg_block").css("display","none");
			location.reload();
		});
		//提示弹出层
		$(".close_tc_ts_btn").click(function(){
			$(".ts_block").css("display","none");
		});
	});
</script>
<!--控制表格奇数偶数颜色不一样开始----------------------->
<script type="text/javascript" language="javascript">      	$(document).ready(function(){  
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
<script type="text/javascript">
	function add() {
		var form = $("<form>");   //定义一个form表单
	    form.attr('style', 'display:none');   //在form表单中添加查询参数
	    form.attr('target', '');
	    form.attr('method', 'post');
	    form.attr('action', "cm_superior_assign_add");
		
		$(document.body).append(form);
		form.submit();
	}
	
	function resetFuc() {
		$("#assignNumber").val("");
		$("#assignCompany").val("");
		$("#assignModality").val("");
		$("#matterCategory").val("");
		$("#startTimeTemp").val("");
		$("#endTimeTemp").val("");
	}
	
	function importFuc() {
		var form = $("<form>");   //定义一个form表单
	    form.attr('style', 'display:none');   //在form表单中添加查询参数
	    form.attr('target', '');
	    form.attr('method', 'post');
	    form.attr('action', "cm_superior_assign_import_show");
		
		$(document.body).append(form);
		form.submit();
	}
	
	function look(id) {
		var form = $("<form>");   //定义一个form表单
	    form.attr('style', 'display:none');   //在form表单中添加查询参数
	    form.attr('target', '');
	    form.attr('method', 'post');
	    form.attr('action', "cm_superior_assign_look");
		
		var guestbookId = $('<input>');
		guestbookId.attr('type', 'hidden');
		guestbookId.attr('name', 'guestbookId');
		guestbookId.attr('value', id);
		
		form.append(guestbookId);
		
		$(document.body).append(form);
		form.submit();
	}
	
	function edit(id) {
		var form = $("<form>");   //定义一个form表单
	    form.attr('style', 'display:none');   //在form表单中添加查询参数
	    form.attr('target', '');
	    form.attr('method', 'post');
	    form.attr('action', "cm_superior_assign_edit");
		
		var guestbookId = $('<input>');
		guestbookId.attr('type', 'hidden');
		guestbookId.attr('name', 'guestbookId');
		guestbookId.attr('value', id);
		
		form.append(guestbookId);
		
		$(document.body).append(form);
		form.submit();
	}
	
	function deleteById(id) {
// 		var msg = "您真的确定要删除吗？";
//         if (confirm(msg)==false){
//         	return;
//         }
		$.ajax({
            url:"cm_superior_assign_delete",
            type:"post",
            data:{id:id},
            success:function(data){
            	data = JSON.parse(data);
            	if (data.status==0) {
            		$("#sucessNotice").text("您已经删除了这条信息！");
            		$(".cg_block").css("display","block");
            	} else if (data.status==1) {
            		$("#warningNotice").text("删除失败！");
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
	
	function imageRecognition(id) {
		var form = $("<form>");   //定义一个form表单
	    form.attr('style', 'display:none');   //在form表单中添加查询参数
	    form.attr('target', '');
	    form.attr('method', 'post');
	    form.attr('action', "cm_superior_assign_image_list");
		
		var guestbookId = $('<input>');
		guestbookId.attr('type', 'hidden');
		guestbookId.attr('name', 'guestbookId');
		guestbookId.attr('value', id);
		
		form.append(guestbookId);
		
		$(document.body).append(form);
		form.submit();
	}
	
	function check(id) {
		$.ajax({
            url:"cm_superior_assign_check",
            type:"post",
            data:{guestbookId:id},
            success:function(data){
            	data = JSON.parse(data);
            	if (data.status==0) {
            		$("#sucessNotice").text("提交审核成功！");
            		$(".cg_block").css("display","block");
            	} else if (data.status==1) {
            		$("#warningNotice").text("此条信访数据信息填写不全，请检查并修改后再提交审核！");
            		$(".ts_block").css("display","block");
            	} else {
            		$("#warningNotice").text("提交审核失败！");
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
</script>
</head>
<body>
    <jsp:include page="../../include/top.jsp"></jsp:include>
    <div class="center">
        <jsp:include page="../../include/public_voice_register_left.jsp"></jsp:include>
        <div class="pubilc_right fl">
        	<div id="ContainerPanel" style="display:none;"><div id="calendarPanel" style="position: absolute;display: none;z-index: 9999;background: #fff;border: 1px solid #ccc;width:200px;font:12px/18px 微软雅黑;margin-left:25px;"></div></div>
            <div class="pubilc_right_cn">
                <div class="cfcx">
                    <div class="cfcx_2">
                        <h1 class="kzt_bt">
                            <span>上级交办</span>
                        </h1>
                        <form id="searchForm" action="cm_superior_assign_list" method="post">
		                    <div class="select_eg">
		                        <table width="100%" border="0" cellpadding="0" cellspacing="0">
		                            <tbody>
		                                <tr>
		                                    <td class="Txt_right">上级交办号：</td>
		                                    <td><input type="text" id="assignNumber" name="assignNumber" value="${assignNumber}" placeholder="请输入上级交办号"/></td>
		                                    <td class="Txt_right">交办人单位：</td>
		                                    <td><input type="text" id="assignCompany" name="assignCompany" value="${assignCompany}" placeholder="请输入交办单位"/></td>
		                                    <td class="Txt_right">交办形式：</td>
		                                    <td>
		                                        <select id="assignModality" name="assignModality">
		                                            <option value="">==请选择==</option>
		                                            <c:forEach items="${assignModalityList}" var="list">
												        <option value="${list.name}" ${assignModality==list.name?'selected':''}>${list.name}</option>
												    </c:forEach>
		                                        </select>
		                                    </td>
		                                    <td class="Txt_right">所属问题：</td>
		                                    <td>
		                                        <select id="matterCategory" name="matterCategory">
		                                            <option value="">==请选择==</option>
		                                            <c:forEach items="${matterCategoryList}" var="list">
												        <option value="${list.name}" ${matterCategory==list.name?'selected':''}>${list.name}</option>
												    </c:forEach>
		                                        </select>
		                                    </td>
		                                </tr>
		                                <tr>
		                                    <td class="Txt_right">交办时间：</td>
		                                    <td colspan="3">
		                                        <input onclick="SetDate(this,'yyyy-MM-dd')" placeholder="选择时间" class="select_time" id="startTimeTemp" name="startTimeTemp" value="${startTimeTemp}">
		                                        &nbsp;-&nbsp;
		                                        <input onclick="SetDate(this,'yyyy-MM-dd')" placeholder="选择时间" class="select_time" id="endTimeTemp" name="endTimeTemp" value="${endTimeTemp}">
		                                    </td>
		                                </tr>
		                            </tbody>
		                        </table>
		                        <div class="select_btn">
		                            <input type="submit" class="select_ss bt_small" value="搜&nbsp;&nbsp;索" /> 
		                            <input type="button" class="select_xz bt_small" value="新&nbsp;&nbsp;增" onclick="add();"/> 
		                            <input type="button" class="select_cz bt_small" value="重&nbsp;&nbsp;置" onclick="resetFuc();"/>
		                            <input type="button" class="select_dr bt_small" value="导&nbsp;&nbsp;入" onclick="importFuc();"/>
		                        </div>
		                    </div>
                        </form>
                    </div>
                    <div class="clear"></div>
                </div>
                <div class="kzt_table">
                    <table id="Table" class="table_bg">
                        <tbody>
                            <tr>
                            	<th>序号</th>
                                <th>信访编号</th>
                                <th>创建日期</th>
                                <th>交办号</th>
                                <th>交办人单位</th>
                                <th>交办形式</th>
                                <th>所属问题</th>
                                <th>状态</th>
                                <th>驳回原因</th>
                                <th>操作</th>
                            </tr>
                            <c:forEach items="${guestBookList}" var="list" varStatus="status">
                                <tr>
                                	<td>${status.count}</td>
                                    <td>${list.complaintNumber}</td>
                                    <td><fmt:formatDate value="${list.createTime}" pattern="yyyy-MM-dd hh:mm:ss" type="date"/></td>
                                    <td>${list.ext.assignNumber}</td>
                                    <td>${list.ext.assignCompany}</td>
                                    <td>${list.ext.assignModality}</td>
                                    <td>${list.ext.matterCategory}</td>
                                    <c:choose>
                                    	<c:when test="${list.status==1}"><td class="">草稿</td></c:when>
                                    	<c:when test="${list.status==2}"><td class="ajzt_zj">提交审核</td></c:when>
                                    	<c:when test="${list.status==3}"><td class="ajzt_zjsj">审核通过</td></c:when>
                                    	<c:when test="${list.status==4}"><td class="ajzt_bysl">驳回修改</td></c:when>
                                    	<c:otherwise></c:otherwise>
                                    </c:choose>
	                                <td>
	                                	<c:forEach items="${list.reason}" var="list1" begin="0" end="0" varStatus="status">
	                                		${list1.reason}
	                                	</c:forEach>
	                                </td>
                                    <td>
                                        <a href="javascript:void(0);" onclick="look(${list.id});">查看</a> 
                                        <c:choose>
                                        	<c:when test="${list.status==2}"></c:when>
                                        	<c:when test="${list.status==3}"></c:when>
                                        	<c:otherwise>
		                                        | 
                                        		<a href="javascript:void(0);" onclick="edit(${list.id});">修改</a> 
                                        		| 
                                        		<a href="javascript:void(0);" onclick="deleteById(${list.id});">删除</a>
                                        		| 
		                                        <a href="javascript:void(0);" onclick="imageRecognition(${list.id});">图片识别</a>
		                                        |
		                                        <a href="javascript:void(0);" onclick="check(${list.id});">提交审核</a>
                                        	</c:otherwise>
                                        </c:choose>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
                <jsp:include page="../../include/page.jsp"></jsp:include>
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
                                                 警告！<br />
                    <span id="warningNotice"></span>
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
                                                 操作成功！<br />
                    <span id="sucessNotice"></span>
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