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

        pst = conn.prepareStatement("update records set dbname =? ,course =?, fee=? where id=?");
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
        <link href="bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
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

                        pst = conn.prepareStatement("select * from records where id =?");
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
