<!DOCTYPE html>
<html>
<head>
  <link rel="stylesheet" type="text/css" href="css.css">
  <link href="https://fonts.googleapis.com/css?family=Roboto:300&display=swap" rel="stylesheet"> 
  <link rel="stylesheet" type="text/css" href="b.css">
  <title>Detail Individual</title>
</head>
<body>
  <div>
   <h1>Detail Individual</h1> 
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%!    
String id="",clas="";
PreparedStatement ps;
Connection cn;
ResultSet rs;
String s="",sid="",s1="",s2="",s3="",s4="",s5="",s6="",s7="",s8="",s9="",s10="",s11="",s12="",s13="",s14="",s15="",s16="";
%>


<%
cn=(Connection)application.getAttribute("con");  
id=request.getParameter("id");
clas=(String)session.getAttribute("kla");


try
{
ps=cn.prepareStatement("select * from student_detailsc"+clas+" where student_id=?");
        ps.setString(1,id);
       
       rs=ps.executeQuery();
    
       while(rs.next())
       {
       
                     s1=rs.getString(1);
                     s2=rs.getString(2);
                     s3=rs.getString(3);
                     s4=rs.getString(4);
                     s5=rs.getString(5);
                     s6=rs.getString(6);
                      s7=rs.getString(7);
                      s8=rs.getString(8);
                       s9=rs.getString(9);
                     s10=rs.getString(10);
                    s11=rs.getString(11);
                     s12=rs.getString(12);
                 s13=rs.getString(13);
                s14=rs.getString(14);
                 s15=rs.getString(15);
                         s15=rs.getString(16); ; 
       }
           %>
           <form action="updates_final.jsp" method="post">
<table>
  <tr>
      <td><label>STUDENT ID: </label>
        <%=s1%></td>
    <td><label>STUDENT NAME: </label>
        <%=s2%></td>
  </tr>
  <tr>
    <td><label>GENDER: </label>
        <%=s3%></td>
    <td><label>D.O.B: </label>
        <%=s4%></td>
  </tr>
  <tr>
    <td><label>Class</label>
        <%=s5%> </td>
    <td><label>FATHER's NAME: </label>
        <%=s6%></td>
  </tr>
  <tr>
    <td><label>MOTHER's NAME: </label>
        <%=s7%>
    </td>
    <td><label>MOBILE:</label>
       <%=s8%></td>
  </tr>
  <tr>
    <td><label>ADDRESS: </label>
        <%=s9%></td>
    <td><label>CITY:</label>
        <%=s10%></td>
  </tr>
  <tr>
      <td><label>PINCODE: </label>
        <%=s11%></td>
    <td><label>EMAIL_ID:</label>
        <%=s12%></td>
  </tr>
  <tr>
    <td><label>ADDHAAR_NO: </label>
       <%=s13%></td>
    <td><label>YEAR: </label>
        <%=s14%></td>
  </tr>
  <tr>
    <td><label>STATUS: </label>
        <%=s15%></td>
    <td><label>SCHOOL ID </label>
        <%=s16%></td>
  </tr>
</table>

</form>


  </div>
</body>
</html>
           
           <%
       
}
catch(Exception e)
{
    out.print(e);
}

%>



  </div>
</body>
</html>