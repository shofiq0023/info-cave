package com.infoCave.dao;

import java.sql.*;


public class LoginDAO {
	DAO dao = new DAO();
	public int userId;
	public String userAuthorName;
	
	String statement = "SELECT * FROM users WHERE user_email =? and user_password =?";
	
	public boolean check(String inputEmail, String inputPassword) throws ClassNotFoundException, SQLException {
		Connection connection = dao.getConnection();
		
		PreparedStatement prst = connection.prepareStatement(statement);
		prst.setString(1, inputEmail);
		prst.setString(2, inputPassword);
		ResultSet rs = prst.executeQuery();
		
		if(rs.next()) {
			userId = Integer.parseInt(rs.getString("user_id"));
			userAuthorName = rs.getString("user_authorName");
			return true;
		}
		
		return false;
	}
}
