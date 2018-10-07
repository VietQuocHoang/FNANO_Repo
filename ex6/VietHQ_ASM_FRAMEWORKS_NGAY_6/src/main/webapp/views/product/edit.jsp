<%--
  Created by IntelliJ IDEA.
  User: viet
  Date: 29/09/2018
  Time: 19:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>Edit product</title>
</head>
<body>
<h3>Edit product</h3>
<a href="${pageContext.request.contextPath}/product/index">Back to index</a>
<form:form action="${pageContext.request.contextPath}/product/edit" method="post" modelAttribute="product">
    <table>
        <tr>
            <td><form:label path="id">ID: </form:label></td>
            <td><form:input path="id" readonly="true"/></td>
        </tr>
        <tr>
            <td>
                <form:label path="name">Name: </form:label>
            </td>
            <td>
                <form:input path="name"/>
            </td>
        </tr>
        <tr>
            <td>
                <form:label path="description">Description: </form:label>
            </td>
            <td>
                <form:input path="description"/>
            </td>
        </tr>
        <tr>
            <td>
                <form:label path="price">Price: </form:label>
            </td>
            <td>
                <form:input path="price"/>
            </td>
        </tr>
        <tr>
            <td>
                <form:label path="amount">Amount: </form:label>
            </td>
            <td>
                <form:input path="amount"/>
            </td>
        </tr>
        <tr>
            <td>
                <form:label path="thumbnail">Thumbnail: </form:label>
            </td>
            <td>
                <form:input path="thumbnail"/>
            </td>
        </tr>
        <tr>
            <td>
                <form:label path="category.id">Category: </form:label>
            </td>
            <td>
                <form:select path="category.id">
                    <c:forEach items="${categoryList}" var="row">
                        <form:option value="${row.id}">${row.name}</form:option>
                    </c:forEach>
                </form:select>
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
