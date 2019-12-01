package cn.tools.link;

import java.sql.DriverManager;
import java.sql.SQLException;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;

public class Write {
	
	public static int writeClerk(String name,String id,String sex,String password,String question) 
			throws ClassNotFoundException, SQLException {
		/*String driverClassName = "com.mysql.jdbc.Driver";
		//jdbc协议的格式：
		String url = "jdbc:mysql://localhost:3306/insurance";
		String userName = "root";
		String password1= "123";
		//加载驱动类
		Class.forName(driverClassName);
		Connection con = (Connection) DriverManager.getConnection(url, userName, password1);*/
		Connection con = Link.link();
		boolean exist = Find.findId(id);
		if(exist == true) {
			return 1;
		}else {
			String sql = "insert into clerk values(?,?,?,?,?)";
			PreparedStatement pstmt = (PreparedStatement) con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, name);
			pstmt.setString(3, password);
			pstmt.setString(4, sex);
			pstmt.setString(5, question);
			return pstmt.executeUpdate();
		}
		
	}
	
	public static int write2(String baodan,String name,String sex,String birthday,String phone,
			String kind,String money,String clerk1,String clerk2,String id,String time) throws ClassNotFoundException, SQLException {
		
		//通过Link类的静态方法link获取连接
		Connection con = Link.link();
		//将保单信息写入数据库
		String sql = "insert into warranty values(?,?,?,?,?,?,?,?,?,?,?)";
		boolean exist = Find.findBaodan(baodan);
		if(exist == true) {
			return 1;
		}else {
			PreparedStatement pstmt = (PreparedStatement) con.prepareStatement(sql);
			pstmt.setString(1, baodan);
			pstmt.setString(2, name);
			pstmt.setString(3, sex);
			pstmt.setString(4, birthday);
			pstmt.setString(5, phone);
			pstmt.setString(6, kind);
			pstmt.setString(7, money);
			pstmt.setString(8, clerk1);
			pstmt.setString(9, clerk2);
			pstmt.setString(10, id);
			pstmt.setString(11, time);
			return pstmt.executeUpdate();
		}
		
	}
}
