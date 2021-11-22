package com.infoCave.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DAO {
	private String url = "jdbc:mysql://localhost:4306/info_cave";
	private String username = "root";
	private String password = "admin";
	
	
	public Connection getConnection() throws ClassNotFoundException, SQLException {
		Connection connection = null;
		Class.forName("com.mysql.cj.jdbc.Driver");
		connection = DriverManager.getConnection(url, username, password);
		
		return connection;
	}
	
}
