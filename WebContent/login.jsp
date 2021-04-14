<%@page import="com.thrive.more.entities.Message"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>SignIn - Thrive More</title>
<!-- CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  
<style>

.control{
	border-bottom:2px solid rgb(73, 137, 171);
	border-top:none;
	border-left:none;
	border-right:none;
}


</style>

</head>
<body>

<!-- NavBar -->
	<nav class="navbar navbar-expand-lg navbar-light  bg-dark" >
  <a class="navbar-brand text-white" href="index.html">Thrive More</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link text-white" href="about.jsp"><span class="	fa fa-sticky-note-o"></span> About </a>
      </li>
      <li class="nav-item">
        <a class="nav-link text-white" href="privacy-policy.jsp"><span class="	fa fa-reorder"></span> Privacy Policy </a>
      </li>
      
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle text-white" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          Help
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="about.jsp">About Section</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="disscussProblems.jsp">Discuss Problems</a>
          <a class="dropdown-item" href="contactUs.jsp">Contact Us</a>
        </div>
      </li>
      
      <li class="nav-item">
        <a class="nav-link text-white" href="register.jsp">SignUp</a>
      </li>
      <li class="nav-item">
        <a class="nav-link text-white" href="login.jsp"><span class="	fa fa-sign-in"></span> SignIn</a>
      </li>
    </ul>
  
  </div>
</nav> 


<!-- Main content -->



<div class="container pt-5" >
<div class="row">
	<div class="col-2">
	
	</div>
	<div class="col-8 ">
	<div class="card" style="box-shadow:4px 3px 5px rgb(97, 102, 102);">
  <div class="card-header text-center text-white bg-dark">
   	<span class="	fa fa-user-circle fa-3x"></span>
   	<h4>Sign In</h4>
  </div>
  
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
  
  <div class="card-body">
    	<form action="LoginServlet" method="post">
    	<div class="form-row pt-5">
    	<div class="form-group col-md-1">	
    		<span class="	fa fa-envelope-o fa-2x" ></span>		
  		</div>
  <div class="form-group col-md-10 ">
 	  
    <input name="email" required type="email" class="form-control control" id="inputEmail4" placeholder="Email">
  </div>
  </div>
  <div class="form-row pt-4">
  <div class="form-group col-md-1">	
    		<span class="	fa fa-lock fa-3x" ></span>		
  		</div>
  <div class="form-group col-md-10">
    <input name="password" required type="password" class="form-control control" id="inputPassword4" placeholder="Password">
  </div>
 </div>
  <div class="form-row pt-5">
  				<div class="form-group col-md-5">
  				
  				</div>
  				<div class="form-group col-md-1">
  					<div class="text-center" id="loader" style="display:none;">
  						<span class="fa fa-refresh fa-spin fa-2x"></span>
  					</div>
  					<button id="submit-btn" type="submit" class="btn text-white " style="background:rgb(73, 137, 171);">Sign up</button>
				</div>
			</div>
</form>
 	<div class="col-3">
 	
 	</div>
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
</body>
</html>