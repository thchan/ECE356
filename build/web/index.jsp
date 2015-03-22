<%-- 
    Document   : index.jsp
    Created on : March 21, 2015 7:52:06 PM
    Author     : thchan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
    </head>
    <body>
        <h1>Please Login:</h1><br><br>
        <form action="LoginServelet">
            Username:<br>
            <input type="text" name="user_alias"><br>
            Password:<br>
            <input type="text" name="password"><br>
            <input type="submit" value="Log In"><br> 
        </form>
        <br>
        <!-- These links are place holders for other pages -->
        <li><a href="QueryServlet?qnum=1">Patient Search</a></li>        
        <li><a href="QueryServlet?qnum=2">Doctor Search</a></li>        
        <li><a href="queryEmployee.jsp">View Friend Requests</a></li>        
        <li><a href="AddEmployeeServlet">View Own Profile</a></li>
        </ul>
    </body>
</html>
