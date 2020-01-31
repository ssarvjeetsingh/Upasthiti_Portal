<!DOCTYPE html>
<html>
<head>
  <link rel="stylesheet" type="text/css" href="css.css">
  <link href="https://fonts.googleapis.com/css?family=Roboto:300&display=swap" rel="stylesheet"> 
  <link rel="stylesheet" type="text/css" href="b.css">
  <title>Teacher Detail</title>
</head>
<body>
<div>
  <h1 class="display-4">Teacher Detail</h1>
  <%@page import="java.sql.*"%>

<%!
    Connection co;
    ResultSet rs;
    PreparedStatement ps;
    String s="",s1="",s2="",s3="",s4="",s5="",s6="",s7="",s8="",s9="",s10="",s11="",s12="",s13="",s14="";
%>

<%
    co=(Connection)application.getAttribute("con");
    s=request.getParameter("but");
 out.print(s);
    if(s!=null)
    {
        ps=co.prepareStatement("select * from teacher_details where teacher_name=?");
        ps.setString(1,s);
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
        }
    }
%>
<form>
<table>
  <tr>
    <td>TEACHER ID </td>
    <td><input type="text" name="teacher_id" value="<%=s1%>"></td>
  </tr>
  <tr>
    <td>TEACHER NAME </td>
    <td><input type="text" name="teacher_name" value="<%=s2%>"></td>
  </tr>
  <tr>
    <td>GENDER</td>
    <td><input type="text" name="gender" value="<%=s3%>"></td>
  </tr>
  <tr>
    <td>DATE OF BIRTH </td>
    <td><input type="text" name="dob" value="<%=s4%>"></td>
  </tr>
  <tr>
    <td>MOBILE NO </td>
    <td><input type="text" name="mobile_no" value="<%=s5%>"></td>
  </tr>
  <tr>
    <td>FATHER NAME </td>
    <td><input type="text" name="father_name" value="<%=s6%>"></td>
  </tr>
  <tr>
    <td>ADDRESS</td>
    <td><input type="text" name="address" value="<%=s7%>"></td>
  </tr>
  <tr>
    <td>CITY</td>
    <td><input type="text" name="city" value="<%=s8%>"></td>
  </tr>
  <tr>
    <td>PINCODE</td>
    <td><input type="text" name="pincode" value="<%=s9%>"></td>
  </tr>
  <tr>
    <td>EMAIL</td>
    <td><input type="text" name="email" value="<%=s10%>"></td>
  </tr>
  <tr>
    <td>AADHAR NO </td>
    <td><input type="text" name="addhar_no" value="<%=s11%>"></td>
  </tr>
  <tr>
    <td>YEAR</td>
    <td><input type="text" name="year" value="<%=s12%>"></td>
  </tr>
  <tr>
    <td>STATUS</td>
    <td><input type="text" name="status" value="<%=s13%>"></td>
  </tr>
  <tr>
    <td>SCHOOL ID </td>
    <td><input type="text" name="school_id" value="<%=s14%>"></td>
  </tr>
  <tr>
    <td></td>
  </tr>
</table>
</form>
</div>
</body>
</html>