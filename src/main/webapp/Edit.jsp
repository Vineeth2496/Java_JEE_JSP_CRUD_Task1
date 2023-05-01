<%@page import="com.data.Data"%>
<%@page import="com.data.Data_logics"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Profile</title>
</head>
<body>
<%
	String Firstname=request.getParameter("fn");
	String Lastname=request.getParameter("ln");
	String Email=request.getParameter("em");
	String Regno=request.getParameter("regno");
	String Password=request.getParameter("pass");
	String Stdcode=request.getParameter("std");
	String Phoneno=request.getParameter("ph");
	String Gender=request.getParameter("gm");
	
	Data d=new Data();
	d.setFirstname(Firstname);
	d.setLastname(Lastname);
	d.setEmail(Email);
	d.setRegno(Regno);
	d.setPassword(Password);
	d.setStdcode(Stdcode);
	d.setPhoneno(Phoneno);
	d.setGender(Gender);
	
	Data_logics l=new Data_logics();
	int r=l.Edit_logics(d);
	
	out.println("<html><center><h1><font color='green'>Record Updated = "+ r+"</font></h1></center></html>");

%>

</body>
</html>