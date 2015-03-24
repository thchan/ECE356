<%-- 
    Document   : doctorSearchSuccess
    Created on : 22-Mar-2015, 5:43:57 PM
    Author     : Thomas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="ece356_project.Doctor"%>
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
            <title>Doctor Search</title>
        </head>
        <%! ArrayList<Doctor> doctorList;%>
        <% doctorList = (ArrayList<Doctor>) request.getAttribute("doctorList");%>
        <% Boolean friend_reviewed; %> 
        <% friend_reviewed = (Boolean) request.getAttribute("friend_reviewed");%>
        <body>
            <table border=1><tr><th>Name</th><th>Gender</th><th>Average review score</th><th>Number of Reviews</th><th>View Profile</th></tr>
            <%
            if( doctorList != null) {
                for (Doctor doc : doctorList) {
                    if (friend_reviewed == false || friend_reviewed == doc.is_friend_reviewed){
            %>
            <tr>
                <td><%= doc.getName()%></td>
                <td><%= doc.gender%></td>
                <% if(doc.number_of_reviews == 0) {%>
                <td>--</td>   
                <%}else{%>
                <td><%= doc.average_rating%></td>
                <%}%>
                <td><%= doc.number_of_reviews%></td>
                <td><a href="viewDoctorProfile?alias=<%= doc.d_alias%>">View</a></td>
            </tr>
            <%      
                    }
                }
            }
            %>
        </body>
    </html>
</f:view>
