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
			
			String query = "insert into user(fname, lname, email, password, gender, profile, number, threvens) values(?,?,?,?,?,?,?,?)";
			PreparedStatement pstmt = this.con.prepareStatement(query);
			pstmt.setString(1, user.getFname());
			pstmt.setString(2, user.getLname());
			pstmt.setString(3, user.getEmail());
			pstmt.setString(4, user.getPassword());
			pstmt.setString(5, user.getGender());
			pstmt.setString(6, user.getProfile());
			pstmt.setString(7, user.getNumber());
			pstmt.setInt(8, user.getThrevens());
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
				user.setNumber(set.getString("number"));
				user.setDob(set.getDate("dob"));
				user.setTenthEdu(set.getString("tenthEdu"));
				user.setTwelfthEdu(set.getString("twelfthEdu"));
				user.setCountry(set.getString("country"));
				user.setProffession(set.getString("profession"));
				user.setClgEdu(set.getString("clgEdu"));
				user.setAbout(set.getString("about"));
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return user;
	}
	
}
