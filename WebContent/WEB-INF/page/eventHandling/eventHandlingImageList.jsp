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
<script type="text/javascript">
	function imageRecognition(id) {
		var form = $("<form>");   //定义一个form表单
	    form.attr('style', 'display:none');   //在form表单中添加查询参数
	    form.attr('target', '');
	    form.attr('method', 'post');
	    form.attr('action', "cm_event_handling_image");
		
		var attachmentsId = $('<input>');
		attachmentsId.attr('type', 'hidden');
		attachmentsId.attr('name', 'attachmentsId');
		attachmentsId.attr('value', id);
		
		form.append(attachmentsId);
		
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
            <div class="pubilc_right_cn">
                <div class="kzt_table">
                    <table id="Table" class="table_bg">
                        <tbody>
                            <tr>
                                <th>序号</th>
                                <th>名称</th>
                                <th>照片</th>
                                <th>操作</th>
                            </tr>
                            <c:forEach items="${picList}" var="list" varStatus="status">
                                <tr>
                                    <td>${status.count}</td>
                                    <td>${list.name}</td>
                                    <td><img alt="" src="${list.path}" style="width:45px;height:45px"/></td>
                                    <td><a href="javascript:void(0);" onclick="imageRecognition(${list.id});">AI识别</a></td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
                <div class="sj_bt_wai">
					<div class="sj_bt">
						<input type="button" class="bt_small bt_yellow" value="返&nbsp;&nbsp;&nbsp;回" onclick="javascript:window.location.href='/cm_event_handling_list'" />
					</div>
				</div>
            </div>
        </div>
    </div>
</body>
</html>