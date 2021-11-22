package com.infoCave.model;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.infoCave.dao.EditProfileDAO;

@WebServlet("/editProfile")
public class EditProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		EditProfileDAO dao = new EditProfileDAO();
		
		int id = Integer.parseInt(request.getParameter("userId"));
		String fullName = request.getParameter("fullName");
		String email = request.getParameter("userEmail");
		String password = request.getParameter("userPassword");
		
		try {
			if(dao.editUser(id, fullName, email, password)) {
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
