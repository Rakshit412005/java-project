<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<%@page import="java.sql.*,java.util.*" %>
<%@ page import="jakarta.validation.constraints.Null" %>
<%
    String name = request.getParameter("mail");
    String pwd = request.getParameter("pwd");

    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "Abhimanyu", "password");
        String st = "select * from userbase where mailid=? and pwd=?";
        PreparedStatement s = conn.prepareStatement(st);
        s.setString(1, name);
        s.setString(2, pwd);
        ResultSet res = s.executeQuery();

        if (res.next() == false) {
            response.sendRedirect("login.html");
        }

        String role = res.getString(3);
        session.setAttribute("username", name);
        if (role.equals("user")) {
            response.sendRedirect("userhome.html");

        } else if (role.equals("ADMIN")) {

            response.sendRedirect("adminhome.html");
        }

    } catch (Exception e) {
        System.out.print(e);
        e.printStackTrace();
    }
%>