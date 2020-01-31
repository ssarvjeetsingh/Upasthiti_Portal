<%@page import="java.sql.*"%>
<%!
    Connection co;
    ResultSet rs;
    PreparedStatement ps;
    String s="",sid="",s2="",s4="",s5="",s6="",s7="",s8="",s9="",s10="",s11="",s12="",s13="",s14="",s16="";
%>

<%
    co=(Connection)application.getAttribute("con");
    
    try
    {
        s2=request.getParameter("student_name");
        s4=request.getParameter("birth_date");
        s5=request.getParameter("class_name");
        s6=request.getParameter("fathers_name");
        s7=request.getParameter("mothers_name");
        s8=request.getParameter("mobile_no");
        s9=request.getParameter("address");
        s10=request.getParameter("city");
        s11=request.getParameter("pincode");
        s12=request.getParameter("email_id");
        s13=request.getParameter("adhar_no");
        s14=request.getParameter("year");
        s16=request.getParameter("school_id");
        
        String scl=(String)session.getAttribute("scl");
        sid=(String)session.getAttribute("uid");
    
        ps=co.prepareStatement("update student_detailsc"+scl+" set student_name=?,dob=?,class=?,father_name=?,mother_name=?,mobile_no=?,address=?,city=?,pincode=?,email=?,addhar_no=?,year=?,school_id=? where student_id=?");
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
        ps.setString(11,s13);
        ps.setString(12,s14);
        ps.setString(13,s16);
        ps.setString(14,sid);
        
        ps.executeUpdate();
%>  
    <script>
        alert("Updated successfully");
        window.location("school_entry.jsp");
    </script>

<%        
    ps.close();
    }catch(Exception e)
    {
        out.print("Exception ="+e);
    }
%>