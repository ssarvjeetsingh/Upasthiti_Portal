<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="css.css">
  <link href="https://fonts.googleapis.com/css?family=Roboto:300&display=swap" rel="stylesheet"> 
  <link rel="stylesheet" type="text/css" href="b.css">
    <title>Marksp</title>
</head>
<body>
<div>
    <h1 class="display-4">Marks Sheet</h1>
<%!
    Connection co;
    PreparedStatement ps;
    ResultSet rs;
    String subname="";
%>
<%
    try
    {   
        co=(Connection)application.getAttribute("con");
        String store="";
        String cla=request.getParameter("classes");
        session.setAttribute("clm",cla);
        String suid=request.getParameter("subid");
        session.setAttribute("suids",suid);
        String typ=request.getParameter("etype");
        session.setAttribute("styp",typ);
        ps=co.prepareStatement("select subject_name from subject_code where subject_id=?");
        ps.setString(1,suid);
        rs=ps.executeQuery();
        if(rs.next())
        {
            subname=rs.getString(1);
        }
        rs.close();
        ps.close();
        
        ps=co.prepareStatement("select * from student_detailsc"+cla+" where class=?");
        ps.setString(1,cla);
        rs=ps.executeQuery();
        %>
        <form action="msuccess.jsp" method="post">
<table>
  <tr>
    <td class="center">STUDENT ID</td>
    <td class="center">NAME</td>
    <td class="center">MARKS</td>
    <td class="center">SUBJECT</td>
  </tr>
  <%
            while(rs.next())
            {
                store=store+rs.getString(1)+"@";
            %> 
  <tr>
    <td class="center"><%=rs.getString(1)%></td>
    <td class="center"><%=rs.getString(2)%></td> 
    <td class="center"><input type="number" name="<%=rs.getString(1)%>" max="100" required></td>
    <td class="center"><%=subname%></td>
  </tr>
  <%
            }
            %>
            
            <input type="hidden" name="count" value="<%=store%>">
  <tr>
    <td><input class="btn btn-success center" name="submit" type="submit" value="SAVE"></td>
  </tr>
</table>
        </form>
<%
    } catch(Exception e)
    {
        out.print("Exception is.."+e);  
    }
%>
</div>
</body>
</html>