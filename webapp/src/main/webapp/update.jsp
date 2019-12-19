<%-- 
    Document   : update
    Created on : Dec 17, 2019, 4:32:38 AM
    Author     : Asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%
    if (request.getParameter("submit") != null) {
        String id = request.getParameter("id");
        String name1 = request.getParameter("name1");
        String course = request.getParameter("course2");
        String fee = request.getParameter("fee3");

        Connection conn;
        PreparedStatement pst;
        ResultSet rs;

        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://sql12.freemysqlhosting.net:3306/sql12316313", "sql12316313", "Tk7s6xd1pe");

        pst = conn.prepareStatement("update kp set dbname =? ,course =?, fee=? where id=?");
        pst.setString(1, name1);
        pst.setString(2, course);
        pst.setString(3, fee);
        pst.setString(4, id);
        pst.executeUpdate();
%>
<script>
    alert("Data Di Update");
</script>

<%
    }
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>UPDATE</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
    </head>
    <body>
        <h1>DATA UPDATE</h1>


        <div class="row">
            <div class="col-sm-4">
                <form class="card" method="POST" action="#">

                    <%
                        Connection conn;
                        PreparedStatement pst;
                        ResultSet rs;

                        Class.forName("com.mysql.jdbc.Driver");
                        conn = DriverManager.getConnection("jdbc:mysql://sql12.freemysqlhosting.net:3306/sql12316313", "sql12316313", "Tk7s6xd1pe");

                        String id = request.getParameter("id");

                        pst = conn.prepareStatement("select * from kp where id =?");
                        pst.setString(1, id);
                        rs = pst.executeQuery();

                        while (rs.next()) {


                    %>

                    <div alight="left">   
                        <label class="form-label"> STUDENT NAME </label>
                        <input type="text" class="form-control" placeholder="Student Name" value="<%= rs.getString("dbname")%>" name="name1" id="name"  required>
                    </div>

                    <div alight="left">   
                        <label class="form-label"> Course </label>
                        <input type="text" class="form-control" placeholder="Course" value="<%= rs.getString("course")%>" name="course2" id="course" required>
                    </div>

                    <div alight="left">   
                        <label class="form-label"> Fee </label>
                        <input type="text" class="form-control" placeholder="Fee" value="<%= rs.getString("fee")%>" name="fee3" id="fee"  required>
                    </div>

                    <%

                        }

                    %>

                    <br>
                    <div alight="right">   
                        <input type="submit"  name="submit" id="submit" class="btn btn-info">
                        <input type="reset"  name="reset" id="reset" class="btn btn-info">
                    </div>

                    <div align="right" >
                        <p><a href="index.jsp">Click Back</a></p>
                    </div>
                </form> 
            </div>
        </div>



    </body>
</html>
