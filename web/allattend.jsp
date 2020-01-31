<%@page import="java.sql.ResultSetMetaData"%>
<!DOCTYPE html>
<html>
<head>
  <link rel="stylesheet" type="text/css" href="css.css">
  <link href="https://fonts.googleapis.com/css?family=Roboto:300&display=swap" rel="stylesheet"> 
  <link rel="stylesheet" type="text/css" href="b.css">
  <title>Detail Individual!</title>
</head>
<body>
  <div>
   <h1>Attendance Individual</h1> 
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%!    
String id="",clas="";
PreparedStatement ps,ps1;
Connection cn;
ResultSet rs,rs1;
String s="";
ResultSetMetaData rsmd;
int n=0,count=0;
%>


<%
cn=(Connection)application.getAttribute("con");  

clas=(String)session.getAttribute("kla");


try
{


ps=cn.prepareStatement("select student_name from student_detailsc"+clas+" where status=?");
ps.setString(1,"activate");
rs=ps.executeQuery();
%>
<table>
<tr>
    <td>STUDENT NAME: </td>
    <td>
    <%
while(rs.next())
{
%>
    <%=rs.getString(1)%>

    <%
        }
}catch(Exception e)
{
out.print(e);
}
        %>
        </td>
</tr>
</table>
  </div>
</body>
</html>