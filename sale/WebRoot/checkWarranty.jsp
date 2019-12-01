<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="http://cdn.datatables.net/1.10.15/css/jquery.dataTables.css">
<script type="text/javascript" charset="utf8" src="http://code.jquery.com/jquery-1.10.2.min.js"></script>
<script type="text/javascript" charset="utf8" src="http://cdn.datatables.net/1.10.15/js/jquery.dataTables.js"></script>
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
<script type="text/javascript">
window.onload = function() {
	if(window.top == window) {
		location.href="/sale/menu.jsp";
	}
};

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

$(document).ready(function() {
	var table = $("#myWarranty").DataTable({
		ajax:"CheckWarranty",
		lengthMenu:[
			[5,10,20,40],
			['5页','10页','20页','40页']
		],
		bStateSave:true,
		language: {
			"sProcessing":"处理中...",
			"sLengthMenu":"显示_MENU_项结果",
			"sInfo": "显示第 _START_ 至 _END_ 项结果，共 _TOTAL_ 项",
       		"sInfoEmpty": "显示第 0 至 0 项结果，共 0 项",
        	"sInfoFiltered": "(由 _MAX_ 项结果过滤)",
        	"sInfoPostFix": "",
        	"sSearch": "搜索:",
	        "sEmptyTable": "此账号未曾提交表单",
    	    "sLoadingRecords": "载入中...",
        	"sInfoThousands": ",",
        	"oPaginate": {
           		"sFirst": "首页",
            	"sPrevious": "上页",
            	"sNext": "下页",
            	"sLast": "末页"
        	},
        	"oAria": {
            	"sSortAscending": ": 以升序排列此列",
            	"sSortDescending": ": 以降序排列此列"
        	}
		},
		columnDefs:[{
			targets:11,
			data:null,
			defaultContent:"<button id='del' type='button'>删除</button>"
		}],
		columns:[
			{data:"baodan"},
			{data:"name"},
			{data:"sex",orderable:false},
			{data:"birthday"},
			{data:"phone",orderable:false},
			{data:"kind",orderable:false},
			{data:"money"},
			{data:"clerk1",orderable:false},
			{data:"clerk2",orderable:false},
			{data:"id",orderable:false},
			{data:"time"},
			{data:null,orderable:false}
		],
		
	});
	
	$("#myWarranty").on('click','#del',function() {
		var data = table.row($(this).parents('tr')).data();
		if(confirm("是否确认删除此保单")) {
			var x1 = createXMLHttpRequest();
			x1.open("POST","/list/DelWarrantyServlet",true);
			x1.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
			x1.send("baodan="+data.baodan);
			x1.onreadystatechange = function() {
				if(x1.readyState==4 && x1.status==200) {
					if(x1.responseText == "success") {
						table.row().remove();
						window.alert("删除成功");
						window.location.reload();
					}else {
						window.alert("删除失败")
					}
				}				
			};
		}
	});
});


</script>
<style>
tr {
	text-align:center;
}
</style>
</head>
<body>
	<div class="background"></div>
	<table id="myWarranty" class="display cell-border">
		<thead>
			<tr>
				<th>保单号</th>
				<th>姓名</th>
				<th>性别</th>
				<th>出生日期</th>
				<th>电话号码</th>
				<th>保险种类</th>
				<th>保金</th>
				<th>被保人1</th>
				<th>被保人2</th>
				<th>员工工号</th>
				<th>出单时间</th>
				<th>编辑</th>
			</tr>
		</thead>
	</table>
</body>
</html>