<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@page import="user.UserDAO"%>

<%@page import="evaluation.EvaluationDAO"%>

<%@page import="likey.LikeyDTO"%>

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
	
	String evaluationID = null;
		
	if(request.getParameter("evaluationID") != null){
		
		evaluationID = request.getParameter("evaluationID");
	}
	
	EvaluationDAO evaluationDAO = new EvaluationDAO();
	
	if(userID.equals(evaluationDAO.getUserID(evaluationID)) || userID.equals("damndavid")){
		
		int result = new EvaluationDAO().delete(evaluationID);
		
		if(result == 1){

			PrintWriter script = response.getWriter();

			script.println("<script>");

			script.println("alert('You successfully deleted your review.');");

			script.println("location.href = 'index.jsp'");

			script.println("</script>");

			script.close();

			return;
			
		} else {
			
			PrintWriter script = response.getWriter();

			script.println("<script>");

			script.println("alert('Database Error Occured.');");

			script.println("history.back();");

			script.println("</script>");

			script.close();

			return;
		}
		
	} else {
		
		PrintWriter script = response.getWriter();

		script.println("<script>");
		
		script.println("alert('Sorry, but you can only delete your own reviews');");

		script.println("location.href = 'index.jsp'");

		script.println("</script>");

		script.close();

		return;
	}
	
%>