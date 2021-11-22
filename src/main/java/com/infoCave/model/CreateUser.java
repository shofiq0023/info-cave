package com.infoCave.model;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.infoCave.dao.LoginDAO;
import com.infoCave.dao.CreateUserDAO;

@WebServlet("/New")
public class CreateUser extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String fullName = request.getParameter("fullName");
		String email = request.getParameter("userEmail");
		String authorName = request.getParameter("userAuthorName");
		String password = request.getParameter("userPassword");
		String confirmPassword = request.getParameter("confirmPassword");
		
		CreateUserDAO dao = new CreateUserDAO();
		LoginDAO loginDao = new LoginDAO();
		RequestDispatcher signinRd = request.getRequestDispatcher("signin.jsp");
		RequestDispatcher signupRd = request.getRequestDispatcher("signup.jsp");
		
		try {
			if(!loginDao.check(email, password)) {
				if(password.equals(confirmPassword)) {
					if(dao.insert(fullName, email, authorName, password)) {
						request.setAttribute("success", "pass");
						signinRd.forward(request, response);
					}
				}
			} else {
				request.setAttribute("error", "error");
				signupRd.forward(request, response);
			}
			
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	
}
