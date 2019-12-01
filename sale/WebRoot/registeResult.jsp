<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js">
</script>
<title>注册结果</title>
<style type="text/css">
.background {
	left:0;
	top:0;
	width:100%;
	height:100%;
	position:absolute;
	float:left;
	background-image:url(picture/registe.jpg);
	background-repeat:no-repeat;
	filter:blur(10px);
	transition-duration:0.4s;		
}

.background:hover {
	filter:blur(0px);
}
</style>
</head>
<body>
<script type="text/javascript">
function createXMLHttpRequest() {
	var xmlHttp;
	//适用于大多数浏览器
	try {
		xmlHttp = new XMLHttpRequest();
	}catch(e) {
		try {
			xmlHttp = new ActiveXObject("Msxm12.XMLHTTP");
		}catch(e) {
			try {
				xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
			}catch(e){}		
		}
	}
	return xmlHttp;
}
window.onload = function() {
	var text =null;
	var x1 = createXMLHttpRequest();
	x1.open("GET","/sale/RegisteServlet?time="+new Date().getTime(),true);
	x1.send(null);
	x1.onreadystatechange = function() {
		if(x1.readyState == 4 && x1.status == 200) {
			 text = x1.responseText;			//中文乱码
			 //alert(x1.responseText);
			 //alert(text);
		     var x2 = createXMLHttpRequest();
	    	 x2.open("POST","/list/RegisteWriteServlet",true);
			 x2.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
			 var clerk = eval("(" + text + ")");
			 //alert(text);						//此处中文为乱码
			 //alert(clerk.name);
			 x2.send("name="+clerk.name+"&id="+clerk.id+"&password="+clerk.password+"&sex="+clerk.sex+"&question="+clerk.question);
			 x2.onreadystatechange = function() {
					if(x2.readyState==4 && x2.status==200) {
						//alert(x2.responseText);
						if(x2.responseText=="true") {
							document.getElementById("h1").innerHTML = "注册成功";
							document.getElementById("id").innerHTML = clerk.id;
							document.getElementById("name").innerHTML = clerk.name;
							//document.getElementById("sex").innerHTML = clerk.sex;
							if(clerk.sex=="male") {
								document.getElementById("sex").innerHTML = "男";
							}else {
								document.getElementById("sex").innerHTML = "女";
							}
							document.getElementById("ps").innerHTML = clerk.password;
							document.getElementById("qt").innerHTML = clerk.question;
						}else {
							document.getElementById("h1").innerHTML = "注册失败";
						}
					}
				};
		}
	};
	//alert(text);
	/*var x2 = createXMLHttpRequest();
	x2.open("POST","/list/RegisteWriteServlet",true);
	x2.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
	var clerk = eval("(" + text + ")");
	//window.alert(text);
	//window.alert(clerk.name);
	x2.send("name=clerk.name");*/
};
</script>

<script>
$(document).ready(function(){
	  $("#password").click(function(){
	    $("#ps").toggle("slow");
	  });
	  $("#question").click(function() {
		 $("#qt").toggle("slow"); 
	  });
	});
</script>
<div class="background"></div>
<div style="margin-top:350px;margin-left:300px;position:absolute;">
<h1 id = "h1"></h1>
<div>
<table>
		<tr>
			<td>工号：</td>
			<td id="id"></td>
		</tr>
		<tr>
			<td>姓名：</td>
			<td id="name"></td>
		</tr>
		<tr>
			<td>性别：</td>
			<td id="sex"></td>
		</tr>
		<tr>
			<td id="password">点我查看/隐藏密码:</td>
			<td id="ps" style="display:none;"></td>
		</tr>
		<tr>
			<td id="question">点我查看/隐藏密保问题答案：</td>
			<td id="qt" style="display:none;"></td>
		</tr>
	
</table>
</div>
<a href="/sale/login.jsp">登陆</a>
</div>
</body>
</html>