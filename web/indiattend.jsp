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
id=request.getParameter("id");
clas=(String)session.getAttribute("kla");


try
{


ps=cn.prepareStatement("select student_name from student_detailsc"+clas+" where student_id=? and status=?");
ps.setString(1, id);
ps.setString(2,"activate");
rs=ps.executeQuery();

if(rs.next())
{

%>
<table>
<tr>
    <td>STUDENT NAME: </td>
    <td ><%=rs.getString(1)%></td>
    
    <td>STUDENT ID: </td>
    <td ><%=id%></td>
    <td >CLASS:</td>
    <td ><%=clas%></td>
    
  </tr>
  <tr align="center">
               <td align=>                          </td>
           
  </tr>
  <tr align="center">
               <td align="center">DATE</td><td>ATTEDANCE</td>
           
  </tr>
  
<%

ps=cn.prepareStatement("select * from attendencec"+clas);
rs=ps.executeQuery();
rsmd=rs.getMetaData();
n=rsmd.getColumnCount();

ps.close();
    
    
ps=cn.prepareStatement("select * from attendencec"+clas);
rs=ps.executeQuery();
rsmd=rs.getMetaData();
int i=1;
while(i!=n)
{
    
if(("R"+id).equals(rsmd.getColumnName(i+1)))
{
    ps.close();
    rs.close();
    count=1;
ps=cn.prepareStatement("select * from attendencec"+clas);
rs=ps.executeQuery();
ps1=cn.prepareStatement("select date from attendence_detailsc"+clas);       
       rs1=ps1.executeQuery();
       
    
       while(rs.next()&&rs1.next())
       {
           %>
           <tr align="center">
               <td align=><%=rs1.getString(1)%></td><td><%=rs.getString(Integer.parseInt(id)+1)%></td>
           
  </tr>
      
      <%    
       }
       ps.close();
       rs.close();
   
}

i++;
}
}
else
{
    out.print("unknown");
}
    
    
           %>
         <%
       
}
catch(Exception e)
{
    out.print(e);
}

%>


</table>
  </div>
</body>
</html>