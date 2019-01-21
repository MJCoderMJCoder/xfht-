<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link type="text/css" href="${path}/static/css/style.css" rel="stylesheet"/>
<link type="text/css" href="${path}/static/css/public.css" rel="stylesheet"/>
<link type="text/css" href="${path}/static/css/other.css" rel="stylesheet"/>
<link type="text/css" href="${path}/static/css/tcc.css" rel="stylesheet"/>
<link type="text/css" href="${path}/static/css/calendar-price-jquery.min.css" rel="stylesheet"/>
<link type="text/css" href="${path}/static/css/fullcalendar.min.css" rel="stylesheet" />
<link type="text/css" href="${path}/static/css/fullcalendar.print.min.css" rel="stylesheet" media="print" />
<title></title>
<script type="text/javascript" src="${path}/static/js/jquery.min.js"></script>
<script type="text/javascript" src="${path}/static/js/highcharts.js"></script>
<script type="text/javascript" src="${path}/static/js/oldie.js"></script>
<script type="text/javascript" src="${path}/static/js/exporting.js"></script>
<script type="text/javascript" src="${path}/static/js/highcharts-zh_CN.js"></script>
<script type="text/javascript" src="${path}/static/js/jquery.SuperSlide.2.1.js"></script>
<script type="text/javascript" src="${path}/static/js/date.js"></script><!--时间控件js-->
<script type="text/javascript" src="${path}/static/js/moment.min.js"></script>
<script type="text/javascript" src="${path}/static/js/fullcalendar.min.js"></script>
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
<script>
$(document).ready(function() {
	DivCalendar();
	$("#cktcc_center_gb1").click(function(){
		$("#cktcc1").css("display","none");
		location.reload();
	}); 
});
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
var theDate = "";
function update(){
	$.ajax({
		type: "POST",
        dataType: 'json',
        url: "cm_task_HandleUpdate",
        data: $("#updateForm").serialize(),
        traditional: true,
        dataType: "json",
        success: function(data){
        	DivDay(theDate);
        },
        error:function(){
 	 	}
	})
}
function DivDay(date){
	$("#Table1 tr:not(:first)").html("");
	$("#Table2 tr:not(:first)").html("");
	$.ajax({
		type: "POST",
        dataType: 'json',
        url: "cm_task_RemindHandle",
        data: {theDate: date},
        dataType: "json",
        success: function(data){
        	if(data.Result=="OK"){
        		var strA = data.HandleA;
        		var strB = data.HandleB;
        		var trHTMLA="";
        		var trHTMLB="";
        		for(i=0;i<strA.length;i++){
        			var n= i+1;
        			trHTMLA += "<tr><td>"+n+"</td><td>"+strA[i][0].name+"</td><td>"+strA[i][0].contents+"</td></tr>";
        		}
				for(i=0;i<strB.length;i++){
					trHTMLB += "<tr><td><input type=\"checkbox\" id=\"chooseExport\" name=\"chooseExport\" value=\""+strB[i][0].id+"\"/></td><td>"+strB[i][0].name+"</td><td>"+strB[i][0].contents+"</td></tr>";
				}
				$("#Table1").append(trHTMLA);
				$("#Table2").append(trHTMLB);
        	}else{
        		alert('查询错误！');
        	}
			$("#cktcc1").css("display","block");
        },
        error:function(){
 	 	}
	})
}
function DivCalendar(){
	var CurrentDate = new Date();
	var year = CurrentDate.getFullYear();
    var month = CurrentDate.getMonth() + 1;
    var strDate = CurrentDate.getDate();
    if (month >= 1 && month <= 9) {
        month = "0" + month;
    }
    if (strDate >= 0 && strDate <= 9) {
        strDate = "0" + strDate;
    }
    var current = year + "-" + month + "-" + strDate;
	$("#calendar").fullCalendar({
		defaultDate: current,
	    //editable: true,//移动事件
	    eventLimit: true, // allow "more" link when too many events
		dayClick: function(date, jsEvent, view) { 
			var eventss = $('#calendar').fullCalendar('clientEvents', function(event) {
			    theDate = date.format('YYYY-MM-DD');
			});
			DivDay(theDate);
		},
		eventClick: function() { $(".bg_block").css("display","block"); },
		events: function(start,end,timezone, callback){
			var date = this.getDate().format('YYYY-MM');
			$.ajax({
				type: "POST",
		        dataType: 'json',
		        url: "cm_task_Remind",
		        data: {date: date,},
		        dataType: "json",
		        success: function(data){
		        	var events = [];
		        	var objs = data.contents.split('|');
		        	for(i=0;i<objs.length;i++){
		        		var obj = objs[i].split(',');
		        		if(obj[1]==1){
		        			events.push({
		        				title:"已处理："+obj[2],
		        				start:obj[0],
		        				backgroundColor:"#83acfa",
		        				borderColor:"#83acfa"
		        			})
		        		}else{
		        			events.push({
		        				title:"未处理："+obj[2],
		        				start:obj[0],
		        				backgroundColor:"#3075f7",
		        				borderColor:"#3075f7"
		        			})
		        		}
		        	}
		        	callback(events);
		        },
		        error:function(){
		 	 	}
			})
		}
	});
}
</script>
</head>
<body>
<jsp:include page="../include/top.jsp"></jsp:include>
<div class="center">
  <jsp:include page="../include/task_left.jsp"></jsp:include>
  <div class="pubilc_right fl">
  	<div class="pubilc_right_cn">
    	<div class="cfcx">
        	<div class="cfcx_2">
            	<h1 class="kzt_bt"><span>任务提醒</span></h1>
                <div id="calendar"></div>
            </div>
            <div class="clear"></div>
        </div>
    </div>
  </div>
</div>
<div class="cktcc" id="cktcc1">
	<div class="cktcc_center">
		<div class="wai_tittle">
			<input type="button" value="关&nbsp;闭" id="cktcc_center_gb1" class="cktcc_center_gb"/>
           	<h1 class="cktcc_center_bt">任务查看</h1>
        </div>
        <div class="wai">
			<p class="cktcc_center_sjcl">已处理事件</p>
			<div class="kzt_table">
				<table width="" id="Table1" class="table_bg Table">
					<tbody>
						<tr>
							<th width="80">序号</th>
							<th width="30%">任务名称</th>
							<th>任务内容</th>
						</tr>
					</tbody>
      	  	   	</table>
      	  	</div>
			<p class="cktcc_center_sjcl">未处理事件</p>
           	<div class="kzt_table">
          		<form  action="cm_role_save" id="updateForm" name="updateForm" method="post">
           		<table width="" id="Table2" class="table_bg Table">
               		<tbody>
               			<tr>
               				<th width="80">选择</th>
               				<th width="30%">任务名称</th>
               				<th>任务内容</th>
               			</tr>
               		</tbody>
               	</table>
               	</form>
           	</div>
			<div class="xz_table">
				<input type="checkbox" name="bmdlb-xz" id="allChoose" name="allChoose" onclick="onChooseAll()" />全选
       	   		<input type="button" class="bt_ycl" value="标记为已处理" onclick="update()"  />
       	   	</div>
         </div>
	</div>
</div>
</body>
</html>