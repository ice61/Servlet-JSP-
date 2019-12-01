package cn.kexie.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.DriverManager;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.tools.link.Find;

import com.mysql.jdbc.Connection;

public class FindIDServlet extends HttpServlet {

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		//用utf-8标准进行编码和转码
		request.setCharacterEncoding("utf-8");					
		response.setContentType("text/html;charset=utf-8");
		//得到员工在注册界面填写的工号
		String clerkId = request.getParameter("clerkid");
		boolean a = true;
		//通过调用Find类中的静态方法查找此工号是否已经存在于数据库中
		try {
			//如果存在返回值为true，否则为false
			a = Find.findId(clerkId);
		} catch (Exception e) {
			e.printStackTrace();
		} 
		if(a) {
			
			response.getWriter().print("true");			
		}else {
		
			response.getWriter().print("false");			
		}
	}
}
