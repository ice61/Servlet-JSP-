package cn.kexie.servlev;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import cn.kexie.bean.Warranty;

public class SubmitServlet extends HttpServlet {

	String warranty = null;
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().print(warranty);
		warranty = null;
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String name = request.getParameter("name");
		String sex = request.getParameter("sex");
		String year = request.getParameter("year");
		String month = request.getParameter("month");
		if(month.length()==1) {
			month = "0" + month;
		}
		String day = request.getParameter("day");
		if(day.length()==1) {
			day = "0" + day;
		}
		String birthday = year + "-" + month + "-" +day;
		String phone = request.getParameter("phone");
		String kind = request.getParameter("kind");
		String money = request.getParameter("money");
		String clerk1 = request.getParameter("clerk1");
		String clerk2 = request.getParameter("clerk2");
		Date date = new Date();
		String baodan = (String) request.getSession().getAttribute("id") + date.getTime();
		String id = (String) request.getSession().getAttribute("id");
		String time = date.toLocaleString();
		
		Warranty w = new Warranty(baodan, name, sex, birthday, phone, kind, money, clerk1, clerk2, id, time);
		JSONObject map = JSONObject.fromObject(w);
		String result = map.toString();
		warranty = result;
		response.sendRedirect("/sale/submitResult.jsp");
	}

}
