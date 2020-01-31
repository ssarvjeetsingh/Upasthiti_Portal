<%@page import="java.sql.*"%>
<%!
    Connection co;
    PreparedStatement ps;
    ResultSet rs;
    String id="";
%>
<%
    co=(Connection)application.getAttribute("con");
    String sname=request.getParameter("student_name");
    String fname=request.getParameter("fathers_name");
    String mname=request.getParameter("mothers_name");
    String sdob=request.getParameter("birth_date");
    String sgen=request.getParameter("gender");
    String scity=request.getParameter("city");
    String smob=request.getParameter("mobile_no");
    int spin=Integer.parseInt(request.getParameter("pincode")); 
    String addhar=request.getParameter("adhar_no");
    String smail=request.getParameter("email_id");
    String saddress=request.getParameter("address");
    int sclass=Integer.parseInt(request.getParameter("class_name"));
    int year=Integer.parseInt(request.getParameter("year"));
    String tt=(String)session.getAttribute("schid");
    int schids=Integer.parseInt(tt);
    try
    {
        ps=co.prepareStatement("insert into student_detailsc"+sclass+"(student_name,gender,dob,class,father_name,mother_name,mobile_no,address,city,pincode,email,addhar_no,year,status,school_id) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
        ps.setString(1,sname);
        ps.setString(2,sgen);
        ps.setString(3,sdob);
        ps.setInt(4,sclass);
        ps.setString(5,fname);
        ps.setString(6,mname);
        ps.setString(7,smob);
        ps.setString(8,saddress);
        ps.setString(9,scity);
        ps.setInt(10,spin);
        ps.setString(11,smail);
        ps.setString(12,addhar);
        ps.setInt(13,year);
        ps.setString(14,"activate");
        ps.setInt(15,schids);
        ps.executeUpdate();
        ps.close();
        
        ps=co.prepareStatement("select student_id from student_detailsc"+sclass+" where student_name=? and addhar_no=?");
        ps.setString(1,sname);
        ps.setString(2,addhar);
        rs=ps.executeQuery();
        if(rs.next())
        {
            id=rs.getString(1);
        }
        ps.close();
        rs.close();
        String ss="alter table attendencec"+sclass+" add(R"+id+" varchar(20) default 'late')";
        ps=co.prepareStatement(ss);

        ps.executeUpdate();
        ps.close();
        String ssm="alter table marksc"+sclass+" add(R"+id+" varchar(20) default 'late')";
        ps=co.prepareStatement(ssm);

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