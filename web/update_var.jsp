<%@page import="java.sql.*"%>
<%!
    String s="";
%>

<%
    s=request.getParameter("but");
    
    if(s!=null)
    {
    if(s.equals("STUDENT DETAILS"))
    {
%>
    <jsp:forward page="update_stu.jsp" />    
<%
    }
    else if(s.equals("TEACHER DETAILS"))
    {
%>
    <jsp:forward page="update_teacher.jsp" />

<%
    }
}
%>