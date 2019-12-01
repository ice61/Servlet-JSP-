<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
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
</style>
</head>
<%
	String id = (String)request.getSession().getAttribute("id");
	String name = (String)request.getSession().getAttribute("name");
	if(id == null && name == null) {
		request.getRequestDispatcher("/main.jsp").forward(request, response);
		return;
	}
	id = "(" + id + ")";
%>

<script type="text/javascript">
window.onload = function() {
	if(window.top == window) {
		location.href="/sale/menu.jsp";
	}
};
</script>
<body>
	<div class="background"></div>
	<h3 class="id" style="position:absolute;"><%=name %><%=id %>已登陆</h3>
</body>
</html>