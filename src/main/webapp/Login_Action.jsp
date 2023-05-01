<%@page import="java.util.Vector"%>
<%@page import="com.data.Data_logics"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Student Login</title>
</head>
<body>
<%
	String regno=request.getParameter("rn");
	String password=request.getParameter("pass");
	
	Data_logics s=new Data_logics();
	
	Vector v=s.login_logics();
	
	if(v.contains(regno) && v.contains(password))
	{
	pageContext.setAttribute("regno", regno, pageContext.SESSION_SCOPE);
	pageContext.setAttribute("password", password, pageContext.SESSION_SCOPE);
	RequestDispatcher rd=request.getRequestDispatcher("FetchAction.jsp");
	rd.forward(request, response);
	}
	else
	{
		out.println("<html>");
		out.println("<center>");
		out.println("<h1 style='color:red;'>Invalid Username or Password</h1>");
		RequestDispatcher rd=request.getRequestDispatcher("Login.jsp");
		rd.include(request, response);
		out.println("</center>");
		out.println("</html>");
	}
%>
</body>
</html>