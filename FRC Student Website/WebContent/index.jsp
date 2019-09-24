<!doctype html>
<!--
  Material Design Lite
  Copyright 2015 Google Inc. All rights reserved.

  Licensed under the Apache License, Version 2.0 (the "License");
  you may not use this file except in compliance with the License.
  You may obtain a copy of the License at

      https://www.apache.org/licenses/LICENSE-2.0

  Unless required by applicable law or agreed to in writing, software
  distributed under the License is distributed on an "AS IS" BASIS,
  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  See the License for the specific language governing permissions and
  limitations under the License
-->
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device=width, initial-scale=1, shrink-to-fit-no">
    <title>FRC Student Website</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:regular,bold,italic,thin,light,bolditalic,black,medium&amp;lang=en">
    <link rel="stylesheet" href="https://code.getmdl.io/1.3.0/material.grey-pink.min.css" />
    <link rel="stylesheet" href="./css/custom.css" />
    <link rel="stylesheet" href="./css/bootstrap.min.css" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.2.0/css/all.css" integrity="sha384-hWVjflwFxL6sNzntih27bfxkr27PmbbK/iSvJ+a4+0owXq79v+lsFkW54bOGbiDQ"
	crossorigin="anonymous">
	<link href='https://fonts.googleapis.com/css?family=Abel' rel='stylesheet'>
	
</head>

<body>

<%
	String userID = null;
	
	if (session.getAttribute("userID") != null) {
	
		userID = (String) session.getAttribute("userID");
	
	}
%>
    <div class="mdl-layout mdl-js-layout mdl-layout--fixed-header">
        <header class="mdl-layout__header mdl-layout__header--waterfall portfolio-header">
            <div class="mdl-layout__header-row portfolio-logo-row">
                <span class="mdl-layout__title">
                    <a href="index.jsp"><div class="portfolio-logo"></div></a>
                    <a href="index.jsp"><span class="mdl-layout__title" style="color:grey;">FRC Student Website</span></a>
                </span>
            </div>
            <div class="mdl-layout__header-row portfolio-navigation-row mdl-layout--large-screen-only">
                <nav class="mdl-navigation mdl-typography--body-1-force-preferred-font">
                    <a class="mdl-navigation__link is-active" href="index.jsp">Main</a>
                    <a class="mdl-navigation__link" disabled>Forum</a>
                    <a class="mdl-navigation__link" href="./courseEv/index.jsp">Course Evaluation</a>
                    <a class="mdl-navigation__link" disabled>Online Tutoring</a>
<%
						if (userID == null) {
%>
						<a class="mdl-navigation__link" href="./courseEv/userLogin.jsp">Log In/Sign Up</a>
<%
						} else {
%>
						<a class="mdl-navigation__link" href="./courseEv/userLogout.jsp">Log Out</a>
<%
						}
%>
                </nav>
            </div>
        </header>
        <div class="mdl-layout__drawer mdl-layout--small-screen-only">
            <nav class="mdl-navigation mdl-typography--body-1-force-preferred-font">
                <a class="mdl-navigation__link is-active" href="index.jsp">Main</a>
                <a class="mdl-navigation__link" disabled>Forum</a>
                <a class="mdl-navigation__link" href="./courseEv/index.jsp">Course Evaluation</a>
                <a class="mdl-navigation__link" disabled>Online Tutoring</a>
<%
						if (userID == null) {
%>
						<a class="mdl-navigation__link" href="./courseEv/userLogin.jsp">Log In/Sign Up</a>
<%
						} else {
%>
						<a class="mdl-navigation__link" href="./courseEv/userLogout.jsp">Log Out</a>
<%
						}

%>
            </nav>
        </div>
        <main class="mdl-layout__content">
        
        <div class="container">
        	<div class="jumbotron">
        		<h1 class="text-center">Welcome to FRC Student Website</h1>
        		<p class ="text-center">This website was created to help the students to express their voices and opinions about their school. More features will be added soon.</p>
        		<p class = "text-center"><a class="btn btn-outline-success waves-effects py-2 mx-1" href="https://www.pembinatrails.ca/schools/fortrichmond/Pages/default.aspx" role="button" target="_blank">FRC School Website</a></p>
        	</div>
        </div>
        
            <div class="mdl-grid portfolio-max-width">
                <div class="mdl-cell mdl-card mdl-shadow--4dp portfolio-card">
                    <div class="mdl-card__media">
                        <img style =" min-height:237px;" class="article-image" src=" images/onlineTutoring.jpg" border="0" alt="">
                    </div>
                    <div class="mdl-card__title">
                        <h2 class="mdl-card__title-text">Online Peer Tutoring</h2>
                    </div>
                    <div class="mdl-card__supporting-text">
                        Through the customized live chat and online whiteboard, you can get free peer tutoring before school, after school, and even in weekends!
                    </div>
                    <div class="mdl-card__actions mdl-card--border">
                        <a class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect mdl-button--accent" disabled>Learn more</a>
                    </div>
                </div>
                <div class="mdl-cell mdl-card mdl-shadow--4dp portfolio-card">
                    <div class="mdl-card__media">
                        <img style =" min-height:237px;" class="article-image" src=" images/schoolForum.jpg" border="0" alt="">
                    </div>
                    <div class="mdl-card__title">
                        <h2 class="mdl-card__title-text">School Forum</h2>
                    </div>
                    <div class="mdl-card__supporting-text">
                        This is where you get to speak about your opinions about our school. What are some areas you think our school can be improved on?
                    </div>
                    <div class="mdl-card__actions mdl-card--border">
                        <a class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect mdl-button--accent" disabled>Learn more</a>
                    </div>
                </div>
                <div class="mdl-cell mdl-card mdl-shadow--4dp portfolio-card">
                    <div class="mdl-card__media">
                        <img style =" min-height:237px;"class="article-image" src="images/courseEv.jpg" border="0" alt="">
                    </div>
                    <div class="mdl-card__title">
                        <h2 class="mdl-card__title-text">Course Evaluation</h2>
                    </div>
                    <div class="mdl-card__supporting-text">
                       Course evaluation allows students to evaluate their courses, share their honest experiences, and give advice for future students!
                    </div>
                    <div class="mdl-card__actions mdl-card--border">
                        <a class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect mdl-button--accent" href="./courseEv/index.jsp">Learn more</a>
                    </div>
                </div>
               </div>
        </main>
		<footer class="bg-dark mt-4 p-5 text-center" style="color: #FFFFFF;">
		Copyright &copy; 2018 David Kim All Rights Reserved. </footer>
    </div>
    <script src="https://code.getmdl.io/1.3.0/material.min.js"></script>
</body>
</html>