<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>保单信息</title>

<style>
.background {
	left:0;
	top:0;
	width:100%;
	height:100%;
	position:absolute;
	float:left;
	background-image:url(picture/submitResult.jpg);
	background-repeat:no-repeat;
	filter:blur(10px);
	transition-duration:0.4s;		
}

.background:hover {
	filter:blur(0px);
}

.result {
	position:absolute;
	margin-top:150px;
	margin-left:40%;
	text-align:center;
	filter:blur(5px);
	transition-duration:0.4s;
	border-radius:10px;
	border:15px solid;
	border-image:linear-gradient(#66ccff, #3300ff) 1 1;
	padding:15px;
}

.result:hover {
	filter:blur(0px);
}

.new {
	background-color:#ffff33;
	font-size:25px;
	border-radius:10px;
	transition-duration:1.0s;
}

.new:hover {
	background-color:#ff3366;
}

</style>
</head>
<%
	String name = (String)request.getSession().getAttribute("name");
	String id = (String)request.getSession().getAttribute("id");
	if(name == null && id == null) {
		request.getRequestDispatcher("/main.jsp").forward(request, response);
		//out.print("已经执行");
		return;
	}
%>
<body>


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

window.onload = function() {
	if(window.top == window) {
		location.href="/sale/menu.jsp";
		return;
	}
	
	var information = null;
	var x1 = createXMLHttpRequest();
	x1.open("GET","/sale/SubmitServlet?time="+new Date().getTime(),true);
	x1.send(null);
	x1.onreadystatechange = function() {
		if(x1.readyState == 4 && x1.status == 200) {
			information = x1.responseText;
			var x2 = createXMLHttpRequest();
			x2.open("POST","/list/WarrantyWriteServlet",true);
		    x2.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
			var client = eval("(" + information + ")");
			x2.send("baodan="+client.baodan+"&name="+client.name+"&sex="+client.sex+"&birthday="+client.birthday+"&phone="+client.phone
					 +"&kind="+client.kind+"&money="+client.money+"&clerk1="+client.clerk1+"&clerk2="+client.clerk2+"&id="+client.id+"&time="+client.time);
			x2.onreadystatechange = function() {
				if(x2.readyState == 4 && x2.status == 200) {
					if(x2.responseText == "true") {
						document.getElementById("h").innerHTML = "提交保单成功";
						document.getElementById("baodan").innerHTML = client.baodan;
						document.getElementById("name").innerHTML = client.name;
						if(client.sex == "male") {
							document.getElementById("sex").innerHTML = "男";
						}else {
							document.getElementById("sex").innerHTML = "女";
						}
						document.getElementById("birthday").innerHTML = client.birthday;
						
						var birth = client.birthday.split("-");
						var byear = birth[0];
						var bmonth = birth[1];
						var bday = birth[2];
						
						var date = new Date();
						var age = date.getFullYear() - byear;
						if(age != 0) {
							if((bmonth-1) > date.getMonth()) {
								age = age - 1;
							}else if((bmonth - 1) == date.getMonth()) {
								if(bday > date.getDay()) {
									age = age - 1;
								}
							}
							document.getElementById("age").innerHTML = age;
						}else {
							document.getElementById("age").innerHTML = age;
						}
						
						document.getElementById("phone").innerHTML = client.phone;
						
						if(client.kind == "accident") {
							document.getElementById("kind").innerHTML = "意外险";
						}else if(client.kind == "health") {
							document.getElementById("kind").innerHTML = "健康险";
						}else if(client.kind == "medical") {
							document.getElementById("kind").innerHTML = "补充医疗险";
						}else {
							document.getElementById("kind").innerHTML = "分红险";
						}
						
						document.getElementById("money").innerHTML = client.money;
						document.getElementById("clerk1").innerHTML = client.clerk1;
						document.getElementById("clerk2").innerHTML = client.clerk2;
						document.getElementById("id").innerHTML = client.id;
						document.getElementById("time").innerHTML = client.time;
					}else {
						document.getElementById("h").innerHTML = "提交保单失败";
					}
				}
			};
		}
	};
};
</script>

<div class="background"></div>
<div class="result">
<h1 id="h"></h1>
<table>
	<tr>
		<td>保单号：</td>
		<td id="baodan"></td>
	</tr>
	<tr>
		<td>投保人姓名：</td>
		<td id="name"></td>
	</tr>
	<tr>
		<td>性别：</td>
		<td id="sex"></td>
	</tr>
	<tr>
		<td>出生日期：</td>
		<td id="birthday"></td>
	</tr>
	<tr>
		<td>年龄：</td>
		<td id="age"></td>
	</tr>
	<tr>
		<td>电话号码：</td>
		<td id="phone"></td>
	</tr>
	<tr>
		<td>保险种类：</td>
		<td id="kind"></td>
	</tr>
	<tr>
		<td>保费：</td>
		<td id="money"></td>
	</tr>
	<tr>
		<td>被保险人1：</td>
		<td id="clerk1"></td>
	</tr>
	<tr>
		<td>被保险人2：</td>
		<td id="clerk2"></td>
	</tr>
	<tr>
		<td>业务员工号：</td>
		<td id="id"></td>
	</tr>
	<tr>
		<td>出单时间：</td>
		<td id="time"></td>
	</tr>
</table><br><br>
<input class="new" type="button" value="再来一单" onclick="window.location.href='/sale/insurance.jsp'"/>
</div>
</body>
</html>