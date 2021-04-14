<%@page import="com.thrive.more.entities.Post"%>
<%@page import="java.util.List"%>
<%@page import="com.thrive.more.helpers.ConnectionProvider"%>
<%@page import="com.thrive.more.dao.PostDao"%>
<%
	PostDao dao = new PostDao(ConnectionProvider.getConnection());
	int bid = Integer.parseInt(request.getParameter("bid"));
	
	List<Post> list = null;
	if(bid == 0 ){
		list = dao.getAllPost();
	}else{
		list = dao.getPostByCategory(bid);
	}
	for(Post p : list){
		String temp = p.getFeelings();
		String feel="";
		%>
			<div class="col-12 mt-3">
				<div class="card">
					<div class="card-body">
						<b>This is post <%
						for(int i=0; i<temp.length() ; i++){
							if((temp.charAt(i)>='a' && temp.charAt(i)<='z' ) || (temp.charAt(i)>='A' && temp.charAt(i)<='Z')){
								feel = feel + temp.charAt(i);
							}else{
								continue;
							}
						}
						
						%>
						<span>is feeling <%= feel %></span></b>
						<% if(p.getPlocation() != "")
							{
							%>
							<p class="text-muted">at <%= p.getPlocation() %></p>
							<% 
							}
						%>
						<div class="container">
							<div class="row">
								<div class="col-9"></div>
								<div class="col-3">
									<strong style="color:rgb(73, 137, 171);">Bid :<span class="ml-2"><%= p.getBid() %></span><i class="fa fa-shield ml-2" style="cursor:pointer;" data-toggle="tooltip" data-placement="bottom" title="Place a Bid"></i></strong>
								</div>
							</div>
							<div class="row mt-2">
								<div class="col-12">
									<p><%= p.getPcontent() %></p>
								</div>
							</div>
						 	<div class="row">
						 		<div class="col-12">
									<img src="post_pics" alt="Post Image"/>
								</div>
							</div>
							<div class="row pt-4">
								<div class="col-3">
									<span class="fa fa-thumbs-o-up like" style="cursor:pointer; font-size:25px;"  data-toggle="tooltip" data-placement="bottom" title="Like"> </span>
									
								</div>
								<div class="col-3">
									<span class="fa fa-thumbs-o-down dislike" style="cursor:pointer; font-size:25px;" data-toggle="tooltip" data-placement="bottom" title="Dislike"> </span>
									
								</div>
								<div class="col-3">
									<span class="fa fa-comments-o comment" style="cursor:pointer; font-size:25px;" data-toggle="tooltip" data-placement="bottom" title="Comment"> </span>
								</div>
								<div class="col-3">
									<span class="fa fa-briefcase request" style="cursor:pointer; font-size:25px;" data-toggle="tooltip" data-placement="bottom" title="Send a request for Partnership"> </span>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		<%
	}
%>
<script>
  	$(document).ready(function(){
  		var liked = false;
  		var dislike = false;
  		$('.like').click(function(){
  			if(liked == false){
  				$(this).css("color", "rgb(11, 137, 176)");
  				liked = true;
  			}else{
  				$(this).css("color", "black");
  				liked = false;
  			}
  		});
  		
  		$('.dislike').click(function(){
  			if(dislike == false){
  				$(this).css("color", "rgb(11, 137, 176)");
  				dislike = true;
  			}else{
  				$(this).css("color", "black");
  				dislike = false;
  			}
  		});
  		
  	});
  </script>