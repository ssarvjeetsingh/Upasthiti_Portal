<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="css.css">
  <link href="https://fonts.googleapis.com/css?family=Roboto:300&display=swap" rel="stylesheet"> 
  <link rel="stylesheet" type="text/css" href="b.css">
    <title>Individual Attendance</title>
</head>
<body>
    <div>
        <h1 class="display-4">Individual Teacher Attendance</h1>
        <%@page import="java.sql.*"%>
<%!
    Connection co;
    ResultSet rs;
    PreparedStatement ps;
    String st1="",st2="",st3="";
    int flag=0;
%>
<%
    co=(Connection)application.getAttribute("con");
%>
    
    <form action="indi_teacher.jsp">
    <input type="text" name="tea_id" placeholder="TEACHER ID" required>
    <input type="text" name="tea_mobile" placeholder="TEACHER MOBILE NO" required>
    </br>
</br><input class="btn btn-success" type="submit" name="but6" value="LOGIN">
    </form>
    
<%
    st3=request.getParameter("but6");
    st1=request.getParameter("tea_id");
    st2=request.getParameter("tea_mobile");
    
    if(st3!=null)
    {
   out.print(st1+st2+st3);
   try
   {
 out.print(222);
        ps=co.prepareStatement("select * from teacher_details where teacher_id=?");
  out.print(333);
        ps.setString(1,st1);
   out.print(111);
        rs=ps.executeQuery();
        while(rs.next())
        {
            flag=1;
        }
        if(flag==1)
        {
            session.setAttribute("tid",st1);
     out.print(2);
%>
    <jsp:forward page="indi_detail.jsp" />

<%
        }
    }catch(Exception e)
    {
        out.print("exception ="+e);
    }
}
%>
    </div>
</body>
</html>