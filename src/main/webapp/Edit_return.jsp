<%@page import="java.util.Iterator"%>
<%@page import="java.util.Vector"%>
<%@page import="com.data.Data_logics"%>
<%@page import="com.data.Data"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Profile</title>
<style>
body {
       
	background-image: url('https://image.shutterstock.com/image-photo/double-exposure-graph-rows-coins-260nw-531998662.jpg');
	background-repeat: no-repeat;
	background-attachment: fixed;
	background-size: cover;
}
</style>
</head>
<body>
<%

	String regno= request.getParameter("regno");

	Data d=new Data();
	d.setRegno(regno);
	
	Data_logics l=new Data_logics();
	Vector v=l.Edit_return(d);
	Iterator ii=v.iterator();
	
	for(;ii.hasNext();)
	{
		Data d1=(Data)ii.next();
		out.println("<html>");
		out.println("<center>");
		out.println("<h1><font color='green'>EDIT PROFILE</font></h1>");
		out.println("<form action='Edit.jsp'>");
		out.println("<table border='1'>");
		
		out.println("<tr>	"+"<th style='text-align: left;'>"+"First Name"+"</th>"+"<td><input type='text' name='fn' id='fn' value='"+d1.getFirstname()+"'/></td></tr>");
		out.println("<tr>	"+"<th style='text-align: left;'>"+"Last Name"+"</th>"+"<td><input type='text' name='ln' id='ln' value='"+d1.getLastname()+"'/></td></tr>");
		out.println("<tr>	"+"<th style='text-align: left;'>"+"Email"+"</th>"+"<td><input type='email' name='em' id='em' value='"+d1.getEmail()+"'/></td></tr>");
		out.println("<tr>	"+"<th style='text-align: left;'>"+"Registration No"+"</th>"+"<td><input type='text' name='regno' id='regno' value='"+d1.getRegno()+"'/></td></tr>");
		out.println("<tr>	"+"<th style='text-align: left;'>"+"Password"+"</th>"+"<td><input type='text' name='pass' id='pass' value='"+d1.getPassword()+"'/></td></tr>");
		out.println("<tr>	"+"<th style='text-align: left;'>"+"StdCode"+"</th>"+"<td><input type='text' name='std' id='std' value='"+d1.getStdcode()+"'/></td></tr>");
		out.println("<tr>	"+"<th style='text-align: left;'>"+"Phone No"+"</th>"+"<td><input type='text' name='ph' id='ph' value='"+d1.getPhoneno()+"'/></td></tr>");
		out.println("<tr>	"+"<th style='text-align: left;'>"+"Gender"+"</th>"+"<td><input type='text' name='gm' id='gm' value='"+d1.getGender()+"'/></td></tr>");
		
		out.println("<tr>	<td colspan='2' style='text-align: center;'><input type='submit' value='Edit'/></td></tr>");
		
		out.println("</table>");
		out.println("</form>");
		out.println("</center>");
		out.println("</html>");
		
	}
	
	
	



%>

</body>
</html>