<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>供应商列表</title>

<link type="text/css" href="${path}/static/css/style.css" rel="stylesheet" />
<link type="text/css" href="${path}/static/css/public.css" rel="stylesheet" />
<link type="text/css" href="${path}/static/css/other.css" rel="stylesheet" />
<link type="text/css" href="${path}/static/css/tcc.css" rel="stylesheet" />

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
		//成功提示弹出层
		$(".close_xg_btn").click(function(){
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

<script type="text/javascript" language="javascript"> 
function detailed(id){
	var form = $("<form>");   //定义一个form表单
    form.attr('style', 'display:none');   //在form表单中添加查询参数
    form.attr('target', '');
    form.attr('method', 'post');
    form.attr('action', "cm_visitingRegistration_detailed");
	
	var bookingId = $('<input>');
	bookingId.attr('type', 'hidden');
	bookingId.attr('name', 'id');
	bookingId.attr('value', id);
	form.append(bookingId);
	$(document.body).append(form);
	form.submit();
}

function edit(id){
	var form = $("<form>");   //定义一个form表单
    form.attr('style', 'display:none');   //在form表单中添加查询参数
    form.attr('target', '');
    form.attr('method', 'post');
    form.attr('action', "cm_visitingRegistration_edit");
	
	var bookingId = $('<input>');
	bookingId.attr('type', 'hidden');
	bookingId.attr('name', 'id');
	bookingId.attr('value', id);
	form.append(bookingId);
	$(document.body).append(form);
	form.submit();
}

function deletegys(id){
	$.ajax({
        type: "POST",
        dataType: 'json',
        url: "cm_visitingRegistration_updateBook",
        data: {"id":id,"status":0},
        traditional: true,
        dataType: "json",
        success: function(data){
        	if(data.status==0) {
        		$("#sucessNotice").text("删除成功！");
        		$(".cg_block").css("display","block");
            }else if(data.status == 1){
            	$("#notice").text("删除失败！");
        		$(".jg_block").css("display","block");
            }
        },
        error:function(){
 	 	}
    });
}
function distinguish(id){
	var form = $("<form>");   //定义一个form表单
    form.attr('style', 'display:none');   //在form表单中添加查询参数
    form.attr('target', '');
    form.attr('method', 'post');
    form.attr('action', "cm_visitingRegistration_picList");
	
	var bookingId = $('<input>');
	bookingId.attr('type', 'hidden');
	bookingId.attr('name', 'id');
	bookingId.attr('value', id);
	form.append(bookingId);
	$(document.body).append(form);
	form.submit();
}

function resetButton(){
	$("#supplier_name").val("");
	$("#caidanList").val("");
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
              <span>供应商列表</span>
            </h1>
            <div class="select_eg">
              <form action="cm_visitingRegistration_list" id="searchForm" name="searchForm" method="post">
              <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tbody>
                  <tr>
                    <td class="Txt_right">供应商名：</td><!--查询  -->
                    <td><input id="supplier_name" name="supplier_name" type="text" placeholder="请输入姓名"  value="${supplier_name }"/></td>
                  </tr>
                  <tr>
                  	<td class="Txt_right">供应商类别：</td>
                    <td>
	                    <select id="caidanList" name="caidanList" >
					  		<option value=""></option>
						  	 <c:forEach items="${caidanList}" var="group" varStatus="status"><!--下拉列表  -->
						   	<option value="${group}" 
						  	<c:if test="${caidanList == group}">selected="selected"</c:if>>${group }</option>
						  	
						  	</c:forEach>
					 	</select>
                    </td>
                  <%--  <td class="Txt_right">上访时间：</td>
                     <td colspan="3">
                      <input onclick="SetDate(this,'yyyy-MM-dd')" placeholder="选择时间" class="select_time" id="startTime" name="startTime" value="${startTime}"/>
                      &nbsp;-&nbsp;
                      <input onclick="SetDate(this,'yyyy-MM-dd')" placeholder="选择时间" class="select_time" id="endTime" name="endTime" value="${endTime}"/>
                    </td> --%>
                  </tr>
                </tbody>
              </table>
              <div class="select_btn">
                <input type="submit" class="select_ss bt_small" value="搜&nbsp;&nbsp;索" /> 
                <input type="button" class="select_xz bt_small" value="新&nbsp;&nbsp;增" onclick="javascrtpt:window.location.href='/cm_visitingRegistration_add'"/> 
                <input type="button" class="select_cz bt_small" value="重&nbsp;&nbsp;置" onclick="resetButton();"/>
              </div>
              </form>
            </div>
          </div>
          <div class="clear"></div>
        </div>
        <div class="kzt_table">
          <table id="Table" class="table_bg">
            <tbody>
              <tr>
                 <th>序号</th>
                <th>供应商名</th>
                <th>供应商等级</th>
                 <th>供应商类别</th>
                <th>交货及时率评分</th>
                <th>服务质量评分</th>
                <th>产品质量评分</th>
                <th>供应商账期</th>
                <th>总分</th>
                <th>供应商评分等级</th>
                <th>供应商评价</th>
                <th>操作</th>
              </tr> 
              <c:forEach items="${guestBookList }" var="obj" varStatus="status"><!-- 数据 -->
              <tr>
                 <td>${status.count}</td>
                <td>${obj[1] }</td>
                <td>${obj[2] }</td>
                <td>${obj[3] }</td>
               	<td>${obj[4] }</td>
                <td>${obj[5] }</td>
                <td>${obj[6] }</td>
                <td>${obj[7] }</td>
                <td>${obj[8] }</td>
                <td>${obj[9] }</td>
                <%-- <td>${obj[10] }</td> --%>
                <td>${obj[11] }</td>
                <td>
                  <a href="javascript:void(0);" onclick="detailed(${obj[0]});">详情</a> 
	              <a href="javascript:void(0);" onclick="edit(${obj[0]});">打分</a> 
	              <a href="javascript:void(0);" onclick="deletegys(${obj[0]});">删除</a>
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
          <span id="notice"></span>
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
          <span id="updateNotice"></span>
        </div>
        <div class="tc_btn">
          <input type="button" class="close_xg_btn" value="关闭" />
        </div>
      </div>
    </div>
  </div>
  <!--成功弹出 END-->
</body>
</html>