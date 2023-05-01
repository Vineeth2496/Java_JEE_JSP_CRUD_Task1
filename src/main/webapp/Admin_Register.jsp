<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Register</title>
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
<style>
form{
	background-color:lime;
	border: solid;
	width: 300px;
	height: 350px;
	border-color: black;
	color: navy;
}
</style>
<center>
	<form action="Admin_Register_Action.jsp">
	First Name:</br>
	<input type="text" name="fn" required="true" > </br></br>
	Last Name:</br>
	<input type="text" name="ln" required="true" > </br></br>
	Email:</br>
	<input type="email" name="em" required="true" > </br></br>
	Register No:</br>
	<input type="text" name="rn" required="true" > </br></br>
	Password:</br>
	<input type="password" name="pa" required="true" > </br></br>
	
	<input type="submit" value="Admin Register">
	
	</form>
</center>

	
</body>
</html>