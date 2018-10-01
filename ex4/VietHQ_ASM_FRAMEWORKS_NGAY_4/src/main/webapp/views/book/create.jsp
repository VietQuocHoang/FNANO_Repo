<%--
  Created by IntelliJ IDEA.
  User: viet
  Date: 29/09/2018
  Time: 19:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>Create new book</title>
</head>
<body>
<h3>Create new book</h3>
<a href="${pageContext.request.contextPath}/student/index">Back to index</a>
<form:form modelAttribute="book" method="post" action="${pageContext.request.contextPath}/book/create">
    <table>
        <tr>
            <td>
                <form:label path="name">Name: </form:label>
                <form:input path="name"/>
            </td>
            <td>
                <form:label path="author">Author: </form:label>
                <form:input path="author"/>
            </td>
            <td>
                <form:label path="releaseDate">Release Date: </form:label>
                <form:input type="date" path="releaseDate"/>
            </td>
            <td>
                <button type="submit">Save</button>
            </td>
        </tr>
    </table>
</form:form>
</body>
</html>
