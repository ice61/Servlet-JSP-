package cn.kexie.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.tools.link.Delete;

public class DelWarrantyServlet extends HttpServlet {

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");					
		response.setContentType("text/html;charset=utf-8");
		
		String baodan = request.getParameter("baodan");
		int result = 0;
		
		try {
			result = Delete.delWarranty(baodan);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//System.out.println(result);
		if(result == 1) {
			response.getWriter().print("success");
		}else {
			response.getWriter().print("fail");
		}
	}

}
