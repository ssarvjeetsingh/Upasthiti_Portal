<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="css.css">
  <link href="https://fonts.googleapis.com/css?family=Roboto:300&display=swap" rel="stylesheet"> 
  <link rel="stylesheet" type="text/css" href="b.css">
    <title>Update Teacher</title>
</head>
<body>
    <div>
        <h1 class="display-4">Update Teacher</h1>
        <%@page import="java.sql.*"%>
<%!
    Connection co;
    ResultSet rs;
    PreparedStatement ps;
    int flag=0;
    String s1="",s2="",s3="";
%>

<form action="update_teacher.jsp" method="post">
<%
    co=(Connection)application.getAttribute("con");

    try
    {
%>
<table>
  <tr>
      <td><input type="number" name="tea_id" placeholder="TEACHER ID" required></td>
  </tr>
  <tr>
      <td><input type="submit" value="Login" name="butt"></td>
  </tr>
</table>
<%
    s1=request.getParameter("tea_id");
    s3=request.getParameter("butt");
  
    if(s3!=null)
    {
    ps=co.prepareStatement("select * from teacher_details where teacher_id=?");
    ps.setString(1,s1);
    rs=ps.executeQuery();
    while(rs.next())
    {
        flag=1;
    }
    if(flag==1)
    {
        session.setAttribute("id",s1);
%>
    <jsp:forward page="update_teachere.jsp" />
        
<%
    }  
   
}
}catch(Exception e)
    {
        out.print("exception="+e);
    }
%>
</form>
    </div>
</body>
</html>