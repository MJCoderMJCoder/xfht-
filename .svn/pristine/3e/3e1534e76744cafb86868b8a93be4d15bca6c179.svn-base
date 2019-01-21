<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link type="text/css" href="${path}/static/css/style.css" rel="stylesheet"/>
<link type="text/css" href="${path}/static/css/public.css" rel="stylesheet"/>
<link type="text/css" href="${path}/static/css/other.css" rel="stylesheet"/>
<title>帮助中心-管理</title>
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
<script type="text/javascript">
$(document).ready(function(){
	//添加弹出层
	$(".select_xz").click(function(){
		$(".cktcc").css("display","block");
	}); 
	$(".cktcc_center_gb").click(function(){
		$(".cktcc").css("display","none");
	});
	
	//修改弹出层
	$(".help_xg").click(function(){
		$(".cktccxg").css("display","block");
	}); 
	$(".cktccxg_center_gb").click(function(){
		$(".cktccxg").css("display","none");
	});
	 
});
</script>
<script type="text/javascript">
function check()
{
	var title=document.getElementById("addtitle").value;
	var cont=document.getElementById("addcont").value;
	if(title=="")
		{
		return false;
		}
	if(cont=="")
		{
		return false;
		}
	
	}
	 
	function getinfo(id)
	{
		$.ajax({
			data : "helpid=" + id, 
			type : "POST",
			dataType : 'json',
			url : "getinfoforupdatehelp",
			error : function(data) {
			},
			success : function(data) { 
				//xgform
				document.xgform.action="xghelp_"+data.hid;
				document.getElementById("xgtitle").value = data.title;
				document.getElementById("xgcont").value = data.cont;
				for (var i=0;i<data.temp;i++){
					switch(i) 
					{ 
					case 0: 
						document.getElementById('xgfat'+(i+1)).value=data.xgfat1;
						break; 
					case 1: 
						document.getElementById('xgfat'+(i+1)).value=data.xgfat2;
						break; 
					case 2: 
						document.getElementById('xgfat'+(i+1)).value=data.xgfat3;
						break; 
					case 3: 
						document.getElementById('xgfat'+(i+1)).value=data.xgfat4;
						break; 
					case 4: 
						document.getElementById('xgfat'+(i+1)).value=data.xgfat5;
						break; 
					}  
				 } 
			}
		});
	}
	
	function delete_info(id)
	{
		var statu = confirm("是否删除记录！");
		 if(!statu){
		     return false;
		 }
		$.ajax({
			data : "helpid=" + id, 
			type : "POST",
			dataType : 'json',
			url : "deletehelp",
			error : function(data) {
			},
			success : function(data) { 
			 if(data.sta=="succ")  {
				 alert(":succ 之后换成弹出层");
				 location.reload();
				 }
			 else {
				 alert(":fail 之后换成弹出层");
				 location.reload();
				 } 
			}
		});
	}
	
</script> 
<c:if test="${not empty sulogin}">
<input type="hidden" value="${sulogin}" id="hid_sulogin"/> 
<script type="text/javascript">
var s = $("#hid_sulogin").val(); 
if(s == 'fail'){
	alert("操作失败，之后换成弹出层");
}
if(s == 'succ'){
	alert("操作成功,之后换成弹出层");
}
</script>

</c:if>

<!--控制表格奇数偶数颜色结束----------------------->
<body> 
<jsp:include page="../include/top.jsp"></jsp:include>

<div class="center">
 <jsp:include page="../include/system_left.jsp"></jsp:include>
<div class="pubilc_right fl">
<div id="ContainerPanel" style="display:none;"><div id="calendarPanel" style="position: absolute;display: none;z-index: 9999;background: #fff;border: 1px solid #ccc;width:200px;font:12px/18px 微软雅黑;margin-left:25px;"></div></div>
      
      <div class="pubilc_right_cn">
      	  <div class="cfcx">
      	  	   <div class="cfcx_2">
      	  	   	  <h1 class="kzt_bt"><span>帮助中心管理</span></h1>
      	  	   	  <div class="select_eg">
      	  	   	  <form action="help_list" id="searchForm" name="searchForm" method="post">
					<table width="100%" border="0" cellpadding="0" cellspacing="0">
						  <tbody>
							<tr>
							  <td class="Txt_right">标题：</td>
							  <td><input class="" id="sectitle" name="sectitle" type="text" /></td>
							  </tr>
							  <tr>
							   <td class="Txt_right">内容：</td>
							 <td><input class="" id="seccont" name="seccont" type="text"  /></td>
							  </tr>
							   <c:forEach var="mess" items="${typelist}"  varStatus="status"> 
							<tr>
							  <td class="Txt_right">${mess.getName()}:</td>
							  <td> 
							  <select  class="" id="sec${mess.getId()}" name="sec${mess.getId()}">
							  <option value=null>--</option>
							   <c:forEach var="mess11" items="${mess.getChilds() }" >
							   <option value="${mess11.getId() }">${mess11.getName() }</option> 
					 			</c:forEach>　 
							  </select></td>
							  </tr>
							  </c:forEach>
							 
							 
							</tbody>
						</table>
						<div class="select_btn">
							<input type="submit" class="select_ss bt_small" value="搜&nbsp;&nbsp;索" />
							<input type="button" class="select_xz bt_small" value="新&nbsp;&nbsp;增" id="cktcc_center_ck2" />
							<input type="button" class="select_cz bt_small" value="重&nbsp;&nbsp;置"  /> 
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
      	  	   	   	   	  <th>标题</th>
      	  	   	   	   	  <th>创建人</th>
      	  	   	   	   	  <th>创建时间</th> 
      	  	   	   	   	  <th>操作</th>
      	  	   	   	   </tr>
      	  	   	   	   <c:forEach items="${templist }" var="list" varStatus="status">
      	  	   	   	   <tr>
     	  	   	   	   	  <td><input type="checkbox" name="kzt_xz"/></td>
      	  	   	   	   	  <td>${status.count }</td>
      	  	   	   	   	  <td>${list.getTitle() }</td>
      	  	   	   	   	  <td>${list.getCusername() }</td>
      	  	   	   	   	  <td>${list.getCreatetime() }</td> 
      	  	   	   	   	  <td>
      	  	   	   	   	  <a href="javascript:;" class="help_xg" onclick="getinfo('${list.getId()}')">查看</a> | 
      	  	   	   	   	  <a href="javascript:;" class="help_xg" onclick="getinfo('${list.getId()}')">修改</a> | 
      	  	   	   	   	  <a href="javascript:;" onclick="delete_info('${list.getId() }')">删除</a>
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

<!-- 添加弹出层 start -->
<div class="cktcc" id="cktcc2">
	<div class="cktcc_center">
         <div class="wai_tittle">
           <input type="button" value="关&nbsp;闭" id="cktcc_center_gb2" class="cktcc_center_gb"/>
           <h1 class="cktcc_center_bt">添加帮助</h1>
         </div>
         <form action="addhelp" id="addform" name="addform" method="post">
         <div class="wai">
            	  	   	  <div class="select_eg">
					<table width="100%" border="0" cellpadding="0" cellspacing="0">
						  <tbody>
							<tr>
							  <td class="Txt_right">标题：</td>
							  <td><input class="" id="title" name="addtitle" type="text" value="请输入标题" onfocus="this.value='';" onblur="if(this.value==''){this.value='请输入标题'}"/></td>
							  </tr>
							<tr>
							  <td class="Txt_right">内容：</td>
							  <td><textarea class="select_textarea" id="addcont" name="addcont"></textarea></td>
							  </tr> 
							  <c:forEach var="mess" items="${typelist}"  varStatus="status"> 
							<tr>
							  <td class="Txt_right">${mess.getName()}:</td>
							  <td> 
							  <select  class="" id="fat${mess.getId()}" name="fat${mess.getId()}">
							  <option value="--">--</option>
							   <c:forEach var="mess11" items="${mess.getChilds() }" >
							   <option value="${mess11.getId() }">${mess11.getName() }</option> 
					 			</c:forEach>　 
							  </select></td>
							  </tr>
							  </c:forEach>
							</tbody>
						</table>
						<div class="select_btn">
							<!--<input type="button" class="select_ss bt_small" value="搜&nbsp;&nbsp;索" />-->
							<input type="submit" onclick="return check();" class="select_xz bt_small" value="新&nbsp;&nbsp;增"  />
							<!--<input type="button" class="select_cz bt_small" value="重&nbsp;&nbsp;置"  />
							<input type="button" class="select_dc bt_small" value="导&nbsp;&nbsp;出"  />-->
						</div>
						</div>
         </div>
         </form>
	</div>
</div>
<!-- 添加弹出层 end -->

<!-- 修改弹出层 start -->
<div class="cktcc cktccxg" id="cktccxg">
	<div class="cktcc_center">
         <div class="wai_tittle">
           <input type="button" value="关&nbsp;闭" id="cktccxg_center_gb" class="cktcc_center_gb cktccxg_center_gb" />
           <h1 class="cktcc_center_bt">修改帮助</h1>
         </div>
         <form action="xghelp" id="xgform" name="xgform" method="post">
         <div class="wai">
            	  	   	  <div class="select_eg">
					<table width="100%" border="0" cellpadding="0" cellspacing="0">
						  <tbody>
							<tr>
							  <td class="Txt_right">标题：</td>
							  <td><input class="" id="xgtitle" name="xgtitle" type="text" value="请输入标题" onfocus="this.value='';" onblur="if(this.value==''){this.value='请输入标题'}"/></td>
							  </tr>
							<tr>
							  <td class="Txt_right">内容：</td>
							  <td><textarea class="select_textarea" id="xgcont" name="xgcont"></textarea></td>
							  </tr> 
							  <c:forEach var="mess" items="${typelist}"  varStatus="status"> 
							<tr>
							  <td class="Txt_right">${mess.getName()}:</td>
							  <td> 
							  <select  class="" id="xgfat${status.count}" name="xgfat${status.count}">
							  <option value="--">--</option>
							   <c:forEach var="mess11" items="${mess.getChilds() }" >
							   <option value="${mess11.getId() }">${mess11.getName() }</option> 
					 			</c:forEach>　 
							  </select></td>
							  </tr>
							  </c:forEach>
							</tbody>
						</table>
						<div class="select_btn">
							<!--<input type="button" class="select_ss bt_small" value="搜&nbsp;&nbsp;索" />-->
							<input type="submit" onclick="return check();" class="select_xz bt_small" value="修&nbsp;&nbsp;改"  />
							<!--<input type="button" class="select_cz bt_small" value="重&nbsp;&nbsp;置"  />
							<input type="button" class="select_dc bt_small" value="导&nbsp;&nbsp;出"  />-->
						</div>
						</div>
         </div>
         </form>
	</div>
</div>
<!-- 修改弹出层 end -->

</body>
</html>