<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>事件处理</title>

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
	function resetFuc() {
		$("#complaintNumber").val("");
		$("#matterCategory").val("");
		$("#startTimeTemp").val("");
		$("#endTimeTemp").val("");
		$("#ctgId").val("");
	}
	
	function look(id) {
		var form = $("<form>");   //定义一个form表单
	    form.attr('style', 'display:none');   //在form表单中添加查询参数
	    form.attr('target', '');
	    form.attr('method', 'post');
	    form.attr('action', "cm_event_handling_look");
		
		var guestbookId = $('<input>');
		guestbookId.attr('type', 'hidden');
		guestbookId.attr('name', 'guestbookId');
		guestbookId.attr('value', id);
		
		form.append(guestbookId);
		
		$(document.body).append(form);
		form.submit();
	}
	
	function eventHandling(id) {
		var form = $("<form>");   //定义一个form表单
	    form.attr('style', 'display:none');   //在form表单中添加查询参数
	    form.attr('target', '');
	    form.attr('method', 'post');
	    form.attr('action', "cm_event_handling");
		
		var guestbookId = $('<input>');
		guestbookId.attr('type', 'hidden');
		guestbookId.attr('name', 'guestbookId');
		guestbookId.attr('value', id);
		
		form.append(guestbookId);
		
		$(document.body).append(form);
		form.submit();
	}
	
	function imageRecognition(id) {
		var form = $("<form>");   //定义一个form表单
	    form.attr('style', 'display:none');   //在form表单中添加查询参数
	    form.attr('target', '');
	    form.attr('method', 'post');
	    form.attr('action', "cm_event_handling_image_list");
		
		var guestbookId = $('<input>');
		guestbookId.attr('type', 'hidden');
		guestbookId.attr('name', 'guestbookId');
		guestbookId.attr('value', id);
		
		form.append(guestbookId);
		
		$(document.body).append(form);
		form.submit();
	}
</script>
</head>
<body>
    <jsp:include page="../include/top.jsp"></jsp:include>
    <div class="center">
        <jsp:include page="../include/handle_left.jsp"></jsp:include>
        <div class="pubilc_right fl">
        	<div id="ContainerPanel" style="display:none;"><div id="calendarPanel" style="position: absolute;display: none;z-index: 9999;background: #fff;border: 1px solid #ccc;width:200px;font:12px/18px 微软雅黑;margin-left:25px;"></div></div>
            <div class="pubilc_right_cn">
                <div class="cfcx">
                    <div class="cfcx_2">
                        <h1 class="kzt_bt">
                            <span>事件处理</span>
                        </h1>
                        <form id="searchForm" action="cm_event_handling_list" method="post">
		                    <div class="select_eg">
		                        <table width="100%" border="0" cellpadding="0" cellspacing="0">
		                            <tbody>
		                                <tr>
		                                    <td class="Txt_right">信访编号：</td>
		                                    <td><input type="text" id="complaintNumber" name="complaintNumber" value="${complaintNumber}" placeholder="请输入信访编号"/></td>
		                                    <td class="Txt_right">所属问题：</td>
		                                    <td>
		                                        <select id="matterCategory" name="matterCategory">
		                                            <option value="">==请选择==</option>
		                                            <c:forEach items="${matterCategoryList}" var="list">
												        <option value="${list.name}" ${matterCategory==list.name?'selected':''}>${list.name}</option>
												    </c:forEach>
		                                        </select>
		                                    </td>
		                                    <td class="Txt_right">处理截止日期：</td>
		                                    <td colspan="3">
		                                        <input onclick="SetDate(this,'yyyy-MM-dd')" placeholder="选择时间" class="select_time" id="startTimeTemp" name="startTimeTemp" value="${startTimeTemp}">
		                                        &nbsp;-&nbsp;
		                                        <input onclick="SetDate(this,'yyyy-MM-dd')" placeholder="选择时间" class="select_time" id="endTimeTemp" name="endTimeTemp" value="${endTimeTemp}">
		                                    </td>
		                                </tr>
		                                <tr>
		                                    <td class="Txt_right">信访来源：</td>
		                                    <td>
		                                        <select id="ctgId" name="ctgId">
		                                            <option value="">==请选择==</option>
		                                            <c:forEach items="${guestbookCtgList}" var="list">
												        <option value="${list.id}" ${ctgId==list.id?'selected':''}>${list.name}</option>
												    </c:forEach>
		                                        </select>
		                                    </td>
		                                </tr>
		                            </tbody>
		                        </table>
		                        <div class="select_btn">
		                            <input type="submit" class="select_ss bt_small" value="搜&nbsp;&nbsp;索" /> 
		                            <input type="button" class="select_cz bt_small" value="重&nbsp;&nbsp;置" onclick="resetFuc();"/>
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
                                <th>所属问题</th>
                                <th>处理截止日期</th>
                                <th>信访来源</th>
                                <th>状态</th>
                                <th>操作</th>
                            </tr>
                            <c:forEach items="${guestBookList}" var="list" varStatus="status">
                                <tr>
                                	<td>${status.count}</td>
                                    <td>${list.complaintNumber}</td>
                                    <td>${list.ext.matterCategory}</td>
                                    <td><fmt:formatDate value="${list.endTime}" pattern="yyyy-MM-dd hh:mm:ss" type="date"/></td>
                                    <c:choose>
                                    	<c:when test="${list.ctgId==1}"><td class="">网上信访</td></c:when>
                                    	<c:when test="${list.ctgId==2}"><td class="ajzt_zj">来访登记</td></c:when>
                                    	<c:when test="${list.ctgId==3}"><td class="ajzt_zjsj">来信登记</td></c:when>
                                    	<c:when test="${list.ctgId==4}"><td class="ajzt_bysl">上级交办</td></c:when>
                                    	<c:otherwise></c:otherwise>
                                    </c:choose>
                                    <c:choose>
                                    	<c:when test="${list.status==3}"><td class="ajzt_zjsj">审核通过</td></c:when>
                                    	<c:when test="${list.status==5}"><td class="ajzt_zj">不予受理/不再受理</td></c:when>
                                    	<c:when test="${list.status==6}"><td class="ajzt_zjsj">转办/交办</td></c:when>
                                    	<c:when test="${list.status==7}"><td class="ajzt_zj">上报</td></c:when>
                                    	<c:when test="${list.status==8}"><td class="ajzt_zj">口头回复/书面回复</td></c:when>
                                    	<c:when test="${list.status==9}"><td class="ajzt_zjsj">完结</td></c:when>
                                    	<c:when test="${list.status==10}"><td class="ajzt_zj">处理中</td></c:when>
                                    	<c:otherwise></c:otherwise>
                                    </c:choose>
                                    <td>
                                        <a href="javascript:void(0);" onclick="look(${list.id});">查看</a>
                                        <c:if test="${list.status==3||list.status==6||list.status==10}">
	                                        |
	                                        <a href="javascript:void(0);" onclick="eventHandling(${list.id});">事件处理</a>
                                        </c:if>
                                        | 
                                        <a href="javascript:void(0);" onclick="imageRecognition(${list.id});">图片识别</a>
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