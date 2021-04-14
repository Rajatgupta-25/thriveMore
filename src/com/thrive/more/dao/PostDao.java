package com.thrive.more.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.thrive.more.entities.Category;
import com.thrive.more.entities.Post;

public class PostDao {
	Connection con;
	
	public PostDao(Connection con) {
		this.con = con;
	}
	
	public boolean savePost(Post p) {
		boolean flag=false;
		
		try {
			
			String query = "insert into posts(pLocation, pContent, pPic, feelings, pVideo, userEmail) values(?,?,?,?,?,?)";
			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.setString(1, p.getPlocation());
			pstmt.setString(2, p.getPcontent());
			pstmt.setString(3, p.getPpic());
			pstmt.setString(4, p.getFeelings());
			pstmt.setString(5, p.getPvideo());
			pstmt.setString(6, p.getUserEmail());
			
			pstmt.executeUpdate();
			
			flag = true;
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return flag;
	}
	
	public List<Post> getAllPost(){
		List<Post> list = new ArrayList<Post>();
		
		try {
			
			PreparedStatement p = con.prepareStatement("select * from posts");
			ResultSet set = p.executeQuery();
			
			while(set.next()) {
				int pid = set.getInt("pid");
				String pLocation = set.getString("pLocation");
				String pContent = set.getString("pContent");
				String pPic = set.getString("pPic");
				String pVideo = set.getString("pVideo");
				String feeling = set.getString("feelings");
				Timestamp date = set.getTimestamp("pDate");
				String userEmail = set.getString("userEmail");
				String bid = set.getString("bid");
				
				Post post = new Post(pid, pLocation, pContent, pPic, date, feeling, pVideo, userEmail, bid);
				list.add(post);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	public List<Post> getPostByCategory(int findbid){
		List<Post> list = new ArrayList();
		
		try {
			
			PreparedStatement p = con.prepareStatement("select * from posts where bid<=");
			p.setInt(1, findbid);
			
			ResultSet set = p.executeQuery();
			
			while(set.next()) {
				int pid = set.getInt("pid");
				String pLocation = set.getString("pLocation");
				String pContent = set.getString("pContent");
				String pPic = set.getString("pPic");
				String pVideo = set.getString("pVideo");
				String feeling = set.getString("feelings");
				Timestamp date = set.getTimestamp("pDate");
				String userEmail = set.getString("userEmail");
				String bid = set.getString("bid");
				
				Post post = new Post(pid, pLocation, pContent, pPic, date, feeling, pVideo, userEmail, bid);
				list.add(post);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		return list;
	}
	
}
