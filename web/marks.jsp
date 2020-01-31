 <%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="css.css">
  <link href="https://fonts.googleapis.com/css?family=Roboto:300&display=swap" rel="stylesheet"> 
  <link rel="stylesheet" type="text/css" href="b.css">
    <title>Marks</title>
</head>
<body>
<div>
   
<%!
    Connection co;
    PreparedStatement ps;
    ResultSet rs;
%>
<%
    try
    {   
        co=(Connection)application.getAttribute("con");
        ps=co.prepareStatement("select subject_id from subject_code");
        rs=ps.executeQuery();
        %>
        <h1 class="display-4">Marks Entry</h1>
        <form action="marksp.jsp" method="post">
            <table>
                <tr>
                    <td  class="center">
                    <label class="center" for="clse">CLASS: </label>
                        <select  id="clse" name="classes">
                            <option value="1">I</option>
                            <option value="2">II</option>
                            <option value="3">III</option>
                        </select>
                  </td>
                    <td  class="center">
                    <label class="center" for="sub">SUBJECT ID: </label>
                    <select  id="sub" name="subid">
                    <%
                    while(rs.next())
                    {
                    %> 
                    <option class="center" value="<%=rs.getString(1)%>"><%=rs.getString(1)%></option>
                    <%
                    }
                    rs.close();
                    ps.close();
                    %>
                    </select>
                  </td>
                    <td  class="center">
                        <label class="center" for="exty">SESSION: </label>
                        <select id="exty" name="etype"> 
                            <option value="Yearly">Yearly</option>
                            <option value="Half Yearly">Half Yearly</option>
                        </select>
                  </td>
                </tr>
                <tr>
                    <td  class="center"><input class="center" class="btn btn-success" type="submit" value="OK" name="but"></td>
                </tr>
          </table>
        </form>
        <%
              }catch(Exception e)
              {
                  out.print("Exception is ..."+e);
              }
%>   


</div>
</body>
</html>