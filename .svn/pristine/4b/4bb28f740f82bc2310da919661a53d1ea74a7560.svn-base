<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" import="java.util.*"%>
<c:set value="${pageContext.request.contextPath}" var="path" scope="page" /> 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link type="text/css" href="${path}/static/css/style.css" rel="stylesheet"/>
<link type="text/css" href="${path}/static/css/public.css" rel="stylesheet"/>
<link type="text/css" href="${path}/static/css/index.css" rel="stylesheet"/>
<link rel="stylesheet" href="${path}/static/css/calendar-price-jquery.min.css">
<link href="${path}/static/css/fullcalendar.min.css" rel="stylesheet" />
<link href="${path}/static/css/fullcalendar.print.min.css" rel="stylesheet" media="print" />

<title>index</title>
<script type="text/javascript" src="${path}/static/js/jquery.min.js"></script>
<script type="text/javascript" src="${path}/static/js/highcharts.js"></script>
<script type="text/javascript" src="${path}/static/js/oldie.js"></script>
<script type="text/javascript" src="${path}/static/js/exporting.js"></script>
<script type="text/javascript" src="${path}/static/js/highcharts-zh_CN.js"></script>
<script src="${path}/static/js/calendar-price-jquery.min.js"></script>
<script src="${path}/static/js/moment.min.js"></script>
<script src="${path}/static/js/fullcalendar.min.js"></script>
<script>

  $(document).ready(function() {
	  DivCalendar();
  });

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
				//DivDay(theDate);
			},
			eventClick: function() {  },
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

<script>
//内容部分高度自适应
$(function(){
	$(".center").css("height",$(window).height()-190);
});  
var h = (window.innerHeight || (window.document.documentElement.clientHeight || window.document.body.clientHeight));
  $(".center").css({"height":h-190});
  window.onresize = resize;
  function resize(){
    var h = (window.innerHeight || (window.document.documentElement.clientHeight || window.document.body.clientHeight));
    $(".center").css({"height":h-190});
  }

//图表
var chart = null;
$(function () {
	// 饼状图1
    $('#pie1').highcharts({
        chart: {
		    backgroundColor: null,
            plotBackgroundColor: null,
            plotBorderWidth: null,
            plotShadow: false,
            spacing : [0, 10 , 0, 10]
        },
        colors: ['#62a1f6','#2ec7c9','#b6a2de','#d87a80','#ffb980', '#6188bc','#52af87','#847cd2','#ec82b9','#fbde87'],	
		exporting:{
			enabled: false //关闭网址链接
			},
		credits: {
            enabled: false //关闭下载按钮
        },
        title: {
            text:null
        },

        tooltip: {
            headerFormat: '{series.name}<br>',
            pointFormat: '{point.name}:{point.percentage:.1f}%'
        },
        plotOptions: {
            pie: {
                allowPointSelect: true,
                cursor: 'pointer',
                dataLabels: {
                    enabled: true,
                    format: '<b>{point.name}</b>: {point.percentage:.1f} %',
                    style: {
                        color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
                    }
                }
            }
        },
        series: [{
            type: 'pie',
            name: '待录入信访来源',
            data: eval($("#pieStr1").val()),
            dataLabels: {
                enabled: true,
                color: '#666',
                align: 'center',
                style: {
					fontFamily: "微软雅黑",
					fontSize: '14px',
					fontWeight: 'normal'
                }
            }
        }]
    });
	
	// 饼状图2
    $('#pie2').highcharts({
        chart: {
		    backgroundColor: null,
            plotBackgroundColor: null,
            plotBorderWidth: null,
            plotShadow: false,
            spacing : [0, 10 , 0, 10]
        },
        colors: ['#62a1f6','#2ec7c9','#b6a2de','#d87a80','#ffb980', '#6188bc','#52af87','#847cd2','#ec82b9','#fbde87'],	
		exporting:{
			enabled: false //关闭网址链接
			},
		credits: {
            enabled: false //关闭下载按钮
        },
        title: {
            text:null
        },

        tooltip: {
            headerFormat: '{series.name}<br>',
            pointFormat: '{point.name}:{point.percentage:.1f}%'
        },
        plotOptions: {
            pie: {
                allowPointSelect: true,
                cursor: 'pointer',
                dataLabels: {
                    enabled: true,
                    format: '<b>{point.name}</b>: {point.percentage:.1f} %',
                    style: {
                        color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
                    }
                }
            }
        },
        series: [{
            type: 'pie',
            name: '待分流信访来源',
            data: eval($("#pieStr2").val()),
            dataLabels: {
                enabled: true,
                color: '#666',
                align: 'center',
                style: {
					fontFamily: "微软雅黑",
					fontSize: '14px',
					fontWeight: 'normal'
                }
            }
        }]
    });
	
	//线形图
	$('#line1').highcharts({
        colors: ['#62a1f6','#2ec7c9','#b6a2de','#d87a80','#ffb980', '#6188bc','#52af87','#847cd2','#ec82b9','#fbde87'],	
		exporting:{
			enabled: false //关闭网址链接
			},
		credits: {
            enabled: false //关闭下载按钮
        },
        title: {
            text:null
        },
        xAxis: {
            tickInterval: 1
        },
		yAxis: {
			title: {
				text: '数量'
			}
		},
		legend: {
			layout: 'vertical',
			align: 'right',
			verticalAlign: 'middle'
		},
		plotOptions: {
			series: {
				label: {
					connectorAllowed: false
				},
				pointInterval: 1,
				pointStart: eval($("#pointStart").val()),
				pointEnd:eval($("#pointEnd").val())
			}
		},
		series:  eval($("#zxtStr").val()),
		responsive: {
			rules: [{
				condition: {
					maxWidth: 500
				},
				chartOptions: {
					legend: {
						layout: 'horizontal',
						align: 'center',
						verticalAlign: 'bottom'
					}
				}
			}]
		}	
	
	})
	
	
});

//标签切换
function SetTab(tab,id,cnt){
  var menus=document.getElementById(tab).getElementsByTagName("li");
  for(i=0;i<cnt;i++){
	i==id?menus[i].className="on":menus[i].className="";
	i==id?document.getElementById(tab+"-content"+i).className="block":document.getElementById(tab+"-content"+i).className="none";
  }
}

</script>
</head>

<body>

<jsp:include page="include/top.jsp"></jsp:include>

<div class="center">

  <div class="center_right">
  
    <div class="center_right1">
      <div class="tabber">
        <div class="tmenu">
          <ul id="tab">
            <li  class="on" onmouseover="SetTab('tab',0,2);"><a class="conter_right_tab1" href="javascript:void(0);">待录入信访数据</a></li>
            <li  onmouseover="SetTab('tab',1,2);"><a class="conter_right_tab2" href="javascript:void(0);">待分流信访数据</a></li>
          </ul>
        </div>
        
        <div class="tbox">
          <div id="tab-content0" class="block">
            
            
            <div class="tab_l">
              <div class="tab_list">
                <ul>
                  	<c:forEach items="${picTyping }" var="li" varStatus="status">
                  		<c:if test="${status.count < 3}">
                 			<li class="tab_list_${status.count }"><span>&nbsp;${li[1] }</span>${li[0] }</li>
                 		</c:if>
                	</c:forEach>
                </ul>
              </div>
            </div>
            <div class="tab_r">
              <div class="tab_list">
                <ul>
                  <c:forEach items="${picTyping }" var="li" varStatus="status">
                  		<c:if test="${status.count > 2}">
                 			<li class="tab_list_${status.count }"><span>&nbsp;${li[1] }</span>${li[0] }</li>
                 		</c:if>
                  </c:forEach>
                </ul>
              </div>
            </div>
          </div>
          <div id="tab-content1" class="none">
            <div class="tab_l">
              <div class="tab_list">
                <ul>
                  <c:forEach items="${picPass }" var="li" varStatus="status">
                  		<c:if test="${status.count < 3}">
                 			<li class="tab_list_${status.count }"><span>&nbsp;${li[1] }</span>${li[0] }</li>
                 		</c:if>
                  </c:forEach>
                </ul>
              </div>
            </div>
            <div class="tab_r">
              <div class="tab_list">
                <ul>
                  <c:forEach items="${picPass }" var="li" varStatus="status">
                  		<c:if test="${status.count > 2}">
                 			<li class="tab_list_${status.count }"><span>&nbsp;${li[1] }</span>${li[0] }</li>
                 		</c:if>
                  </c:forEach>
                </ul>
              </div>
            </div>
          </div>
         
        </div>
      </div>
    
    </div>
    <div class="center_right2">
       <h1 class="kzt_bt"><span>任务管理</span></h1>
      <div class="center_right_rl">
        <div id="calendar"></div>
      </div>
    </div>
  </div>
  
  <div class="center_left">
    <div class="center_left1">
      <div class="center_left1_d">共受理信访数据 <br /><span>${all }</span> 件</div>
      <div class="center_left1_d">未办结事件 <br /><span>${notFinish }</span> 件</div>
    </div>
    <div class="center_left2">
      <div class="center_left2_l">
        <div class="left2_title">待录入信访来源</div>
        <div id="pie1" style="width:100%;height:400px"></div>
      </div>
      <div class="center_left2_r">
        <div class="left2_title">待分流信访来源</div>
        <div id="pie2" style="width:100%;height:400px"></div>
      </div>
      <div class="clear"></div>
    </div>
    <div class="center_left3">
        <div class="left2_title">各年度信访数量统计</div>
      <div id="line1" style="width:100%;min-height:300px"></div>
    </div>
  </div>
  <div class="clear"></div>
</div>

<!-- 待录入信访来源 -->
<c:choose> 
<c:when test="${!empty picTyping}">
<input type="hidden" value="${prepareTyping}" id="pieStr1" name="pieStr1"/>   
</c:when> 
<c:otherwise>    
<input type="hidden" value="" id="pieStr1" name="pieStr1"/> 
</c:otherwise> 
</c:choose>
<!--待分流信访来源  -->
<c:choose> 
<c:when test="${!empty picPass}">
<input type="hidden" value="${preparePass}" id="pieStr2" name="pieStr2"/>   
</c:when> 
<c:otherwise>    
<input type="hidden" value="" id="pieStr2" name="pieStr2"/> 
</c:otherwise> 
</c:choose>
<!-- 折线图 -->
<c:choose> 
<c:when test="${!empty pic}">
<input type="hidden" value="${zxt}" id="zxtStr" name="zxtStr"/>   
</c:when> 
<c:otherwise>    
<input type="hidden" value="" id="zxtStr" name="zxtStr"/> 
</c:otherwise> 
</c:choose>
<input type="hidden" id="pointStart" name="pointStart" value="${pointStart }">
<input type="hidden" id="pointEnd" name="pointEnd" value="${pointEnd }">
</body>
</html>
