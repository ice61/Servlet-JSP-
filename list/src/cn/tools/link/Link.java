package cn.tools.link;

import java.sql.DriverManager;
import java.sql.SQLException;

import com.mysql.jdbc.Connection;

public class Link {
	
	public static Connection link() throws ClassNotFoundException, SQLException {
		
		//以下为jdbc四大配置参数
		String driverClassName = "com.mysql.jdbc.Driver";
		//jdbc协议的格式：
		String url = "jdbc:mysql://localhost:3306/insurance";
		//用户名为root，密码为123
		String userName = "root";
		String password1= "123";
		//加载驱动类
		Class.forName(driverClassName);
		//使用url,用户名，密码得到连接对象并将其返回
		Connection con = (Connection) DriverManager.getConnection(url, userName, password1);
		return con;
	}
	 
	
}
