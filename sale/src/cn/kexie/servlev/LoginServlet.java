package cn.kexie.servlev;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.kexie.bean.Find;

public class LoginServlet extends HttpServlet {

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// 使用utf-8
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		// 分别获取员工的工号，密码，员工输入的验证码
		String id = request.getParameter("clerk_id");
		String password = request.getParameter("clerk_password");
		String clerkVerifyCode = request.getParameter("VerifyCode");
		
		// 获取之前存放在session域中验证码的真实数值
		String realVerifyCode = (String) request.getSession().getAttribute(
				"session_Vcode");
		if (!clerkVerifyCode.equalsIgnoreCase(realVerifyCode)) {
			// 如果输入的内容与真实内容不符，设置request域中的vcWrong，并转发到登陆界面
			request.setAttribute("vcWrong", "验证码错误");
			request.getRequestDispatcher("/login.jsp").forward(request,
					response);
			return;
		}
		String result = null;
		/*
		 * 使用result接收find方法的返回值 如果工号未注册则返回noid 如果工号存在但密码错误则返回nopassword
		 */
		try {
			result = Find.find(id, password);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		/*
		 * 根据result的值做出相应的变化 如果登陆出现错误则将错误信息存在request域后转发到登陆界面
		 * 否则登陆成功，将员工工号和姓名存储在session域中重定向到保单填写界面
		 */
		if ("noid".equals(result)) {
			request.setAttribute("idWrong", "工号不存在，请注册后再登陆");
			request.getRequestDispatcher("/login.jsp").forward(request,
					response);
			return;
		} else if ("nopassword".equals(result)) {
			request.setAttribute("psWrong", "密码错误");
			request.getRequestDispatcher("/login.jsp").forward(request,
					response);
			return;
		} else {
			request.getSession().setAttribute("name", result);
			request.getSession().setAttribute("id", id);
			response.sendRedirect("/sale/menu.jsp");
		}
	}

}
