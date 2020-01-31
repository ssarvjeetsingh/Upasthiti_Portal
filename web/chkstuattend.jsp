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
    <h1 class="display-4">STUDENT ATTENDANCE</h1>
    <%!
    String s="";
%>

<form action="chkstuattend.jsp">
    <input type="submit" name="but3" value="INDIVIDUAL STUDENT ATTENDANCE">
    <input type="submit" name="but3" value="ALL STUDENTS ATTENDANCE">
</form>

<%
    s=request.getParameter("but3");
    if(s!=null)
    {
    if(s.equals("INDIVIDUAL STUDENT ATTENDANCE"))
    {
%>
    <jsp:forward page="studetails.jsp?value=indiattend" />

<%
    }
    else 
     if(s.equals("ALL STUDENTS ATTENDANCE"))
    {

%>
    
   <jsp:forward page="allattend.jsp" />
<%
    }
}
%>
</div>
</body>
</html>