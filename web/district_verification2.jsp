<html>
    <head>
<link rel="stylesheet" type="text/css" href="css.css">
  <link href="https://fonts.googleapis.com/css?family=Roboto:300&display=swap" rel="stylesheet"> 
  <link rel="stylesheet" type="text/css" href="b.css">
    </head>
</html>

<%@page import="java.sql.*"%>
<%!
    Connection co;
    PreparedStatement ps;
    ResultSet rs;
    String s[];
%>
<%
    co=(Connection)application.getAttribute("con");
    String s1=request.getParameter("blk");
    
    try
    {
        ps=co.prepareStatement("select school_id,school_name from school_details where block_no=?");
        ps.setString(1,s1);
        rs=ps.executeQuery();
     %>
     <html>
         <form action="check.html">
         <%
        while(rs.next())
        {  
  
            
            %>
            
            <input type="submit" value="<%=rs.getString(2)%>" name="but">
                <input type="hidden" value="<%=rs.getString(1)%>"  name="hide">
           <%
             }
             %>
         </form>
     </html>
             <%
               ps.close();
                rs.close();
        }catch(Exception e)
        {
            out.print("exception is ...."+e);
        }
%>       