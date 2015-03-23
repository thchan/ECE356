<%-- 
    Document   : writeReview
    Created on : 22-Mar-2015, 5:48:28 PM
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
            <title>Write Review</title>
        </head>
        <% String d_alias = request.getParameter("alias");%>
        <body>
            <form method="post" action="AddEmployeeServlet">
            Search Criteria:
            <p>
            <input type="hidden" name="patAlias" value="TODO get current alias"><br/>
            Province: <input type="text" name="Province" size="40"><br/>
            City: <input type="text" name="City" size="40"><br/>  
            <input type="hidden" name="docAlias" value="<%=d_alias%>">
            <p> <input type="submit" value="Submit">
        </body>
    </html>
</f:view>
