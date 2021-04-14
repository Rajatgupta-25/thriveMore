package com.thrive.more.entities;

public class Category {
	private int cid;
	private String name;
	
	public Category(int cid, String name){
		this.cid = cid;
		this.name = name;
	}
	
	public Category() {
		
	}
	
	public Category(String name) {
		this.name = name;
	}
	
	public int getCid() {
		return cid;
	}
	
	public String getName() {
		return name;
	}
	
	public void setCid(int cid) {
		this.cid = cid;
	}
	
	public void setName(String name) {
		this.name = name;
	}
}
