package com.infoCave.model;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.infoCave.dao.DeleteUserDAO;

@WebServlet("/DeleteAccount")
public class DeleteUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int userId = Integer.parseInt(request.getParameter("id"));
		
		DeleteUserDAO dao = new DeleteUserDAO();
		
		try {
			if(dao.deleteAccount(userId)) {
				HttpSession session = request.getSession();
				session.removeAttribute("userId");
				session.invalidate();
				response.sendRedirect("signin.jsp");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
