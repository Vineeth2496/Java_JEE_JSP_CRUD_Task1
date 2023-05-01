<%@page import="java.util.Iterator"%>
<%@page import="java.util.Vector"%>
<%@page import="com.data.Data"%>
<%@page import="com.data.Data_logics"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin's Profile</title>
</head>
<body>
<%
	String regno=(String)pageContext.getAttribute("regno", pageContext.SESSION_SCOPE);
	String password=(String)pageContext.getAttribute("password", pageContext.SESSION_SCOPE );
	out.println("<center><h1>WELCOME TO YOUR PROFILE</h1></center></br></br>");
	Data d=new Data();
	d.setRegno(regno);
	d.setPassword(password);
	
	Data_logics s=new Data_logics();
	Vector v=s.profile_logics(d);
	Iterator ii=v.iterator();
	
	out.println("<html>");
	out.println("<body>");
	out.println("<center>");
	
	out.print("<table border=3>");
	out.print("<tr>");
	out.print("<th>"+"First Name"+"</th>");
	out.print("<th>"+"Last Name"+"</th>");
	out.print("<th>"+"Email"+"</th>");
	out.print("<th>"+"Registeration No"+"</th>");
	out.print("<th>"+"Password"+"</th>");
	out.print("<th>"+"Stdcode"+"</th>");
	out.print("<th>"+"Phone No"+"</th>");
	out.print("<th>"+"Gender"+"</th>");
	out.print("<th>"+"Edit"+"</th>");
	out.print("<th>"+"Delete"+"</th>");
	out.print("</tr>");
	out.print("<tr>");
	
	for(;ii.hasNext();)
		{
		Data d1=(Data) ii.next();

		
		out.print("<td>"+ d1.getFirstname()+"</td>");
		out.print("<td>"+ d1.getLastname()+"</td>");
		out.print("<td>"+ d1.getEmail()+"</td>");
		out.print("<td>"+ d1.getRegno()+"</td>");
		out.print("<td>"+ d1.getPassword()+"</td>");
		out.print("<td>"+ d1.getStdcode()+"</td>");
		out.print("<td>"+ d1.getPhoneno()+"</td>");
		out.print("<td>"+ d1.getGender()+"</td>");
		
		out.print("<td>"+"<a href='Edit_return.jsp?regno="+ d1.getRegno()+"'>Edit</a>"+"</td>");
		out.print("<td>"+"<a href='Delete.jsp?regno="+d1.getRegno()+"'>Delete</a>"+"</td>");

		}
	out.print("</tr>");
	out.print("</table>");
	
	out.println("<font style='color: green;'><a href='StudentEnd.jsp'>Logout</a></font>");
	out.println("</center>");
	out.println("</body>");
	out.println("</html>");
	
%>
</body>
</html>