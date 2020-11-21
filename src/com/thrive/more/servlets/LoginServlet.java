package com.thrive.more.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.thrive.more.dao.UserDao;
import com.thrive.more.entities.Message;
import com.thrive.more.entities.User;
import com.thrive.more.helpers.ConnectionProvider;


@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userEmail = request.getParameter("email");
		String userPassword = request.getParameter("password");
		
		UserDao dao = new UserDao(ConnectionProvider.getConnection());
		
		User user = dao.getUserByEmailAndPassword(userEmail, userPassword);
		if(user == null) {
			Message msg = new Message("Invalid Email or Password!", "error", "alert-danger");
			HttpSession s = request.getSession();
			s.setAttribute("msg", msg);
			
			response.sendRedirect("login.jsp");
		}else {
			HttpSession s = request.getSession();
			s.setAttribute("currentUser", user);
			response.sendRedirect("profile.jsp");
		}
	}

}
