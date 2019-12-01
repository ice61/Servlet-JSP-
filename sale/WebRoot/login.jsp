<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="pragma" content="no-cache"> 
<meta http-equiv="Cache-Control" content="no-cache, must-revalidate"> 
<meta http-equiv="expires" content="Wed, 26 Feb 1997 08:21:57 GMT">
<title>中国人寿——业务员登陆</title>
<!-- change1函数实现了验证码的改变 -->
<script>
	function change1() {
		var img = document.getElementById("picture");
		img.src = "/sale/VerifyCodeServlet?time+" + new Date().getTime();
	}	
</script>
<!-- see函数实现了查看密码和隐藏密码功能  -->
<script>
	function see() {
		var ps = document.getElementById("ps");
		//window.alert(ps.type);
		if(ps.type=="password") {
			//window.alert(1);
			ps.type="text";
		}else if(ps.type=="text"){
			ps.type="password";
			//window.alert(2);
		}
	}
</script>
<!-- real函数用于将真正的登陆界面展现 -->
<script type="text/javascript">
function real() {
	window.alert("其实这个是假的");
	document.getElementById("background").removeAttribute("hidden");
	document.getElementById("form").removeAttribute("hidden");
}
</script>

<style>
.form {
	border-radius:10px;
	width:18%;
    border:25px solid #66ffcc;
    padding:25px;
   	margin-top:300px;
   	margin-bottom:250px;
   	margin-left:38%;
   	margin-right:38%;
    text-align:center;
    background:#ffffcc;
    position:absolute;
    filter:blur(10px);
    transition-duration:0.4s;
}
.form:hover {
	filter:blur(0px);
}	
.background {
	position:absolute;
	left:0;
	top:0;
	width:100%;
	height:100%;
	background-image:url(picture/login.jpg);
	background-repeat: no-repeat;
	background-size: cover;
	filter:blur(10px);
	float:left;
	transition-duration:0.4s;
}

.background:hover {
	filter:blur(0px);	
}

.fakebackground {
	position:absolute;
	left:0;
	top:0;
	width:100%;
	height:100%;
	background-image:url(picture/fakelogin.jpg);
	background-repeat: no-repeat;
	background-size: cover;
	float:left;
}

.login {
	background-color:#e7e7e7;
	font-size:20px;
	border-radius:10px;
	transition-duration:0.4s;
	
}
.login:hover {
	background-color:#4CAF50;
}
</style>

<script type="text/javascript">
function tips() {
	window.alert("您已登陆，请退出后再登陆");
}
</script>
</head>
<body>
	
	<%
		String id = (String)request.getSession().getAttribute("id");
		//System.out.println(id);
		if(id != null) {
			request.getSession().setAttribute("loginWrong", "wrong");
			request.getRequestDispatcher("/menu.jsp").forward(request, response);
			return;
		}
	%>

	<%
		String idError = "";
		String passwordError = "";
		String vcError = "";
		if(request.getAttribute("idWrong")!=null) {
			idError = (String)request.getAttribute("idWrong");
		}
		
		if(request.getAttribute("psWrong")!=null) {
			passwordError = (String)request.getAttribute("psWrong");	
		}
		
		if(request.getAttribute("vcWrong")!=null) {
			vcError = (String)request.getAttribute("vcWrong");
		}
	%>
	<div class="fakebackground" onclick="real();"></div>
	<div class="background" id="background" hidden="hidden"></div>
	<div class = "form" id="form" hidden="hidden">
	<form action="/sale/LoginServlet" method="post">
		<table>
			<tr>
				<td>工号：</td>
				<td><input type="text" name="clerk_id" required="required"/></td>
				
			</tr>
			<tr>
				<td></td>
				<td style="color:red;"><%=idError %></td>
			</tr>
			<tr>
				<td>密码：</td>
				<td><input type="password" name="clerk_password" id="ps" required="required"/></td>
				<td><input type="button" onclick="see()" value="*"/></td>
				
			</tr>
				<td></td>
				<td style="color:red;"><%=passwordError %></td>
			<tr>
				<td>验证码：</td>
				<td><input type="text" name="VerifyCode"/ required="required"></td>
			</tr>
			<tr>
				<td></td>
				<td style="color:red;"><%=vcError %></td>
			</tr>
			<tr>
				<td><img id="picture" src="/sale/VerifyCodeServlet"/></td>
				<td><a href="javascript:change1()">看不清？点我换一张</a></td>
			</tr>
			<tr>
				<td></td>
				<td><input type="submit" value="登陆" class="login"/></td>			
			</tr>
		</table>
	</form>
	<a href="/sale/registe.jsp">没有账号？点我注册</a>
	</div>
</body>
</html>