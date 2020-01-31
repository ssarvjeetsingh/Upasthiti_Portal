<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="css.css">
  <link href="https://fonts.googleapis.com/css?family=Roboto:300&display=swap" rel="stylesheet"> 
  <link rel="stylesheet" type="text/css" href="b.css">
    <title>Teacher Attendance</title>
</head>
<body>
    <div>
        <h1 class="display-4">Teacher Attendance</h1>
        <%!
    String s="";
%>

<form action="teacher_attendance.jsp">
    <select name="clas">
        <option value="1">1</option>
        <option value="2">2</option>
        <option value="3">3</option>
    </select>
        
        <input type="submit" name="butt1" value="INDIVIDUALATTENDANCE">
        <input type="submit" name="butt1" value="ALLTEACHERATTENDANCE">
    </form>

<%
    s=request.getParameter("butt1");
    if(s!=null)
    {
        if(s.equals("INDIVIDUALATTENDANCE"))
        {
%>
    <jsp:forward page="teacher_attendance1.jsp" />

<%
        }
        else if(s.equals("ALLTEACHERATTENDANCE"))
        {
     out.print("ALL");
%>
    

<%
        }
    }
    
%>
    </div>
</body>
</html>