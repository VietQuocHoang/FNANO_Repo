<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <title>Product Details</title>
</head>
<body>
<h3>Product details</h3>
<a href="${pageContext.request.contextPath}/product/index">Back to index</a>
<table>
    <tr>
        <td>ID:</td>
        <td>${product.id}</td>
    </tr>
    <tr>
        <td>Name:</td>
        <td>${product.name}</td>
    </tr>
    <tr>
        <td>Description:</td>
        <td>${product.description}</td>
    </tr>
    <tr>
        <td>Price:</td>
        <td>${product.price}</td>
    </tr>
    <tr>
        <td>Amount:</td>
        <td>${product.amount}</td>
    </tr>
    <tr>
        <td>Thumbnail:</td>
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
    </tr>
    <tr>
        <td>Category:</td>
        <td>${product.category.name}</td>
    </tr>
</table>
</body>
</html>
