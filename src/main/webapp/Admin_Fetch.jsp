<%@page import="java.util.List"%>
<%@page import="oracle.net.aso.a"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.Vector"%>
<%@page import="com.data.Data_logics"%>
<%@page import="com.data.Data"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin's Profile</title>
</head>
<body>
<%
	String regno=(String) pageContext.getAttribute("regno", pageContext.SESSION_SCOPE);
	String password=(String) pageContext.getAttribute("password", pageContext.SESSION_SCOPE);
	
	out.println("<center><h1>WELCOME TO ADMIN LOGIN PROFILE</h1></center></br></br>");
	
	//	Data d=new Data();
	//	d.setRegno(regno);
	//	d.setPassword(password);
	
	//	Data_logics s=new Data_logics();
	
	List<Data> list =Data_logics.fetchAll();
	
	//	Iterator ii=v.iterator();
		
	out.println("<html>");
	out.println("<body>");
	out.println("<center>");
	out.print("<table border=3>");
	out.print("<div>");
	out.print("<tr>");
	out.print("<th>"+"First Name"+"</th>");
	out.print("<th>"+"Last Name"+"</th>");
	out.print("<th>"+"Email"+"</th>");
	out.print("<th>"+"Registeration No"+"</th>");
	out.print("<th>"+"Password"+"</th>");
	out.print("<th>"+"Stdcode"+"</th>");
	out.print("<th>"+"Phone No"+"</th>");
	out.print("<th>"+"Gender"+"</th>");
	out.print("<th>"+"Edit Student Details"+"</th>");
	out.print("<th>"+"Delete Profile"+"</th>");
	out.print("</tr>");
	
		for(Data d1 : list)
		{
			out.print("<tr>");
			out.print("<td>"+ d1.getFirstname()+"</td>");
			out.print("<td>"+ d1.getLastname()+"</td>");
			out.print("<td>"+ d1.getEmail()+"</td>");
			out.print("<td>"+ d1.getRegno()+"</td>");
			out.print("<td>"+ d1.getPassword()+"</td>");
			out.print("<td>"+ d1.getStdcode()+"</td>");
			out.print("<td>"+ d1.getPhoneno()+"</td>");
			out.print("<td>"+ d1.getGender()+"</td>");
			
			out.print("<td>"+"<a href='Admin_Edit_return.jsp?regno="+ d1.getRegno()+"'>Edit</a>"+"</td>");
			out.print("<td>"+"<a href='Admin_Delete.jsp?regno="+d1.getRegno()+"'>Delete</a>"+"</td>");

			
			out.print("</tr>");
		}
		
	out.print("</div>");
	out.println("</table></br></br>");
	
	out.print("<a href='Register.jsp'>"+"Add New Student"+"</a>"+"</br>"+"</br>");
	out.println("<a href='AdminEnd.jsp'>Logout</a>");
	
	out.println("</center>");
	out.println("</body>");
	out.println("</html>");
	
	
%>
</body>
</html>

