<%--
  Created by IntelliJ IDEA.
  User: viet
  Date: 29/09/2018
  Time: 19:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Index</title>
</head>
<body>
<h3>Student Management</h3>
<a href="${pageContext.request.contextPath}/student/create">Create new</a>
<table>
    <tr>
        <th>Id</th>
        <th>Name</th>
        <th></th>
    </tr>
    <c:forEach items="${studentList}" var="student">
        <tr>
            <td>${student.id}</td>
            <td>${student.name}</td>
            <td>
                <a href="${pageContext.request.contextPath}/student/details?id=${student.id}">Details</a>
                <a href="${pageContext.request.contextPath}/student/edit?id=${student.id}">Edit</a>
                <a href="${pageContext.request.contextPath}/student/delete?id=${student.id}">Delete</a>
            </td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
