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
    <title>Product Index</title>
</head>
<body>
<h3>Product Management</h3>
<a href="${pageContext.request.contextPath}/product/create">Create new</a>
<form action="${pageContext.request.contextPath}/product/index" method="get">
    <input type="hidden" name="page" value="${page}"/>
    <input type="text" name="search" value="${search}" placeholder="Search"/>
    <select name="categoryId">
        <option value="" <c:if test="${categoryId == null || categoryId==category.id}">selected</c:if>>Select a category
            to filter
        </option>
        <c:forEach items="${categoryList}" var="category">
            <option value="${category.id}"
                    <c:if test="${categoryId==category.id}">selected</c:if>>${category.name}</option>
        </c:forEach>
    </select>
    <button type="submit">Search</button>
</form>
<table>
    <tr>
        <th>Id</th>
        <th>Name</th>
        <th>Description</th>
        <th>Price</th>
        <th>Amount</th>
        <th>Thumbnail</th>
        <th>Category name</th>
        <th>Action</th>
    </tr>
    <c:forEach items="${productList}" var="product">
        <tr>
            <td>${product.id}</td>
            <td>${product.name}</td>
            <td>${product.description}</td>
            <td>${product.price}</td>
            <td>${product.amount}</td>
            <td>
                <c:choose>
                    <c:when test="${empty product.thumbnail}">
                        There is no thumbnail
                    </c:when>
                    <c:otherwise>
                        <img src="${pageContext.request.contextPath}/image/${product.id}/${product.thumbnail}"
                             style="width: 50px; height: 50px"/>
                    </c:otherwise>
                </c:choose>
            </td>
            <td>${product.category.name}</td>
            <td>
                <a href="${pageContext.request.contextPath}/product/details?id=${product.id}">Details</a>
                <a href="${pageContext.request.contextPath}/product/edit?id=${product.id}">Edit</a>
                <a href="${pageContext.request.contextPath}/product/delete?id=${product.id}">Delete</a>
            </td>
        </tr>
    </c:forEach>
</table>
<c:if test="${page>0}"><a
        href="${pageContext.request.contextPath}/product/index?page=${page-1}&search=${search}&categoryId=${categoryId}">Previous</a></c:if> |
<b><c:choose><c:when test="${page>limit}">0</c:when><c:otherwise>${page+1}</c:otherwise></c:choose> </b>/${limit+1} |
<c:if test="${page<limit}"><a
        href="${pageContext.request.contextPath}/product/index?page=${page+1}&search=${search}&categoryId=${categoryId}">Next</a></c:if>
</body>
</html>
