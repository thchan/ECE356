<%-- 
    Document   : menu
    Created on : 22-Mar-2015, 3:22:26 PM
    Author     : Thomas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="ece356_project.Login"%>
<%
 Login user;
 user = (Login)session.getAttribute("user");
if(user == null) {
    response.sendRedirect("index.jsp");
}else if(  user.is_Patient == true) {
    response.sendRedirect("patientMenu.jsp");
}
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
            <title>Doctor Menu</title>
        </head>
        <body>
            <li><a href="viewDoctorProfile?alias=<%=user.user_alias%>">My Profile</a></li>
            <li><a href="logout">Log out</a></li>
        </body>
    </html>
</f:view>
