<%-- 
    Document   : patientSearch
    Created on : 22-Mar-2015, 4:08:25 PM
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
            <title>Patient Search</title>
        </head>
        <body>
            <h1>Patient Search</h1>
            <form method="post" action="AddEmployeeServlet">
            Search Criteria:
            <p>
            Patient Alias: <input type="text" name="Alias" size="20"><br/>
            Province: <input type="text" name="Province" size="40"><br/>
            City: <input type="text" name="City" size="40"><br/>               
            <p> <input type="submit" value="Submit">
        </body>
    </html>
</f:view>
