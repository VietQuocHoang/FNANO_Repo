<%--
  Created by IntelliJ IDEA.
  User: viet
  Date: 29/09/2018
  Time: 19:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>Edit book</title>
</head>
<body>
<h3>Edit book information</h3>
<a href="${pageContext.request.contextPath}/book/index">Back to index</a>
<form:form action="${pageContext.request.contextPath}/book/edit" method="post" modelAttribute="book">
    <table>
        <tr>
            <td><form:label path="id">ID: </form:label></td>
            <td><form:input path="id" readonly="true"/></td>
        </tr>
        <tr>
            <td><form:label path="name">Name: </form:label></td>
            <td><form:input path="name"/></td>
        </tr>
        <tr>
            <td>
                <form:label path="author">Author: </form:label>
            </td>
            <td>
                <form:input path="author"/>
            </td>
        </tr>
        <tr>
            <td>
                <form:label path="releaseDate">Release Date: </form:label>
            </td>
            <td>
                <form:input path="releaseDate" type="date"/>
            </td>
        </tr>
        <tr>
            <td>
                <button type="submit">Save</button>
            </td>
        </tr>
    </table>
</form:form>

</body>
</html>
