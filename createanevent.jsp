<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dynamic Buttons</title>
    <link rel="stylesheet" href="createevent.css">
    <script>

        function showOverlay(s,l){
            var overlayTitle = document.getElementById('overlay-title');
            var overlayData = document.getElementById('overlay-data');
            var viddata=document.getElementById('vid');
            overlayData.innerHTML=s;
            viddata.innerHTML=l;
            document.getElementById('overlay').style.display = 'flex';
        }

        function hideOverlay() {
            document.getElementById('overlay').style.display = 'none';
        }
    </script>
</head>


<body>
<%
    String username = (String) session.getAttribute("username");
    if (username == null) {
        response.sendRedirect("login.html");
    }
%>

<h1>Availabe Rooms</h1>


<div class="overlay" id="overlay">
    <div class="overlay-content">
        <h2 id="overlay-title">Dynamic Data</h2>
        <h1><div id="vid">
            <!--vid here-->
        </div></h1>
        <div id="overlay-data">
            <!-- Dynamic content will be injected here -->
        </div>
        <button onclick="hideOverlay()">Close</button>
        <button onclick="">select</button>
    </div>
</div>


<div class="button-list">
    <%
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String dbURL = "jdbc:mysql://localhost:3306/project";
            String dbUser = "Abhimanyu";
            String dbPass = "password";

            conn = DriverManager.getConnection(dbURL, dbUser, dbPass);
            String t = "select * from allvenue";
            PreparedStatement s = conn.prepareStatement(t);
            rs = s.executeQuery();

            while (rs.next()) {
                int capacity = rs.getInt("capacity");
                String location = rs.getString("location");
                int floor = rs.getInt("floor");
                int ac = rs.getInt("ac");
                int smartboard = rs.getInt("smartboard");
                int projector = rs.getInt("projector");
                String vid = rs.getString("vid");
                String name = location + " " + vid;
                String pass = "Capacity:" + capacity + " location:" + location + " floor:" + floor + " ac:" + ac + " smartboard:" + smartboard + " projector" + projector;
    %>
    <button type="button" id="result-container" onclick="showOverlay('<%= pass %>','<%=vid%>')">
        <%= name %>
    </button>
    <%
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) try {
                rs.close();
            } catch (SQLException ignore) {
            }
            if (stmt != null) try {
                stmt.close();
            } catch (SQLException ignore) {
            }
            if (conn != null) try {
                conn.close();
            } catch (SQLException ignore) {
            }
        }
    %>
</div>

</body>
</html>
