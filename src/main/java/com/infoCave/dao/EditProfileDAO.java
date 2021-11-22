package com.infoCave.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class EditProfileDAO {
	DAO dao = new DAO();
	String statement = "UPDATE users SET user_fullName = ?, user_email = ?, user_password = ? WHERE user_id = ?";
	
	public boolean editUser(int id, String fullName, String email, String password) throws ClassNotFoundException, SQLException {
		Connection con = dao.getConnection();
		PreparedStatement prst = con.prepareStatement(statement);
		prst.setString(1, fullName);
		prst.setString(2, email);
		prst.setString(3, password);
		prst.setInt(4, id);
		int effectedRow = prst.executeUpdate();
		
		if(effectedRow > 0) {
			return true;
		}
		
		return false;
	}
}
