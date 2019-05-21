package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import haiku.Common;

public class DAOConnection {
	public static Connection conn = null;
	public static PreparedStatement ps = null;
	
	public static ResultSet rs = null;
	
	Common common = new Common();
	
	//DB起動
	public static Connection getConnection() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
			return DriverManager.getConnection("jdbc:mysql://localhost/haiku?user=root&password=yokohama");
		}catch(Exception e) {
			throw new IllegalArgumentException(e);
		}
	}
	
	//DB切断
	public static void allClose(PreparedStatement ps, Connection conn) {
		if(ps != null) {
			try {
				ps.close();
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
		if(conn != null) {
			try {
				conn.close();
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
}