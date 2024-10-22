<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="org.example.demo.*"%>
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>

<!DOCTYPE html>
<html>
<head>
  <title>JSP - Hello World</title>
</head>
<body>
<h1><%= "Hello World!" %></h1>
<br/>
<a href="hello-servlet">Hello Servlet</a>
<form method = 'Get'>
  First Name: <input type = "text" name = "ID">
  <br />
  Last Name: <input type = "text" name = "name" />
  <input type = "submit" value = "Submit" />
</form>
<% String name=   %>
<p><%for(int i=0;i<5;i++){ out.println(HelloServlet.tolower(i));}%></p>


</body>
</html>