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
	
	String reportTitle = null;
	
	String reportContent = null;
	
	if(request.getParameter("reportTitle") != null){
		reportTitle = request.getParameter("reportTitle");
	}
	
	if(request.getParameter("reportContent") != null){
		reportContent = request.getParameter("reportContent");
	}
	
	if(reportTitle == null || reportContent == null ||
	   reportTitle.equals("") || reportContent.equals("")){
		
		PrintWriter script = response.getWriter();

		script.println("<script>");

		script.println("alert('Fill them correctly.');");

		script.println("history.back();");

		script.println("</script>");

		script.close();		

		return;
	}
	

	// 사용자에게 보낼 메시지를 기입합니다.

	String host = "http://frcstudent.atl.jelastic.vps-host.net/courseEv/";

	String to = "frcstudentofficial@gmail.com";

	String from = userDAO.getUserEmail(userID);

	String subject = "A reported review in FRC Course Evaluation";

	String content = "Reporter: " + userID +
					 "<br>Title: " + reportTitle +
					 "<br>Details: " + reportContent;


	

	// SMTP에 접속하기 위한 정보를 기입합니다.

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

		script.println("alert('오류가 발생했습니다..');");

		script.println("history.back();");

		script.println("</script>");

		script.close();		

	    return;

	}

	PrintWriter script = response.getWriter();

	script.println("<script>");

	script.println("alert('Thank you for reporting. We will take a look at the review.');");

	script.println("history.back();");

	script.println("</script>");

	script.close();		

    return;
%>