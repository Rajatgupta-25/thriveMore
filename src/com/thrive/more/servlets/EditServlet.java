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


@WebServlet("/EditServlet")
public class EditServlet extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String tenthEdu = request.getParameter("newTenthEdu");
		String twelfthEdu = request.getParameter("newTwelfthEdu");
		String clgEdu = request.getParameter("newClgEdu");
		String about = request.getParameter("newAbout");
		String profession = request.getParameter("newProfession");
		String country =request.getParameter("newCountry");
		
		HttpSession s = request.getSession();
		User user = (User)s.getAttribute("currentUser");
		user.setTenthEdu(tenthEdu);
		user.setTwelfthEdu(twelfthEdu);
		user.setClgEdu(clgEdu);
		user.setCountry(country);
		user.setAbout(about);
		user.setProffession(profession);
		
		UserDao dao = new UserDao(ConnectionProvider.getConnection());
		
		if(dao.updateUser(user)) {
			Message m = new Message("Successfully updated!", "success", "alert-success");
			s.setAttribute("msg", m);
		}else {
			Message m = new Message("Error Occured!", "error", "alert-danger");
			s.setAttribute("msg", m);
		}
		response.sendRedirect("dashboard.jsp");
	}

}
