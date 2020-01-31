<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="css.css">
  <link href="https://fonts.googleapis.com/css?family=Roboto:300&display=swap" rel="stylesheet"> 
  <link rel="stylesheet" type="text/css" href="b.css">
    <title>Update Student</title>
</head>
<body>
<div>
    <h1 class="display-4">Update Student</h1>
    
<%!
    Connection co;
    ResultSet rs;
    PreparedStatement ps;
    int flag=0;
    String s1="",s2="",s3="";
%>

<form action="update_stu.jsp" method="post">
<%
    co=(Connection)application.getAttribute("con");
    try
    {
%>
<table>
  <tr>
    <td><input type="number" name="stu_id" placeholder="STUDENT ID" required></td>
    <td>
    <label for="stcl">CLASS: </label>
        <select  id="stcl" name="stu_class">
            <option value="1">I</option>
            <option value="2">II</option>
            <option value="3">III</option>
        </select>
    </td>
  </tr>
  <tr>
    <td><input class="btn btn-success" type="submit" value="Login" name="but4"></td>
  </tr>
</table>

<%
    s1=request.getParameter("stu_id");
    s2=request.getParameter("stu_class");
    session.setAttribute("scl",s2);
    s3=request.getParameter("but4");
  
    if(s3!=null)
    {
        ps=co.prepareStatement("select * from student_detailsc"+s2+" where student_id=?");
        ps.setString(1,s1);
        rs=ps.executeQuery();
        while(rs.next())
        {
            flag=1;
        }
        if(flag==1)
        {
            session.setAttribute("id",s1);
    %>
        <jsp:forward page="updates_entry.jsp" />
        
    <%
        }
    }
    }catch(Exception e)
    {
        out.print("exception="+e);
    }
%>
</form>
</div>
</body>
</html>