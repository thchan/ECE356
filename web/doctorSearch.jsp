<%-- 
    Document   : doctorSearch
    Created on : 22-Mar-2015, 3:31:36 PM
    Author     : Thomas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="ece356_project.Specialization"%>
<%@page import="ece356_project.Doctor"%>
<%@page import="java.util.ArrayList"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
            <title>Doctor Search</title>
        </head>
        <body>
            <h1>Search for doctor</h1>    
            <form method="post" action="doctorSearch">
            Enter doctor search criteria:
            <p>       
                First name: <input type="text" name="first_name" size="20"><br/>
                Last name: <input type="text" name="last_name" size="20"><br/>
                Gender:
                <select name="gender">
                    <option value=null></option>
                    <option value="male">Male</option>
                    <option value="female">Female</option>
                </select><br/>
                Work address:<input type="text" name="address" size="20"><br/>
                Specialization:
                <%!ArrayList<String> specList;%>
                <% specList = (ArrayList<String>) request.getAttribute("specList");%>
                <select name="spec">
                    <option value=null></option>
                    <%
                        for (String spec : specList) {
                    %>
                    <option value="<%= spec %>"><%= spec %></option>
                    <%
                        }
                    %>
                </select><br/>
                Number of years licensed: <input type="text" name="licensed" size="20"><br/>
                Minimum acceptable star rating: <input type="number" min="0" max="5" step ="1" name="rating" size="20"><br/>
                Reviewed by friend: <input type="checkbox" name="reviewed"><br/>
                Review keyword: <input type="text" name="keyword" size="20"><br/>
            <p> <input type="submit" value="Submit">
        </body>
    </html>
</f:view>
