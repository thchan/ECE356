<%-- 
    Document   : patientSearchSuccess
    Created on : 22-Mar-2015, 4:54:43 PM
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
            <title>JSP Page</title>
        </head>
        <%! ArrayList patientList;%>
        <% patientList = (ArrayList) request.getAttribute("patientList");%>
        <body>
            <table border=1><tr><th>Alias</th><th>Home Address</th><th>Number of Review</th><th>Last Review</th><th>Add friend</th></tr>
            <%
                for (Patient pa : patientList) {
            %>
            <tr>
                <td><%= pa.getAlias()%></td>
                <td><%= pa.getAddress()%></td>
                <td><%= pa.getNumReviews()%></td>
                <td><%= pa.getLastReview()%></td>
                <td><a href="addFriend.jsp?alias=<%= pa.getAlias()%>">Add</a></td>
            </tr>
            <%
                }
            %>
        </body>
    </html>
</f:view>
