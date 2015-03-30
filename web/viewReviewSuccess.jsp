<%-- 
    Document   : viewReviewSuccess
    Created on : 22-Mar-2015, 5:46:36 PM
    Author     : Thomas
--%>

<%@page import="ece356_project.Login"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="ece356_project.Review"%>
<%@page import="ece356_project.Doctor"%>
<%
 Login user;
 user = (Login)session.getAttribute("user");
if(user == null) {
    response.sendRedirect("index.jsp");
}
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
            <title>JSP Page</title>
        </head>
             <% Review rev = (Review)request.getAttribute("review");%> 
             <% Doctor doc = (Doctor)request.getAttribute("doctor");%> 
             <% String stringNext = String.valueOf(request.getAttribute("next"));%>
             <% String stringPrev = String.valueOf(request.getAttribute("prev"));%>
             <% int next =  Integer.parseInt(stringNext);%> 
             <% int prev = Integer.parseInt(stringPrev);%> 
        <body>
           
            <p>Doctor Name: <%= doc.getName() %></p>
            <p>Review Date: <%= rev.date%></p>
            <p>Rating: <%= rev.rating%>/5</p>
            <p>Comments:</p>
            <p><%= rev.comments%></p>
            <br><br>
            <% if( next != 0 ) { %>
            <p><a href="viewReview?id=<%=next%>">Next Review</a></p>
            <% } if(prev != 0) { %>
            <p><a href="viewReview?id=<%=prev%>">Previous Review</a></p>
            <%}%>
        </body>
    </html>
</f:view>
