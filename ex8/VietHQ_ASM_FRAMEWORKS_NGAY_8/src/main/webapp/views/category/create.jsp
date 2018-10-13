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
    <title>Create new category</title>
</head>
<body>
<h3>Create new category</h3>
<a href="${pageContext.request.contextPath}/category/index">Back to index</a>
<form:form modelAttribute="category" method="post" action="${pageContext.request.contextPath}/category/create">
    <table>
        <tr>
            <td>
                <form:label path="name">Name: </form:label>
            </td>
            <td>
                <form:input path="name"/>
            </td>
            <td>
                <form:errors path="name" cssStyle="color:red;display:block"/>
            </td>
        </tr>
        <tr>
            <td colspan="3">
                <button type="submit">Save</button>
            </td>
        </tr>
    </table>
</form:form>
</body>
</html>
