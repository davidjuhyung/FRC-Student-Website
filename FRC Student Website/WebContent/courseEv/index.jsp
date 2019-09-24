<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.net.URLEncoder"%>
<%@ page import="user.UserDAO"%>
<%@ page import="evaluation.EvaluationDAO"%>
<%@ page import="evaluation.EvaluationDTO"%>



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
	    	<link href="../css/MDBcss/mdb.min.css" rel="stylesheet">
  	<!-- Your custom styles (optional) -->
  	<link href="../css/MDBscss/style.css" rel="stylesheet">

</head>
<body>

<%	
		String gradeDivide = "All";
	
		String searchType = "Newest";
		
		String search = "";
		
		int pageNumber = 0;

		if(request.getParameter("gradeDivide") != null) {

			gradeDivide = request.getParameter("gradeDivide");

		}

		if(request.getParameter("searchType") != null) {

			searchType = request.getParameter("searchType");

		}

		if(request.getParameter("search") != null) {

			search = request.getParameter("search");

		}
		
		if(request.getParameter("pageNumber") != null) {

			try {

				pageNumber = Integer.parseInt(request.getParameter("pageNumber"));

			} catch (Exception e) {

				System.out.println("Page Number Error.");

			}

		}


		String userID = null;

		if (session.getAttribute("userID") != null) {

			userID = (String) session.getAttribute("userID");

		}

		 if (userID == null) {

			PrintWriter script = response.getWriter();

			script.println("<script>");

			script.println("alert('You need to have an account to access this feature.');");

			script.println("location.href='userLogin.jsp';");

			script.println("</script>");

			script.close();

		}

		boolean emailChecked = new UserDAO().getUserEmailChecked(userID);

		if (emailChecked == false) {

			PrintWriter script = response.getWriter();

			script.println("<script>");

			script.println("location.href='emailSendConfirm.jsp';");

			script.println("</script>");

			script.close();

			return;
		}
%>




<div class="mdl-layout mdl-js-layout mdl-layout--fixed-header">

    <!--  Header -->
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
	            <a class="mdl-navigation__link is-active" href="index.jsp">Course Evaluation</a>
	            <a class="mdl-navigation__link" disabled>Online Tutoring</a>
				<%
				if (userID == null) {
				%>
				<a class="mdl-navigation__link" href="userLogin.jsp">Log In/Sign Up</a>
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
	
	<!-- For Small Screen -->
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
	
	<!-- Main Component -->
    <main class="mdl-layout__content">  	
		<section class="container">
			<form method="get" action="./index.jsp" class="form-inline mt-4">
				<select name="gradeDivide" class="form-control custom-select mx-1">
					<option value="All">All</option>
					<option value="Grade 12" <% if(gradeDivide.equals("Grade 12")) out.println("selected");%> >Grade 12</option>
					<option value="Grade 11" <% if(gradeDivide.equals("Grade 11")) out.println("selected");%> >Grade 11</option>
					<option value="Grade 10" <% if(gradeDivide.equals("Grade 10")) out.println("selected");%> >Grade 10</option>
				</select>
				<select name="searchType" class="form-control custom-select mx-1">
					<option value="Newest">Newest</option>
					<option value="Most Useful" <% if(searchType.equals("Most Useful")) out.println("selected");%> >Most Useful</option>
				</select>
				<input type="text" name="search" class="form-control py-2 mx-1" placeholder="Enter your course">
				<button type="submit" class="btn btn-outline-success waves-effects py-2 mx-1">Search</button>
				<a data-toggle="modal" href="#reportModal"><i class="material-icons" style="font-size:40px; color: red;">flag</i></a>
			</form>	
			<%
				ArrayList<EvaluationDTO> evaluationList = new ArrayList<EvaluationDTO>();
				evaluationList = new EvaluationDAO().getList(gradeDivide, searchType, search, pageNumber);			
				if(evaluationList != null)		
					for(int i = 0; i < evaluationList.size(); i++) {		
						if(i == 5) break;			
						EvaluationDTO evaluation = evaluationList.get(i);		
			%>
			<div class="card grey lighten-5 mt-4  z-depth-5 border-light">
				<div class="card-header grey lighten-5">
					<div class="row">
						<div class="col-8 text-left">
							<%=evaluation.getCourseName()%>&nbsp;<small><%=evaluation.getTeacherName()%></small>
						</div>
						<div class="col-4 text-right">
							TOTAL SCORE <span style="color: red;"><%=evaluation.getTotalScore()%></span>
						</div>
					</div>
				</div>
				<div class="card-body">
					<h5 class="card-title font-weight-bold">
						<%=evaluation.getEvaluationTitle()%>&nbsp;<small>(<%=evaluation.getCourseYear()%>, semester <%=evaluation.getSemesterDivide()%>)</small>
					</h5>
					<p class="card-text text-dark"><%=evaluation.getEvaluationContent()%></p>
					<div class="row">
						<div class="col-9 text-left">
							EASY <span style="color: red;"><%=evaluation.getEasy()%></span>
							INTERESTING <span style="color: red;"><%=evaluation.getInteresting()%></span> 
							USEFUL <span style="color: red;"><%=evaluation.getUseful()%></span>
							<span style="color: green;">(<%=evaluation.getLikeCount()%> people found this useful)</span>
						</div>
						<div class="col-3 text-right">
							<a href="./likeAction.jsp?evaluationID=<%= evaluation.getEvaluationID() %>"> <i class="far fa-thumbs-up"></i> Useful </a>
							<a onclick="return confirm('Do you really want to delete this review?')" href="./deleteAction.jsp?evaluationID=<%= evaluation.getEvaluationID() %>">Delete</a>
						</div>
					</div>
				</div>
			</div>
			<%
				}
			%>
		</section>
		
		<!-- Page -->
		<ul class="pagination justify-content-center mt-3">
	    	<li class="page-item">
			<%
				if(pageNumber <= 0) {
			%>     
			        <a class="page-link disabled">Previous</a>
			<%
				} else {
			%>
					<a class="page-link" href="./index.jsp?gradeDivide=<%=URLEncoder.encode(gradeDivide) %>&searchType=
					<%=URLEncoder.encode(searchType)%>&search=<%=URLEncoder.encode(search)%>&pageNumber=
					<%=pageNumber - 1%>">Previous</a>
			<%
				}
			%>
			</li>
			<li>
			<%
				if(evaluationList.size() < 6) {
			%>     
			        <a class="page-link disabled">Next</a>
			<%
				} else {
			%>
					<a class="page-link" href="./index.jsp?gradeDivide=<%=URLEncoder.encode(gradeDivide)%>&searchType=
					<%=URLEncoder.encode(searchType)%>&search=<%=URLEncoder.encode(search)%>&pageNumber=
					<%=pageNumber + 1%>">Next</a>
			<%
				}
			%>
	      </li>
	    </ul>
    </main>
	<div class="modal fade" id="registerModal" tabindex="-1" role="dialog" aria-labelledby="modal" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="modal">Write Your Own Review</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form action="./evaluationRegisterAction.jsp" method="post">
						<div class="form-row">
							<div class="form-group col-sm-6">
								<label>Course</label> <input type="text" name="courseName" class="form-control" maxlength="20">
							</div>
							<div class="form-group col-sm-6">
								<label>Teacher</label> <input type="text" name="teacherName" class="form-control" maxlength="20" placeholder="(optional)">
							</div>
						</div>
						<div class="form-row">
								<div class="form-group col-sm-4">
									<label>Year</label> 
									<select name="courseYear" class="form-control">
									<option value="2017">2017</option>
									<option value="2018" selected>2018</option>
									<option value="2019">2019</option>
									<option value="2020">2020</option>
									<option value="2021">2021</option>
									<option value="2022">2022</option>
									<option value="2023">2023</option>
									<option value="2024">2024</option>
									</select>
								</div>
								<div class="form-group col-sm-4">
									<label>Semester</label>
									<select name="semesterDivide" class="form-control">
										<option value="1" selected>1</option>
										<option value="2">2</option>
									</select>
								</div>
								<div class="form-group col-sm-4">
									<label>Grade</label> 
									<select name="gradeDivide" class="form-control">
										<option value="Grade 10" selected>Grade 10</option>
										<option value="Grade 11">Grade 11</option>
										<option value="Grade 12">Grade 12</option>
									</select>
								</div>
						</div>
						<div class="form-group">
							<label>Review Title</label> <input type="text" name="evaluationTitle" class="form-control" maxlength="40">
						</div>
						<div class="form-group">
							<label>Your Review</label>
							<textarea name="evaluationContent" class="form-control" maxlength="2048" style="height: 180px;"></textarea>
						</div>
						<div class="form-row">
							<div class="form-group col-sm-3">
								<label>Easy</label> 
								<select name="easy" class="form-control">
									<option value="5" selected>5</option>
									<option value="4">4</option>
									<option value="3">3</option>
									<option value="2">2</option>
									<option value="1">1</option>
								</select>
							</div>
							<div class="form-group col-sm-3">
								<label>Interesting</label> 
								<select name="interesting" class="form-control">
									<option value="5" selected>5</option>
									<option value="4">4</option>
									<option value="3">3</option>
									<option value="2">2</option>
									<option value="1">1</option>
								</select>
							</div>
							<div class="form-group col-sm-3">
								<label>Useful</label> 
								<select name="useful" class="form-control">
									<option value="5" selected>5</option>
									<option value="4">4</option>
									<option value="3">3</option>
									<option value="2">2</option>
									<option value="1">1</option>
								</select>
							</div>
							<div class="form-group col-sm-3">
								<label>Total Score</label>
								<select name="totalScore" class="form-control">
									<option value="5" selected>5</option>
									<option value="4">4</option>
									<option value="3">3</option>
									<option value="2">2</option>
									<option value="1">1</option>
								</select>
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-danger" data-dismiss="modal">Cancel</button>
							<button type="submit" class="btn btn-primary">Submit</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="reportModsal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header text-center">
                <h4 class="modal-title w-100 font-weight-bold">Write to us</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body mx-3">
                <div class="md-form mb-5">
                    <i class="fa fa-tag prefix grey-text"></i>
                    <input type="text" id="form34" class="form-control validate">
                    <label data-error="wrong" data-success="right" for="form34">Title of the review you want to report</label>
                </div>

                <div class="md-form">
                    <i class="fa fa-pencil prefix grey-text"></i>
                    <textarea type="text" id="form8" class="md-textarea form-control" rows="4"></textarea>
                    <label data-error="wrong" data-success="right" for="form8">Reason for why reporting</label>
                </div>

            </div>
            <div class="modal-footer d-flex justify-content-center">
                <button class="btn btn-unique">Send <i class="fa fa-paper-plane-o ml-1"></i></button>
            </div>
        </div>
    </div>
</div>

	<div class="modal fade" id="reportModal" tabindex="-1" role="dialog"
		aria-labelledby="modal" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title font-weight-bold" id="modal">Report a Review</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form action="./reportAction.jsp" method="post">
						<div class="form-group">
							<label><i class= "fa fa-tag prefix grey-text"></i> Title of the review you want to report</label> 
							<input type="text" name="reportTitle" class="form-control" maxlength="50">
						</div>
						<div class="form-group">
							<label><i class= "fa fa-tag prefix grey-text"></i> Reason for reporting</label>
							<textarea name="reportContent" class="form-control" maxlength="2048" style="height: 180px;"></textarea>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
							<button type="submit" class="btn btn-danger">Report</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- Central Modal Warning Demo-->
	<div class="modal fade" id="ruleModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	    <div class="modal-dialog modal-notify modal-warning modal-center" role="document">
	        <!--Content-->
	        <div class="modal-content">
	            <!--Header-->
	            <div class="modal-header">
	               <h4 class="modal-title w-100" id="myModalLabel">Welcome to FRC's Course Evaluation Page</h4>
	            </div>
	            <!--Body-->
	            <div class="modal-body mx-2">
	                <div class="row">
                        <p class="font-weight-bold">Your HONEST reviews are needed!</p>
                        <p>Share your experience and advice with others for them to succeed in the course! Please be respectful and considerate when writing reviews.</p>
						<p>Your account will be automatically suspended/terminated in cases of you intentionally:</p>						
						<ol class="form-control">
						  <ul>a. abuse</ul>
						  <ul>b. target a specific teacher with negative reviews</ul>
						  <ul>c. write wrong information</ul>
						</ol>
						<p>You can write as many reviews as you want as long as you follow these rules. Enjoy!!</p>
	                </div>
	            </div>
	            <!--Footer-->
	            <div class="modal-footer justify-content-center">
	                <button type="button" class="btn btn-outline-primary waves-effect" data-dismiss="modal">Ok, I got it</button>
	            </div>
	        </div>
	        <!--/.Content-->
	    </div>
	</div>
	<a data-toggle="modal" href="#registerModal" id="contact-button" class="mdl-button mdl-button--fab mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-color--accent mdl-color-text--accent-contrast mdl-shadow--4dp">
	<i class="material-icons">assignment</i></a>
	
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
	<script type="text/javascript">
		$(document).ready(function() {
			if (sessionStorage.getItem('#ruleModal') !== 'true') {
				$("#ruleModal").modal('show');
				sessionStorage.setItem('#ruleModal', 'true');
			}
		})
	</script>
</body>
</html>