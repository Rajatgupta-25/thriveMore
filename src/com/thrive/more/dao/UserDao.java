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
			pstmt.setString(8, user.getThrevens());
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
	
	public boolean updateUser(User user) {
		boolean flag=false;
		
		try {
			
			String query = "update user set tenthEdu=? , twelfthEdu=? , clgEdu=? , country=? , profession=? , about=? where email=?";
			PreparedStatement p = con.prepareStatement(query);
			p.setString(1, user.getTenthEdu());
			p.setString(2, user.getTwelfthEdu());
			p.setString(3, user.getClgEdu());
			p.setString(4, user.getCountry());
			p.setString(5, user.getProffession());
			p.setString(6, user.getAbout());
			p.setString(7, user.getEmail());
			
			p.executeUpdate();
			
			flag = true;
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return flag;
	}
	
	public boolean updateProfile(User user) {
		boolean flag = false;
		
		try {
			String query = "update user set profile=? where email=?";
			PreparedStatement p = con.prepareStatement(query);
			p.setString(1, user.getProfile());
			p.setString(2, user.getEmail());
			
			p.executeUpdate();
			
			flag = true;
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return flag;
	}
}
