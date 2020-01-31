<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="css.css">
  <link href="https://fonts.googleapis.com/css?family=Roboto:300&display=swap" rel="stylesheet"> 
  <link rel="stylesheet" type="text/css" href="b.css">
    <title>Check Teacher</title>
</head>
<body>
<div>
    <h1 class="display-4">Check Teacher</h1>
    <%@page import="java.sql.*"%>
<%!
    Connection co;
    ResultSet rs;
    PreparedStatement ps;
    String s="";
%>

<form action="check_teacher.jsp">
    <input class="btn btn-info" type="submit" name="but1" value="ATTENDANCE">
    <input class="btn btn-info" type="submit" name="but1" value="DETAILS">
</form>

<%  

    s=request.getParameter("but1");
    if(s!=null)
    {
    if(s.equals("ATTENDANCE"))
    {
%>
    <jsp:forward page="teacher_attendance.jsp" />

<%    
    }
    else if(s.equals("DETAILS"))
    {
%>
    <jsp:forward page="teacher_details.jsp" />

<%
    }
}
%>
</div>
</body>
</html>