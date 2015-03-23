<%-- 
    Document   : error
    Created on : 22-Mar-2015, 10:07:07 PM
    Author     : Thomas
--%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.io.StringWriter"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
            <title>ERROR ERROR MUY BEUNO</title>
        </head>
        <%String errmsg;%>
        <%String stackTrace;%>
        <%Exception myException = (Exception)request.getAttribute("exception");%>
        <%errmsg = myException.getMessage();%>
        <%if (errmsg == null) { errmsg = ""; }
        StringWriter errorWriter = new StringWriter();
        myException.printStackTrace(new PrintWriter(errorWriter));
        stackTrace = errorWriter.toString();
        %>
        
        <body>
            <h1>Error: <%= errmsg%></h1>
        </body>
    </html>
</f:view>
