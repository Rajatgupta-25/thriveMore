<%@page import="com.thrive.more.entities.Message"%>
<%@page import="java.sql.Date"%>
<%@page import="com.thrive.more.entities.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%
    	User user = (User)session.getAttribute("currentUser");
    	if(user == null){
    		response.sendRedirect("login.jsp");
    	}
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title><%= user.getFname() %> <%= user.getLname() %> - DashBoard</title>

<!-- CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  
  <style>
	li{
            cursor: pointer;
			
        }

</style>
</head>
<body>

<!-- NavBar -->

<nav class="navbar navbar-expand-lg navbar-light bg-dark ">
  <a class="navbar-brand text-white" data-toggle="tooltip" data-placement="bottom" title="Home" href="profile.jsp"><span class="fa fa-home"></span></a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse " id="navbarSupportedContent">
  <form class="form-inline ml-5 ">
      <input class="form-control  my-sm-0 " style=" width:280px; border-radius:150px 0px 0px 150px; " type="search" placeholder="Find Friends" aria-label="Search">
      <button class="btn  my-2 my-sm-0 text-white" type="submit" style="background:rgb(73, 137, 171); border-radius:0px 50px 50px 0px;"><span class="fa fa-search"></span></button>
    </form>
    <ul class="navbar-nav mx-auto">
    	<li class="nav-item active">
    	<a class="nav-link text-white" href="dashboard.jsp"><img src="img/<%= user.getProfile() %>" width="25px" height="25px" style="border-radius:50%;"> <%= user.getFname() %> <%= user.getLname() %></a>
    	</li>
    	<li class="nav-item active ml-5" >
    	<a class="nav-link text-white" data-toggle="modal" data-target="#ThrevensModal"> 
    	<strong class="text-muted p-1 ml-4 border mr-2" style="border-radius:40px; background:white;">
    		<%
     				String threvens = user.getThrevens();
     				if(threvens == null){
     					%>
     						0
     					<%
     				}else{
     					%>
     					<%= user.getThrevens() %>
     					<%
     				}
     		%> 
    	</strong> Threvens</a>
    	</li>
    </ul>
    <ul class="navbar-nav ml-auto">
      <li class="nav-item active ">
        <a class="nav-link text-white " href="#"><span class="fa fa-bar-chart-o"></span> Apex </a>
      </li>
      <li class="nav-item ml-2">
        <a class="nav-link text-white" data-toggle="modal" data-target="#notificationModal"><span class="fa fa-bell "></span> <sup class="text-center" style="width:15px; height:15px; background:red; color:white;">3</sup></a>
      </li>
      
      <li class="nav-item">
        <a class="nav-link text-white" href="#"  data-toggle="modal" data-target="#notificationModal"><span class="fa fa-comment"> <sup class="text-center" style="width:15px; height:15px; background:red; color:white;">4</sup></a>
      </li>
      <li class="nav-item mr-5">
      	<div class="dropdown">
  <button class="btn btn-secondary bg-dark" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
    <span class="fa fa-ellipsis-v"></span>
  </button>
  <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
  	<a class="dropdown-item"  href="dashboard.jsp"><img src="img/<%= user.getProfile() %>" width="25px" height="25px" style="border-radius:50%;">  <%= user.getFname() %> <%= user.getLname() %></a>
  	<small class="text-muted p-3"><%= user.getEmail() %></small>
  	<div class="dropdown-divider m-3"></div>
    <a class="dropdown-item" href="#">Prominent Posts</a>
    <a class="dropdown-item" href="#">Despise Posts</a>
    <a class="dropdown-item" href="#">New Posts</a>
    <a class="dropdown-item" href="#">Upload Post</a>
    <div class="dropdown-divider m-3"></div>
    <a class="dropdown-item" href="#">Apex</a>
    <a class="dropdown-item" href="#">About</a>
    <a class="dropdown-item" href="#">Discuss</a>
    <a class="dropdown-item" href="#">Settings</a>
    <a class="dropdown-item" href="#">Privacy Policy</a>
    <a class="dropdown-item" href="#">Contact Us</a>
    <div class="dropdown-divider m-3"></div>
    <a class="dropdown-item" href="LogoutServlet">LogOut</a>
  </div>
</div>
      </li>
    </ul>
    <form action="LogoutServlet" method="get">
    	<button class="btn btn-sm ml-5 text-white" style="background:rgb(97, 102, 102);" ><span class="fa fa-sign-out"></span> Sign Out</button>
    </form>
    
    
  
  </div>
</nav>
<!-- End Of NavBar -->

 <%
  	Message m = (Message)session.getAttribute("msg");
  	if(m != null){
  		%>
  			<div class="alert <%= m.getCssClass() %> text-center"  role="alert">
  				<%= m.getContent() %>
			</div>
  		<% 
  		session.removeAttribute("msg");
  	}
  %>
  


<!-- Notification Modal -->
<div class="modal fade" id="notificationModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        ...
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>


<!-- Message Modal -->
<div class="modal fade" id="messageModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        ...
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>

<!-- Threvens Modal -->
<div class="modal fade" id="ThrevensModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        ...
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>

<!--Upload Image Modal -->
<div class="modal fade" id="imgModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-body">
      	<div class="container">
      		<div class="row" id="userImage">
      			<div class="col-3"></div>
      			<div class="col-9">
      	<img src="img/<%= user.getProfile() %>" width="200px" height="200px" style="border-radius:50%;"/>
      			</div>
      		</div>
      		
      		<div class="row pt-4">
      			
      			
      			<div class="col-8 ">
      			
      				<span class="fa fa-camera ml-5" id="takePhoto"> Take Photo</span>
      				<div class="text-center pt-4" id="loader" style="display:none;">
  						<span class="fa fa-refresh fa-spin fa-2x "></span><br>
  						<h5>Please Wait!</h5>
  					</div>
      				<div id="clickPhoto" style="display:none;">
      				<!-- Stream video via webcam -->
      				
      				<div class="video-wrap" id="camera">
      					<video id="video" playsinline autoplay></video>
      				</div>
      				
      				<!-- Trigger canvas web API -->
      				<div class="controller" id="capture">
      					<button id="snap" class="btn" style="color:white; background:rgba(73, 137, 171, 0.8);"><span class="fa fa-file-image-o"> Capture</span></button>
      				</div>
      				</div>
      				
      				<!-- Webcam video snapshot -->
      				<canvas id="canvas" class="clickedImage" width="640" height="480" style="display:none;">
      					Your browser doesn't support canvas.
      				</canvas>
      				   
      			</div>
      		</div>
      		<hr>
      		<form action="ProfileEditServlet" method="post" enctype="multipart/form-data">
      		<div class="row pt-1">
      			<div class="col-1"></div>
      			<div class="col-8">
      				<input type="file" id="choosePhoto" name="image"  />
      			</div>
      		</div>
      		<hr>
      		<div class="row pt-4">
      			<div class="col-6"></div>
      			<div class="col-6">
      					<button type="button" class="btn btn-secondary" id="back" data-dismiss="modal">Close</button>
        				<input type="submit" name="image" class="btn text-white ml-3" style="background:rgb(73, 137, 171);" value="Upload"></input>
      			</div>
      		</div>
      	</form>
      	</div>
      </div>
      
      
    </div>
  </div>
</div>

<!-- Main Content -->
					<div class="container-fluid pt-2">
    					<div class="row">	
    						<div class="col-6">
      							<a class="nav-link"  ><img src="img/<%= user.getProfile() %>" data-toggle="modal" data-target="#imgModal" width="205px" height="205px" style="border-radius:50%;"></a>
    						</div>
    						
    						
    						<div class="col-6  pt-4">
    							<div class="conatiner border">
    								<div class="row">
    									<div class="col-6  text-center">
    										<h3>0</h3>
    									</div>
    									<div class="col-6 text-center">
    										<h3>0</h3>
    									</div>
    								</div>
    								<div class="row ">
    									<div class="col-6 text-center">
    										<h5>Followers</h5>
    									</div>
    									
    									<div class="col-6 text-center">
    										<h5>Following</h5>
    									</div>
    								</div>
    								
    							</div>
    						</div>
    					</div>
    					<div class="row pt-4">	
    						<div class="col-5 ml-5">
    							<h4 ><%= user.getFname() %> <%= user.getLname() %></h4>
    						</div>
    					</div>
    				</div>
  <div class="container-fluid">
    <div class="row pt-4">
		<div class="col-3">   			
    		<ul class="list-group">	
    			<li class="list-group-item">
    				<div class="container-fluid">
    					<div class="row pt-3">
    						<div class="col-3">
    							<h6>Email</h6>
    						</div>
    						<div class="col-9 " style="overflow:hidden;">
    							<h6 class=" text-muted p-1 m-0" data-toggle="modal" data-target="#emailModal" ><%= user.getEmail() %></h6>
    						</div>
    					</div>
    					<hr>
    					<div class="row pt-1">
    						<div class="col-3">
    							<h6>Gender</h6>
    						</div>
    						<div class="col-5 ">
    							<h6 class=" text-muted p-1 m-0" data-toggle="modal" data-target="#emailModal" ><%= user.getGender() %></h6>
    						</div>
    					</div>
    					<hr>
    					
    					
    					<div class="row pt-1">
    						<div class="col-1">
    							
    						</div>
    						<div class="col-2" >
    							<p class=" text-muted p-1 m-0"  data-toggle="modal" data-target="#emailModal" >
    							More...
    							</p>
    						</div>
    					</div>
    					
    					
    				</div>
    			</li>
    	</div>
    	<div class="col-6 border">
			    	<div class="container pt-4">
    								<div class="row">
    									<div class="col-6 border text-muted p-1 m-0" style="border-radius:80px; cursor:pointer; background:rgb(245, 246, 247);">
    										<h6 class="ml-3 mt-1" data-toggle="modal" data-target="#postModal">What's on Your mind <%= user.getFname() %> ?</h6>
    									</div>
    									<div class="col-2"></div>
    									<div class="col-2">
    										<form>
    											<button id="submit-btn" type="submit" class="btn text-white " style="background:rgb(73, 137, 171);">Post</button>
    										</form>
    									</div>
    								</div>
    							</div>
    	</div>
    	</div>
    	</div>
    	<div class="container-fluid">
    	<div class="row pt-4">
    	<div class="col-3">
    		<ul class="list-group">
    			<li class="list-group-item">
    			<ul class="nav flex-column">
    				<li class="nav-item pt-2">
      					<h6><a class="nav-link " href="#">Create Posts</a></h6>
    				</li>
    				<li class="nav-item">
      					<h6><a class="nav-link" href="#">All Posts</a></h6>
    				</li>
    				<li class="nav-item">
      					<h6><a class="nav-link" href="#">All Notifications</a></h6>
    				</li>
    				<li class="nav-item">
      					<h6><a class="nav-link " href="#">All Messages</a></h6>
    				</li>
    				<li class="nav-item">
      					<h6><a class="nav-link " href="#">Help</a></h6>
    				</li>
    				<li class="nav-item">
      					<h6><a class="nav-link " href="#">Discuss</a></h6>
    				</li>
    				<li class="nav-item">
      					<h6><a class="nav-link " href="#">Settings</a></h6>
    				</li>
  				</ul>
  				</li>
  			</ul>
		</div>
		</div>
	</div>



<!-- Post Modal -->
<div class="modal fade" id="postModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
    	<div class="container">
      <div class="modal-header ">
       
      <div class="container">
      	<div class="row ">
      		
      			<span class="fa fa-arrow-circle-o-left fa-2x mt-2" data-toggle="tooltip" data-placement="bottom" title="Back" id="backPost" style="display:none; cursor:pointer;" ></span>
      		
      		<div class="col-10 p-2 text-center">
      		<div id="createPost">
        <h5>Create Post</h5>
        	</div>
        	<div id="Feeling" style="display:none;">
        		<h5>How Are You Feeling?</h5>
        	</div>
        	</div>
        	<div class="col-2 mx-auto" id="close" > 
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
        </div>
        </div>
        </div>
      </div>
      <form id="add-post-form" action="AddPostServlet" method="post">
      <div class="modal-body">
      
        <div class="container-fluid" id="CreatePost">
        	<div class="row">
        		<div class="col-1">
        			<img src="img/<%= user.getProfile() %>" width="30px" height="30px"/>  
        		</div>
        		<div class="col-6 ">
        			<h6><%= user.getFname() %> <%= user.getLname() %></h6>
						<p id="feels" style="display:none;"><small><b>is feeling </b></small></p>
        				<input type="hidden" name="feeling" id="hiddenField" value=""/>
        		</div>
        		
        		<div class="col-5">
        			<input class="form-control control" type="text" name="location" placeholder="Add Location"/>
        		</div>
        	</div>
        	<div class="row pt-3">
        		<div class="col-12 p-2 ">
        			
        			<textarea class="form-control" name="content" placeholder="What's on your mind, <%= user.getFname() %>?" style="border:none;"></textarea>
        		</div>
        	</div>
        	<div class="row pt-3">
        		<div class="col-6">
        			<input type="text" name="bid" class="form-control control" placeholder="Place a bid"/>
        		</div>
        		<div class="col-3"></div>
        		<div class="col-1" >
        			<input type="file" name="pic" hidden="hidden"  id="real-inp" accept="images/*" />
        			<p><span class="fa fa-file-image-o" id="custom-inp"  style="cursor:pointer;" data-toggle="tooltip" data-placement="bottom" title="Images"></span>
        		</div>
        		<div class="col-1">
        			<input type="file" name="videos" hidden="hidden" id="real-video" accept="videos/*"/>
        			<p><span id="custom-video" class="fa fa-file-video-o " style="cursor:pointer;" data-toggle="tooltip" data-placement="bottom" title="Videos"></span></p>
        		</div>
        		<div class="col-1">
        			<p><span id="emoji" class="fa fa-smile-o" style="cursor:pointer;" data-toggle="tooltip" data-placement="bottom" title="Feelings"></span></p>
        		</div>
        		
        	</div>
        </div>
        
        
        <div class="container-fluid" id="Feelings-Activities" style="display:none;">
        	<div class="row">
        		
        		<div class="col-4" >
        			<h6 class="ml-2" style="color:#1e90ff; cursor:pointer;" id="feeling">Feelings</h6>
        		</div>
        		<div class="col-4" >
        			<h6 class="ml-2" style="color:grey; cursor:pointer;" id="activity">Activities</h6>
        		</div>
        	</div>
        	<div class="row" >
        		<div class="col-3">
        			<hr id="feeling-line" style="height:2px; background:#1e90ff;">
        		</div>
        		<div class="col-1"></div>
        		<div class="col-3">
        			<hr id="activity-line" style="display:none; height:2px; background:#1e90ff;">
        		</div>
        	</div>
        	<div class="row" style="height:250px; overflow:scroll;">
        		<div class="container-fluid">
        			<div class="row pt-1">		
        			<div class="col-6 ">
        				<p class="target"  ><span style="font-size:20px;">&#128512 </span>Happy</p>
        			</div>
        				<div class="col-6">
        					<p class="target"  ><span style="font-size:20px;">&#128519 </span>Blessed</p>
        				</div>
        			</div>
        			<div class="row pt-1">		
        			<div class="col-6 ">
        				<p class="target"><span style="font-size:20px;">&#128525 </span>Loved</p>
        			</div>
        				<div class="col-6" >
        					<p class="target"><span style="font-size:20px;">&#128577 </span>Sad</p>
        				</div>
        			</div>
        			<div class="row pt-1">		
        			<div class="col-6 ">
        				<p class="target"><span style="font-size:20px;">&#128525 </span>Lovely</p>
        			</div>
        				<div class="col-6" >
        					<p class="target"><span style="font-size:20px;">&#128515 </span>Thank You</p>
        				</div>
        			</div>
        			<div class="row pt-1">		
        			<div class="col-6 ">
        				<p class="target"><span style="font-size:20px;">&#128513 </span>Excited</p>
        			</div>
        				<div class="col-6" >
        					<p class="target"><span style="font-size:20px;">&#128536 </span>In Love</p>
        				</div>
        			</div>
        			<div class="row pt-1">		
        			<div class="col-6 ">
        				<p class="target"><span style="font-size:20px;">&#129322 </span>Crazy</p>
        			</div>
        				<div class="col-6" >
        					<p class="target"><span style="font-size:20px;">&#128512 </span>Grateful</p>
        				</div>
        			</div>
        			<div class="row pt-1">		
        			<div class="col-6 ">
        				<p class="target"><span style="font-size:20px;">&#128522 </span>Blissful</p>
        			</div>
        				<div class="col-6" >
        					<p class="target"><span style="font-size:20px;">&#129299 </span>Fantastic</p>
        				</div>
        			</div>
        			<div class="row pt-1">		
        			<div class="col-6 ">
        				<p class="target"><span style="font-size:20px;">&#129317 </span>Silly</p>
        			</div>
        				<div class="col-6" >
        					<p class="target"><span style="font-size:20px;">&#127879 </span>Festive</p>
        				</div>
        			</div>
        			<div class="row pt-1">		
        			<div class="col-6 ">
        				<p class="target"><span style="font-size:20px;">&#128522 </span>Wonderful</p>
        			</div>
        				<div class="col-6" >
        					<p class="target"><span style="font-size:20px;">&#128526 </span>Cool</p>
        				</div>
        			</div>
        			<div class="row pt-1">		
        			<div class="col-6 ">
        				<p class="target"><span style="font-size:20px;">&#128578 </span>Amused</p>
        			</div>
        				<div class="col-6" >
        					<p class="target"><span style="font-size:20px;">&#128516 </span>Relaxed</p>
        				</div>
        			</div>
        			<div class="row pt-1">		
        			<div class="col-6 ">
        				<p class="target"><span style="font-size:20px;">&#128516 </span>Positive</p>
        			</div>
        				<div class="col-6" >
        					<p class="target"><span style="font-size:20px;">&#128516 </span>Chill</p>
        				</div>
        			</div>
        			<div class="row pt-1">		
        			<div class="col-6 ">
        				<p class="target"><span style="font-size:20px;">&#127799 </span>Hopeful</p>
        			</div>
        				<div class="col-6" >
        					<p class="target"><span style="font-size:20px;">&#128521 </span>Joyful</p>
        				</div>
        			</div>
        			<div class="row pt-1">		
        			<div class="col-6 ">
        				<p class="target"><span style="font-size:20px;">&#129317 </span>Tired</p>
        			</div>
        				<div class="col-6" >
        					<p class="target"><span style="font-size:20px;">&#129320 </span>Motivated</p>
        				</div>
        			</div>
        			<div class="row pt-1">		
        			<div class="col-6 ">
        				<p class="target"><span style="font-size:20px;">&#128522 </span>Proud</p>
        			</div>
        				<div class="col-6" >
        					<p class="target"><span style="font-size:20px;">&#128543 </span>Alone</p>
        				</div>
        			</div>
        			<div class="row pt-1">		
        			<div class="col-6 ">
        				<p class="target"><span style="font-size:20px;">&#128580 </span>Thoughtful</p>
        			</div>
        				<div class="col-6" >
        					<p class="target"><span style="font-size:20px;">&#128077 </span>OK</p>
        				</div>
        			</div>
        			<div class="row pt-1">		
        			<div class="col-6 ">
        				<p class="target"><span style="font-size:20px;">&#129303 </span>Nostalgic</p>
        			</div>
        				<div class="col-6" >
        					<p class="target"><span style="font-size:20px;">&#128545 </span>Angry</p>
        				</div>
        			</div>
        			<div class="row pt-1">		
        			<div class="col-6 ">
        				<p class="target"><span style="font-size:20px;">&#129298 </span>Sick</p>
        			</div>
        				<div class="col-6" >
        					<p class="target"><span style="font-size:20px;">&#128513 </span>Delighted</p>
        				</div>
        			</div>
        			<div class="row pt-1">		
        			<div class="col-6 ">
        				<p class="target"><span style="font-size:20px;">&#128524 </span>Drained</p>
        			</div>
        				<div class="col-6" >
        					<p class="target"><span style="font-size:20px;">&#128543 </span>Emotional</p>
        				</div>
        			</div>
        			<div class="row pt-1">		
        			<div class="col-6 ">
        				<p class="target"><span style="font-size:20px;">&#128522 </span>Confident</p>
        			</div>
        				<div class="col-6" >
        					<p class="target"><span style="font-size:20px;">&#128516 </span>Awesome</p>
        				</div>
        			</div>
        			<div class="row pt-1">		
        			<div class="col-6 ">
        				<p class="target"><span style="font-size:20px;">&#128522 </span>Fresh</p>
        			</div>
        				<div class="col-6" >
        					<p class="target"><span style="font-size:20px;">&#129320 </span>Determined</p>
        				</div>
        			</div>
        			<div class="row pt-1">		
        			<div class="col-6 ">
        				<p class="target"><span style="font-size:20px;">&#128549 </span>Exhausted</p>
        			</div>
        				<div class="col-6" >
        					<p class="target"><span style="font-size:20px;">&#128544 </span>Annoyed</p>
        				</div>
        			</div>
        			
        		</div>
        	</div>
        </div>
        
        
       
      </div>
      <div class="modal-footer">
        <div class="container">
        	<div class="row" >
        		<div class="col-12" >
        			<button type="submit" id="post"  class="btn text-center text-white" style="width:410px; background:rgb(73, 137, 171);">Post</button>
        		</div>
        	</div>
        </div>
      </div>
       </form>
    </div>
    </div>
  </div>
</div>



<!-- Edit Modals -->
<div class="modal fade" id="emailModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
  	<div class="container pt-4">
    		
    <div class="modal-content">
    	<div class="container pt-4">
    		<button type="button" class="close ml-2" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      <div class="modal-header bg-dark" >
      	<div class="container">
      		<div class="row">
      			<div class="col-md-4"></div>
      			<div class="col-md-3 text-center">
        <img src="img/<%= user.getProfile() %>" width="50px" height="50px" style="border-radius:50%;"/>
        		</div>
        		<div class="col-md-3"></div>
        
        	</div>
        </div>
      </div>
      <div class="modal-body">
      	<div class="container">
      		<div id="profile-details">
     		<div class="row">
     			<div class="col-2">
     				<h6>Name</h6>
     			</div>
     			<div class="col-1"></div>
     			<div class="col-8 pt-2 border text-muted" style="border-radius:50px; background-color:rgb(232, 234, 235);">
     				<h6><%= user.getFname() %> <%= user.getLname() %></h6>
     			</div>
     		</div>
     		<hr>
     		<div class="row">
     			<div class="col-2">
     				<h6>Email</h6>
     			</div>
     			<div class="col-1">
     			</div>
     			<div class="col-8 pt-2 border text-muted" style="border-radius:50px; background-color:rgb(232, 234, 235);">
     				<h6><%= user.getEmail() %></h6>
     			</div>
     		</div>
     		<hr>
     		<div class="row">
     			<div class="col-2">
     				<h6>Gender</h6>
     			</div>
     			<div class="col-1"></div>
     			<div class="col-8 pt-2 border text-muted" style="border-radius:50px; background-color:rgb(232, 234, 235);">
     				<h6><%= user.getGender() %></h6>
     			</div>
     		</div>
     		<hr>
     		<div class="row">
     			<div class="col-2">
     				<h6>Number</h6>
     			</div>
     			<div class="col-1"></div>
     			<div class="col-8 pt-2 border text-muted" style="border-radius:50px; background-color:rgb(232, 234, 235);">
     				<h6><%= user.getNumber() %></h6>
     			</div>
     		</div>
     		<hr>
     		<div class="row ">
     			<div class="col-4">
     				<h6>Education </h6>
     			</div>
     			</div>
     		<div class="row">
     			
     			<div class="col-2 text-muted">
     				<h6>Tenth </h6>
     			</div>
     			<div class="col-1"></div>
     			<div class="col-8 pt-2 border text-muted" style="border-radius:50px; background-color:rgb(232, 234, 235);">
     			<%
     				String edu = user.getTenthEdu();
     				if(edu == null){
     					%>
     						<h6>Edit</h6>
     					<%
     				}else{
     					%>
     					<h6><%= user.getTenthEdu() %></h6>
     					<%
     				}
     			%>
     			</div>
     		</div>
     		<div class="row pt-4">
     			
     			<div class="col-2 text-muted">
     				<h6>Twelfth </h6>
     			</div>
     			<div class="col-1"></div>
     			<div class="col-8 pt-2 border text-muted" style="border-radius:50px; background-color:rgb(232, 234, 235);">
     			<%
     				String edu2 = user.getTwelfthEdu();
     				if(edu2 == null){
     					%>
     						<h6>Edit</h6>
     					<%
     				}else{
     					%>
     					<h6><%= user.getTwelfthEdu() %></h6>
     					<%
     				}
     			%>
     			</div>
     		</div>
     		<div class="row pt-4">
     			
     			<div class="col-2 text-muted">
     				<h6>College </h6>
     			</div>
     			<div class="col-1"></div>
     			<div class="col-8 pt-2 border text-muted" style="border-radius:50px; background-color:rgb(232, 234, 235);">
     			<%
     				String edu3 = user.getClgEdu();
     				if(edu3 == null){
     					%>
     						<h6>Edit</h6>
     					<%
     				}else{
     					%>
     					<h6><%= user.getClgEdu() %></h6>
     					<%
     				}
     			%>
     			</div>
     		</div> 
     		<hr>
     		<div class="row">
     			<div class="col-2">
     				<h6>About</h6>
     			</div>
     			<div class="col-1">
     			</div>
     			<div class="col-8 pt-2 border text-muted" style="border-radius:50px; background-color:rgb(232, 234, 235);">
     				<%
     				String about = user.getAbout();
     				if(about == null){
     					%>
     						<h6>Edit</h6>
     					<%
     				}else{
     					%>
     					<h6><%= user.getAbout() %></h6>
     					<%
     				}
     			%>
     			</div>
     		</div>
     		<hr>
     		<div class="row">
     			
     			<div class="col-2 ">
     				<h6>Country </h6>
     			</div>
     			<div class="col-1"></div>
     			<div class="col-8 pt-2 border text-muted" style="border-radius:50px; background-color:rgb(232, 234, 235);">
     			<%
     				String country = user.getCountry();
     				if(country == null){
     					%>
     						<h6>Edit</h6>
     					<%
     				}else{
     					%>
     					<h6><%= user.getCountry() %></h6>
     					<%
     				}
     			%>
     			</div>
     		</div>
     		 
		</div>
		
		<!-- Profile Edit -->
		<div id="profile-edit" style="display:none;">
			<h5>Please Edit Carefully!</h5>
			<hr>
			<form action="EditServlet" method="post" >
				<div class="container">
					<div class="row">
						<div class="col-3">
							<h6>Education</h6>
						</div>
					</div>
					<div class="row">
						<div class="col-2 text-muted" >
							Tenth
						</div>
						<div class="col-1"></div>
						<div class="col-8" >
							<input type="text" name="newTenthEdu"  class="form-control" placeholder="<%= user.getTenthEdu()%>"/>
						</div>
					</div>
					<div class="row pt-4">
						<div class="col-2 text-muted" >
							Twelfth
						</div>
						<div class="col-1"></div>
						<div class="col-8" >
							<input type="text" name="newTwelfthEdu"  class="form-control" placeholder="<%= user.getTwelfthEdu()%>"/>
						</div>
					</div>
					<div class="row pt-4">
						<div class="col-2 text-muted" >
							College
						</div>
						<div class="col-1"></div>
						<div class="col-8" >
							<input type="text" name="newClgEdu"  class="form-control" placeholder="<%= user.getClgEdu()%>"/>
						</div>
					</div>
					<hr>
					<div class="row">
						<div class="col-2">
							<h6>About</h6>
						</div>
						<div class="col-1"></div>
						<div class="col-8">
							<textarea name="newAbout" class="form-control" rows="5" cols="8" placeholder="<%= user.getAbout() %>"></textarea>
						</div>
					</div>
					<hr>
					<div class="row">
						<div class="col-2">
							<h6>Country</h6>
						</div>
						<div class="col-1"></div>
						<div class="col-8">
							<input type="text" class="form-control" name="newCountry" placeholder="<%= user.getCountry() %>"/>
						</div>
					</div>
					<hr>
					<div class="row">
						<div class="col-2">
							<h6>Profession</h6>
						</div>
						<div class="col-1"></div>
						<div class="col-8">
							<input type="text" class="form-control" name="newProfession" placeholder="<%= user.getProffession() %>"/>
						</div>
					</div>
					<div class="row pt-4">
						<div class="col-4"></div>
						<div class="col-3 text-center">
							<input type="submit" class="form-control" value="Save" style="color:white;background:rgb(73, 137, 171);"/>
						</div>
					</div>
				</div>
			</form>
		</div>		
		</div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn text-white" id="edit-profile-btn" style="background:rgb(73, 137, 171);">Edit</button>
      </div>
    </div>
    </div>
  </div>
</div>





<!-- JavaScript -->
	 <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script
  src="https://code.jquery.com/jquery-3.5.1.min.js"
  integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
  crossorigin="anonymous"></script>
<script src= 
"https://cdnjs.cloudflare.com/ajax/libs/html2canvas/0.4.1/html2canvas.js"> 
    </script> 
    <!-- Angular -->
  <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/angular.js/1.8.2/angular.min.js" integrity="sha512-7oYXeK0OxTFxndh0erL8FsjGvrl2VMDor6fVqzlLGfwOQQqTbYsGPv4ZZ15QHfSk80doyaM0ZJdvkyDcVO7KFA==" crossorigin="anonymous"></script>
  <!-- end of Angular script -->
  <script>
  	const realInp = document.getElementById("real-inp");
  	const customInp = document.getElementById("custom-inp");
  	
  	const realVideo = document.getElementById("real-video");
  	const customVideo = document.getElementById("custom-video");
  	
  	customInp.addEventListener("click", function(){
  		realInp.click();
  	});
  	
  	customVideo.addEventListener("click", function(){
  		realVideo.click();
  	});
  	</script>
    
 <script >
  $(function () {
	  $('[data-toggle="tooltip"]').tooltip()
	});
</script>

<script>
	$(document).ready(function(){
		let clickStatus = false;
		let clicked = false;
		
		$('#takePhoto').click(function(){
			if(clickStatus == false){
				$("#userImage").hide()
				$("#takePhoto").hide()
				$("#clickPhoto").show();
				clickStatus = true;
				$("#back").text("Back");
			}else{
				$("#userImage").show()
				$("#takePhoto").show()
				$("#clickPhoto").hide();
				clickStatus = false;
			}
		});
		
		$('#capture').click(function(){
			if(clicked == false){
				$(this).hide()
				$("#camera").hide()
				$(".clickedImage").show();
				clicked = true;
			}else{
				$(this).show()
				$("#camera").show()
				$(".clickedImage").hide()
			}
		});
		
		$('#back').click(function(){
			location.reload();
		}); 
	});
</script>

<script>
	$(document).ready(function(){
		let editStatus = false;
		
		$('#edit-profile-btn').click(function(){
			if(editStatus == false){
				$("#profile-details").hide()
				$("#profile-edit").show();
				editStatus = true;
				$(this).text("Back");
			}else{
				$("#profile-details").show()
				$("#profile-edit").hide();
				editStatus = false;
				$(this).text("Edit");
			}
		});
		
		$("#takePhoto").hover(function(){
			$(this).css("color", "#1e90ff"),
			$(this).css("cursor", "pointer");
		});
		
		
		$("#choosePhoto").hover(function(){
			$(this).css("cursor", "pointer");
		});
	});
</script>

	
<script>
	'use strict';
	const video = document.getElementById('video');
	const canvas = document.getElementById('canvas');
	const snap = document.getElementById('snap');
	const errorMsgElement = document.getElementById('snap#ErrorMsg');
	
	const constraint = {
			audio: false,
			video: {
				width: 430, height: 430
			}
	};
	
	//Access Webcam
	async function init(){
		try{
			const stream = await navigator.mediaDevices.getUserMedia(constraint);
			handleSuccess(stream);
		}catch(e){
			errorMsgElement.innerHTML = `navigator.getUserMedia.error:${e.toString()}`;
		}
	}

	
	//Success
	function handleSuccess(stream){
		$("#loader").hide();
		window.stream = stream;
		video.srcObject = stream;
	}
	
	//Load init
	
	$(document).ready(function(){
		$('#takePhoto').click(function(){
			$("#loader").show();
			init();
		});
	});
	
	//Draw image
	var context = canvas.getContext('2d');
	snap.addEventListener("click", function(){
		context.drawImage(video, 0, 0, 430, 430);
	});
	

</script>
<script >
  
  
  var feel;
  
  
  $(function () {
	  $('[data-toggle="tooltip"]').tooltip()
	});
  
  $(document).ready(function(){
	 $('#custom-inp').mouseenter(function(){
		 $(this).css("color",  "#1e90ff");
	 });
	 
	 $('#custom-video').mouseenter(function(){
		 $(this).css("color",  "#1e90ff");
	 });
	 
	 $('#emoji').mouseenter(function(){
		 $(this).css("color",  "#1e90ff");
	 });
	 
	 $('#custom-inp').mouseleave(function(){
		 $(this).css("color",  "black");
	 });
	 
	 $('#custom-video').mouseleave(function(){
		 $(this).css("color",  "black");
	 });
	 
	 $('#emoji').mouseleave(function(){
		 $(this).css("color",  "black");
	 });
	 
	 $('.target').mouseenter(function(){
		$(this).css("color", "#1e90ff");
		$(this).css("cursor", "pointer");
	 });
	 $('.target').mouseleave(function(){
			$(this).css("color", "black");
			$(this).css("cursor", "context-menu");
		 });
	 
	 
	 $('.target').click(function(){
		 feel = $(this).text();
		 document.getElementById("hiddenField").value = feel;
		 $("#feels").show();
		 $("#feels").append('<small><b>' + feel + '</b></small>');
		 $("#backPost").click();
	 });
	 
	 $('#emoji').click(function(){
		 $("#CreatePost").hide();
		 $("#Feelings-Activities").show();
		 $("#createPost").hide();
		 $("#Feeling").show();
		 $("#backPost").show();
		 $("#close").hide();
		 $("#post").hide();
	 });
	 
	 $('#feeling').click(function(){
		$(this).css("color", "#1e90ff");
		$("#activity").css("color", "grey");
		$("#feeling-line").show();
		$("#activity-line").hide();
	 });
	
	 $('#activity').click(function(){
			$(this).css("color", "#1e90ff");
			$("#feeling").css("color", "grey");
			$("#activity-line").show();
			$("#feeling-line").hide();
	 });
	 
	 $('#backPost').click(function(){
		 $(this).hide();
		$("#createPost").show();
		$("#CreatePost").show();
		$("#Feelings-Activities").hide();
		$("#close").show();
		$("#Feeling").hide();
		$("#post").show();
	 });
	 
	
  });
  
  </script>
  
  
  <!-- Add Post Js -->
  
  <script>
  
  
  		$(document).ready(function(e){
  			$("#add-post-form").on("submit", function(event){
  				event.preventDefault();
  				
  				let form = new FormData(this);
  				
  				$.ajax({
  					url : "AddPostServlet",
  					type : 'post',
  					data : form,
  					success: function(data, textStatus, jqXHR){
  						if(data.trim() == 'done'){
  							swal("Congratulations!", "Post Uploaded Successfully", "success")
  							.then((value) => {
  								window.location = "profile.jsp"	
  							});
  						}else{
  							swal("Error Occurred!", "Something went wrong...", "error");
  						}
  					},
  					error: function(jqXHR, textStatus, errorThrown){
  						swal("Error Occurred!", "Something went wrong...", "error");
  					},
  					processData: false,
  					contentType: false
  				});
  			});
  		});
  		
  		
  </script>
  
  <!-- Loading Post using Ajax -->
  <script>
  
  function getPosts(bidP){
	  $.ajax({
			url: "load_posts.jsp",
			data: {bid: bidP},
			success: function(data, textStatus, jqXHR){
				$("#loader").hide();
				$("#post_container").html(data);
			}
		});
  }
  
  	$(document).ready(function(e){
  		getPosts(0);
  	});
  </script>
  
</body>
</html>