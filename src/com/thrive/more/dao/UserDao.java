package com.thrive.more.dao;
import java.sql.*;

import com.thrive.more.entities.User;

public class UserDao {
	private Connection con;
	public UserDao(Connection con) {
		this.con = con;
	}
	
	public boolean saveUser(User user) {
		boolean flag = false;
		try {
			
			String query = "insert into user(fname, lname, email, password, gender, profile) values(?,?,?,?,?,?)";
			PreparedStatement pstmt = this.con.prepareStatement(query);
			pstmt.setString(1, user.getFname());
			pstmt.setString(2, user.getLname());
			pstmt.setString(3, user.getEmail());
			pstmt.setString(4, user.getPassword());
			pstmt.setString(5, user.getGender());
			pstmt.setString(6, user.getProfile());
			pstmt.executeUpdate();
			
			flag = true;
		}catch(Exception e) {
			e.printStackTrace();
		}
		return flag;
	}
	
	public User getUserByEmailAndPassword(String email, String password) {
		User user=null;
		
		try {
			
			String query="select * from user where email=? and password=?";
			PreparedStatement pstmt = this.con.prepareStatement(query);
			pstmt.setString(1, email);
			pstmt.setString(2, password);
			
			ResultSet set = pstmt.executeQuery();
			
			if(set.next()) {
				user = new User();
				user.setFname(set.getString("fname"));
				user.setLname(set.getString("lname"));
				user.setEmail(set.getString("email"));
				user.setPassword(set.getString("password"));
				user.setGender(set.getString("gender"));
				user.setProfile(set.getString("profile"));
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return user;
	}
}
