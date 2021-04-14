package com.thrive.more.servlets;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.thrive.more.dao.UserDao;
import com.thrive.more.entities.Message;
import com.thrive.more.entities.User;
import com.thrive.more.helpers.ConnectionProvider;
import com.thrive.more.helpers.Helper;

@MultipartConfig
@WebServlet("/ProfileEditServlet")
public class ProfileEditServlet extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Part part = request.getPart("image");
		String newProfile = part.getSubmittedFileName();
		
		HttpSession s = request.getSession();
		User user = (User)s.getAttribute("currentUser");
		user.setProfile(newProfile);
		
		String oldProfile = user.getProfile();
		
		UserDao dao = new UserDao(ConnectionProvider.getConnection());
		
		if(dao.updateProfile(user)) {
			
			String path = request.getRealPath("/") + "img" + File.separator + user.getProfile();
			String pathOldFile = request.getRealPath("/") + "img" + File.separator + oldProfile;
				if(!(oldProfile.equals("profile.female.png") || oldProfile.equals("profile.female.png") || oldProfile.equals("profile.trans.png"))) {
					Helper.deleteFile(pathOldFile);
				}
				if(Helper.saveFile(part.getInputStream(), path)) {
					Message m = new Message("Successfully updated!", "success", "alert-success");
					s.setAttribute("msg", m);
				}else {
				Message m = new Message("Error Occured!", "error", "alert-danger");
				s.setAttribute("msg", m);
				}
			
		}else {
			Message m = new Message("Error Occured!", "error", "alert-danger");
			s.setAttribute("msg", m);
		}
		response.sendRedirect("dashboard.jsp");
	}

}
