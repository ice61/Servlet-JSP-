package cn.tools.link;

import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;
import com.mysql.jdbc.Statement;

public class Find {
	
	public static boolean findId(String id) throws ClassNotFoundException, SQLException {
		
		//调用Link类中的静态方法link连接数据库
		Connection con = Link.link();
		//根据ID查询名为clerk的表
		String sql = "select * from clerk where id=?";
		//绑定sql语句
		PreparedStatement pstmt = (PreparedStatement) con.prepareStatement(sql);
		//给第一个问号赋值
		pstmt.setString(1, id);		
		/*
		 * 调用查询方法向数据库发送语句并创建ResultSet接收
		 * 如果不为空，则返回值为true，否则为false
		 * */
		ResultSet rs = pstmt.executeQuery();	
		return rs.next();
	}
	
	public static String findId2(String id) throws ClassNotFoundException, SQLException {
		
		Connection con = Link.link();
		String sql = "select * from clerk where id=?";
		PreparedStatement pstmt = (PreparedStatement) con.prepareStatement(sql);
		pstmt.setString(1, id);		//给第一个问号赋值
		ResultSet rs = pstmt.executeQuery();		//调用查询方法向数据库发送语句
		String name = null;
		while(rs.next()) {
			name = rs.getString("name");
		}
		
		return name;
	}
	
	public static boolean findIdAndPassword(String id,String password) throws ClassNotFoundException, SQLException {
		
		Connection con = Link.link();
		String sql = "select * from clerk where id=? and password=?";
		PreparedStatement pstmt = (PreparedStatement) con.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.setString(2, password);
		ResultSet rs = pstmt.executeQuery();
		return rs.next();
	}
	
	public static boolean findBaodan(String baodan) throws ClassNotFoundException, SQLException {
		
		Connection con = Link.link();
		String sql = "select * from warranty where baodan=?";
		PreparedStatement pstmt = (PreparedStatement) con.prepareStatement(sql);
		pstmt.setString(1, baodan);
		ResultSet rs = pstmt.executeQuery();
		//如果保单号已经存在，返回为true，否则返回为false
		return rs.next();
	}
}
