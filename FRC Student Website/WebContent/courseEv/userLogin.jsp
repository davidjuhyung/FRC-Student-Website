<%@ page import="java.io.PrintWriter"%>
<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit-no">
	<title>FRC Student Website</title>
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:regular,bold,italic,thin,light,bolditalic,black,medium&amp;lang=en">
	<link rel="stylesheet" href="https://code.getmdl.io/1.3.0/material.grey-pink.min.css" />
	<link rel="stylesheet" href="../css/loginSignup.css" />
	<link rel="stylesheet" href="../css/bootstrap.min.css" />
	<link rel="stylesheet" href="../css/custom.css" />
	<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.2.0/css/all.css" integrity="sha384-hWVjflwFxL6sNzntih27bfxkr27PmbbK/iSvJ+a4+0owXq79v+lsFkW54bOGbiDQ"
		crossorigin="anonymous">
	
	<!-- Font Icon -->
    <link rel="stylesheet" href="../Login/fonts/material-icon/css/material-design-iconic-font.min.css">

    <!-- Main css -->
    <link rel="stylesheet" href="../Login/css/style.css">
    
	<!--  Add JQuery JavaScript Here -->
	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	<!--  Add Popper JavaScript Here -->
	<script src="../js/jqueryMain.js"></script>
	<!--  Add Bootstrap JavaScript Here -->
	<script src="../js/bootstrap.min.js"></script>
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
						<a class="mdl-navigation__link is-active" href="userLogin.jsp">Log In/Sign Up</a>
<%
						} else {
%>
						<a class="mdl-navigation__link" href="userLogout.jsp">Log Out</a>
<%
						}
%>
                </nav>     
            </div>
        </header>
        <div class="mdl-layout__drawer mdl-layout--small-screen-only">
            <nav class="mdl-navigation mdl-typography--body-1-force-preferred-font">
                <a class="mdl-navigation__link is-active" href="../index.jsp">Main</a>
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
<div class="bg-dark" style="padding:5%;">
		  <!-- Sign in  Form -->
        <section class="sign-in" id="logIn">
            <div class="container">
                <div class="signin-content">
                    <div class="signin-image">
                        <figure><img src="../Login/images/signin-image.jpg" alt="sing up image"></figure>
                        <a href="#signUp" class="signup-image-link">Don't have an account?</a>
                    </div>

                    <div class="signin-form">
                        <h2 class="form-title">Log in</h2>
                        <form method="POST" class="register-form" id="login-form" action="./userLoginAction.jsp">
                            <div class="form-group">
                                <label for="your_name"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                <input type="text" name="userID" id="your_name" placeholder="Your ID"/>
                            </div>
                            <div class="form-group">
                                <label for="your_pass"><i class="zmdi zmdi-lock"></i></label>
                                <input type="password" name="userPassword" id="your_pass" placeholder="Your Password"/>
                            </div>
                            <div class="form-group form-button">
                                <input type="submit" name="signin" id="signin" class="form-submit" value="Log in"/>
                            </div>
                        </form>
                      
                    </div>
                </div>
            </div>
        </section>
		<br>
		<br>
		<br>
		
		<!-- Sign up form -->
        <section class="signup" id="signUp">
            <div class="container">
                <div class="signup-content">
                    <div class="signup-form">
                        <h2 class="form-title">Sign up</h2>
                        <form method="POST" class="register-form" id="register-form" action="./userSignupAction.jsp">
                            <div class="form-group">
                                <label for="name"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                <input type="text" name="userID" id="name" placeholder="Your ID"/>
                            </div>
                            <div class="form-group">
                                <label for="pass"><i class="zmdi zmdi-lock"></i></label>
                                <input type="password" name="userPassword" id="pass" placeholder="Your Password"/>
                            </div>
                            <div class="form-group">
                                <label for="email"><i class="zmdi zmdi-email"></i></label>
                                <input type="email" name="userEmail" id="email" placeholder="Your Email"/>
                            </div>
                            <div class="form-group form-button">
                                <input type="submit" name="signup" id="signup" class="form-submit" value="Register"/>
                            </div>
                        </form>
                    </div>
                    <div class="signup-image">
                        <figure><img src="../Login/images/signup-image.jpg" alt="sign up image"></figure>
                        <a href="#logIn" class="signup-image-link">I have an account!</a>
                    </div>
                </div>
            </div>
                        	</div>
            
        </section>   
		<footer class="mdl-mini-footer">
				<div class="footer-container">
						Feedback to Dev - davidjuhyung@gmail.com - Illustrations by Colorlib
				</div>
		</footer>

		</main>
		

	<script src="https://code.getmdl.io/1.3.0/material.min.js"></script>
	 <script src="../Login/vendor/jquery/jquery.min.js"></script>
    <script src="../Login/js/main.js"></script>
</body>
</html>