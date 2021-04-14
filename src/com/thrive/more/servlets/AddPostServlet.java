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

import com.thrive.more.dao.PostDao;
import com.thrive.more.entities.Post;
import com.thrive.more.entities.User;
import com.thrive.more.helpers.ConnectionProvider;
import com.thrive.more.helpers.Helper;


@WebServlet("/AddPostServlet")
@MultipartConfig
public class AddPostServlet extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String location = request.getParameter("location");
		String content = request.getParameter("content");
		Part part = request.getPart("pic");
		Part part2 = request.getPart("videos");
		String feeling = request.getParameter("feeling");
		String bid = request.getParameter("bid");
		
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("currentUser");
		
		Post post = new Post(location, content, part.getSubmittedFileName(), null, feeling, part2.getSubmittedFileName(), user.getEmail(), bid); 
		
		PostDao dao = new PostDao(ConnectionProvider.getConnection());
		
		if(dao.savePost(post)) {
			String path = request.getRealPath("/") + "post_pics" + File.separator + part.getSubmittedFileName();
			
			Helper.saveFile(part.getInputStream(), path);
			
			String path2 = request.getRealPath("/") + "post_videos" + File.separator + part2.getSubmittedFileName();
			
			Helper.saveFile(part2.getInputStream(), path2);
			
			response.getWriter().println("done");
		}else {
			response.getWriter().println("error");
		}
	}

}
