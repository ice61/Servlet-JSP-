<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>中国人寿保险销售系统</title>

<style type="text/css">

.login {
	background-color:#33ffff;
	font-size:40px;
	border-radius:10px;
	transition:background-color 1s, font-size 1s, transform 1s;
}

.login:hover {
	background-color:#6633ff;
	font-size:200px;
	border-radius:50px;
	transform:rotate(720deg);
}

.registe {
	background-color:#ffccff;
	font-size:40px;
	border-radius:10px;
	transition:background-color 1s, font-size 1s, transform 1s;
}

.registe:hover {
	background-color:#ff3333;
	font-size:200px;
	border-radius:50px;
	transform:rotate(720deg);
}
	
.button {
	position:absolute;
	margin-top:300px;
	margin-left:45%;
}

.background {
	background-image:url(picture/menu.jpg);
	left:0;
	top:0;
	width:100%;
	height:100%;
	background-repeat:no-repeat;
	float:left;
	position:absolute;
	filter:blur(10px);
	transition-duration:0.5s;
}
.background:hover {
	filter:blur(0px);
}
</style>
</head>
<body>
	<div class="background"></div>
	<div class="button">
		<div><input type="button" value="注册" class="registe" onclick="window.location.href='/sale/registe.jsp'"/></div>
		<div><input type="button" value="登陆" class="login" onclick="window.location.href='/sale/login.jsp'"/></div>
	</div>
</body>
</html>