<!DOCTYPE html>
<html>
<head>
  <link rel="stylesheet" type="text/css" href="css.css">
  <link href="https://fonts.googleapis.com/css?family=Roboto:300&display=swap" rel="stylesheet"> 
  <link rel="stylesheet" type="text/css" href="b.css">
  <title>Teacher List</title>
</head>
<body>
  <div>
    <h1 class="display-4">Teacher List</h1>
    <%@page import="java.sql.*"%>
<%!
    Connection co;
    ResultSet rs;
    PreparedStatement ps;
    String s="",sid="",s1="",s2="",s4="",s5="",s6="",s7="",s8="",s9="",s10="",s11="",s12="",s14="";
%>

<%
    co=(Connection)application.getAttribute("con");
    s=request.getParameter("but");
    sid=(String)session.getAttribute("id");

    ps=co.prepareStatement("select * from teacher_details where teacher_id=?");
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
        s14=rs.getString(14); 
        
        s12=s12.substring(0,s12.length()-6);
        session.setAttribute("uid",s1);
    }
    
%>

<form action="update_teacherf.jsp">
<table>
      <tr>
        <td><label>FACULTY NAME </label><input type="text" name="faculty_name" value="<%=s2%>"></td>
        <td><label>GUARDIAN NAME </label><input type="text" name="guardian_name" value="<%=s6%>"></td>
      </tr>
      <tr>
        <td><label>D.O.B </label><input type="text" name="birth_date" value="<%=s4%>"></td>
        <td><label>CITY </label><input type="text" name="city" value="<%=s8%>"></td>
      </tr>
      <tr>
        <td><label>PINCODE </label><input type="text" name="pincode" value="<%=s9%>"></td>
                <td><label>YEAR </label><input type="number" name="year" value="<%=s12%>"></td>      
  </tr>
      <tr>
        <td><label>MOBILE_NO </label><input type="number" name="mobile_no" value="<%=s5%>"></td>
        <td><label>ADDRESS </label><input type="text" name="address" value="<%=s7%>"></td>
      </tr>
      <tr>
        <td><label>EMAIL_ID </label><input type="text" name="email_id" value="<%=s10%>"></td>
        <td><label>SCHOOL_ID </label><input type="text" name="school_id" value="<%=s14%>"></td>
      </tr>
      <tr>
        <td><label>AADHAAR NO </label><input type="text" name="adhar_no" value="<%=s11%>"></td>
        <td></td>
      </tr>
      <tr>
        <td><input class="btn btn-success" type="submit" name="but" value="UPDATE"></td>
      </tr>
</table>

</form>


  </div>
</body>
</html>