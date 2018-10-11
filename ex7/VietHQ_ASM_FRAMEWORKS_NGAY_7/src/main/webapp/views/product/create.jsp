<%--
  Created by IntelliJ IDEA.
  User: viet
  Date: 29/09/2018
  Time: 19:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>Create new product</title>
</head>
<body>
<h3>Create new product</h3>
<a href="${pageContext.request.contextPath}/product/index">Back to index</a>
<form:form modelAttribute="product"
           method="post"
           enctype="multipart/form-data"
           action="${pageContext.request.contextPath}/product/create">
    <table>
        <tr>
            <td>
                <form:label path="name">Name: </form:label>
            </td>
            <td>
                <form:input path="name"/>
            </td>
            <td>
                <form:errors path="name" cssStyle="color: red; display: block"/>
            </td>
        </tr>
        <tr>
            <td>
                <form:label path="description">Description: </form:label>
            </td>
            <td>
                <form:input path="description"/>
            </td>
            <td>
                <form:errors path="description" cssStyle="color: red; display: block"/>
            </td>
        </tr>
        <tr>
            <td>
                <form:label path="price">Price: </form:label>
            </td>
            <td>
                <form:input path="price"/>
            </td>
            <td>
                <form:errors path="price" cssStyle="color: red; display: block"/>
            </td>
        </tr>
        <tr>
            <td>
                <form:label path="amount">Amount: </form:label>
            </td>
            <td>
                <form:input path="amount"/>
            </td>
            <td>
                <form:errors path="amount" cssStyle="color: red; display: block"/>
            </td>
        </tr>
        <tr>
            <td>
                <label>Thumbnail: </label>
            </td>
            <td>
                <input name="thumbnail" type="file"/>
            </td>
        </tr>
        <tr>
            <td>
                <form:label path="category">Category: </form:label>
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
            <td colspan="3">
                <button type="submit">Save</button>
            </td>
        </tr>
    </table>
</form:form>
</body>
</html>
