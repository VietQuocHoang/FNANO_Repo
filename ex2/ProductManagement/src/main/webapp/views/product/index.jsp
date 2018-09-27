<%--
  Created by IntelliJ IDEA.
  User: viet
  Date: 27/09/2018
  Time: 20:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Product Index</title>
</head>
<body>
<table>
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Price</th>
        <th>Amount</th>
        <th>Action</th>
    </tr>
    <c:forEach items="productList" var="product">
        <tr>
            <td>${product.id}</td>
            <td>${product.name}</td>
            <td>${product.price}</td>
            <td>${product.amount}</td>
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
