<%-- 
    Document   : viewReviewSuccess
    Created on : 22-Mar-2015, 5:46:36 PM
    Author     : Thomas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="ece356_project.Review"%>
<%@page import="ece356_project.Doctor"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
            <title>JSP Page</title>
        </head>
             <% Review rev = (Review)request.getAttribute("review");%> 
             <% Doctor doc = (Doctor)request.getAttribute("doctor");%> 
        <body>
           
            <p>Doctor Name: <%= doc.getName() %></p>
            <p>Review Date: <%= rev.date%></p>
            <p>Rating: <%= rev.rating%>/5</p>
            <p>Comments:</p>
            <p><%= rev.comments%></p>
        </body>
    </html>
</f:view>
