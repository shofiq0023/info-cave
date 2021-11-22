package com.infoCave.model;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.infoCave.dao.GetBlogDAO;
import com.infoCave.web.Blogs;

@WebServlet("/blogDetail")
public class GetBlog extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int blogId = Integer.parseInt(request.getParameter("id"));
		GetBlogDAO dao = new GetBlogDAO();
		try {
			Blogs blog = dao.getBlog(blogId);
			request.setAttribute("blog", blog);
			RequestDispatcher rd = request.getRequestDispatcher("blog-detail.jsp");
			rd.forward(request, response);
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
