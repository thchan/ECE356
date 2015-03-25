<%-- 
    Document   : doctorOwnProfileSuccess
    Created on : 22-Mar-2015, 5:49:45 PM
    Author     : Thomas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="ece356_project.Review"%>
<%@page import="ece356_project.Doctor"%>
<%@page import="ece356_project.Specialization"%>
<%@page import="ece356_project.WorkAddress"%>
<%@page import="java.util.ArrayList"%>
<%@page import="ece356_project.Login"%>
<%
 Login user;
 user = (Login)session.getAttribute("user");
if(user == null) {
    response.sendRedirect("index.jsp");
}else if(  user.is_Patient == true) {
    response.sendRedirect("patientMenu.jsp");
}
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<f:view>
    <html>
        <head>
        <a href="doctorOwnProfileSuccess.jsp"></a>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
            <title>My profile</title>
        </head>
        <% Doctor doc = (Doctor)request.getAttribute("doctor");%>
        <%! ArrayList<Review> reviewList;%>
        <%! ArrayList<Specialization> specList;%>
        <%! ArrayList<WorkAddress> addrList;%>
        <% reviewList = (ArrayList<Review>) request.getAttribute("reviews");%>
        <% specList = (ArrayList<Specialization>) request.getAttribute("specs");%>
        <% addrList = (ArrayList<WorkAddress>) request.getAttribute("addrs");%>
        <%
            if( doc != null ) {
        %>
        <body>
            <h1>Profile</h1>
            <p>Name: <%= doc.getName()%></p>
            <p>Gender: <%= doc.gender%></p>
            <p>Work Address: <% if(addrList != null) {for ( WorkAddress addr : addrList) {%><%= addr.getAddress()%>  ;  <%}}%></p>
            <p>Specialization: <% if(specList != null) { for ( Specialization spec : specList) {%><%= spec.spec_name%>, <%}}%></p>
            <p>Email: <%= doc.email_address%></p>
            <p>Number Of Years Licensed: <%= doc.license_year%></p>
            <p>Average Rating: <%= doc.average_rating%></p>
            <p>Number of reviews: <%= doc.number_of_reviews%></p><br>
            <h1>Reviews:</h1>
            <table border=1><tr><th>Id</th><th>By</th><th>Rating</th></tr>
            <%
            if(reviewList != null) {
                for ( Review rev : reviewList) {
            %>
            <tr>
                <td><a href="viewReview?id=<%= rev.review_id%>"><%= rev.review_id%></a></td>
                <td><%= rev.p_alias%></td>
                <td><%= rev.rating%></td>
            </tr>
            <%
                }
            }
            %>
            <%} %>
        </body>
    </html>
</f:view>
