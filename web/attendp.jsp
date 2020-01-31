<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="css.css">
  <link href="https://fonts.googleapis.com/css?family=Roboto:300&display=swap" rel="stylesheet"> 
  <link rel="stylesheet" type="text/css" href="b.css">
    <title>Attenp</title>
</head>
<body>
    <div>
        <h1 class="display-4">Attendance Sheet</h1>
<%!
    Connection co;
    PreparedStatement ps;
    ResultSet rs;
%>
<%
    try
    {   
        co=(Connection)application.getAttribute("con");
        String store="";
        String cla=request.getParameter("classes");
        session.setAttribute("cls",cla);
        String lectid=request.getParameter("lectno");
       
        ps=co.prepareStatement("insert into attendence_detailsc"+cla+"(lecture_no,subject_id,teacher_id) values(?,?,?)");
        ps.setString(1,request.getParameter("lectno"));
        ps.setString(2,request.getParameter("subid"));
        ps.setString(3,request.getParameter("techid"));
        ps.executeUpdate();
        ps.close();
        
        ps=co.prepareStatement("select * from student_detailsc"+cla+" where class=?");
        ps.setString(1,cla);
        rs=ps.executeQuery();
        %>
        <form action="asuccess.jsp" method="post">
<table>
  <tr>
    <td  class="center">STUDENT ID</td>
    <td  class="center">NAME</td>
    <td  class="center">PRESENT</td>
    <td  class="center">ABSENT</td>
  </tr>
  <%
            while(rs.next())
            {
                store=store+rs.getString(1)+"@";
            %> 
  <tr>
    <td  class="center"><%=rs.getString(1)%></td>
    <td  class="center"><%=rs.getString(2)%></td> 
    <td  class="center"><input type="radio" name="<%=rs.getString(1)%>" value="present" required></td>
    <td  class="center"><input type="radio" name="<%=rs.getString(1)%>" value="absent" required></td>
  </tr>
  <%
            }
            %>
            
            <input type="hidden" name="count" value="<%=store%>">
            <input type="hidden" name="lecid" value="<%=lectid%>">
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