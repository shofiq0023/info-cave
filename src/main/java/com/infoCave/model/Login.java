package com.infoCave.model;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.infoCave.dao.LoginDAO;

@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("userEmail");
		String password = request.getParameter("userPassword");
		
		LoginDAO dao = new LoginDAO();
		
		try {
			if(dao.check(username, password)) {
				HttpSession session = request.getSession();
				
				session.setAttribute("userId", dao.userId);
				session.setAttribute("userAuthorName", dao.userAuthorName);
				response.sendRedirect("profile.jsp");
			} else {
				response.sendRedirect("signin.jsp");
			}
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	

}
