package com.infoCave.dao;

import java.sql.*;

public class CreateUserDAO {
	DAO dao = new DAO();
	
	String statement = "INSERT INTO users (user_fullName, user_email, user_authorName, user_password) VALUES (?, ?, ?, ?)";
	
	public boolean insert(String fullName, String email, String authorName, String password) throws ClassNotFoundException, SQLException {
		Connection connection = dao.getConnection();
		
		PreparedStatement prst = connection.prepareStatement(statement);
		prst.setString(1, fullName);
		prst.setString(2, email);
		prst.setString(3, authorName);
		prst.setString(4, password);
		
		int rs = prst.executeUpdate();
		
		if(rs > 0) {
			return true;
		}
		
		return false;
	}
}
