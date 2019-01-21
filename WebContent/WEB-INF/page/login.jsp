<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" import="java.util.*"%>
<c:set value="${pageContext.request.contextPath}" var="path" scope="page" /> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="Mosaddek">
<meta name="keyword" content="FlatLab, Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">

<link type="text/css" href="${path}/static/css/style.css" rel="stylesheet"/>
<link type="text/css" href="${path}/static/css/login.css" rel="stylesheet"/>
<script src="${path}/static/js/canvas/js/jquery.min.js"></script>
<script src="${path}/static/js/canvas/jquery.webcam.min.js"></script>

<title>登录</title>

<script>
var code ; //在全局 定义验证码   
function createCode(){    
    code = "";    
    var codeLength = 4;//验证码的长度    
    //所有候选组成验证码的字符，可以用中文    
    var selectChar = new Array(0,1,2,3,4,5,6,7,8,9,'A','B','C',  
            'D','E','F','G','H','I','J','K','L','M','N','O','P',  
            'Q','R','S','T','U','V','W','X','Y','Z','a','b','c',  
            'd','e','f','g','h','i','j','k','l','m','n','o','p',  
            'q','r','s','t','u','v','w','x','y','z');    
    for(var i=0;i<codeLength;i++){    
        var charIndex = Math.floor(Math.random()*60);    
        code +=selectChar[charIndex];    
    }    
    return code;    
}    
function validate(){    
    var inputCode = document.getElementById("code").value.toLowerCase();   
    if(inputCode.length <=0){    
    	$("#prompt").text("请输入验证码！"); 
        return false;    
    }    
    if(inputCode != code.toLowerCase()){   
    	$("#prompt").text("验证码输入错误！"); 
    	$("#code").val("");
        show();//刷新验证码    
        return false;    
    }
    return true;        
}    
function show(){    
        //显示验证码    
        document.getElementById("codeImg").src="tc_f?code="+createCode();    
}    
window.onload = function() {  
        show();//页面加载时加载验证码    
    }  

function checkinfo()
{
	if(validate()==false){
		return false;
	}
	var name=document.getElementById("username").value;
	var pass=document.getElementById("password").value;
	if(name.trim()=="" || name.trim() == "用户名"){
    	$("#prompt").text("填写用户名！");
		return false;
	}
	if(pass.trim()=="" || pass.trim() == "密码"){
    	$("#prompt").text("填写密码！");
		return false;
	}
	
	$.ajax({
        type: "POST",
        dataType: 'json',
        url: "logon",
        data: {"username":name,"password":pass},
        traditional: true,
        dataType: "json",
        success: function(data){
        	if(data.status==0) {
        		/* $("#personId").val(data.userId);
            	$("#prompt").text("请摄像头对准面部拍照！"); */
        		var form = $("<form>");   //定义一个form表单
                form.attr('style', 'display:none');   //在form表单中添加查询参数
                form.attr('target', '');
                form.attr('method', 'post');
                form.attr('action', "cm_index");
                var bookingId = $('<input>');
            	bookingId.attr('type', 'hidden');
            	bookingId.attr('name', 'personId');
            	bookingId.attr('value', data.userId);
            	form.append(bookingId);
                $(document.body).append(form);
            	form.submit();
            	return;
            }else if(data.status == 1){
            	$("#prompt").text("用户名密码不匹配！");
                show();//页面加载时加载验证码    
            }
        },
        error:function(){
 	 	}
    });
}

</script> 

</head>

<body>
    <div class="login-bj">
        <div class="login-bt">
            <p>智能信访数据处理平台</p>
        </div>
        <p class="login-bbh">V 1.0.1.1.20171129</p>
    	<div class="login-center">
    		<div class="login-left">
    			<div class="login-left-img">
    				<div id="webcam"></div>
    			</div>
   			  <input type="button" id="play" name="play" value="拍摄照片" class="pic_input" onclick="photoGraph();"> 
    		</div>
    		
    		<form action="login">
        	<input type="hidden" id="personId" name="personId"/>
    		<div class="login-right">
    			<ul>
    				<li>
   					  <div class="login_tittle"></div>
                    </li>
    				<li class="login-right-li">
    					<input type="text" name="username" id="username" class="login-user" value="用户名" onfocus="if(value=='用户名')value=''" onblur="if(!value)value='用户名'">
    				</li>
    				<li class="login-right-li">
    					<input type="text" name="password" id="password" class="login-password"  value="密码" onfocus="modiFyType(this)" onblur="if(!value)value='密码'">
    					<script>
                             function modiFyType(obj){
								 obj.value = "";
								 obj.type = "password"
							 }    
					    </script>
    				</li>
    				<li class="login-right-li login-right-li-yz">
    					<input type="text" name="textfield2" id="code" maxlength="4" class="code" value="验证码" onfocus="if(value=='验证码')value=''" onblur="if(!value)value='验证码'">
    					<img id="codeImg"  onclick="javascript:show();return false;" />
    				</li>
    				<li class="login-right-li-sm">
    					<p><span id="prompt" name="prompt"><!-- *用户名或密码错误 --></span></p>
    				</li>
    				<li class="login-forget">
    					<a href="#">忘记密码</a>
    				</li>
    				<li class="login-right-li-btn">
    					<input class="login-btn" type="button" onclick="return checkinfo();" value="登录"/>
    				</li>
    			</ul>
    		</div>
    	</div>
    	<p class="login-explain">为了更好更流畅的体验该站，建议使用IE7.0以上版本进行浏览</p>	
    </div>
<canvas id="canvas" height="240" width="320"></canvas>    
</body>
<script>
    var w = 320, h = 240;                                       //摄像头配置,创建canvas
    var pos = 0, ctx = null, saveCB, image = [];
    var canvas = document.createElement("canvas");
    $("body").append(canvas);
    canvas.setAttribute('width', w);
    canvas.setAttribute('height', h);
    ctx = canvas.getContext("2d");
    image = ctx.getImageData(0, 0, w, h);


    $("#webcam").webcam({
        width: w,
        height: h,
        mode: "callback",                       //stream,save，回调模式,流模式和保存模式
        swffile: "static/js/canvas/jscam_canvas_only.swf",
        onTick: function(remain) { 
            if (0 == remain) {
                $("#status").text("拍照成功!");
            } else {
                $("#status").text("倒计时"+remain + "秒钟...");
            }
        },
        onSave: function(data){              //保存图像
            var col = data.split(";");
            var img = image;
            for(var i = 0; i < w; i++) {
                var tmp = parseInt(col[i]);
                img.data[pos + 0] = (tmp >> 16) & 0xff;
                img.data[pos + 1] = (tmp >> 8) & 0xff;
                img.data[pos + 2] = tmp & 0xff;
                img.data[pos + 3] = 0xff;
                pos+= 4;
            }
            if (pos >= 4 * w * h) {
                ctx.putImageData(img,0,0);      //转换图像数据，渲染canvas
                pos = 0;
                Imagedata=canvas.toDataURL().substring(22);  //上传给后台的图片数据
                alert(Imagedata);
                $.ajax({
                    type: "POST",
                    dataType: 'json',
                    url: "logonImage",
                    data: {"personId":$("#personId").val(),"Imagedata":Imagedata},
                    traditional: true,
                    dataType: "json",
                    success: function(data){
                    	if(data.status==0) {
                    		var form = $("<form>");   //定义一个form表单
                            form.attr('style', 'display:none');   //在form表单中添加查询参数
                            form.attr('target', '');
                            form.attr('method', 'post');
                            form.attr('action', "cm_index");
                            $(document.body).append(form);
                        	form.submit();
                        	return;
                        }else if(data.status == 1){
                        	$("#prompt").text("服务器异常，请重新拍照！");
                        }else if(data.status==2){
                        	$("#prompt").text("人像登录失败，请重新拍照！");
                        }
                    },
                    error:function(){
             	 	}
                });
                
            }
        },
        onCapture: function () {               //捕获图像
            webcam.save();      
        },
        debug: function (type, string) {       //控制台信息
            console.log(type + ": " + string);
        },
        onLoad: function() {                   //flash 加载完毕执行
            console.log('加载完毕！')
            var cams = webcam.getCameraList();
            for(var i in cams) {
                $("body").append("<p>" + cams[i] + "</p>");
            }
        }
    });  

    function photoGraph(){
    	if($("#personId").val() == ""){
        	$("#prompt").text("请先校验用户名密码！");
        	return false;
		}
        webcam.capture(0);        //拍照，参数5是倒计时
    }
  

</script> 
</html>
