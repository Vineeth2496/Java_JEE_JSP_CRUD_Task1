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
HttpSession hs=request.getSession();
hs.invalidate();
out.println("<html>");
out.println("<center>");
out.println("<h1 style='color:red;'>Sucessfully Logged</h1>");
RequestDispatcher rd=request.getRequestDispatcher("Admin.jsp");
rd.include(request, response);
out.println("</center>");
out.println("</html>");
%>

</body>
</html>