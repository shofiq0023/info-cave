package com.infoCave.model;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.infoCave.dao.GetUserDAO;
import com.infoCave.web.User;

@WebServlet("/edit")
public class GetProfileEdit extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		GetUserDAO userDao = new GetUserDAO();
		try {
			User user = userDao.getUser(id);
			request.setAttribute("user", user);
			RequestDispatcher rd = request.getRequestDispatcher("profile-edit.jsp");
			rd.forward(request, response);
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
			System.out.println(e);
		}
	}

}
