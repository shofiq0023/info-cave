package com.infoCave.dao;

import java.sql.*;

public class CreateBlogDAO {
	DAO dao = new DAO();
	
	String statement = "INSERT INTO blogs (blog_title, blog_author, blog_snippets, blog_detail, user_id) VALUES (?, ?, ?, ?, ?)";
	
	public boolean insertBlog(String title, String author, String snippets, String detail, int userId) throws ClassNotFoundException, SQLException {
		Connection connection = dao.getConnection();
		PreparedStatement prst = connection.prepareStatement(statement);
		prst.setString(1, title);
		prst.setString(2, author);
		prst.setString(3, snippets);
		prst.setString(4, detail);
		prst.setInt(5, userId);
		int rs = prst.executeUpdate();
		
		if(rs > 0) {
			return true;
		}
		
		return false;
	}
}
