package com.infoCave.model;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.infoCave.dao.EditBlogDAO;

@WebServlet("/editBlog")
public class EditBlog extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		EditBlogDAO dao = new EditBlogDAO();
		
		int blogId = Integer.parseInt(request.getParameter("blogId"));
		String title = request.getParameter("blogTitle");
		String snippets = request.getParameter("blogSnippet");
		String detail = request.getParameter("blogDetail");
		
		try {
			if(dao.editBlog(blogId, title, snippets, detail)) {
				response.sendRedirect("profile.jsp");
			}
		} catch (ClassNotFoundException | SQLException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
