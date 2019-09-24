<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device=width, initial-scale=1, shrink-to-fit-no">
<title>Rate My Courses</title>
<!-- Add Bootstrap CSS Here -->
<link rel="stylesheet" href="./css/bootstrap.min.css">
<!--  Add Custom CSS -->
<link rel="stylesheet" href="./css/custom.css">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.2.0/css/all.css"
	integrity="sha384-hWVjflwFxL6sNzntih27bfxkr27PmbbK/iSvJ+a4+0owXq79v+lsFkW54bOGbiDQ"
	crossorigin="anonymous">
</head>
<body>

<% 
	String userID = null;

	if (session.getAttribute("userID") != null) {
		
		userID = (String) session.getAttribute("userID");
		
	}	
	
	if (userID != null) {
		
		PrintWriter script = response.getWriter();

		script.println("<script>");
		
		script.println("alert('You already logged in.');");

		script.println("location.href='index.jsp';");

		script.println("</script>");

		script.close();
		
		return;
	}
	
	
%>
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<a class="navbar-brand" href="index.jsp">Rate My Courses</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbar">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div id="navbar" class="collapse navbar-collapse">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link"
					href="index.jsp">Main Page</a></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" id="dropdown"
					data-toggle="dropdown"> Your Account </a>
					<div class="dropdown-menu" aria-labelledby="dropdown">

<% 
						if (userID == null) {
%>
						<a class="dropdown-item" href="userLogin.jsp">Log In</a>
						<a class="dropdown-item" href="userSignup.jsp">Sign Up</a>
<%
						} else {
%>  			
						<a class="dropdown-item" href="userLogout.jsp">Log Out</a> 
<%
						}
%>					


					</div></li>
			</ul>
			<form action="./index.jsp" method="get" class="form-inline my-2 my-lg-0">
				<input type="text" name="search" class="form-control mr-sm-2" type="search" aria-label="search">
				<button class="btn btn-outline-success my-2 my-sm-0" type="submit">SEARCH</button>
			</form>
		</div>
	</nav>
	
	<section class="container mt-4" style="max-width: 560px;">
		<form method="post" action="./userSignupAction.jsp">
			<div class="form-group">
				<label>ID</label> 
				<input type="text" name="userID" class="form-control">
			</div>
			<div class="form-group">
				<label>Password</label> 
				<input type="password" name="userPassword" class="form-control">
			</div>
			<div class="form-group">
				<label>E-mail</label> 
				<input type="email" name="userEmail" class="form-control">
			</div>
			<button type="submit" class="btn btn-primary">Sign Up</button>
		</form>
	</section>
	<footer class="bg-dark mt-4 p-5 text-center" style="color: #FFFFFF;">
		Copyright &copy; 2018 David Kim All Rights Reserved. </footer>
	<!--  Add JQuery JavaScript Here -->
	<script src="./js/jquery.min.js"></script>
	<!--  Add Popper JavaScript Here -->
	<script src="./js/popper.js"></script>
	<!--  Add Bootstrap JavaScript Here -->
	<script src="./js/bootstrap.min.js"></script>
</body>
</html>