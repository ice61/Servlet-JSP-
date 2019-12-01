<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">

.background {
	background-image:url(picture/button.jpg);
	background-repeat:no-repeat;
	background-size:cover;
	float:left;
	position:absolute;
	left:0;
	top:0;
	width:100%;
	height:100%;
}

.button {
	font-size:30px;
	border-radius:10px;
	transition-duration:0.5s;
}

.button:hover {
	font-size:50px;
	border-radius:30px;
}

.exit {
	background-color:#ff9933;
}

.exit:hover {
	background-color:#ff6600;
}

.insurance {
	background-color:#33ffff;
}

.insurance:hover {
	background-color:#00ff66;
}

.registe {
	background-color:#ff99ff;
}

.registe:hover {
	background-color:#ff33ff;
}

.change {
	background-color:#ffff99;
}

.change:hover {
	background-color:#ffff00;
}
</style>
</head>
<%
	String id = (String)request.getSession().getAttribute("id");
	String name = (String)request.getSession().getAttribute("name");
	if(id == null && name == null) {
		request.getRequestDispatcher("/main.jsp").forward(request, response);
	}
%>

<script type="text/javascript">
window.onload = function() {
	if(window.top == window) {
		//location.href="/sale/menu.jsp";
	}
};
</script>

<script type="text/javascript">
function createXMLHttpRequest() {
	var xmlHttp;
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
</script>

<script type="text/javascript">
function registe() {
	window.top.location.href="/sale/registe.jsp";	
}

function insurance() {
	window.open("/sale/insurance.jsp", "main_interface",false);	
}

function check() {
	window.open("/sale/checkWarranty.jsp","main_interface",false);
}

function change() {
	if(confirm("是否切换账号？")) {
		var x1;
		x1 = createXMLHttpRequest();
		x1.open("GET","/sale/ExitServlet",true);
		x1.send(null);
		x1.onreadystatechange = function() {
			if(x1.readyState == 4 && x1.status == 200) {
				if(x1.responseText == "账号退出成功");
				window.top.location.href="/sale/login.jsp";
			}
		}
	}
}

function exit() {
	if(confirm("确认退出此账号？")) {
		var x1;
		x1 = createXMLHttpRequest();
		x1.open("GET","/sale/ExitServlet",true);
		x1.send(null);
		x1.onreadystatechange = function() {
			if(x1.readyState == 4 && x1.status == 200) {
				alert(x1.responseText);
				window.top.location.reload();
				//window.top.location.href="/sale/main.jsp"; 
			}
		}
	}
}
</script>

<body>
	<div class="background"></div>
	<div style="position:absolute;margin-top:200px;margin-left:65px;">
		<div><input class="button registe" type="button" value="注册账号" onclick="registe();"/></div>
		<div><input class="button insurance" type="button" value="填写保单" onclick="insurance();"/></div>
		<div><input class="button check" type="button" value="我的保单" onclick="check();"/></div>
		<div><input class="button change" type="button" value="切换账号" onclick="change();"/></div>
		<div><input class="button exit" type="button" value="退出登录" onclick="exit();"/></div>
	</div>
</body>
</html>