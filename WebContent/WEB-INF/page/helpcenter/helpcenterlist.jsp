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
<title>帮助中心问题筛选</title>
<script type="text/javascript" src="${path}/static/js/jquery.min.js"></script>
<script type="text/javascript" src="${path}/static/js/jquery.SuperSlide.2.1.js"></script>
<script type="text/javascript" src="${path}/static/js/script.js"></script>
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
	$(".helpsubNav").click(function(){
				$(this).toggleClass("helpcurrentDd").siblings(".helpsubNav").removeClass("helpcurrentDd")
				$(this).toggleClass("helpcurrentDt").siblings(".helpsubNav").removeClass("helpcurrentDt")
				// 修改数字控制速度， slideUp(500)控制卷起速度
				$(this).next(".helpnavContent").slideToggle(500).siblings(".helpnavContent").slideUp(500);
		})	
	})
</script>
<!--点击加载js-->
<script type="text/javascript">  

function openShutManager2(obj) {  
    var objStr = typeof obj == "string" ? document.getElementById(obj) : obj; 
	
    if(document.getElementById("dataDivId").style.display!="none"){  
        document.all["dataDivId"].style.display="none"; //显示  
        objStr.value='点击查看更多选项';
		
    }
	
	else{  
        document.all["dataDivId"].style.display="block"; //隐藏  
        objStr.value='点击关闭多余选项';
		
    }
	
}     
</script>

<script type="text/javascript">
	
$(document).ready(function(){
    var flag = 1;
    $(".help_jiazai_btn").click(function(){
        if(flag == 1){
            $(".help_jiazai_btn").css("background","url(images/help_sq.png) right center no-repeat");
            flag = 0;
        } else{
            $(".help_jiazai_btn").css("background","url(images/help_tj.png) right center no-repeat");
            flag = 1;
        }
    })
});
</script>



</head>
<body>
 <jsp:include page="../include/top.jsp"></jsp:include>
<div class="center">
  <div class="help_nr">
  	 <div class="help_nr_1">
  	     <h1><p>帮助中心问题筛选</p></h1>
		 <ul class="select">
		 
		 <c:forEach var="mess" items="${typelist}"  varStatus="status"> 
			<li class="select-list">
				<dl id="select1">
					<dt> ${mess.getName()}</dt>
					<dd class="select-all selected"><a href="#">全部</a></dd> 
					　 <c:forEach var="mess11" items="${mess.getChilds() }" >
					<dd><a href="#">${mess11.getName() }</a></dd>
					 </c:forEach>　
					 
				</dl>
			</li> 
				</c:forEach>
				
				<!--添加选项处-->
				<li class="select-result">
					<dl>
						<dt>已选条件：</dt>
						<dd class="select-no">暂时没有选择过滤条件</dd>
					</dl>
				</li>

				<!--点击加载按钮-->
				<li class="help_jiazai">
					 <input type="button" value="点击查看更多选项" onclick="openShutManager2(this)" class="help_jiazai_btn" id="djzk_btn"/>
				</li>		 
		</ul>

 	   
  	 </div>
  	 <div class="help_nr_2">
  	    <h1><p>常用问题列表</p></h1> 
  	    <div class="help_nr_2_list">
  	       <div class="help_nr_2_list_cn">
			<ul class="help_nr_2_ul fl">
			 <c:forEach var="mess" items="${helpls}"  varStatus="status">
			 <li><a href="#">如何进行信访登记？</a></li>
			 </c:forEach>
			</ul>
			<ul class="help_nr_2_ul fr">
				<li><a href="#">如何进行信访登记？</a></li>
				<li><a href="#">如何进行信访登记？</a></li>
				<li><a href="#">如何进行信访登记？</a></li>
				<li><a href="#">如何进行信访登记？</a></li>
				<li><a href="#">如何进行信访登记？</a></li>
				<li><a href="#">如何进行信访登记？</a></li>
				<li><a href="#">如何进行信访登记？</a></li>
				<li><a href="#">如何进行信访登记？</a></li>
				<li><a href="#">如何进行信访登记？</a></li>
			</ul>
 	        <div class="clear"></div>
	 	    </div>
 	 	  
  	 	</div>
  	 	
  	 </div>
  	   	 <!--翻页开始--> 
      	    
			<div class="pages">
			 <div id="Pagination"> 
			  <div class="pagination">
			   <a class="current prev"><i></i>上一页</a>
			   <a class="current">1</a>
			   <a href="#">2</a>
			   <a href="#">3</a>
			   <a href="#">4</a>
			   <span class="pagination-break">...</span>
			   <a href="#" class="ep">15</a>
			   <a href="#" class="next">下一页 <i></i></a>
			  </div> 
			 </div> 
			 <div class="searchPage"> 
			  <span class="page-sum">共<strong class="allPage">15</strong>页</span> 
			  <span class="page-go">跳转<input type="text" />页</span> 
			  <a href="javascript:;" class="page-btn">GO</a> 
			 </div> 
			</div> 
			<!--翻页结束-->
  </div>

</div>
</body>
</html>
