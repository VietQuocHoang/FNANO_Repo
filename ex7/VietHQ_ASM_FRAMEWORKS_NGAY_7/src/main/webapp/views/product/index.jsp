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
            <td><img src="${pageContext.request.contextPath}/image/${product.thumbnail}" style="width:50px; height:50px"/></td>
            <td>${product.category.name}</td>
            <td>
                <a href="${pageContext.request.contextPath}/product/details?id=${product.id}">Details</a>
                <a href="${pageContext.request.contextPath}/product/edit?id=${product.id}">Edit</a>
                <a href="${pageContext.request.contextPath}/product/delete?id=${product.id}">Delete</a>
            </td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
