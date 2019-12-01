package cn.tools.link;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;

public class Delete {
	
	public static int delWarranty(String baodan) throws ClassNotFoundException, SQLException {
		Connection con = Link.link();
		String sql = "delete from warranty where baodan=?";
		PreparedStatement pstmt = (PreparedStatement) con.prepareStatement(sql);
		pstmt.setString(1, baodan);
		int result = pstmt.executeUpdate();
		//System.out.println(result);
		return result;
	}
}
