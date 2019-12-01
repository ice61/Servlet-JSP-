package cn.kexie.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.tools.link.Write;

public class WarrantyWriteServlet extends HttpServlet {

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		//分别获取保单号，投保人姓名，性别，生日，电话号码，保险种类，保金，被保人信息，员工工号，出单时间
		String baodan = request.getParameter("baodan");
		String name = request.getParameter("name");
		String sex = request.getParameter("sex");
		String birthday = request.getParameter("birthday");
		String phone = request.getParameter("phone");
		String kind = request.getParameter("kind");
		String money = request.getParameter("money");
		String clerk1 = request.getParameter("clerk1");
		String clerk2 = request.getParameter("clerk2");
		String id = request.getParameter("id");
		String time = request.getParameter("time");
		
		//调用Write类中的静态方法write2进行写入，写入成功flag变为1，否则为0
		int flag = 0;
		
		try {
			flag = Write.write2(baodan, name, sex, birthday, phone, kind, money, clerk1, clerk2, id, time);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//根据不同结果进行相应操作
		if(flag==1)
			response.getWriter().print(true);
		else
			response.getWriter().print(false);
	}

}
