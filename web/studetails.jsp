

<%!
String value="";
%>

<%
value=request.getParameter("value");
%>


<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="css.css">
  <link href="https://fonts.googleapis.com/css?family=Roboto:300&display=swap" rel="stylesheet"> 
  <link rel="stylesheet" type="text/css" href="b.css">
    <title>Student Detail</title>
</head>
<body>
   <div>
    <%
        
    if(value.equals("detailindi"))
    {
   
    %>
    <h1 class="display-4">Student Detail</h1>
    
    <%
    }
    else
if(value.equals("indiattend"))
    {
    %>
    <h1 class="display-4">Student Attendance</h1>
    <%
    
    }
    %>
    <form action="<%=value%>.jsp">
         
            <input type="number" name="id" required placeholder="STUDENT ID"/>
      
             </br>
         </br>
         <input class="btn btn-success" type="submit" name="but" value="OK"/>
            
        </form>
</div>
</body>
</html>
