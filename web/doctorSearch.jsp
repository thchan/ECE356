<%-- 
    Document   : doctorSearch
    Created on : 22-Mar-2015, 3:31:36 PM
    Author     : Thomas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
            <title>JSP Page</title>
        </head>
        <body>
            <h1>Search for doctor</h1>    
            <form method="post" action="AddEmployeeServlet">
            Enter doctor search criteria:
            <p>       
                Doctor name: <input type="text" name="docName" size="20"><br/> 
                Gender:
                <select name="gender">
                    <option value="Male">Male</option>
                    <option value="Female">Female</option>
                </select><br/>
                Work address:<input type="text" name="address" size="20"><br/>
                Specialization:
                <select name="spec">
                    <%! ArrayList<Department> departmentList;%>
                    <%
                        departmentList = (ArrayList<Department>) request.getAttribute("departmentList");
                        for (Department dep : departmentList) {
                    %>
                    <option value="<%= dep.getDeptID()%>"><%= dep.getDeptName()%></option>
                    <%
                        }
                    %>
                </select><br/>
                Number of years licensed: <input type="text" name="licensed" size="20"><br/>
                Minimum acceptable star rating: <input type="number" name="rating" size="20"><br/>
                Reviewed by friend: <input type="checkbox" name="reviewed"><br/>
                Review keyword: <input type="text" name="keyword" size="20"><br/>
            <p> <input type="submit" value="Submit">
        </body>
    </html>
</f:view>
