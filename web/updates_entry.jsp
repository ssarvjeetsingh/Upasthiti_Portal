<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
  <link rel="stylesheet" type="text/css" href="css.css">
  <link href="https://fonts.googleapis.com/css?family=Roboto:300&display=swap" rel="stylesheet"> 
  <link rel="stylesheet" type="text/css" href="b.css">
  <title>Update Entry</title>
</head>
<body>
  <div>
    <h1 class="display-4">Update Entry</h1>
    
<%!
    Connection co;
    ResultSet rs;
    PreparedStatement ps;
    String s="",sid="",s1="",s2="",s4="",s5="",s6="",s7="",s8="",s9="",s10="",s11="",s12="",s13="",s14="",s16="";
%>

<%
    co=(Connection)application.getAttribute("con");
    String scl=(String)session.getAttribute("scl");
    sid=(String)session.getAttribute("id");

    ps=co.prepareStatement("select * from student_detailsc"+scl+" where student_id=?");
    ps.setString(1,sid);
    rs=ps.executeQuery();
    while(rs.next())
    {
        s1=rs.getString(1);
        s2=rs.getString(2);
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
        s16=rs.getString(16); 
        
        s14=s14.substring(0,s14.length()-6);
        session.setAttribute("uid",s1);
    }
    
%>

<form action="updates_final.jsp" method="post">
<table>
  <tr>
    <td><label>STUDENT NAME </label>
        <input type="text" name="student_name" value="<%=s2%>" required></td>
    <td><label>FATHERS NAME </label>
        <input type="text" name="fathers_name" value="<%=s6%>" required></td>
  </tr>
  <tr>
    <td><label>D.O.B </label>
        <input type="text" name="birth_date" value="<%=s4%>" required></td>
    <td><label>MOTHERS NAME </label>
        <input type="text" name="mothers_name" value="<%=s7%>" required></td>
  </tr>
  <tr>
    <td><label>CITY </label>
        <input type="text" name="city" value="<%=s10%>" required>
    </td>
    <td><label>PINCODE</label>
        <input type="text" name="pincode" value="<%=s11%>" required></td>
  </tr>
  <tr>
    <td><label>MOBILE_NO </label>
        <input type="number" name="mobile_no" value="<%=s8%>" required></td>
    <td><label>YEAR</label>
        <input type="number" name="year" value="<%=s14%>" required></td>
  </tr>
  <tr>
    <td><label>EMAIL_ID </label>
        <input type="text" name="email_id" value="<%=s12%>" required></td>
    <td><label>ADDRESS </label>
        <input type="text" name="address" value="<%=s9%>" required></td>
  </tr>
  <tr>
    <td><label>AADHAAR NO </label>
        <input type="text" name="adhar_no" value="<%=s13%>" required></td>
    <td><label>SCHOOL ID </label>
        <input type="text" name="school_id" value="<%=s16%>" required></td>
  </tr>
  <tr>
    <td><label>CLASS </label>
        <input type="text" name="class_name" value="<%=s5%>" required></td>
    
  </tr>
  <tr>
    <td><input class="btn btn-success" type="submit" value="UPDATE" name="but"></td>
  </tr>
</table>

</form>


  </div>
</body>
</html>