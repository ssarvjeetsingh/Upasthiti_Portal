<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="css.css">
  <link href="https://fonts.googleapis.com/css?family=Roboto:300&display=swap" rel="stylesheet"> 
  <link rel="stylesheet" type="text/css" href="b.css">
    <title>Teacher Details</title>
</head>
<body>
<div>
    <h1 class="display-4">Teacher Details</h1>
    <%!
    String s="";
%>

<form action="teacher_details.jsp">
    <input type="submit" name="but3" value="INDIVIDUAL TEACHER DETAILS">
    <input type="submit" name="but3" value="ALL TEACHER DETAILS">
</form>

<%
    s=request.getParameter("but3");
    if(s!=null)
    {
    if(s.equals("INDIVIDUAL TEACHER DETAILS"))
    {
%>
    <jsp:forward page="indi_teacher.jsp" />

<%
    }
    else if(s.equals("ALL TEACHER DETAILS"))
    {
%>
    <jsp:forward page="allteacher_details.jsp" />

<%
    }
}
%>
</div>
</body>
</html>