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

@WebServlet("/getEditBlog")
public class GetEditBlog extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		GetBlogDAO blogDao = new GetBlogDAO();
		try {
			Blogs blog = blogDao.getBlog(id);
			request.setAttribute("blog", blog);
			RequestDispatcher rd = request.getRequestDispatcher("blog-edit.jsp");
			rd.forward(request, response);
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
