<%-- 
    Document   : doctorSearchSuccess
    Created on : 22-Mar-2015, 5:43:57 PM
    Author     : Thomas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
            <title>Doctor Search</title>
        </head>
        <%! ArrayList doctorList;%>
        <% doctorList = (ArrayList) request.getAttribute("doctorList");%>
        <body>
            <table border=1><tr><th>Name</th><th>Gender</th><th>Average review score</th><th>Number of Reviews</th><th>View Profile</th></tr>
            <%
                for (Doctor doc : doctorList) {
            %>
            <tr>
                <td><%= doc.getName()%></td>
                <td><%= doc.getAddress()%></td>
                <td><%= doc.getNumReviews()%></td>
                <td><%= doc.getLastReview()%></td>
                <td><a href="doctorProfileSuccess.jsp?alias=<%= doc.getAlias()%>">View</a></td>
            </tr>
            <%
                }
            %>
        </body>
    </html>
</f:view>
