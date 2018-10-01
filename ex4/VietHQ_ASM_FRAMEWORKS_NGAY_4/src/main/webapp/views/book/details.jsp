<%--
  Created by IntelliJ IDEA.
  User: viet
  Date: 29/09/2018
  Time: 19:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Book Details</title>
</head>
<body>
<h3>Book details</h3>
<a href="${pageContext.request.contextPath}/book/index">Back to index</a>
<table>
    <tr>
        <td>ID:</td>
        <td>${book.id}</td>
    </tr>
    <tr>
        <td>Name:</td>
        <td>${book.name}</td>
    </tr>
    <tr>
        <td>Author: </td>
        <td>${book.author}</td>
    </tr>
    <tr>
        <td>Release Date: </td>
        <td>${book.releaseDate}</td>
    </tr>
</table>
</body>
</html>
