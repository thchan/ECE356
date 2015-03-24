<%-- 
    Document   : writeReview
    Created on : 22-Mar-2015, 5:48:28 PM
    Author     : Thomas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
            <title>Write Review</title>
        </head>
        <% String d_alias = request.getParameter("alias");%>
        <body>
            <form method="post" action="writeReview">
            
            <p>
            Rating: <input type="number" min="0" max="5" name="rating" value="0" size="40"><br/>
            Comments: <input type="text" name="comments" size="500"><br/>  
            <input type="hidden" name="d_alias" value="<%=d_alias%>">
            <p> <input type="submit" value="Submit">
        </body>
    </html>
</f:view>
