<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@page import="javax.mail.Transport"%>

<%@page import="javax.mail.Message"%>

<%@page import="javax.mail.Address"%>

<%@page import="javax.mail.internet.InternetAddress"%>

<%@page import="javax.mail.internet.MimeMessage"%>

<%@page import="javax.mail.Session"%>

<%@page import="javax.mail.Authenticator"%>

<%@page import="java.util.Properties"%>

<%@page import="user.UserDAO"%>

<%@page import="util.SHA256"%>

<%@page import="util.Gmail"%>

<%@page import="java.io.PrintWriter"%>


<%

	UserDAO userDAO = new UserDAO();

	String userID = null;

	if(session.getAttribute("userID") != null) {

		userID = (String) session.getAttribute("userID");

	}

	if(userID == null) {

		PrintWriter script = response.getWriter();

		script.println("<script>");

		script.println("alert('Please log in.');");

		script.println("location.href = 'userLogin.jsp'");

		script.println("</script>");

		script.close();

		return;

	}

	boolean emailChecked = userDAO.getUserEmailChecked(userID);

	if(emailChecked == true) {

		PrintWriter script = response.getWriter();

		script.println("<script>");

		script.println("alert('You already verified your account!');");

		script.println("location.href = 'index.jsp'");

		script.println("</script>");

		script.close();		

		return;

	}

	String host = "http://localhost:8080/FRC_Student_Website/courseEv/";

	String from = "frcstudentofficial@gmail.com";

	String to = userDAO.getUserEmail(userID);

	String subject = "Verification email for FRC Student Website.";

	String content = "This is an automatic message. Please click the following link to continue with your registeration. " +

		"<a href='" + host + "emailCheckAction.jsp?code=" + new SHA256().getSHA256(to) + "'>Verify</a>";

	
	Properties p = new Properties();

	p.put("mail.smtp.user", from);

	p.put("mail.smtp.host", "smtp.gmail.com");

	p.put("mail.smtp.port", "465");

	p.put("mail.smtp.starttls.enable", "true");

	p.put("mail.smtp.auth", "true");

	p.put("mail.smtp.debug", "true");

	p.put("mail.smtp.socketFactory.port", "465");

	p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");

	p.put("mail.smtp.socketFactory.fallback", "false");

	 

	try{

	    Authenticator auth = new Gmail();

	    Session ses = Session.getInstance(p, auth);

	    ses.setDebug(true);

	    MimeMessage msg = new MimeMessage(ses); 

	    msg.setSubject(subject);

	    Address fromAddr = new InternetAddress(from);

	    msg.setFrom(fromAddr);

	    Address toAddr = new InternetAddress(to);

	    msg.addRecipient(Message.RecipientType.TO, toAddr);

	    msg.setContent(content, "text/html;charset=UTF-8");

	    Transport.send(msg);

	} catch(Exception e){

	    e.printStackTrace();

		PrintWriter script = response.getWriter();

		script.println("<script>");

		script.println("alert('Unknown error occured...');");

		script.println("history.back();");

		script.println("</script>");

		script.close();		

	    return;

	}

%>

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
		<div class="alert alert-success mt-4" role="alert">
			We sent a verification link via your email. Please verify your account!
		</div>
	</section>

	</main>
	<footer class="bg-dark mt-4 p-5 text-center" style="color: #FFFFFF;">
		Copyright &copy; 2018 David Kim All Rights Reserved. </footer>
	</div>

	<!--  Add JQuery JavaScript Here -->
	<script src="../js/jquery.min.js"></script>
	<!--  Add Popper JavaScript Here -->
	<script src="../js/popper.js"></script>
	<!--  Add Bootstrap JavaScript Here -->
	<script src="../js/bootstrap.min.js"></script>
	<script src="https://code.getmdl.io/1.3.0/material.min.js"></script>
</body>
</html>