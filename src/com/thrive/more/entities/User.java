package com.thrive.more.entities;

public class User {
	private String fname;
	private String lname;
	private String email;
	private String password;
	private String gender;
	private String profile;
	public User() {
		
	}
	
	public  User(String fname, String lname, String email, String password, String gender, String profile) {
		this.fname = fname;
		this.lname = lname;
		this.email = email;
		this.password = password;
		this.gender = gender;
		this.profile = profile;
	}
	
	public String getProfile() {
		return profile;
	}
	
	public void setProfile(String profile) {
		this.profile = profile;
	}
	
	public String getFname() {
		return fname;
	}
	
	public String getLname() {
		return lname;
	}
	
	public String getEmail() {
		return email;
	}
	public String getPassword() {
		return password;
	}
	
	public String getGender() {
		return gender;
	}
	
	public void setFname(String fname) {
		this.fname = fname;
	}
	public void setLname(String lname) {
		this.lname = lname;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
}
