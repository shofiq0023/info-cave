package com.infoCave.dao;

import java.sql.*;

import com.infoCave.web.Blogs;

public class GetBlogDAO {
	DAO dao = new DAO();
	Blogs blog;
	
	String statement = "SELECT * FROM blogs WHERE blog_id=?";
	
	public Blogs getBlog(int id) throws ClassNotFoundException, SQLException {
		Connection con = dao.getConnection();
		PreparedStatement prst = con.prepareStatement(statement);
		prst.setInt(1, id);
		ResultSet rs = prst.executeQuery();
		while(rs.next()) {
			int blogId = rs.getInt("blog_id");
			String title = rs.getString("blog_title");
			String author = rs.getString("blog_author");
			String snippets = rs.getString("blog_snippets");
			String detail = rs.getString("blog_detail");
			blog = new Blogs(blogId, title, author, snippets, detail);
		}
		return blog;
	}
}
