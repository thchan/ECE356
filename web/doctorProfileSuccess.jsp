<%-- 
    Document   : doctorProfileSuccess
    Created on : 22-Mar-2015, 5:45:08 PM
    Author     : Thomas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    <a href="doctorProfileSuccess.jsp"></a>
    "http://www.w3.org/TR/html4/loose.dtd">

<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
            <title>Doctor Profile</title>
        </head>
        <% Doctor doc = request.getAttribute("doctor");%>
        <%! ArrayList<Review> reviewList;%>
        <% reviewList = (ArrayList<Review>) request.getAttribute("reviewList");%>
        <body>
            <h1>Profile</h1>
            <p>Name: <%= doc.getName()%></p>
            <p>Gender: <%= doc.getName()%></p>
            <p>Work Address: <%= doc.getName()%></p>
            <p>Specialization: <%= doc.getName()%></p>
            <p>Number Of Years Licensed: <%= doc.getYearsLicensed()%></p>
            <p>Name: <%= doc.getAverageStarReviews()%></p>
            <p>Name: <%= doc.getNumReviews()%></p><br>
            <h1>Reviews:</h1>
            <table border=1><tr><th>Id</th><th>By</th><th>Rating</th></tr>
            <%
                for ( Review rev : reviewList) {
            %>
            <tr>
                <td><a href="viewReviewSuccess.jsp?alias=<%= rev.review_id%>">View<%= rev.review_id%></a></td>
                <td><%= rev.p_alias%></td>
                <td><%= rev.rating%></td>
            </tr>
            <%
                }
            %>
            <a href="writeReview.jsp?alias=<%= doc.d_alias%>">Write Review</a>
        </body>
    </html>
</f:view>
