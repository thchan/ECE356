<%-- 
    Document   : patientSearchSuccess
    Created on : 22-Mar-2015, 4:54:43 PM
    Author     : Thomas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="ece356_project.Patient"%>
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
            <title>Patient search results</title>
        </head>
        <%! ArrayList<Patient> patientList;%>
        <% patientList = (ArrayList<Patient>) request.getAttribute("patientList");%>
        <body>
            <table border=1><tr><th>Alias</th><th>Home Address</th><th>Number of Review</th><th>Last Review</th><th>Add friend</th></tr>
            <%
                if( patientList != null ) {
                for (Patient pa : patientList) {
            %>
            <tr>
                <td><%= pa.p_alias%></td>
                <td><%= pa.home_address_city%>, <%= pa.home_address_province %></td>
                <td><%= pa.number_of_reviews%></td>
                <td><%= pa.last_review_date%></td>
                <td><a href="addFriend.jsp?alias=<%= pa.p_alias%>">Add</a></td>
            </tr>
            <%
                }
                }
            %>
        </body>
    </html>
</f:view>
