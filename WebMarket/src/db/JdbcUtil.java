package db;

import java.sql.*;

public class JdbcUtil {
	public static Connection getConnection() {
		Connection conn = null;
		
		String url = "jdbc:mariadb://3.35.235.65:3306/project";
		String user = "jundb";
		String password = "1q2w3e4r";
		
		try {
			Class.forName("org.mariadb.jdbc.Driver");
			conn = DriverManager.getConnection(url, user, password);
			System.out.println("데이터베이스에 연결되었습니다.");
		} catch (Exception e) {
			System.out.println("데이터베이스에 연결이 되지 않았습니다.");
			e.printStackTrace();
		}
		return conn;
	}
}
