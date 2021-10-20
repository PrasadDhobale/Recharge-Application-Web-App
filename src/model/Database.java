package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Database {

	private final static String driver="oracle.jdbc.OracleDriver";
	private final static String url="jdbc:oracle:thin:@localhost:1521:xe";
	private final static String userName="system";
	private final static String password="5316";
	static Connection con;
	public static Connection getConnection(){
		try {
			Class.forName(driver);
			con=DriverManager.getConnection(url,userName,password);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}		
		return con;
	}
}