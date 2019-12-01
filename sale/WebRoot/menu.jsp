<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>中国人寿保险销售系统</title>
</head>
<frameset rows="20%,*">
	<frame src="state.jsp">
	<frameset cols="15%,*">
		<frame src="button.jsp">
		<frame src="blank.jsp" name="main_interface">
	</frameset>
</frameset>

<%
	String id = (String)request.getSession().getAttribute("id");
	String name = (String)request.getSession().getAttribute("name");
	//System.out.println(id + "||" +name);
	if(id == null && name == null) {
		request.getRequestDispatcher("/main.jsp").forward(request, response);
		return;
	}
%>

<body>
</body>
</html>