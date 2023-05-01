<%@page import="com.data.Data_logics"%>
<%@page import="com.data.Data"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Delete Profile</title>
</head>
<body>
<%
	String regno=request.getParameter("regno");

	Data d=new Data();
	d.setRegno(regno);

	Data_logics l=new Data_logics();
	int r=l.Admin_Delete_logics(d);

	out.println("<html><center><h1><font color='green'>Profile is Deleted = "+ r+"</font></h1></center></html>");

%>
</body>
</html>