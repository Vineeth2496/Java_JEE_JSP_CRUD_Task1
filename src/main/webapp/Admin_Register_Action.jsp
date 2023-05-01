<%@page import="com.data.Data_logics"%>
<%@page import="com.data.Data"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
	String firstname=request.getParameter("fn");
	String lastname=request.getParameter("ln");
	String email=request.getParameter("em");
	String regno=request.getParameter("rn");
	String password=request.getParameter("pa");
	
	Data d=new Data();
	d.setFirstname(firstname);
	d.setLastname(lastname);
	d.setEmail(email);
	d.setRegno(regno);
	d.setPassword(password);
	
	Data_logics s=new Data_logics();
	int i=s.admin_register(d);
	out.println("<html>");
	out.println("<center><h1>");
	out.println("Admin Registered Sucessfully</br>");
	out.println("Registernation Number	:"+regno+"</br>");
	out.println("Password				:"+password+"</br>");
	out.println("</h1></center>");
	out.println("</html>");
	
	
	

%>
</body>
</html>