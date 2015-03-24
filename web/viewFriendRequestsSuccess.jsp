<%-- 
    Document   : viewFriendRequestsSuccess
    Created on : 23-Mar-2015, 10:40:21 PM
    Author     : Sean
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="ece356_project.FriendRequest"%>
<%@page import="java.util.ArrayList"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
            <title>Friend Requests</title>
        </head>
        <%! ArrayList<FriendRequest> friendRequests;%>
        <% friendRequests = (ArrayList<FriendRequest>) request.getAttribute("friendRequestList");%>
        <body>
            <table border=1><tr><th>Alias</th><th>E-Mail Address</th><th>Add friend</th></tr>
            <%
                if( friendRequests != null ) {
                for (FriendRequest fr : friendRequests) {
            %>
            <tr>
                <td><%= fr.user_alias%></td>
                <td><%= fr.email%></td>
                <td><a href="addFriend.jsp?alias=<%= fr.user_alias%>">Add</a></td>
            </tr>
            <%
                }
                }
            %>
        </body>
    </html>
</f:view>
