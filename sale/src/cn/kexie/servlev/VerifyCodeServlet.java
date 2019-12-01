package cn.kexie.servlev;

import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.kexie.bean.VerifyCode;

public class VerifyCodeServlet extends HttpServlet {

	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		VerifyCode vc = new VerifyCode();
		BufferedImage image = vc.getImage();
		request.getSession().setAttribute("session_Vcode", vc.getText());
		//System.out.println(vc.getText());
	System.out.println((String)request.getSession().getAttribute("session_Vcode"));
		VerifyCode.output(image, response.getOutputStream());
		
	}

}
