package com.thrive.more.entities;

import java.sql.Timestamp;

public class Post {
	private int pid;
	private String pLocation;
	private String pContent;
	private String pPic;
	private Timestamp pDate;
	private String feelings;
	private String userEmail;
	private String pVideo;
	private String bid;
	
	public Post() {
		
	}
	
	public Post(int pid, String pLocation, String pContent, String pPic, Timestamp pDate, String feelings, String pVideo, String userEmail, String bid) {
		this.pid = pid;
		this.pLocation = pLocation;
		this.pContent = pContent;
		this.pPic = pPic;
		this.pDate = pDate;
		this.feelings = feelings;
		this.pVideo = pVideo;
		this.userEmail = userEmail;
		this.bid = bid;
	}
	
	public Post(String pLocation, String pContent, String pPic, Timestamp pDate, String feelings, String pVideo, String userEmail, String bid) {
		this.pLocation = pLocation;
		this.pContent = pContent;
		this.pPic = pPic;
		this.pDate = pDate;
		this.feelings = feelings;
		this.pVideo = pVideo;
		this.userEmail = userEmail;
		this.bid = bid;
	}
	
	
	public String getBid() {
		return bid;
	}
	
	public void setBid(String bid) {
		this.bid = bid;
	}
	
	public String getPvideo() {
		return pVideo;
	}
	
	public String getUserEmail() {
		return userEmail;
	}
	
	public void setPvideo(String pVideo) {
		this.pVideo = pVideo;
	}
	
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	
	public String getFeelings() {
		return feelings;
	}
	
	public void setFeelings(String feelings) {
		this.feelings = feelings;
	}
	
	public int getPid() {
		return pid;
	}
	
	public String getPlocation() {
		return pLocation;
	}
	
	public String getPcontent() {
		return pContent;
	}
	
	public String getPpic() {
		return pPic;
	}
	
	public Timestamp getPdate() {
		return pDate;
	}
	
	public void setPid(int pid) {
		this.pid = pid;
	}
	
	public void setPlocation(String pLocation) {
		this.pLocation = pLocation;
	}
	
	public void setPcontent(String pContent) {
		this.pContent = pContent;
	}
	
	public void setPpic(String pPic) {
		this.pPic = pPic;
	}
	
	public void setPdate(Timestamp pDate) {
		this.pDate = pDate;
	}
	
}
