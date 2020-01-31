<%@page import="java.sql.*"%>
<%!
    String but="";
%>

<%
    but=request.getParameter("but");
    
    if(but!=null)
    {
    if(but.equals("STUDENT"))
    {
%>
    <jsp:forward page="chstu.html" />    
<%
    }
    else if(but.equals("FACULTY"))
    {
%>
    <jsp:forward page="check_teacher.jsp" />

<%
    }
}
%>