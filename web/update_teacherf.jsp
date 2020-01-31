<%@page import="java.sql.*"%>
<%!
    Connection co;
    ResultSet rs;
    PreparedStatement ps;
    String s="",sid="",s2="",s4="",s5="",s6="",s7="",s8="",s9="",s10="",s11="",s12="",s14="";
%>

<%
    co=(Connection)application.getAttribute("con");
    
    try
    {
        s2=request.getParameter("faculty_name");
        s4=request.getParameter("birth_date");
        s5=request.getParameter("mobile_no");
        s6=request.getParameter("guardian_name");
        s7=request.getParameter("address");
        s8=request.getParameter("city");
        s9=request.getParameter("pincode");
        s10=request.getParameter("email_id");
        s11=request.getParameter("adhar_no");
        s12=request.getParameter("year");
        s14=request.getParameter("school_id");
        sid=(String)session.getAttribute("uid");
    
        ps=co.prepareStatement("update teacher_details set teacher_name=?,dob=?,mobile_no=?,guardian_name=?,address=?,city=?,pincode=?,email=?,addhar_no=?,year=?,school_id=? where teacher_id=?");
        ps.setString(1,s2);
        ps.setString(2,s4);
        ps.setString(3,s5);
        ps.setString(4,s6);
        ps.setString(5,s7);
        ps.setString(6,s8);
        ps.setString(7,s9);
        ps.setString(8,s10);
        ps.setString(9,s11);
        ps.setString(10,s12);
        ps.setString(11,s14);
        ps.setString(12,sid);
        
        ps.executeUpdate();
%>  
    <script>
        alert("Updated successfully");
        window.location("school_entry.html");
    </script>

<%        
    ps.close();
    }catch(Exception e)
    {
        out.print("Exception ="+e);
    }
%>