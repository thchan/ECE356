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
if(  user.is_Patient == true) {
    response.sendRedirect("/ECE356_Project/patientMenu.jsp");
 //forward("/patientMenu.jsp").forward(request, response);
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
        </body>
    </html>
</f:view>
