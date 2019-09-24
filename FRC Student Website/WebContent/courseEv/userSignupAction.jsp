<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="user.UserDTO"%>

<%@ page import="user.UserDAO"%>

<%@ page import="util.SHA256"%>

<%@ page import="java.io.PrintWriter"%>

<%

	request.setCharacterEncoding("UTF-8");
	
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

	String userPassword = null;

	String userEmail = null;

	if(request.getParameter("userID") != null) {

		userID = (String) request.getParameter("userID");

	}

	if(request.getParameter("userPassword") != null) {

		userPassword = (String) request.getParameter("userPassword");

	}

	if(request.getParameter("userEmail") != null) {

		userEmail = (String) request.getParameter("userEmail");

	}

	if (userID == null || userPassword == null || userEmail == null ||
		userID == "" || userPassword == "" || userEmail == "") {

		PrintWriter script = response.getWriter();

		script.println("<script>");

		script.println("alert('fill them correctly.');");

		script.println("history.back();");

		script.println("</script>");

		script.close();

	} else {

		UserDAO userDAO = new UserDAO();
		
		int result = userDAO.signUp(new UserDTO(userID, userPassword, userEmail, SHA256.getSHA256(userEmail), false));

		if (result == -1) {

			PrintWriter script = response.getWriter();

			script.println("<script>");

			script.println("alert('ID already in use');");

			script.println("history.back();");

			script.println("</script>");

			script.close();

		} else {

			session.setAttribute("userID", userID);

			PrintWriter script = response.getWriter();

			script.println("<script>");

			script.println("location.href = 'emailSendAction.jsp';");

			script.println("</script>");

			script.close();

		}

	}

%>