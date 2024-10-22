<%
    String name = request.getParameter("name");
    String age = request.getParameter("age");

    if (name != null && age != null) {
        out.println("<h3>Submitted Information</h3>");
        out.println("<p>Name: " + name + "</p>");
        out.println("<p>Age: " + age + "</p>");
    } else {
        out.println("<p>No data received.</p>");
    }
%>