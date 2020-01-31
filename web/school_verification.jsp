<%@page import="java.sql.*"%>
<%!
    Connection co;
    PreparedStatement ps;
    ResultSet rs;
%>
<%
    co=(Connection)application.getAttribute("con");
    String s1=request.getParameter("school_id");
    String s2=request.getParameter("school_pin");
    try
    {
        ps=co.prepareStatement("select * from level_verification where id=?");
        ps.setString(1,s1);
        rs=ps.executeQuery();
            if(rs.next())
            {
                String s3=rs.getString(2);
                if(s3.equals(s2))
                {
                    session.setAttribute("schid",s1);
                    response.sendRedirect("school_entry.html");
                }
                else
                {
                %>
                    <script>
                        alert("Wrong Password:ReEnter Password");
                        window.location("school_verification.html");
	            </script>
                <%
                }
                rs.close();
                ps.close();
            }
            else
            {
            %>
                <script>
                    alert("Invalid School Id");
		    window.location("school_verification.html");
	        </script>
            <%
            }
        }catch(Exception e)
        {
            out.print("exception is ...."+e);
        }
%>
