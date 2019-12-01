<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>填写保单</title>
<script src="https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js">
</script>

<style>
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
	background-image:url(picture/insurance.jpg);
	background-repeat:no-repeat;
	background-size:cover;
	filter:blur(10px);
	transition-duration:0.4s;	
}

.background:hover {
	filter:blur(0px);
}

.insurance {
	position:absolute;
	margin-top:300px;
	margin-left:40%;
	text-align:center;
	position:absolute;
	filter:blur(5px);
	transition-duration:0.4s;
}

.insurance:hover {
	filter:blur(0px);
}

.submit {
	background-color:#e7e7e7;
	font-size:20px;
	border-radius:10px;
	transition-duration:0.5s;
}

.submit:hover {
	background-color:#33ccff;
}

</style>
</head>

<%
	String name = (String)request.getSession().getAttribute("name");
	String id = (String)request.getSession().getAttribute("id");
	if(name == null && id == null) {
		out.print("已经执行");
		request.getRequestDispatcher("/main.jsp").forward(request, response);
		//out.print("已经执行");
		return;
	}
%>
<body>

<script type="text/javascript">
window.onload = function() {
	if(window.top == window) {
		location.href="/sale/menu.jsp";
	}
	if(document.getElementById("client_name").value != "") {
		window.location.reload();
	}
};
</script>
<!-- 
	以下代码用于实现对出生日期的输入限制，包括大小月和闰年平年的变化
 -->
<script type="text/javascript">
function setYear() {
	/*
		flag用来判断是否为本年出生
		flag1用来判断输入年份是否为闰年
	*/
	var flag = 0;
	var flag1 = 0;
	var date = new Date();
	var year = date.getFullYear();
	var month = date.getMonth();
	var day = date.getDate();
	//window.alert(year+"..."+month+"..."+day);
	//设置年份限制
	document.getElementById("client_year").max = year;
	document.getElementById("client_year").min = year - 110;
	var cyear = document.getElementById("client_year").value;
	/*
		如果在本年出生，则最大月份为当前月，且将flag的值设置为1
		否则最大月份为12月
		如果是闰年，将flag1的值设置为1
	*/
	if((cyear%4==0 && cyear%100 !=0) || cyear%400 ==0) {
		flag1 = 1;
	}
	if(cyear == year) {
		document.getElementById("client_month").max = month+1;
		document.getElementById("client_month").min = 1;
		flag = 1;
	}else {
		document.getElementById("client_month").max = 12;
		document.getElementById("client_month").min = 1;
	}
	
	//获取用户输入的月份的值
	var cmonth = document.getElementById("client_month").value;
	/*
		如果用户已经输入了月份，则执行程序
		如果用户输入的月份为大月，则最大天数为31天，最小为1天，否则最大天数为30天
	*/
	if(cmonth !="") {
		if(cmonth == 1||cmonth == 3||cmonth == 5||cmonth == 7||cmonth == 8||cmonth == 10||cmonth == 12) {
			document.getElementById("client_day").max = 31;
			document.getElementById("client_day").min = 1;
		}else {
			document.getElementById("client_day").max = 30;
			document.getElementById("client_day").min = 1;
		}
		if(flag1 == 1 && cmonth == 2) {
			document.getElementById("client_day").max = 29;
			document.getElementById("client_day").min = 1;
		}else if(flag1 != 1 && cmonth ==2) {
			document.getElementById("client_day").max = 28;
			document.getElementById("client_day").min = 1;
		}
		//在当年当月出生的，限制最大可输入日期为
		if(flag == 1 && cmonth == (month + 1)) {
			//window.alert(day);
			document.getElementById("client_day").max = day;
			/*var a = (document.getElementById("client_day").max < document.getElementById("client_day").value);
			window.alert(a);*/
			document.getElementById("client_day").min = 1;
		}
	}
}

function setMonth() {
	var flag = 0;
	var flag1 = 0;
	var date = new Date();
	var year = date.getFullYear();
	var month = date.getMonth();
	var day = date.getDate();
	document.getElementById("client_year").max = year;
	document.getElementById("client_year").min = year - 110;
	var cyear = document.getElementById("client_year").value;
	
	if(cyear != "") {
		if((cyear%4==0 && cyear%100 !=0) || cyear%400 ==0) {
			flag1 = 1;
		}
		if(cyear == year) {
			document.getElementById("client_month").max = month+1;
			document.getElementById("client_month").min = 1;
			flag = 1;
		}else {
			document.getElementById("client_month").max = 12;
			document.getElementById("client_month").min = 1;
		}
		var cmonth = document.getElementById("client_month").value;
		if(cmonth == 1||cmonth == 3||cmonth == 5||cmonth == 7||cmonth == 8||cmonth == 10||cmonth == 12) {
			document.getElementById("client_day").max = 31;
			document.getElementById("client_day").min = 1;
		}else {
			document.getElementById("client_day").max = 30;
			document.getElementById("client_day").min = 1;
		}
		if(flag1 == 1 && cmonth == 2) {
			document.getElementById("client_day").max = 29;
			document.getElementById("client_day").min = 1;
		}else if(flag1 != 1 && cmonth ==2) {
			document.getElementById("client_day").max = 28;
			document.getElementById("client_day").min = 1;
		}
		//在当年当月出生的，限制最大可输入日期为
		if(flag == 1 && cmonth == (month + 1)) {
			document.getElementById("client_day").max = day;
			document.getElementById("client_day").min = 1;
		}
	}
}	
	/*
		为防止提交一次保单后直接回退单独修改日期造成的问题，特使用下列函数
	*/
	
function setDay() {
		var cyear = document.getElementById("client_year").value;
		var cmonth = document.getElementById("client_month").value;
		if(cyear != "" && cmonth != "") {
			//var flag = 0;
			var flag1 = 0;
			if((cyear%4==0 && cyear%100 !=0) || cyear%400 ==0) {
				flag1 = 1;
			}
			if(cmonth == 1||cmonth == 3||cmonth == 5||cmonth == 7||cmonth == 8||cmonth == 10||cmonth == 12) {
				document.getElementById("client_day").max = 31;
				document.getElementById("client_day").min = 1;
			}else {
				document.getElementById("client_day").max = 30;
				document.getElementById("client_day").min = 1;
			}
			if(flag1 == 1 && cmonth == 2) {
				document.getElementById("client_day").max = 29;
				document.getElementById("client_day").min = 1;
			}else if(flag1 != 1 && cmonth ==2) {
				document.getElementById("client_day").max = 28;
				document.getElementById("client_day").min = 1;
			}
			var date = new Date();
			var month = date.getMonth();
			var year = date.getFullYear();
			var day = date.getDate();
			if(cyear == year && cmonth == (month + 1)) {
				document.getElementById("client_day").max = day;
				document.getElementById("client_day").min = 1;
			}
		}
}

</script>

<!-- 

	checkName用于判断姓名输入项中是否存在空格
	checkMoney用于判断保金输入是否符合规范
	
 -->
<script type="text/javascript">

function checkName() {
	
	var name = document.getElementById("client_name").value;
	var n = name.match(/[\u4e00-\u9fa5]{2,4}/);
	if(n != name) {
		document.getElementById("errorName").setAttribute("error", "false");
		document.getElementById("errorName").innerHTML = "请正确输入姓名";
	}else {
		document.getElementById("errorName").setAttribute("error", "true");
		document.getElementById("errorName").innerHTML = "";
	}
}

function checkMoney() {
	
	var money = document.getElementById("client_money").value;
	//type为number时，输入e/E/+/-,或者输入一个以上小数点后获取到的value为空串
	//window.alert(money);
	//window.alert(document.getElementById("client_phone").value);
	var zero = money.search("0");	//zero用来保存第一个0出现的位置
	var dot = money.search(".");	//dot用来保存第一个小数点出现的位置
	var long = money.split(".");	//long用来保存通过小数点切割的字符串
	//window.alert(zero);
	//window.alert(dot);
	
	if(money == "") {
		//如果没有进行输入或者输入了e/E/+/-或者输入了多个小数点则执行
		document.getElementById("errorMoney").setAttribute("error", "false");
		document.getElementById("errorMoney").innerHTML = "请正确输入保费";
	}else if(zero == 0 && dot != 1) {
		//如果第一个0出现在字符串的头位置且小数点不在第二位则执行
		document.getElementById("errorMoney").setAttribute("error", "false");
		document.getElementById("errorMoney").innerHTML = "请正确输入保费";
	}else if(money.search(/[1-9]/) == -1) {
		//如果字符串中不包含1~9之间的数字
		document.getElementById("errorMoney").setAttribute("error", "false");
		document.getElementById("errorMoney").innerHTML = "请正确输入保费";
	}else if(dot != -1 && long[1].length > 2) {
		//如果存在小数点且小数点后的长度大于二（小数点后有两位以上，保费精确到分）
		document.getElementById("errorMoney").setAttribute("error", "false");
		document.getElementById("errorMoney").innerHTML = "请正确输入保费";
	}else {
		document.getElementById("errorMoney").setAttribute("error", "true");
		document.getElementById("errorMoney").innerHTML = "";
	}
}

function checkClient1() {
	var client1 = document.getElementById("clerk_one").value;
	var n = client1.match(/\([\u4e00-\u9fa5]{2}\)[\u4e00-\u9fa5]{2,4}/);
	//console.log(n);
	var n2 = client1.search(" ");
	if(n2 != -1) {
		//不允许包含空格
		document.getElementById("errorClient1").innerHTML = "请正确输入被保险人信息";
		document.getElementById("errorClient1").setAttribute("error", "false");
	}else if(n != client1) {
		//使用match方法进行匹配，会返回符合标准的字符串
		document.getElementById("errorClient1").innerHTML = "请正确输入被保险人信息";
		document.getElementById("errorClient1").setAttribute("error", "false");
	}else {
		document.getElementById("errorClient1").innerHTML = "";
		document.getElementById("errorClient1").setAttribute("error", "true");
	}
	
}
function checkClient2() {
	var client2 = document.getElementById("clerk_two").value;
	var n = client2.match(/\([\u4e00-\u9fa5]{2}\)[\u4e00-\u9fa5]{2,4}/);
	var n2 = client2.search(" ");
	if(n2 != -1) {
		document.getElementById("errorClient2").innerHTML = "请正确输入被保险人信息";
		document.getElementById("errorClient2").setAttribute("error", "false");
	}else if(n != client2) {
		document.getElementById("errorClient2").innerHTML = "请正确输入被保险人信息";
		document.getElementById("errorClient2").setAttribute("error", "false");
	}else {
		document.getElementById("errorClient2").innerHTML = "";
		document.getElementById("errorClient2").setAttribute("error", "true");
	}
	
}
</script>

<script type="text/javascript">
$(document).ready(function() {
	$("#clerk_one").focus(function() {
		$("#clerko").show();
	});
	$("#clerk_one").blur(function() {
		$("#clerko").hide();
	});
	$("#clerk_two").focus(function() {
		$("#clerkt").show();
	});
	$("#clerk_two").blur(function() {
		$("#clerkt").hide();
	})
});
</script>

<script type="text/javascript">

function checkSubmit() {
	
	var a = document.getElementById("errorName").getAttribute("error");
	var b = document.getElementById("errorMoney").getAttribute("error");
	var c = document.getElementById("errorClient1").getAttribute("error");
	var d = document.getElementById("errorClient2").getAttribute("error");
	if((a!="false" && b!="false") && (c!="false" && d!="false")) {
		return true;
	}else {
		window.alert("请正确填写保单信息");
		return false;
	}
}
</script>

	<div class="background"></div>
	<div class="insurance">
	<form action="SubmitServlet" method="post" onsubmit="return checkSubmit()">
		<table>
			<tr>
				<td>投保人姓名：</td>
				<td><div><input type="text" name="name" id="client_name" required="required" maxlength=5 onblur="checkName()"/></div>
					<div id="errorName" style="color:red;"></div>
				</td>
			</tr>
			<tr>
				<td>性别：</td>
				<td>
					男<input type="radio" name="sex" id="client_sex" value="male" required="required"/>
					女<input type="radio" name="sex" id="client_sex" value="female" required="required"/>
				</td>
			</tr>
			<tr>
				<td>出生日期：</td>
				<td>年：<input type="number" name="year" id="client_year" required="required" 
						style="width:30px" onblur="setYear()" onKeypress="return (/[\d]/.test(String.fromCharCode(event.keyCode)))"/>
					月：<input type="number" name="month" id="client_month" required="required" 
						style="width:15px" onblur="setMonth()" onKeypress="return (/[\d]/.test(String.fromCharCode(event.keyCode)))"/>
					日：<input type="number" name="day" id="client_day" required="required" onblur="setDay()" 
						style="width:15px" onblur="setDay()" onKeypress="return (/[\d]/.test(String.fromCharCode(event.keyCode)))"/>
				</td>
			</tr>
			<tr>
				<td>手机号码：</td>
				<td><input type="number" name="phone" id="client_phone" required="required" 
						oninput="if(value.length>11)value=value.slice(0,11)" onKeypress="return (/[\d]/.test(String.fromCharCode(event.keyCode)))"/></td>
			</tr>
			<tr>
				<td>险种名称：</td>
				<td>
					<select name="kind">
						<option value="accident">意外险</option>
						<option value="health">健康险</option>
						<option value="medical">补充医疗险</option>
						<option value="bonus">分红险</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>保费：</td>
				<td>
					<div><input type="number" name="money" id="client_money" required="required" 
						oninput="if(value.length>9)value=value.slice(0,9)" onblur="checkMoney()" step="0.01"/>
					</div>
					<div id="errorMoney" style="color:red;"></div>
				</td>
			</tr>
			<tr>
				<td>被保险人（1）：</td>
				<td>
					<div><input type="text" name="clerk1" id="clerk_one" value="()" required="required" onblur="checkClient1()"/></div>
					<div id="clerko" style="display:none;">请在括号内填写二字关系<br>括号后填写姓名<br>如：(父子)张三</div>
					<div id="errorClient1" style="color:red;"></div>
				</td>
			</tr>
			<tr>
				<td>被保险人（2）：</td>
				<td>
					<div><input type="text" name="clerk2" id="clerk_two" value="()" required="required" onblur="checkClient2()"/></div>
					<div id="clerkt" style="display:none;">请在括号内填写二字关系<br>括号后填写姓名<br>如：(父子)张三</div>
					<div id="errorClient2" style="color:red;"></div>
				</td>
			</tr>
		</table>
		<input class="submit" type="submit" value="提交"/>
	</form>
	</div>
</body>
</html>