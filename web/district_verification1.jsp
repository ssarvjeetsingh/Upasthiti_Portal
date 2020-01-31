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
%>
<%
    co=(Connection)application.getAttribute("con");
    String s1=request.getParameter("cino");
    try
    {
        ps=co.prepareStatement("select block_no from school_details where city=?");
        ps.setString(1,s1);
        rs=ps.executeQuery();
        
            while(rs.next())
            {
            %>
           
            <form action="district_verification2.jsp">
            <input type="submit" value="<%=rs.getString(1)%>" name="blk" />
              
            </form>
           <%
             }
             rs.close();
             ps.close();
                   
        }catch(Exception e)
        {
            out.print("exception is ...."+e);
        }
%>
