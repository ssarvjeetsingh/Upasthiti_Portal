<%@page import="java.util.StringTokenizer"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%!
    String attend="";
    String roll="";
    String store="";
    String value="";
    String get="";
        
    PreparedStatement ps;
    Connection co;
    ResultSet rs;
%>
<%
    co=(Connection)application.getAttribute("con");
    String cla=(String)session.getAttribute("clm");
    String typ=(String)session.getAttribute("styp");
    String sids=(String)session.getAttribute("suids");
    
    store=request.getParameter("count");
    roll="";
    value="";

    StringTokenizer st=new StringTokenizer(store,"@");

    while(st.hasMoreTokens())
    {
        get=st.nextToken();
        roll=roll+"R"+get+",";
        value=value+"?"+",";
    }
     
    roll=roll.substring(0,roll.length()-1);
    value=value.substring(0,value.length()-1);
   
    try 
    {
        ps=co.prepareStatement("insert into marksc"+cla+"(subject_id,type,"+roll+") values(?,?,"+value+")");    
        StringTokenizer st1=new StringTokenizer(store,"@");
        int i=3;
        ps.setString(1,sids);
        ps.setString(2,typ);
        while(st1.hasMoreTokens())
        {
            ps.setString(i,request.getParameter(st1.nextToken()));
            i++;
        }
        ps.executeUpdate();
    %>
    <script>
        alert("Marks Enterd");
        window.location("school_entry.html")
    </script>
    <%
    }
    catch(Exception e)
    {
        out.print("exception is...."+e);
    }
    %>




