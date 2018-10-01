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
<h3>Book Management</h3>
<a href="${pageContext.request.contextPath}/book/create">Create new</a>
<table>
    <tr>
        <th>Id</th>
        <th>Name</th>
        <th>Author</th>
        <th>Release Date</th>
        <th>Action</th>
    </tr>
    <c:forEach items="${bookList}" var="book">
        <tr>
            <td>${book.id}</td>
            <td>${book.name}</td>
            <td>${book.author}</td>
            <td>${book.releaseDate}</td>
            <td>
                <a href="${pageContext.request.contextPath}/book/details?id=${book.id}">Details</a>
                <a href="${pageContext.request.contextPath}/book/edit?id=${book.id}">Edit</a>
                <a href="${pageContext.request.contextPath}/book/delete?id=${book.id}">Delete</a>
            </td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
