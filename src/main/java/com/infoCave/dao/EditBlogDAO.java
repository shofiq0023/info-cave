package com.infoCave.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class EditBlogDAO {
	DAO dao = new DAO();
	String statement = "UPDATE blogs SET blog_title = ?, blog_snippets = ?, blog_detail = ? WHERE blog_id = ?";
	
	public boolean editBlog(int id, String title, String snippets, String detail) throws ClassNotFoundException, SQLException {
		Connection con = dao.getConnection();
		PreparedStatement prst = con.prepareStatement(statement);
		prst.setString(1, title);
		prst.setString(2, snippets);
		prst.setString(3, detail);
		prst.setInt(4, id);
		int effectedRow = prst.executeUpdate();
		
		if(effectedRow > 0) {
			return true;
		}
		
		return false;
	}
	
}
