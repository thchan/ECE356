<%-- 
    Document   : friendRequestsSuccess
    Created on : 22-Mar-2015, 5:42:40 PM
    Author     : Thomas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="java.util.ArrayList"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
            <title>Friend Requests</title>
        </head>
        <%! ArrayList<Patient> patientList;%>
        <% patientList = (ArrayList<Patient>) request.getAttribute("patientList");%>
        <body>
            <h1>Friend Requests</h1>
            <table border=1><tr><th>Alias</th><th>Email</th><th>Confirm Request</th></tr>
            <%
                for (Patient pa : patientList) {
            %>
            <tr>
                <td><%= pa.p_alias%></td>
                <td><%= pa.email%></td>                
                <td><a href="addFriend.jsp?alias=<%= pa.p_alias%>">Add</a></td>
            </tr>
            <%
                }
            %>
        </body>
    </html>
</f:view>
