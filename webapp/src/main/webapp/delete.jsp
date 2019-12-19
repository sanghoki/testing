<%@page import="java.sql.*" %>
<%

    String id = request.getParameter("id");
    Connection conn;
    PreparedStatement pst;
    ResultSet rs;

    Class.forName("com.mysql.jdbc.Driver");
    conn = DriverManager.getConnection("jdbc:mysql://sql12.freemysqlhosting.net:3306/sql12316313", "sql12316313", "Tk7s6xd1pe");

    pst = conn.prepareStatement("delete from kp where id=?");
    pst.setString(1, id);
    pst.executeUpdate();
%>
<script>
    alert("Data Di Hapus");
</script>

<%

%>

<div align="" >
    <p><a href="index.jsp">Click Back</a></p>
</div>