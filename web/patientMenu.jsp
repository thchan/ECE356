<%-- 
    Document   : patientMenu
    Created on : 22-Mar-2015, 3:26:15 PM
    Author     : Thomas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="ece356_project.Login"%>
<%
 Login user;
 user = (Login)session.getAttribute("user");
if(user == null) {
    response.sendRedirect("index.jsp");
}else if(  user.is_Patient == false) {
    response.sendRedirect("doctorMenu.jsp");
}
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
            <title>Patient Menu</title>
        </head>
        <body>
            <li><a href="doctorSearchInit">Doctor Search</a></li>
            <li><a href="patientSearch.jsp">Patient Search</a></li>
            <li><a href="friendRequests">Friend Requests</a></li>
            <li><a href="logout">Log out</a></li>
        </body>
    </html>
</f:view>
