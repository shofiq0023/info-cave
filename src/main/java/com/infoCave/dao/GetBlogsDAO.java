package com.infoCave.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.infoCave.web.Blogs;

public class GetBlogsDAO {
	DAO dao = new DAO();
	
	String statement = "SELECT * FROM blogs";
	
	public List<Blogs> getBlogs() throws ClassNotFoundException, SQLException {
		List<Blogs> blogs = new ArrayList<>();
		Connection connection = dao.getConnection();
		PreparedStatement prst = connection.prepareStatement(statement);
		ResultSet rs = prst.executeQuery();
		while(rs.next()) {
			int id = rs.getInt("blog_id");
			String title = rs.getString("blog_title");
			String author = rs.getString("blog_author");
			String snippets = rs.getString("blog_snippets");
			String detail = rs.getString("blog_detail");
			blogs.add(new Blogs(id, title, author, snippets, detail));
		}
		return blogs;
	}
	
}
