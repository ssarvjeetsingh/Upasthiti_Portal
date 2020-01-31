<%@page import="java.sql.*"%>
<%!
    Connection co;
    PreparedStatement ps;
    ResultSet rs;
%>
<%
    co=(Connection)application.getAttribute("con");
    String fname=request.getParameter("faculty_name");
    String gname=request.getParameter("guardian_name");
    String sdob=request.getParameter("birth_date");
    String sgen=request.getParameter("gender");
    String scity=request.getParameter("city");
    String smob=request.getParameter("mobile_no");
    int spin=Integer.parseInt(request.getParameter("pincode")); 
    String addhar=request.getParameter("adhar_no");
    String smail=request.getParameter("email_id");
    String saddress=request.getParameter("address");
    int year=Integer.parseInt(request.getParameter("year"));
    String tt=(String)session.getAttribute("schid");
    int schids=Integer.parseInt(tt);
    try
    {
        ps=co.prepareStatement("insert into teacher_details(teacher_name,gender,dob,mobile_no,guardian_name,address,city,pincode,email,addhar_no,year,status,school_id) values(?,?,?,?,?,?,?,?,?,?,?,?,?)");
        ps.setString(1,fname);
        ps.setString(2,sgen);
        ps.setString(3,sdob);
        ps.setString(4,smob);
        ps.setString(5,gname);
        ps.setString(6,saddress);
        ps.setString(7,scity);
        ps.setInt(8,spin);
        ps.setString(9,smail);
        ps.setString(10,addhar);
        ps.setInt(11,year);
        ps.setString(12,"activate");
        ps.setInt(13,schids);
        ps.executeUpdate();
        ps.close();
        %>
        <script>
            alert("Successfully Added");
            window.location("school_entry.html");
        </script>
        <%
    } catch(Exception e)
    {
        out.print("exception is ..."+e);
    }
%>