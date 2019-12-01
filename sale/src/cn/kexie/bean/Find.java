package cn.kexie.bean;

import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import net.sf.json.JSONObject;



import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;

public class Find {
	
	public static String find(String id,String password) throws ClassNotFoundException, SQLException {
		String driverClassName = "com.mysql.jdbc.Driver";
		//jdbc协议的格式：
		String url = "jdbc:mysql://localhost:3306/insurance";
		String userName = "root";
		String password1= "123";
		//加载驱动类
		Class.forName(driverClassName);
		Connection con = (Connection) DriverManager.getConnection(url, userName, password1);
		String s1 = "select * from clerk where id=?";
		PreparedStatement p1 = (PreparedStatement) con.prepareStatement(s1);
		p1.setString(1, id);
		ResultSet rs1 =  p1.executeQuery();
		String name = null;
		String s2 = "select * from clerk where id=? and password=?";
		PreparedStatement p2 = (PreparedStatement) con.prepareStatement(s2);
		p2.setString(1, id);
		p2.setString(2, password);
		ResultSet rs2 = p2.executeQuery();
		if(!rs1.next()) {
			return "noid";
			
		}else if(rs2.next()) {
			name = rs2.getString("name");
			return name;
			
		}else
			return "nopassword";
	}
	
	public static String findWarranty(String id) throws ClassNotFoundException, SQLException {
		String driverClassName = "com.mysql.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/insurance";
		String userName = "root";
		String password1= "123";
		Class.forName(driverClassName);
		Connection con = (Connection) DriverManager.getConnection(url, userName, password1);
		String sql = "select * from warranty where id=?";
		PreparedStatement p1 = (PreparedStatement) con.prepareStatement(sql);
		p1.setString(1, id);
		ResultSet rs1 = p1.executeQuery();
		
		List<JSONObject> list = new ArrayList<JSONObject>();
		while(rs1.next()) {
			JSONObject json = new JSONObject();
			json.put("baodan",rs1.getString("baodan"));
			json.put("name", rs1.getString("name"));
			if("male".equals(rs1.getString("sex"))) {
				json.put("sex", "男");
			}else {
				json.put("sex", "女");
			}
			json.put("birthday",rs1.getString("birthday"));
			json.put("phone",rs1.getString("phone"));
			String kind = rs1.getString("kind");
			if("accident".equals(kind)) {
				json.put("kind","意外险");
			}else if("health".equals(kind)){
				json.put("kind", "健康险");
			}else if("medical".equals(kind)) {
				json.put("kind", "补充医疗险");
			}else {
				json.put("kind", "分红险");
			}
			json.put("money",rs1.getString("money"));
			json.put("clerk1",rs1.getString("clerk1"));
			json.put("clerk2",rs1.getString("clerk2"));
			json.put("id",rs1.getString("id"));
			json.put("time",rs1.getString("time"));
			list.add(json);
		}
		 JSONObject allJson = new JSONObject();
		 allJson.put("data", list);
		 return allJson.toString();
	}
}
