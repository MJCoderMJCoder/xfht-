<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head> 
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link type="text/css" href="${path}/static/css/style.css" rel="stylesheet"/>
<link type="text/css" href="${path}/static/css/public.css" rel="stylesheet"/>
<link type="text/css" href="${path}/static/css/other.css" rel="stylesheet"/>
<title>智能信访数据处理平台-信访查询</title>
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
</head>
 <body> 
   <a id="dcid"></a>
<jsp:include page="../include/top.jsp"></jsp:include>

<div class="center">
 <jsp:include page="../include/xf_seach.jsp"></jsp:include>
<div class="pubilc_right fl">
<div id="ContainerPanel" style="display:none;"><div id="calendarPanel" style="position: absolute;display: none;z-index: 9999;background: #fff;border: 1px solid #ccc;width:200px;font:12px/18px 微软雅黑;margin-left:25px;"></div></div>
      <div class="pubilc_right_cn">
      	  <div class="cfcx">
      	  	   <div class="cfcx_2">
      	  	   	  <h1 class="kzt_bt"><span>信访查询</span></h1>
      	  	   	  <div class="select_eg">
      	  	   	  <form action="cm_xf_list" id="searchForm" name="searchForm" method="post">
					<table width="100%" border="0" cellpadding="0" cellspacing="0">
						  <tbody>
							<tr>
							  <td class="Txt_right">信访人：</td>
							  <td><input class="" id="informantName" name="informantName" type="text"    /></td>
							  <td class="Txt_right">案件编号：</td>
							  <td ><input class="" id="complaintNumber" type="text" name="complaintNumber"  /></td>
							  <td class="Txt_right">上访时间：</td>
							  <td colspan="3">
							   <input type="date" id="stime" name="stime" class="select_time" value="${createTime_end }" onclick="SetDate(this,'yyyy-MM-dd')" placeholder="选择时间">
							  &nbsp;-&nbsp;
							  <input type="date" id="etime" name="etime" class="select_time" value="${createTime_end }" onclick="SetDate(this,'yyyy-MM-dd')" placeholder="选择时间">
							  </td>
							  
							  </tr>
							<%-- <tr>
							   <td class="Txt_right">案件类型：</td>
                                <td><select name="type" id="type">
                                <option value="" >==请选择==</option>
                                <c:forEach  items="${zdls }" var="list" varStatus="status"> 
                                 <option value="${list.id }">${list.name }</option>
                                </c:forEach>
                                </select></td>    
							  
							  </tr> --%>
							</tbody>
						</table>
						<div class="select_btn">
							<input type="submit" class="select_ss bt_small" value="搜&nbsp;&nbsp;索" />
							<input type="button" class="select_xz bt_small" value="新&nbsp;&nbsp;增" id="cktcc_center_ck2" />
							<input type="button" class="select_cz bt_small" onclick="daocls()" value="导出信访"  /> 
							
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
     	  	   	   	   	  <th width="40"></th>
      	  	   	   	   	  <th>序号</th>
      	  	   	   	   	  <th>信访人</th>
      	  	   	   	   	  <th>案件编号</th>
      	  	   	   	   	  <th>来访类型</th> 
      	  	   	   	   	 
      	  	   	   	   	  <th>上访时间</th> 
      	  	   	   	   	  <th>案件状态</th> 
      	  	   	   	   	  <th>操作</th>
      	  	   	   	   </tr>
      	  	   	   	    <c:forEach items="${templist }" var="list" varStatus="status">  
      	  	   	   	   <tr>
     	  	   	   	   	  <td><input type="checkbox" name="kzt_xz"/></td>
     	  	   	   	   	  <td>${status.count} </td>
      	  	   	   	   	  <td>${list.receptionist} </td>
      	  	   	   	   	  <td>${list.complaintNumber} </td>
      	  	   	   	   	  <td>
							<!--1、网上信访2、来访登记3、来信登记4、上级交办 	 -->
      	  	   	   	   	  <c:choose>
      	  	   	   	   	  <c:when test="${list.ctgId =='1'}">
      	  	   	   	   	 	 网上信访
      	  	   	   	   	  </c:when>
      	  	   	   	   	   <c:when test="${list.ctgId =='2'}">
      	  	   	   	   	  	来访登记
      	  	   	   	   	  </c:when>
      	  	   	   	   	   <c:when test="${list.ctgId =='3'}">
      	  	   	   	   	  	来信登记
      	  	   	   	   	  </c:when>
      	  	   	   	   	   <c:when test="${list.ctgId =='4'}">
      	  	   	   	   	  	上级交办
      	  	   	   	   	  </c:when>
      	  	   	   	   	  </c:choose>
      	  	   	   	   	   </td>
      	  	   	   	   	 
      	  	   	   	   	  <td>${list.createTime} </td> 
      	  	   	   	   	  <td>
      	  	   	   	   	  <!-- 状态:0、删除 1、草稿 2、提交审核 3、通过 4、驳回给录入人员 5、不予受理/不再受理 6、转办/交办 7、上报 8、口头回复/书面回复 9、完结 10、处理中 -->
						<c:choose>
      	  	   	   	   	  <c:when test="${list.status =='0'}">
      	  	   	   	   	 	删除
      	  	   	   	   	  </c:when>
      	  	   	   	   	   <c:when test="${list.status =='1'}">
      	  	   	   	   	  	草稿
      	  	   	   	   	  </c:when>
      	  	   	   	   	   <c:when test="${list.status =='2'}">
      	  	   	   	   	  	提交审核
      	  	   	   	   	  </c:when>
      	  	   	   	   	   <c:when test="${list.status =='3'}">
      	  	   	   	   	  	通过
      	  	   	   	   	  </c:when>
      	  	   	   	   	  <c:when test="${list.status =='4'}">
      	  	   	   	   	 	 驳回给录入人员
      	  	   	   	   	  </c:when>
      	  	   	   	   	   <c:when test="${list.status =='5'}">
      	  	   	   	   	  	不予受理/不再受理
      	  	   	   	   	  </c:when>
      	  	   	   	   	   <c:when test="${list.status =='6'}">
      	  	   	   	   	  	转办/交办
      	  	   	   	   	  </c:when>
      	  	   	   	   	   <c:when test="${list.status =='7'}">
      	  	   	   	   	  	上报
      	  	   	   	   	  </c:when>
      	  	   	   	   	  <c:when test="${list.status =='8'}">
      	  	   	   	   	  	口头回复/书面回复
      	  	   	   	   	  </c:when>
      	  	   	   	   	  <c:when test="${list.status =='9'}">
      	  	   	   	   	  	完结
      	  	   	   	   	  </c:when>
      	  	   	   	   	  <c:when test="${list.status =='10'}">
      	  	   	   	   	  	处理中
      	  	   	   	   	  </c:when>
      	  	   	   	   	  </c:choose>
							</td>
      	  	   	   	   	  <td>
      	  	   	   	   	  <a href="cm_see_${list.getId()}"  class="help_xg">查看</a>  
      	  	   	   	   	  </td>
      	  	   	   	   </tr>
                    </c:forEach>   
      	  	   	   </tbody>
      	  	   </table>
      	  </div> 
      </div>
  
</div>
</div> 
 <script type="text/javascript">
	function daocls() { 
    	$.ajax({
    		type : 'POST',  
    		async:false,
    	    /* contentType : 'application/json',   */
    	    url : "cm_xf_listdaochu",  
    	    data : $("#searchForm").serialize() ,   
     	    dataType : 'json', 
    		error : function(data1) {
    		},
    		success : function(data1) { 
    			document.getElementById("dcid").href=data1.msg;
    			document.getElementById("dcid").click();
    		}
    	});
     
	}
</script>
 
 

</body>
</html>