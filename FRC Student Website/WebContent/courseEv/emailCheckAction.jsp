<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="user.UserDAO"%>

<%@ page import="util.SHA256"%>

<%@ page import="java.io.PrintWriter"%>

<%
	request.setCharacterEncoding("UTF-8");

	String code = "";
	if (request.getParameter("code") != "") {

		code = request.getParameter("code");

	}

	UserDAO userDAO = new UserDAO();

	String userID = "";

	if (session.getAttribute("userID") != "") {
		userID = (String) session.getAttribute("userID");
	}

	if (userID == "") {

		PrintWriter script = response.getWriter();

		script.println("<script>");

		script.println("alert('Please log in.');");

		script.println("location.href='userLogin.jsp'");

		script.println("</script>");

		script.close();

		return;
	} else {

		String userEmail = userDAO.getUserEmail(userID);

		boolean isRight = (new SHA256().getSHA256(userEmail).equals(code)) ? true : false;

		if (isRight == true) {

			userDAO.setUserEmailChecked(userID);

			PrintWriter script = response.getWriter();

			script.println("<script>");

			script.println("alert('You have successfully verifed your account!');");

			script.println("location.href='../index.jsp'");

			script.println("</script>");

			script.close();

		} else {

			PrintWriter script = response.getWriter();

			script.println("<script>");

			script.println("alert('The code is not valid.');");

			script.println("location.href='index.jsp'");

			script.println("</script>");

			script.close();

		}
	}
%>