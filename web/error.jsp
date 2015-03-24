<%-- 
    Document   : error
    Created on : 24-Mar-2015, 1:37:01 PM
    Author     : Thomas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="ece356_project.Login"%>
<%
Login user;
user = (Login)session.getAttribute("user");
String url;
if( user != null) {
    if(  user.is_Patient == false) {
        url = "doctorMenu.jsp";
    } else {
        url = "patientMenu.jsp";
    }
} else {
    url = "index.jsp";
}
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
            <title>Error</title>
        </head>
        <body>
            <h1>AN ERROR HAS OCCURRED!</h1>
            <a href="<%=url%>">Click here to return to menu</a>
        </body>
    </html>
</f:view>
