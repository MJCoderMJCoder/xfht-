<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>日志管理</title>
<link type="text/css" href="${path}/static/css/style.css" rel="stylesheet"/>
<link type="text/css" href="${path}/static/css/public.css" rel="stylesheet"/>
<link type="text/css" href="${path}/static/css/other.css" rel="stylesheet"/>
<link type="text/css" href="${path}/static/css/tcc.css" rel="stylesheet"/>
<script type="text/javascript" src="${path}/static/js/jquery.min.js"></script>
<script type="text/javascript" src="${path}/static/js/jquery.SuperSlide.2.1.js"></script>
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
function deleteById(id){
	$.ajax({
        type: "POST",
        dataType: 'json',
        url: "cm_operationLog_delete",
        data: {"id":id},
        dataType: "json",
        success: function(data){
        	if(data.status==0) {
        		$("#sucessNotice").text("你选中的日志删除成功！");
        		$(".cg_block").css("display","block");
        		/* alert("删除成功！");
        		location.reload(); */
            }else{
            	$("#sucessNotice").text("你选中的日志删除失败！");
        		$(".ts_block").css("display","block");
            }
        },
        error:function(){
 	 	}
    });
}
$(document).ready(function(){
	//成功提示弹出层
	$(".btn_tc_cg").click(function(){
		$(".cg_block").css("display","block");
	}); 
	$(".close_tc_btn").click(function(){
		$(".cg_block").css("display","none");
		location.reload();
	});
	//提示弹出层
	$(".btn_tc_ts").click(function(){
		$(".ts_block").css("display","block");
	}); 
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
</head>
<body>
<jsp:include page="../include/top.jsp"></jsp:include>
<div class="center">
	<jsp:include page="../include/system_left.jsp"></jsp:include>
	<div class="pubilc_right fl">
    	<div class="pubilc_right_cn">
      		<div class="cfcx">
      	  		<div class="cfcx_2">
      	  	   		<h1 class="kzt_bt"><span>日志管理</span></h1>
      	  	   	  	<div class="select_eg">
						<form action="cm_operationLog_list" id="searchForm" name="searchForm" method="post">
						<table width="100%" border="0" cellpadding="0" cellspacing="0">
							<tbody>
							<tr>
							  <td class="Txt_right">用户：</td>
							  <td><input type="text" id="s_uName" name="s_uName" value="${s_uName}" /></td>
							  <td class="Txt_right">操作项：</td>
							  <td><input type="text" id="s_category" name="s_category" value="${s_category}" /></td>
							  <td class="Txt_right">分类：</td>
							  <td>
							  	<select id="s_classification" name="s_classification">
          						<option value="">全部</option>
          						<c:choose> 
          							<c:when test="${!empty s_classification }">
          							<c:choose> 
          								<c:when test="${s_classification == 0 }">
	  									<option value="0" selected = "selected">登录日志</option>
	  									</c:when>
	  									<c:otherwise>    
		  								<option value="0">登录日志</option>
										</c:otherwise> 
									</c:choose>
									<c:choose> 
										<c:when test="${s_classification == 1 }">
	  									<option value="1" selected = "selected">操作日志</option>
	  									</c:when>
	  									<c:otherwise>    
		  								<option value="1">操作日志</option>
										</c:otherwise> 
	  								</c:choose>
									<c:choose> 
										<c:when test="${s_classification == 2 }">
	  									<option value="2" selected = "selected">错误日志</option>
	  									</c:when>
	  									<c:otherwise>    
		  								<option value="2">错误日志</option>
										</c:otherwise> 
	  								</c:choose>
	  								</c:when> 
	  								<c:otherwise>   
		  								<option value="0">登录日志</option> 
		  								<option value="1">操作日志</option>
		  								<option value="2">错误日志</option>
									</c:otherwise> 
								</c:choose>
	  							</select>
							  </td>
							</tr>
							</tbody>
						</table>
						<div class="select_btn">
							<input type="submit" class="select_ss bt_small" value="搜&nbsp;&nbsp;索" />
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
      	  	   	   	   	  <th>用户</th>
      	  	   	   	   	  <th>操作时间</th>
      	  	   	   	   	  <th>操作IP</th>
      	  	   	   	   	  <th>操作项</th>
      	  	   	   	   	  <th>操作内容</th>
      	  	   	   	   	  <th>操作</th>
      	  	   	   	   </tr>
      	  	   	   	   	<c:forEach items="${operationLogs }" var="logs" varStatus="status">
						<tr class="bmdlb-tabletr2"> 
	 						<td>${status.index+1 }</td> 
	 						<td>${logs.userId.description}</td>  
	 						<td>${logs.getModifyTime()}</td> 
	 						<td>${logs.getIp()}</td> 
	 						<td>${logs.getCategory()}</td> 
	 						<td>${logs.getDescribes()}</td> 
	 						<td>
	 							<a href="javascript:deleteById(${logs.getId() })">删除</a>
	 						</td> 
						</tr> 
						</c:forEach>
      	  	   	   </tbody>
      	  	   </table>
      	  </div>
      	  <!--翻页开始--> 
      	    <jsp:include page="../include/page.jsp"></jsp:include>
		<!--翻页结束-->
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
</body>
</html>
