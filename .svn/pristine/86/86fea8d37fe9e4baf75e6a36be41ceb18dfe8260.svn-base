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
	  todayTask();
  });
  
  function todayTask(){
	  $.ajax({
			type: "POST",
	        dataType: 'json',
	        url: "cm_task_today",
	        data: {},
	        dataType: "json",
	        success: function(data){
	        	$("#todayTask").html(data.contents);
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
            name: '信访来源',
            data: [
                ['网络', 98],
                ['电话', 125],
                ['到访', 62],
                ['信件', 83],
                ['邮件', 21]
            ],
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
            name: '信访来源',
            data: [
                ['网络', 98],
                ['电话', 125],
                ['到访', 62],
                ['信件', 20],
                ['邮件', 201]
            ],
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
    $('#pie0').highcharts({
        chart: {
		    backgroundColor: null,
            plotBackgroundColor: null,
            plotBorderWidth: null,
            plotShadow: false,
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
            pointFormat: '{point.name}: <b>{point.percentage:.1f}%</b>'
        },
        plotOptions: {
            pie: {
                allowPointSelect: true,
                cursor: 'pointer',
                dataLabels: {
                    enabled: false
                },
                showInLegend: true
            }
        },
        series: [{
            type: 'pie',
            name: '浏览器访问量占比',
            data: [
                ['网络', 98],
                ['电话', 125],
                ['到访', 62],
                ['信件', 83],
                ['邮件', 21]
            ]
        }]
	});
	
	// 柱状图
    $('#bar1').highcharts({
        chart: {
            type: 'column'
        },
        colors: ['#62a1f6','#2ec7c9','#b6a2de','#d87a80','#ffb980', '#6188bc','#52af87','#847cd2','#ec82b9','#fbde87'],	
        title: {
            text: '月平均降雨量'
        },
        subtitle: {
            text: '数据来源: WorldClimate.com'
        },
        xAxis: {
            categories: [
                '一月',
                '二月',
                '三月',
                '四月',
                '五月',
                '六月',
                '七月',
                '八月',
                '九月',
                '十月',
                '十一月',
                '十二月'
            ],
            crosshair: true
        },
        yAxis: {
            min: 0,
            title: {
                text: '降雨量 (mm)'
            }
        },
        tooltip: {
            headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
            pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
            '<td style="padding:0"><b>{point.y:.1f} mm</b></td></tr>',
            footerFormat: '</table>',
            shared: true,
            useHTML: true
        },
        plotOptions: {
            column: {
                borderWidth: 0
            }
        },
        series: [{
            name: '东京',
            data: [49.9, 71.5, 106.4, 129.2, 144.0, 176.0, 135.6, 148.5, 216.4, 194.1, 95.6, 54.4]
        }, {
            name: '纽约',
            data: [83.6, 78.8, 98.5, 93.4, 106.0, 84.5, 105.0, 104.3, 91.2, 83.5, 106.6, 92.3]
        }, {
            name: '伦敦',
            data: [48.9, 38.8, 39.3, 41.4, 47.0, 48.3, 59.0, 59.6, 52.4, 65.2, 59.3, 51.2]
        }, {
            name: '柏林',
            data: [42.4, 33.2, 34.5, 39.7, 52.6, 75.5, 57.4, 60.4, 47.6, 39.1, 46.8, 51.1]
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
		yAxis: {
			title: {
				text: '人数'
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
				pointStart: 2010
			}
		},
		series: [{
			name: '网络',
			data: [43934, 52503, 57177, 69658, 97031, 119931, 137133, 154175]
		}, {
			name: '电话',
			data: [24916, 24064, 29742, 29851, 32490, 30282, 38121, 40434]
		}, {
			name: '到访',
			data: [11744, 17722, 16005, 19771, 20185, 24377, 32147, 39387]
		}, {
			name: '信件',
			data: [null, null, 7988, 12169, 15112, 22452, 34400, 34227]
		}, {
			name: '邮件',
			data: [12908, 5948, 8105, 11248, 8989, 11816, 18274, 18111]
		}],
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
  
    <div class="center_right3">
       <h1 class="kzt_bt"><span>个人任务</span></h1>
      <div class="center_right_rl">
        <div id="calendar"></div>
      </div>
    
    </div>
    <div class="center_right4">
       <h1 class="kzt_bt"><a class="jrrw_more" href="cm_task_listRemind">more+</a><span>今日工作任务</span></h1>
      <div class="center_right_rl">
        <ul id="todayTask">
        </ul>
      </div>

    </div>
  </div>
  
  <div class="center_left">
    <div class="center_left4">
       <h1 class="kzt_bt"><div class="title_sj">目前待提交数据共计： <span>${passCount }</span> 件</div><span>本地待提交</span></h1>
      <div class="dl">
        <ul>
        	<c:forEach items="${waitToPass }" var="li">
          		<li><a href="javascript:void(0);"><span>${li[0] }</span>${li[1] }</a></li>
            </c:forEach>
          <li></li>
          <li></li>
          <li></li>
        </ul>
      </div>
      <div class="clear"></div>
    </div>
    <div class="center_left5">
       <h1 class="kzt_bt"><div class="title_sj">目前处理数据共计： <span>${handleCount }</span> 件</div><span>本地处理</span></h1>
      <div class="dl">
        <ul>
          <c:forEach items="${handle }" var="li">
          		<li><a href="javascript:void(0);"><span>${li[0] }</span>${li[1] }</a></li>
          </c:forEach>
          <li></li>
          <li></li>
          <li></li>
        </ul>
      </div>
      <div class="clear"></div>
    </div>
  </div>
  <div class="clear"></div>
</div>
</body>
</html>
