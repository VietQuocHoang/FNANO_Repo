<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: viet
  Date: 23/10/2018
  Time: 19:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Student Index</title>
</head>
<body>
<a href="<c:url value="/student/create"/> ">Create new</a>
<table>
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Email</th>
        <th>Phone</th>
        <th>Site Class</th>
        <th>Action</th>
    </tr>
    <c:if test="${not empty studentList}">
        <c:forEach items="${studentList}" var="student">
            <tr>
                <td>${student.id}</td>
                <td>${student.firstName} ${student.lastName}</td>
                <td>${student.email}</td>
                <td>${student.phone}</td>
                <td>${student.siteClass.name}</td>
                <td>
                    <a href="<c:url value="/student/details?id=${student.id}"/>">Details</a>
                    <a href="<c:url value="/student/edit?id=${student.id}"/>">Edit</a>
                    <a href="<c:url value="/student/delete?id=${student.id}"/>">Delete</a>
                </td>
            </tr>
        </c:forEach>
    </c:if>
</table>
</body>
</html>
