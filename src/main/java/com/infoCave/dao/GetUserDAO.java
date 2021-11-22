package com.infoCave.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.infoCave.web.User;

public class GetUserDAO {
	DAO dao = new DAO();
	User user;
	
	String statement = "SELECT * FROM users WHERE user_id=?";
	
	public User getUser(int id) throws ClassNotFoundException, SQLException {
		Connection con = dao.getConnection();
		PreparedStatement prst = con.prepareStatement(statement);
		prst.setInt(1, id);
		ResultSet rs = prst.executeQuery();
		while(rs.next()) {
			String fullName = rs.getString("user_fullName");
			String email = rs.getString("user_email");
			String authorName = rs.getString("user_authorName");
			String password = rs.getString("user_password");
			user = new User(id, fullName, email, authorName, password);
		}
		return user;
	}

}
