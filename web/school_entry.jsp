<%@page import="java.sql.*"%>
<%!
    Connection co;
    PreparedStatement ps;
    ResultSet rs;
%>
<%
    co=(Connection)application.getAttribute("con");
    String se=request.getParameter("entry");
    if(se.equals("NEW FACULTY"))
    {
        %>
        <jsp:forward page="new_faculty.html" />
        <%
    }
    else if(se.equals("NEW STUDENT"))
    {
        %>
        <jsp:forward page="new_student.html" />
        <%
    }
    else if(se.equals("ATTENDANCE"))
    {
        %>
        <jsp:forward page="attend.jsp" />
        <%
    }
    else if(se.equals("CHECK"))
    {
        %>
        <jsp:forward page="check.html" />
        <%
    }
    else if(se.equals("MARKS"))
    {
        %>
        <jsp:forward page="marks.jsp" />
        <%
    }
    else if(se.equals("UPDATE"))
    {
        %>
        <jsp:forward page="update.html" />
        <%
    }
%>