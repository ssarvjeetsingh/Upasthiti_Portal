<%@page import="java.sql.*"%>
<%!
    Connection co;
    PreparedStatement ps;
    ResultSet rs;
%>
<%
    co=(Connection)application.getAttribute("con");
    String l=request.getParameter("level");
    if(l.equals("BLOCK"))
    {
        %>
        <jsp:forward page="block_verification.jsp" />
        <%
    }
    else if(l.equals("DISTRICT"))
    {
        %>
        <jsp:forward page="district_verification.jsp" />
        <%
    }
    else if(l.equals("STATE"))
    {
        %>
        <jsp:forward page="state_verification.jsp" />
        <%
    }
    else if(l.equals("SCHOOL"))
    {
        %>
        <jsp:forward page="school_verification.html" />
        <%
    }
%>