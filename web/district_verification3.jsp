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
    int id[];
    int i=0;
    String s[];
%>
<%
    co=(Connection)application.getAttribute("con");
    String s1=request.getParameter("blk");
    out.print(s1);
 
    out.print(1);
    try
    {
        ps=co.prepareStatement("select school_id from school_details where block_no=?");
        ps.setString(1,s1);
        rs=ps.executeQuery();
    out.print(2);
  
        while(rs.next())
            {
                  out.print(2.1);
  
                
                  id[i]=rs.getInt(1);
                  
                 out.print(id[i]);
  
                  i++;
                out.print(3);
  
            
            %>
            
             
           <%
             }
               ps.close();
                rs.close();
         for(int i=0;i<id.length;i++)
{
             ps=co.prepareStatement("select school_name from school_details where school_id=?");
             ps.setInt(1,id[i+1]);
             rs=ps.executeQuery();
             if(rs.next())
{
                s[i]=rs.getString(1);
out.print(s[i]);
                
}            rs.close();
             ps.close();
}        
        }catch(Exception e)
        {
            out.print("exception is ...."+e);
        }
%>       