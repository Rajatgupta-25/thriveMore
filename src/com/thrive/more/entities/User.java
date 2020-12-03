package com.thrive.more.entities;

import java.sql.Date;

public class User {
	private String fname;
	private String lname;
	private String email;
	private String password;
	private String gender;
	private String profile;
	private String number;
	private Date dob;
	private String tenthEdu;
	private String twelfthEdu;
	private String clgEdu;
	private String country;
	private String proffession;
	private String about;
	private int threvens;
	public User() {
		
	}
	
	public  User(String fname, String lname, String email, String password, String gender, String profile, String number, int threvens) {
		this.fname = fname;
		this.lname = lname;
		this.email = email;
		this.password = password;
		this.gender = gender;
		this.profile = profile;
		this.number = number;
		this.threvens = threvens;
	}
	
	public void setThrevens(int threvens) {
		this.threvens = threvens;
	}
	
	public int getThrevens() {
		return threvens;
	}
	
	public String getAbout() {
		return about;
	}
	
	public void setAbout(String about) {
		this.about = about;
	}
	
	public Date getDob() {
		return dob;
	}
	
	public String getTenthEdu() {
		return tenthEdu;
	}
	
	public String getTwelfthEdu() {
		return twelfthEdu;
	}
	
	public String getClgEdu() {
		return clgEdu;
	}
	
	public String getCountry() {
		return country;
	}
	
	public String getProffession() {
		return proffession;
	}
	
	public void setDob(Date dob) {
		this.dob = dob;
	}
	
	public void setTenthEdu(String tenthEdu) {
		this.tenthEdu = tenthEdu;
	}
	
	public void setTwelfthEdu(String twelfthEdu) {
		this.twelfthEdu = twelfthEdu;
	}
	
	public void setClgEdu(String clgEdu) {
		this.clgEdu = clgEdu;
	}
	
	public void setCountry(String country) {
		this.country = country;
	}
	
	public void setProffession(String proffession) {
		this.proffession = proffession;
	}
	
	public String getNumber() {
		return number;
	}
	
	public void setNumber(String number) {
		this.number = number;
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
