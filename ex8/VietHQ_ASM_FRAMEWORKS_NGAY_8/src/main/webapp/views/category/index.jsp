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
<h3>Category Management</h3>
<a href="${pageContext.request.contextPath}/category/create">Create new</a>
<form action="${pageContext.request.contextPath}/category/index" method="get">
    <input type="text" name="search" value="${search}" placeholder="Search"/>
    <input type="hidden" name="page" value="${page}"/>
    <button type="submit">Search</button>
</form>
<table style="min-height: 100px; max-height: 100px">
    <tr>
        <th>Id</th>
        <th>Name</th>
        <th>Action</th>
    </tr>
    <c:forEach items="${categoryList}" var="category">
        <tr>
            <td>${category.id}</td>
            <td>${category.name}</td>
            <td>
                <a href="${pageContext.request.contextPath}/category/details?id=${category.id}">Details</a>
                <a href="${pageContext.request.contextPath}/category/edit?id=${category.id}">Edit</a>
                <a href="${pageContext.request.contextPath}/category/delete?id=${category.id}">Delete</a>
            </td>
        </tr>
    </c:forEach>
</table>
<c:if test="${page>0}"><a href="${pageContext.request.contextPath}/category/index?page=${page-1}&search=${search}">Previous</a></c:if> |
<b><c:choose><c:when test="${page > limit}">0</c:when><c:otherwise>${page+1}</c:otherwise> </c:choose></b>/${limit+1} |
<c:if test="${page<limit}"><a href="${pageContext.request.contextPath}/category/index?page=${page+1}&search=${search}">Next</a></c:if>

</body>
</html>
