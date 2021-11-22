package com.infoCave.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class DeleteBlogDAO {
	DAO dao = new DAO();
	
	String statement = "DELETE FROM blogs WHERE blog_id=?";
	
	public boolean deleteBlog(int id) throws ClassNotFoundException, SQLException {
		Connection con = dao.getConnection();
		PreparedStatement prst = con.prepareStatement(statement);
		prst.setInt(1, id);
		int effectedRow = prst.executeUpdate();
		
		if(effectedRow > 0) {
			return true;
		}
		
		return false;
	}
}
