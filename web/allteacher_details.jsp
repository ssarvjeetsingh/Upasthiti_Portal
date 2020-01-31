<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="css.css">
  <link href="https://fonts.googleapis.com/css?family=Roboto:300&display=swap" rel="stylesheet"> 
  <link rel="stylesheet" type="text/css" href="b.css">
    <title>All Teacher Names</title>
</head>
<body>
<div>
    <h1 class="display-4">All Teacher Names</h1>
    <%@page import="java.sql.*"%>

<%!
    Connection co;
    ResultSet rs;
    PreparedStatement ps;
    String ss="",ss1="";
%>

<form action="all_teacher1.jsp">
<%
    co=(Connection)application.getAttribute("con");
        
    ps=co.prepareStatement("select * from teacher_details");
        rs=ps.executeQuery();
        while(rs.next())
        {
            ss1=rs.getString(1);
            ss=rs.getString(2);
%>
<p><input type="submit" name="but" value="<%=ss%>"></p>

<%
        }
%>
</form>
</div>
</body>
</html>