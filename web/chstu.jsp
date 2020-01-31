
<%!
   String but="",claa="";
    
    
    %>

<%
    
but=request.getParameter("but");
claa=request.getParameter("claa");
session.setAttribute("kla",claa);

if(but.equals("ATTENDANCE"))
{
    %>
  
  <jsp:forward page="chkstuattend.jsp" />
  <%
}
else
    if(but.equals("MARKS"))
{
    out.print("marks");
    %>
  
  <jsp:forward page="marksAll.jsp" />
  <%
}
else
    if(but.equals("DETAILS"))
{
  %>
  
  <jsp:forward page="studetails.jsp?value=detailindi" />
  <%
}


%>


