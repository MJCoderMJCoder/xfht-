<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<c:set value="${pageContext.request.contextPath}" var="path" scope="page" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link type="text/css" href="${path}/static/css/style.css" rel="stylesheet"/>
<link type="text/css" href="${path}/static/css/public.css" rel="stylesheet"/>
<link type="text/css" href="${path}/static/css/other.css" rel="stylesheet"/>
<link rel="stylesheet" href="${path}/static/css/calendar-price-jquery.min.css">
<title>统计报表-年</title>
<script type="text/javascript" src="${path}/static/js/jquery.min.js"></script>
<script type="text/javascript" src="${path}/static/js/highcharts.js"></script>
<script type="text/javascript" src="${path}/static/js/oldie.js"></script>
<script type="text/javascript" src="${path}/static/js/exporting.js"></script>
<script type="text/javascript" src="${path}/static/js/highcharts-zh_CN.js"></script>
<script type="text/javascript" src="${path}/static/js/jquery.SuperSlide.2.1.js"></script>
<!-- 饼状图 -->
<c:choose> 
<c:when test="${!empty pic}">
<input type="hidden" value="${json}" id="pieStr" name="pieStr"/>   
</c:when> 
<c:otherwise>    
<input type="hidden" value="" id="pieStr" name="pieStr"/> 
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
<!-- 柱状图 -->
<c:choose> 
<c:when test="${!empty pic}">
<input type="hidden" value="${yearls}" id="yearStr" name="yearStr"/>   
</c:when> 
<c:otherwise>    
<input type="hidden" value="" id="yearStr" name="yearStr"/> 
</c:otherwise> 
</c:choose>


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
<!--控制表格奇数偶数颜色结束----------------------->



<script>
//内页图表 和控制台的不一样！
var chart = null; 
$(function () {
	//alert(eval("[['普通来访',5],['普通来访1',1]]"));
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
			enabled:true, //关闭下载按钮
			
			},
		credits: {
            enabled: true //关闭网址链接
        },
        title: {
            text:'各年度信访来源统计',
			style:{
					fontFamily: "微软雅黑",
					fontSize: '20px',
				},
			y:20
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
            data: eval($("#pieStr").val()) ,
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
	
	// 柱状图
    $('#bar1').highcharts({
        chart: {
            type: 'column' //切换线形图 type: 'line'
        },
        colors: ['#62a1f6','#2ec7c9','#b6a2de','#d87a80','#ffb980', '#6188bc','#52af87','#847cd2','#ec82b9','#fbde87'],	
        title: {
            text:'各年度信访数量统计',
			style:{
					fontFamily: "微软雅黑",
					fontSize: '20px',
				}
        },
		exporting:{
			enabled:true //关闭下载按钮
			},
		credits: {
            enabled: false //关闭网址链接
        },
        xAxis: {
            categories:  eval($("#yearStr").val()),
            crosshair: true
        },
        yAxis: {
            min: 0,
            title: {
                text: '信访数量'
            }
        },
        tooltip: {
            headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
            pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
            '<td style="padding:0">{point.y:.1f} </td></tr>',
            footerFormat: '</table>',
            shared: true,
            useHTML: true
        },
        plotOptions: {
            column: {
                borderWidth: 0
            }
        },
        series:  eval($("#zxtStr").val())
    });
	
	//线形图
	$('#line1').highcharts({
		//chart:{type:'column'}, //切换柱状图
        colors: ['#62a1f6','#2ec7c9','#b6a2de','#d87a80','#ffb980', '#6188bc','#52af87','#847cd2','#ec82b9','#fbde87'],	
		exporting:{
			enabled:true //关闭下载按钮
			},
		credits: {
            enabled: false //关闭网址链接
        },
        title: {
            text:'各年度信访数量统计',
			style:{
					fontFamily: "微软雅黑",
					fontSize: '20px',
				}
        },
		yAxis: {
			title: {
				text: '信访数量'
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
				pointStart: 2018
			}
		},
		series:  
		         eval($("#zxtStr").val())
		         
		         
		         
		         /* {
			name: '网络',
			data: [43934, 52503, 57177, 69658, 97031, 119931, 137133, 154175,]
		}, {
			name: '电话',
			data: [24916, 24064, 29742, 29851, 32490, 30282, 38121, 40434,]
		}, {
			name: '到访',
			data: [11744, 17722, 16005, 19771, 20185, 24377, 32147, 39387,]
		}, {
			name: '信件',
			data: [null, null, 7988, 12169, 15112, 22452, 34400, 34227,]
		}, {
			name: '邮件',
			data: [12908, 5948, 8105, 11248, 8989, 11816, 18274, 18111,]
		} */ ,
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
</script> 
</head> 
<body>
 <jsp:include page="../include/top.jsp"></jsp:include>
<div class="center">
   <jsp:include page="../include/xf_report.jsp"></jsp:include> 
  <div class="pubilc_right fl">
        <div class="pubilc_right_cn">
            <div class="cfcx">
                 <div class="cfcx_2">
                    <h1 class="kzt_bt"><span>统计报表</span></h1>
                    <div class="select_eg">
                    <form action="cm_report_year" id="cm_report_year_form" method="post">
                      <table width="100%" border="0" cellpadding="0" cellspacing="0">
                            <tbody>
                              <tr>
                                <td class="Txt_right">案件类型：</td>
                                <td><select name="type">
                                <option value="" >==请选择==</option>
                                <c:forEach  items="${zdls }" var="list" varStatus="status"> 
                                 <option value="${list.name }">${list.name }</option>
                                </c:forEach>
                                </select></td>   
                                <td class="Txt_right">上访时间：</td>
                                <td colspan="3"><input value="${stime }" type="date" class="select_time" name="stime">&nbsp;-&nbsp;<input value="${etime }" type="date" class="select_time" name="etime"></td>
                              <td class="Txt_right">&nbsp;</td>
                                <td>&nbsp;</td>
                              </tr> 
                        </tbody>
                          </table>
                          <div class="select_btn">
                              <input type="submit" class="select_ss bt_small" value="搜&nbsp;&nbsp;索" /> 
                              <input type="button" onclick="submit(reset);" class="select_cz bt_small" value="重&nbsp;&nbsp;置"  />
                          </div>
                          </form>
                          </div>
                 </div>
                 <div class="clear"></div>
            </div>
            
            <div class="chart_w">
              <div class="chart_list">
                <div class="chart_title">信访来源</div>
                <ul>
                <c:forEach items="${tableli }" var="li">
                 <li class="chart_list_1"><span>&nbsp;${li[1] }</span>${li[0] }</li>
                </c:forEach>
                <!-- 
                  <li class="chart_list_1"><span>4546</span>网络</li>
                  <li class="chart_list_2"><span>45645</span>到访</li>
                  <li class="chart_list_3"><span>455</span>电话</li>
                  <li class="chart_list_4"><span>4546</span>信件</li>
                  <li class="chart_list_5"><span>7725</span>邮件</li> -->
                </ul>
              </div>
              <div id="pie1" style="width:60%;min-height:300px;"></div>
            </div>
            <div class="chart_w">
              <div id="line1" style="width:100%;min-height:300px"></div>
            </div>
            <div class="chart_w">
              <div id="bar1" style="width:100%;min-height:300px"></div>
            </div>
            
            <div class="kzt_table">
					<table id="Table" class="table_bg">
						<tbody>
							<tr>
								<th>序号</th>
								<th>年份</th>
								<th>数量</th>
								<th>占比</th>
							</tr>
							<c:forEach items="${downtable}" var="tab" varStatus="sta"> 
							<tr>
								<td>${sta.count }</td>
								<td>${tab[0] }</td>
								<td>${tab[1] }</td>
								<td>${tab[2]*100 }%</td>
							</tr>
							 </c:forEach>
						</tbody>
					</table>
				</div>
    	</div>
  </div>
</div>


</body>
</html>