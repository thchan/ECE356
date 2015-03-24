<%-- 
    Document   : patientSearch
    Created on : 22-Mar-2015, 4:08:25 PM
    Author     : Thomas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="ece356_project.Patient"%>
<%//@page import="ece356_project.Department"%>
<%@page import="java.util.ArrayList"%>
<%@page import="ece356_project.Login"%>
<%
 Login user;
 user = (Login)session.getAttribute("user");
if(  user.is_Patient == false) {
    response.sendRedirect("doctorMenu.jsp");
}
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
            <title>Patient Search</title>
        </head>
        <body>
            <h1>Patient Search</h1>
            <form method="post" action="patientSearch">
            Search Criteria:
            <p>
            Patient Alias: <input type="text" name="user_alias" size="20"><br/>
            Province: <input type="text" name="province" size="40"><br/>
            City: <input type="text" name="city" size="40"><br/>               
            <p> <input type="submit" value="Submit">
        </body>
    </html>
</f:view>
