package com.thrive.more.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.thrive.more.dao.UserDao;
import com.thrive.more.entities.User;
import com.thrive.more.helpers.ConnectionProvider;
import java.text.SimpleDateFormat;  
@MultipartConfig
@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		String check = request.getParameter("check");
		if(check.equals("null")) {
			out.println("Terms and Conditions not accepted!");
		}else {
			String fname = request.getParameter("fname");
			String lname = request.getParameter("lname");
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			String confirmPassword = request.getParameter("confirmPassword");
			String gender = request.getParameter("gender");
			String number = request.getParameter("number");
			String profile;
			int threvens = 0;
			if(password.equals(confirmPassword)) {
				if(gender.equals("male")) {
					profile = "profile.male.png";
				}else {
					profile = "profile.female.png";
				}
				
				User user = new User(fname, lname, email, password, gender, profile, number, threvens);
				
				UserDao userdao = new UserDao(ConnectionProvider.getConnection());
				if(userdao.saveUser(user)) {
					out.println("done");
					
				}else {
					out.println("Email Id had already taken...");
				}
				
			}else {
				out.println("Confirm Password won't match!");
			}
		}
	}

}
