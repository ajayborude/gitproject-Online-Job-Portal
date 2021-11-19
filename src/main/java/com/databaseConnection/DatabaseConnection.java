package com.databaseConnection;

import java.sql.*;

public class DatabaseConnection {

	public static Connection getConnection() {
		Connection conn = null;
		if (conn == null)
		{
			try {
				Class.forName("com.mysql.jdbc.Driver");
				conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/online_job_portal", "root", "");
			}
			catch (Exception e) {
				e.printStackTrace();
			}
		}
		return conn;
	}

}
