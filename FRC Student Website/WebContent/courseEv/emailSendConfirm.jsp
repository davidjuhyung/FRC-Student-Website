<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device=width, initial-scale=1, shrink-to-fit-no">
    <title>FRC Student Website</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:regular,bold,italic,thin,light,bolditalic,black,medium&amp;lang=en">
    <link rel="stylesheet" href="https://code.getmdl.io/1.3.0/material.grey-pink.min.css" />    
    <link rel="stylesheet" href="../css/bootstrap.min.css" />
    <link rel="stylesheet" href="../css/custom.css" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.2.0/css/all.css" integrity="sha384-hWVjflwFxL6sNzntih27bfxkr27PmbbK/iSvJ+a4+0owXq79v+lsFkW54bOGbiDQ"
	crossorigin="anonymous">
</head>
<body>

<% 
	String userID = null;

	if (session.getAttribute("userID") != null) {
		
		userID = (String) session.getAttribute("userID");
		
	}	
	
	if (userID == null) {
		
		PrintWriter script = response.getWriter();

		script.println("<script>");
		
		script.println("alert('You need to log in.');");

		script.println("location.href='userLogin.jsp';");

		script.println("</script>");

		script.close();
		
		return;
	}
	
	
%>
<div class="mdl-layout mdl-js-layout mdl-layout--fixed-header">
		<header class="mdl-layout__header mdl-layout__header--waterfall portfolio-header">
            <div class="mdl-layout__header-row portfolio-logo-row">
                <span class="mdl-layout__title">
                    <a href="../index.jsp"><div class="portfolio-logo"></div></a>
                    <a href="../index.jsp"><span class="mdl-layout__title" style="color:grey;">FRC Student Website</span></a>
                </span>
            </div>            
            <div class="mdl-layout__header-row portfolio-navigation-row mdl-layout--large-screen-only">
                <nav class="mdl-navigation mdl-typography--body-1-force-preferred-font">
                    <a class="mdl-navigation__link" href="../index.jsp">Main</a>
                    <a class="mdl-navigation__link" disabled>Forum</a>
                    <a class="mdl-navigation__link" href="index.jsp">Course Evaluation</a>
                    <a class="mdl-navigation__link" disabled>Online Tutoring</a>
<%
						if (userID == null) {
%>
						<a class="mdl-navigation__link" href="userLogin.jsp">Log In/Sign Up</a>
<%
						} else {
%>
						<a class="mdl-navigation__link is-active" href="userLogout.jsp">Log Out</a>
<%
						}
%>
                </nav>     
            </div>
        </header>
        <div class="mdl-layout__drawer mdl-layout--small-screen-only">
            <nav class="mdl-navigation mdl-typography--body-1-force-preferred-font">
                <a class="mdl-navigation__link is-active" href="../index.html">Main</a>
                <a class="mdl-navigation__link" disabled>Forum</a>
                <a class="mdl-navigation__link" href="index.jsp">Course Evaluation</a>
                <a class="mdl-navigation__link" disabled>Online Tutoring</a>
                
<%
						if (userID == null) {
%>
						<a class="mdl-navigation__link" href="userSignup.jsp">Log In/Sign Up</a>
<%
						} else {
%>
						<a class="mdl-navigation__link" href="userLogout.jsp">Log Out</a>
<%
						}
%>
            </nav>
        </div>
		<main class="mdl-layout__content">
			<section class="container mt-4" style="max-width: 560px;">
				<div class="alert alert-warning" role="alert">
					Warning: You need to verify your email address to continue. Do you want to receive the verification email again?
				</div>
				<a href="emailSendAction.jsp" class="btn btn-primary">Send me the email</a>
			</section>
		</main>
		<footer class="bg-dark mt-4 p-5 text-center" style="color: #FFFFFF;">
		Copyright &copy; 2018 David Kim All Rights Reserved. </footer>
</div>
</body>
</html>