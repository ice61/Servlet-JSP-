package cn.kexie.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.tools.link.Write;

public class RegisteWriteServlet extends HttpServlet {

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("utf-8");
		//System.out.println(request.getParameter("name")+request.getParameter("id")+request.getParameter("sex")+
		//		request.getParameter("password")+request.getParameter("question"));
		
		//获取到员工注册的各项信息，姓名，工号，性别，密码，密保问题
		String name = request.getParameter("name");
		String id = request.getParameter("id");
		String sex = request.getParameter("sex");
		String password = request.getParameter("password");
		String question = request.getParameter("question");
		//声明变量flag并赋值为0，flag用来存储写入注册信息的结果
		int flag = 0;
		//调用Write类中的静态方法writeClerk,如果写入成功则返回值1（一行受到变动所以返回1）
		try {
			flag = Write.writeClerk(name, id, sex, password, question);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		//对写入成功和失败进行相应的操作
		if(flag==1)
			response.getWriter().print(true);
		else
			response.getWriter().print(false);
	}

}
