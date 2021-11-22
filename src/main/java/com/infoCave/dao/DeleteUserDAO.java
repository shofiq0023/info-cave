package com.infoCave.dao;

import java.sql.*;

public class DeleteUserDAO {
	DAO dao = new DAO();
	
	String statement = "DELETE FROM users WHERE user_id = ?";
	
	public boolean deleteAccount(int id) throws Exception {
		Connection connection = dao.getConnection();
		PreparedStatement prst = connection.prepareStatement(statement);
		prst.setInt(1, id);
		int effectedRow = prst.executeUpdate();
		
		if(effectedRow > 0) {
			return true;
		}
		return false;
	}
}
