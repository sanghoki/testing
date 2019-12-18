<%-- 
    Document   : index
    Created on : Dec 17, 2019, 3:06:41 AM
    Author     : Asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%
    if (request.getParameter("submit") != null) {
        String name1 = request.getParameter("name1");
        String course = request.getParameter("course2");
        String fee = request.getParameter("fee3");

        Connection conn;
        PreparedStatement pst;
        ResultSet rs;

        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost/testing2", "root", "");

        pst = conn.prepareStatement("insert into records(dbname,course,fee) values (?,?,?)");
        pst.setString(1, name1);
        pst.setString(2, course);
        pst.setString(3, fee);
        pst.executeUpdate();
%>
<script>
    alert("Data Di Input");
</script>

<%
    }
%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <h1>Testing</h1>
        <br>
        <div class="row">
            <div class="col-sm-4">
                <form class="card" method="POST">
                    <div alight="left">   
                        <label class="form-label"> STUDENT NAME </label>
                        <input type="text" class="form-control" placeholder="Student Name" name="name1" id="name" required>
                    </div>

                    <div alight="left">   
                        <label class="form-label"> Course </label>
                        <input type="text" class="form-control" placeholder="Course" name="course2" id="course" required>
                    </div>

                    <div alight="left">   
                        <label class="form-label"> Fee </label>
                        <input type="text" class="form-control" placeholder="Fee" name="fee3" id="fee" required>
                    </div>

                    <br>
                    <div alight="right">   
                        <input type="submit"  name="submit" id="submit" class="btn btn-info">
                        <input type="reset"  name="reset" id="reset" class="btn btn-info">
                    </div>
                </form> 
            </div>
        </div>
        <div class="col-sm-8">
            <div class="panel-body">
                <table id="tblStudent" class="table table-responsive table-bordered" cellpadding ="50" width="100%">
                    <thead>
                        <tr>
                            <th>Student Name</th>
                            <th>Course</th>
                            <th>Fee</th>
                            <th>Edit</th>
                            <th>Delete</th>
                        </tr>

                        <%
                            Connection conn;
                            PreparedStatement pst;
                            ResultSet rs;

                            Class.forName("com.mysql.jdbc.Driver");
                            conn = DriverManager.getConnection("jdbc:mysql://localhost/testing2", "root", "");

                            String query = "Select * from records";
                            Statement st = conn.createStatement();

                            rs = st.executeQuery(query);

                            while (rs.next()) {
                                String id = rs.getString("id");


                        %>

                        <tr>
                            <td><%=rs.getString("dbname")%></td>
                            <td><%=rs.getString("course")%></td>
                            <td><%=rs.getString("fee")%></td>
                            <td><a href="update.jsp?id=<%=id%>">EDIT</a></td>
                            <td><a href="delete.jsp?id=<%=id%>">DELETE</a></td>
                        </tr>

                        <%

                            }
                        %>
                </table>

            </div>
        </div>

    </body>
</html>
