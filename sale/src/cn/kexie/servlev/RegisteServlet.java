package cn.kexie.servlev;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import cn.kexie.bean.Clerk;

public class RegisteServlet extends HttpServlet {

	String clerk_information = null;
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		//System.out.println(clerk_information);			//此处中文不为乱码
		response.getWriter().print(clerk_information);
		clerk_information = null;
	}

	/*
	 * post方法先执行，对clerk_information进行赋值后进行重定向，页面加载结束后执行get方法获取clerk_information
	 * */
	
	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String sex = request.getParameter("sex");
		String password = request.getParameter("password1");
		String question = request.getParameter("question");
		Clerk c = new Clerk(id, name, sex, password, question);
		//System.out.println(c);
		JSONObject map = JSONObject.fromObject(c);
		String result = map.toString();
		//System.out.println(result);				//此处不会出现中文乱码
		clerk_information = result;
		response.sendRedirect("/sale/registeResult.jsp");
	}

}
