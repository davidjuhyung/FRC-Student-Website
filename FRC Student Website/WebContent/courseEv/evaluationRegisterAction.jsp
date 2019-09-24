<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="evaluation.EvaluationDTO"%>

<%@ page import="evaluation.EvaluationDAO"%>

<%@ page import="util.SHA256"%>

<%@ page import="java.io.PrintWriter"%>

<%

	request.setCharacterEncoding("UTF-8");
	
	String userID = null;
	
	if (session.getAttribute("userID") != null) {
		
		userID = (String) session.getAttribute("userID");
		
	}	
	
	if (userID == null) {
		
		PrintWriter script = response.getWriter();
	
		script.println("<script>");
		
		script.println("alert('You need to log in first.');");
	
		script.println("location.href='userLogin.jsp';");
	
		script.println("</script>");
	
		script.close();
		
		return;
	}
	
	
	String courseName = null;

	String teacherName = null;

	int courseYear = 0;

	String semesterDivide = null;

	String gradeDivide = null;

	String evaluationTitle = null;

	String evaluationContent = null;

	String totalScore = null;

	String useful = null;

	String interesting = null;

	String easy = null;
	

	if(request.getParameter("courseName") != null) {

		courseName = (String) request.getParameter("courseName");

	}

	if(request.getParameter("teacherName") != null) {

		teacherName = (String) request.getParameter("teacherName");

	}

	if(request.getParameter("courseYear") != null) {

		try {
			courseYear = Integer.parseInt( request.getParameter("courseYear") );
		} catch (Exception e) {
			System.out.println("Course Year Data Error.");
		}

	}
	
	if(request.getParameter("semesterDivide") != null) {

		semesterDivide = (String) request.getParameter("semesterDivide");

	}
	
	if(request.getParameter("gradeDivide") != null) {

		gradeDivide = (String) request.getParameter("gradeDivide");

	}
	
	if(request.getParameter("evaluationTitle") != null) {

		evaluationTitle = (String) request.getParameter("evaluationTitle");

	}	
	
	if(request.getParameter("evaluationContent") != null) {

		evaluationContent = (String) request.getParameter("evaluationContent");

	}	
	
	if(request.getParameter("totalScore") != null) {

		totalScore = (String) request.getParameter("totalScore");

	}
	
	if(request.getParameter("useful") != null) {

		useful = (String) request.getParameter("useful");

	}
	
	if(request.getParameter("interesting") != null) {

		interesting = (String) request.getParameter("interesting");

	}
	
	if(request.getParameter("easy") != null) {

		easy = (String) request.getParameter("easy");

	}

	if (courseName == null || teacherName == null || courseYear == 0 || semesterDivide == null ||

		gradeDivide == null || evaluationTitle == null || evaluationContent == null || totalScore == null ||

		interesting == null || useful == null || easy == null ||

		evaluationTitle.equals("") || evaluationContent.equals("") || courseName.equals("") ) {

		PrintWriter script = response.getWriter();

		script.println("<script>");

		script.println("alert('Fill them correctly.');");

		script.println("history.back();");

		script.println("</script>");

		script.close();
		
		return;

	}  
		EvaluationDAO evaluationDAO = new EvaluationDAO();

		int result = evaluationDAO.write(new EvaluationDTO(0, userID, courseName, teacherName, courseYear, semesterDivide, gradeDivide, evaluationTitle,
				evaluationContent, totalScore, useful, interesting, easy, 0));

		if (result == -1) {

			PrintWriter script = response.getWriter();

			script.println("<script>");

			script.println("alert('Failed to write the review.');");

			script.println("history.back();");

			script.println("</script>");

			script.close();

		} else {

			session.setAttribute("userID", userID);

			PrintWriter script = response.getWriter();

			script.println("<script>");

			script.println("location.href = 'index.jsp';");

			script.println("</script>");

			script.close();
			
			return;

		}


%>