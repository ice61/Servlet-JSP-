<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>中国人寿——业务员注册</title>
<script src="https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js">
</script>

<style type="text/css">
input::-webkit-outer-spin-button,
    input::-webkit-inner-spin-button {
        -webkit-appearance: none;
    }
    input[type="number"]{
        -moz-appearance: textfield;
    }
    
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

.form {
	position:absolute;
	margin-top:350px;
	margin-left:300px;
}
</style>
</head>
<body>
<script type="text/javascript">
window.onload = function() {
	var id = document.getElementById("clerk_id").value;
	if(id != "") {
		window.location.reload();
	}
};
</script>
<!--
	以下代码用于创建XMLHttpRequest，以此来实现ajax
 -->
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
</script>

<!-- 
	idCheck 函数用来判断工号是否已经被注册过

	psCheck 函数用来判断两次的密码输入是否一致
	
	psCheck2函数用来判断密码是否存在空格
	
	nameCheck函数用来判断姓名中是否包含空格
	
	questionCheck函数用来判断密保问题中是否包含空格
 -->
<script type="text/javascript">
var change = 0;
function idCheck() {
	var clerkEle = document.getElementById("clerk_id");
	//window.alert("+++" + clerkEle.value);
	var xmlHttp = createXMLHttpRequest();
	xmlHttp.open("POST","/list/FindIDServlet",true);
	xmlHttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
	//window.alert(1); 
	//window.alert(clerkEle.value);
	xmlHttp.send("clerkid="+clerkEle.value);
	xmlHttp.onreadystatechange = function() {
		if(xmlHttp.readyState==4 && xmlHttp.status==200) {
			if(xmlHttp.responseText=="true") {
				document.getElementById("errorId").innerHTML = "此工号已被注册";
				document.getElementById("errorId").setAttribute("error", 0);
			}else {
				document.getElementById("errorId").innerHTML = "";
				document.getElementById("errorId").setAttribute("error", 1);
			}
		}
	}
	change = 1;
}
	
function psCheck() {
	var ps1 = document.getElementById("clerk_password1").value;
	var ps2 = document.getElementById("clerk_password2").value;
	//alert("||"+ps1 +"||"+ps2+"||");
	if(ps1 != "" && ps2 != "") {
		if(ps1 != ps2) {
			document.getElementById("errorPs").innerHTML = "两次密码输入不一致";
			document.getElementById("errorPs").setAttribute("error", 0);
		}else {
			document.getElementById("errorPs").innerHTML = "";
			document.getElementById("errorPs").setAttribute("error", 1);
		}
	}
}

function psCheck2() {
	var ps1 = document.getElementById("clerk_password1").value;
	var n = ps1.search(" ");
	if(n != -1) {
		document.getElementById("ps1").innerHTML = "密码中不允许出现空格";
		document.getElementById("errorPs").setAttribute("error1", 0);
	}else {
		document.getElementById("ps1").innerHTML = "";
		document.getElementById("errorPs").setAttribute("error1", 1);
	}
}

function nameCheck() {
	var name = document.getElementById("clerk_name").value;
	var n = name.match(/[\u4e00-\u9fa5]{2,4}/);
	if(n != name) {
		document.getElementById("errorName").innerHTML = "请正确填写姓名";
		document.getElementById("errorName").setAttribute("error", 0);
	}else {
		document.getElementById("errorName").innerHTML = "";
		document.getElementById("errorName").setAttribute("error", 1);
	}
}

function questionCheck() {
	var name = document.getElementById("clerk_question").value;
	var n = name.search(" ");
	if(n != -1) {
		document.getElementById("errorQt").innerHTML = "答案中不允许包含空格";
		document.getElementById("errorQt").setAttribute("error", 0);
	}else {
		document.getElementById("errorQt").innerHTML = "";
		document.getElementById("errorQt").setAttribute("error", 1);
	}
}

</script>

<!-- 

	check函数实现了用户提交表单时对表单的判断，如果信息不符合标准，则无法提交表单
	
 -->
 
<script type="text/javascript">

function check() {
	
	var flag;
	flag = document.getElementById("errorId").getAttribute("error");
	//window.alert("||" + flag +"||");
	if(flag == "0") {
		window.alert("请按要求填写注册信息");
		return false;
	}
	flag = document.getElementById("errorName").getAttribute("error");
	if(flag == "0") {
		window.alert("请按要求填写注册信息");
		return false;
	}
	flag = document.getElementById("errorPs").getAttribute("error");
	if(flag == "0") {
		window.alert("请按要求填写注册信息");
		return false;
	}
	flag = document.getElementById("errorPs").getAttribute("error1");
	if(flag == "0") {
		window.alert("请按要求填写注册信息");
		return false;
	}
	flag = document.getElementById("errorQt").getAttribute("error");
	if(flag == "0") {
		window.alert("请按要求填写注册信息");
		return false;
	}
	if(change == 0) {
		document.getElementById("errorId").innerHTML = "请重新输入新的工号";
		return false;
	}
	return true;
}
</script>
<!-- 
	以下脚本用于实现密码输入项和密保问题输入项的提示信息的隐藏和展示
 -->

<script>
	$(document).ready(function() {
		$("#clerk_password1").focus(function() {
			$("#ps").show();
		});
		$("#clerk_password1").blur(function() {
			$("#ps").hide();
		});
		$("#clerk_question").focus(function() {
			$("#qt").show();
		});
		$("#clerk_question").blur(function() {
			$("#qt").hide();
		})
	});
</script>
<div class="background"></div>
<div class="form">
<form action="/sale/RegisteServlet" method="post" onsubmit="return check()">
	<table>
			<tr> 
				<td>工号：</td>
				<td>
					<div><input type="number" oninput="if(value.length>10)value=value.slice(0,10)"
						 id="clerk_id" name="id" required="required" onblur="idCheck()" 
						 onKeypress="return (/[\d]/.test(String.fromCharCode(event.keyCode)))"/>
					</div>
					<div id="errorId" style="color:red;"></div>
				</td>
			</tr>
			<tr>
				<td>姓名：</td>
				<td>
					<div><input type="text" id="clerk_name" name="name" required="required" onblur="nameCheck()" maxlength="5"/></div>
					<div id="errorName" style="color:red;"></div>
				</td>
			</tr>
			<tr>
				<td>性别：</td>
				<td>男<input type="radio" name="sex" id="clerk_sex" value="male" required="required"/>
				女<input type="radio" name="sex" id="clerk_sex" value="female" required="required"/></td>
			</tr>
			<tr>
				<td>密码：</td>
					<td>
						<div>
							<input type="password" id="clerk_password1" name="password1" 
								maxlength=12 required="required" onblur="psCheck();psCheck2()"/>
							<div id="ps" style="display:none;">密码长度需小于12位</div>
							<div id="ps1" style="color:red;"></div>
						</div>
					</td>
			</tr>
			<tr>
				<td>再次输入密码：</td>
				<td>
					<div><input type="password" id="clerk_password2" maxlength=12 required="required" onblur="psCheck()"/></div>
					<div id="errorPs" style="color:red;"></div>
				</td>
			</tr>
			<tr>
				<td>密保问题（最喜欢的水果）：</td>
				<td>
					<div>
						<input type="text" id="clerk_question" name="question" maxlength=5 required="required"/ onblur="questionCheck()">
					</div>
					<div id="qt" style="display:none;">答案需在五个字之内</div>
					<div id="errorQt" style="color:red;"></div>
				</td>
			</tr>
	</table>
			<input type="submit" value="注册"/>
</form>
</div>
</body>
</html>